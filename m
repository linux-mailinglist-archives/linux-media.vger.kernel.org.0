Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B411EF703
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 14:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgFEMGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 08:06:07 -0400
Received: from foss.arm.com ([217.140.110.172]:54228 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgFEMGH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jun 2020 08:06:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB6C12B;
        Fri,  5 Jun 2020 05:06:06 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 235B53F305;
        Fri,  5 Jun 2020 05:06:05 -0700 (PDT)
References: <20200604123932.20512-1-benjamin.gaignard@st.com> <20200604123932.20512-3-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     hugues.fruchet@st.com, mchehab@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        vincent.guittot@linaro.org, rjw@rjwysocki.net
Subject: Re: [PATCH v3 2/3] media: stm32-dcmi: Set minimum cpufreq requirement
In-reply-to: <20200604123932.20512-3-benjamin.gaignard@st.com>
Date:   Fri, 05 Jun 2020 13:05:59 +0100
Message-ID: <jhj5zc5iuoo.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 04/06/20 13:39, Benjamin Gaignard wrote:
> Before start streaming set cpufreq minimum frequency requirement.
> The cpufreq governor will adapt the frequencies and we will have
> no latency for handling interrupts.
> The frequency requirement is retrieved from the device-tree node.
>
> While streaming be notified if the IRQ affinity change thanks to
> irq_affinity_notify callback.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 3:
> - add a cpumask field to track boosted CPUs
> - add irq_affinity_notify callback
> - protect cpumask field with a mutex
>
>  drivers/media/platform/stm32/stm32-dcmi.c | 187 ++++++++++++++++++++++++++++--
>  1 file changed, 179 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b8931490b83b..fb6ab09eaff0 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> +static void dcmi_irq_notifier_notify(struct irq_affinity_notify *notify,
> +				     const cpumask_t *mask)
> +{
> +	struct stm32_dcmi *dcmi = container_of(notify,
> +					       struct stm32_dcmi,
> +					       notify);
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	mutex_lock(&dcmi->freq_lock);
> +	/*
> +	 * For all boosted CPUs check if it is still the case
> +	 * if not remove the request
> +	 */
> +	for_each_cpu(cpu, dcmi->boosted) {
> +		if (cpumask_test_cpu(cpu, mask))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_remove_request(&per_cpu(qos_req, cpu));
> +		cpumask_andnot(dcmi->boosted, dcmi->boosted, p->cpus);
> +
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	/*
> +	 * For CPUs in the mask check if they are boosted if not add
> +	 * a request
> +	 */
> +	for_each_cpu(cpu, mask) {
> +		if (cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_add_request(&p->constraints, &per_cpu(qos_req, cpu),
> +				     FREQ_QOS_MIN, dcmi->min_frequency);
> +		cpumask_or(dcmi->boosted, dcmi->boosted, p->cpus);
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	mutex_unlock(&dcmi->freq_lock);

That looks about right.

> +}
> +
> +static void dcmi_irq_notifier_release(struct kref *ref)
> +{
> +	/*
> +	 * This is required by affinity notifier. We don't have anything to
> +	 * free here.
> +	 */
> +}
> +
> +static void dcmi_get_cpu_policy(struct stm32_dcmi *dcmi)
> +{
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	if (!alloc_cpumask_var(&dcmi->boosted, GFP_KERNEL))
> +		return;

I think you want to actually return i.e. -ENOMEM and do cleanups in the
probe; otherwise you'll silently continue.

> +
> +	mutex_lock(&dcmi->freq_lock);
> +
> +	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {

When I suggested serialization, I was thinking we may want to use the irq's
desc lock to prevent the affinity from moving under our feet. Something
like:

  CPU A                                          CPU B

  for_each_cpu(cpu, mask)
    cpu = cpumask_next(cpu, mask)

    // ...                                       cpumask_copy(desc->irq_common_data.affinity, mask)

    cpu = cpumask_next(cpu, mask)

Now, should that happen, we would still queue the notifier and run it
shortly after - and since you track which CPUs are boosted, I don't think
we have any loss of information here.

We may have yet another affinity change while the notifier is still queued;
but the notifier boilerplate does grab the desc lock, so I think it's all
good - it wasn't all super obvious so I figured I'd still point it out.

> +		if (cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_add_request(&p->constraints, &per_cpu(qos_req, cpu),
> +				     FREQ_QOS_MIN, FREQ_QOS_MIN_DEFAULT_VALUE);
> +
> +		cpumask_or(dcmi->boosted, dcmi->boosted, p->cpus);
> +
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	mutex_unlock(&dcmi->freq_lock);
> +}
> +
> +static void dcmi_put_cpu_policy(struct stm32_dcmi *dcmi)
> +{
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	mutex_lock(&dcmi->freq_lock);
> +
> +	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
> +		if (!cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_remove_request(&per_cpu(qos_req, cpu));
> +		cpumask_andnot(dcmi->boosted, dcmi->boosted, p->cpus);
> +
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	free_cpumask_var(dcmi->boosted);
> +
> +	mutex_unlock(&dcmi->freq_lock);
> +}
> +
> +static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, s32 freq)
> +{
> +	struct irq_affinity_notify *notify = &dcmi->notify;
> +	int cpu;
> +
> +	mutex_lock(&dcmi->freq_lock);
> +
> +	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
> +		if (!cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +

If the affinity changed between say .probe() and .start_streaming(), IIUC
you may skip CPUs here - and even if you initialize the notifier earlier in
the function (see below), that won't help you.

I think dcmi_irq_notifier_notify() does almost all you want, if it also did
the QoS update for CPUs that weren't affected by the affinity change, you
may be able to just do:

   dcmi_irq_notifier_notify(irq_get_affinity_mask(dcmi->irq));

Or something along those lines.

> +		if (!freq_qos_request_active(&per_cpu(qos_req, cpu)))
> +			continue;
> +
> +		freq_qos_update_request(&per_cpu(qos_req, cpu), freq);
> +	}
> +
> +	mutex_unlock(&dcmi->freq_lock);
> +
> +	if (freq != FREQ_QOS_MIN_DEFAULT_VALUE) {
