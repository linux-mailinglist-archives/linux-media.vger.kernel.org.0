Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF971EBD26
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 15:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgFBNfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 09:35:39 -0400
Received: from foss.arm.com ([217.140.110.172]:50978 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgFBNfj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 09:35:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5F721FB;
        Tue,  2 Jun 2020 06:35:38 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EA783F305;
        Tue,  2 Jun 2020 06:35:37 -0700 (PDT)
References: <20200527151613.16083-1-benjamin.gaignard@st.com> <jhjpnahizkm.mognet@arm.com> <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab\@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32\@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-media\@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32\@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel\@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vincent.guittot\@linaro.org" <vincent.guittot@linaro.org>,
        "rjw\@rjwysocki.net" <rjw@rjwysocki.net>
Subject: Re: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
In-reply-to: <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com>
Date:   Tue, 02 Jun 2020 14:35:31 +0100
Message-ID: <jhjo8q1io9o.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 02/06/20 12:37, Benjamin GAIGNARD wrote:
> On 6/2/20 11:31 AM, Valentin Schneider wrote:
>>> @@ -99,6 +100,8 @@ enum state {
>>>
>>>   #define OVERRUN_ERROR_THRESHOLD	3
>>>
>>> +#define DCMI_MIN_FREQ	650000 /* in KHz */
>>> +
>> This assumes the handling part is guaranteed to always run on the same CPU
>> with the same performance profile (regardless of the platform). If that's
>> not guaranteed, it feels like you'd want this to be configurable in some
>> way.
> Yes I could add a st,stm32-dcmi-min-frequency (in KHz) parameter the
> device tree node.
>

Something like that - I'm not sure how well this fits with the DT
landscape, as you could argue it isn't really a description of the
hardware, more of a description of the performance expectations of the
software. I won't really argue here.

>>
>>>   struct dcmi_graph_entity {
>>>        struct v4l2_async_subdev asd;
>>>
>> [...]
>>> @@ -2020,6 +2042,8 @@ static int dcmi_probe(struct platform_device *pdev)
>>>                goto err_cleanup;
>>>        }
>>>
>>> +	dcmi->policy = cpufreq_cpu_get(0);
>>> +
>> Ideally you'd want to fetch the policy of the CPU your IRQ (and handling
>> thread) is affined to; The only compatible DTS I found describes a single
>> A7, which is somewhat limited in the affinity area...
> If I move this code just before start streaming and use get_cpu(), would
> it works ?
>

AFAIA streaming_start() is not necessarily executing on the same CPU as the
one that will handle the interrupt. I was thinking you could use the IRQ's
effective affinity as a hint of which CPU(s) to boost, i.e. something like:

---
    struct cpumask_var_t visited;
    struct irq_data *d = irq_get_irq_data(irq);

    err = alloc_cpumask_var(visited, GFP_KERNEL);
    /* ... */
    for_each_cpu(cpu, irq_data_get_effective_affinity_mask(d)) {
            /* check if not already spanned */
            if (cpumask_test_cpu(cpu, visited))
                    continue;

            policy = cpufreq_cpu_get(cpu);
            cpumask_or(visited, visited, policy->cpus);
            /* do the boost for that policy here */
            /* ... */
            cpufreq_cpu_put(policy);
    }
---

That of course falls apart when hotplug gets involved, and the effective
affinity changes... There's irq_set_affinity_notifier() out there, but it
seems it's only about the affinity, not the effective_affinity, I'm not
sure how valid it would be to query the effective_affinity in that
notifier.

> Benjamin
>>
>>>        dev_info(&pdev->dev, "Probe done\n");
>>>
>>>        platform_set_drvdata(pdev, dcmi);
>>> @@ -2049,6 +2073,9 @@ static int dcmi_remove(struct platform_device *pdev)
>>>
>>>        pm_runtime_disable(&pdev->dev);
>>>
>>> +	if (dcmi->policy)
>>> +		cpufreq_cpu_put(dcmi->policy);
>>> +
>>>        v4l2_async_notifier_unregister(&dcmi->notifier);
>>>        v4l2_async_notifier_cleanup(&dcmi->notifier);
>>>        media_entity_cleanup(&dcmi->vdev->entity);
