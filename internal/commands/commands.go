package commands

import "github.com/luke-mayer/walk-hard/internal/config"

type Command struct {
	name string
	args []string
}

type Commands struct {
	commands map[string]func(*config.State, Command) error
}
