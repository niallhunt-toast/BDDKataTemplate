module.exports = {
  default: {
    requireModule: ['ts-node/register'],
    paths: ['features/*.feature'],
    require: ['features/steps/*.ts']
  }
};
