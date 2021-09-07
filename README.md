# Ansible playbook runner via SSH Action

The is a github action used to run [NaC](https://github.com/UCCNetsoc/NaC) ansible playbooks.

## Example Usage 

```yml
  deploy:
    needs: [build]
    
    runs-on: ubuntu-latest
    
    steps:
      - name: Ansible playbook runner via SSH Action
        uses: UCCNetsoc/ansible-action@main
        with:
          tags: "tag"
          control_host: ${{ secrets.CONTROL_HOST }}
          control_user: ${{ secrets.CONTROL_USER }}
          control_ssh_key: ${{ secrets.SSH_KEY }}
          directory: ${{ secrets.CONTROL_DIRECTORY }}
          vault_pass: ${{ secrets.VAULT_PASS }}
          port: ${{ secrets.CONTROL_PORT }}
```

For a full example, [see the discord bot](https://github.com/UCCNetsoc/discord-bot/blob/master/.github/workflows/main.yml).
