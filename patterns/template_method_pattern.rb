class Deployment
  def deploy
    git_pull
    compile_code
    run_tests
    build_artifact
    send_artifact
  end

  private

  def git_pull
    raise NotImplementedError
  end
end

class RailsDeployment < Deployment
  private

  def git_pull

  end
end