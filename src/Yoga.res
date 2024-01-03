type t = Express.Middleware.t
type graphiqlMiddleware

module Schema = {
  type t = Graphql.Schema.t
}

@module("graphql-yoga") external createYoga: unit => t = "createYoga"

type configuration<'a, 'b> = {
  schema: Schema.t,
  renderGraphiQL: Js.undefined<graphiqlMiddleware>,
  context: Js.undefined<'a => promise<'b>>,
}

@module("graphql-yoga") external createYogaWithSchema: configuration<'a, 'b> => t = "createYoga"
@module("@graphql-yoga/render-graphiql")
external renderGraphiql: graphiqlMiddleware = "renderGraphiql"

@get external graphqlEndpoint: t => string = "graphqlEndpoint"
