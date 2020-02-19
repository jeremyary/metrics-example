package controller

import (
	"github.com/jary/metrics-example/pkg/controller/metricsservice"
	"github.com/prometheus/client_golang/prometheus"
	"sigs.k8s.io/controller-runtime/pkg/metrics"
)

var (
	creates = prometheus.NewCounter(
		prometheus.CounterOpts{
			Name: "creates_total",
			Help: "Number of mythical creations",
		},
	)
	createFailures = prometheus.NewCounter(
		prometheus.CounterOpts{
			Name: "creates_failures_total",
			Help: "Number of times mythical creation failed",
		},
	)
)

func init() {
	// AddToManagerFuncs is a list of functions to create controllers and add them to a manager.
	AddToManagerFuncs = append(AddToManagerFuncs, metricsservice.Add)

	// Register custom metrics with global Prometheus registry
	metrics.Registry.MustRegister(creates, createFailures)
}
