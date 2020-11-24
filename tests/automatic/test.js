const chai = require("chai");
const chaiHttp = require("chai-http");
const server = require("./server");

// Configure chai
chai.use(chaiHttp);
chai.should();

let app = null;

before((done) => {
    server.then((result) => {
        app = result;
        done();
    });
});

describe("Author Operation", () => {
    describe("GET /api/Authors", () => {
        it("+ should get a list of authors", (done) => {
            chai.request(app)
                .get("/api/Authors")
                .end((error, response) => {
                    try {
                        response.should.have.status(200);
                        done();
                    } catch (error) {
                        done(error);
                    }
                });
        })
    })

    let id = null;
    describe("POST /api/Authors", () => {
        it("+ should create an author", (done) => {
            chai.request(app)
                .post("/api/Authors")
                .send({
                    "name": "H. G. Wells"
                })
                .end((error, response) => {
                    try {
                        response.should.have.status(201);
                        id = response.body.ID;
                        chai.expect(id).to.not.be.null;
                        done();
                    } catch (error) {
                        done(error)
                    }
                });
        })
    });

    describe("GET /api/Authors", () => {
        it("+ should get an specific author", (done) => {
            chai.request(app)
                .get(`/api/Authors(${id})`)
                .end((error, response) => {
                    try {
                        response.should.have.status(200);
                        response.body.ID.should.equal(id);
                        done();
                    } catch (error) {
                        done(error)
                    }
                })
        })
    });

    describe("DELETE /api/Authors", () => {
        it("+ should delete the author", (done) => {
            chai.request(app)
                .delete(`/api/Authors(${id})`)
                .end((error, response) => {
                    try {
                        response.should.have.status(204);
                        done();
                    } catch (error) {
                        done(error);
                    }
                })
        })
    })
});