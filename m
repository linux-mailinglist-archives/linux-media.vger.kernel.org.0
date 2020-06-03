Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D531ECACD
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgFCHuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCHuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 03:50:20 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92DEC05BD43
        for <linux-media@vger.kernel.org>; Wed,  3 Jun 2020 00:50:19 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id e125so716116lfd.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2020 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RI6iXB0qMqr3xlMnwnNSpUiS3SZYn3+NS4HUs4hvuFk=;
        b=Bv2NGZRkizy50GG012REDa+Ac6WD7Cdlhp9SBQUZne2ONByEmjbrF1ObuaG8BusUuc
         tT4fFF6bOT7sbpGB8srbSU8sAzLauoqfKgAnHEMe+Njoiq8cN8L4/OILOwpNPvXxVoRH
         Pnb1931Hl0DGZD17DmZWdVQg3OicSRvDhOV3hpc3knBMfWL7aYPz7QcGjsOC6+dIYy1Z
         BBA8Nzqwm/A2HE/lLI5xIt/BnG1w3KfdtF35Eoo4b/oIXYE9IQp3jdFlXdXmLTzZjFuK
         x6SKMLDcFQfsamwJtMSktvo/Ma8v/iZmfw/yQqiVXjsUKZjmCLRSvusNarN0vntWMQ8c
         P4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RI6iXB0qMqr3xlMnwnNSpUiS3SZYn3+NS4HUs4hvuFk=;
        b=QrMEBJjT82E1XxCMTiG7w4yetjjb65Uu3tDUZa++WnJKibudSE8h2UryLF0/2JES0X
         ja4odzXEvHciNyYiFuGNuRMRAQcMDEgs72FO5aQykZEU+62zG+przbX3VFf3FfzN6zWU
         yXxYYFiwK1UvaJDwFFX3Ub5IileQ7p4KOCFqgAs9gkXyHv5XoVv4jC08iv64pGqh4enI
         F8zXKo3x0+EPyV0BkgrEtoaVmBjpYDzatNwAOxZXpvEbFWM4taSz4GjPH8vDE2yF40+U
         QfudBMrWJ8XImpJkf1vLyrJoiXgLtW7c0cfRqG+oGKsOswTKCCeAzpDc+HHlp1PMOiBh
         OqoQ==
X-Gm-Message-State: AOAM530v7RKTc8RAYSpKDfJftgBmM8KtjAnSmGI9TqnwTR3agRfuIjGb
        HIucNBvkC/LnYtstWctxqfc2Z0+rJVy+uMJ02fOz7w==
X-Google-Smtp-Source: ABdhPJwQ86B8yTe/9il9L6LnfiUJTL8erQbgj0KU1+oMuQ+QlImP1yxiL4f9rbdAdwNQf8DKbxDu0Dm6tMQQyCoUlhY=
X-Received: by 2002:a19:5013:: with SMTP id e19mr1725514lfb.95.1591170618304;
 Wed, 03 Jun 2020 00:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
 <jhjpnahizkm.mognet@arm.com> <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com>
 <jhjo8q1io9o.mognet@arm.com> <1b0ace18-e7f8-0b75-f6fe-968a269626b0@st.com>
In-Reply-To: <1b0ace18-e7f8-0b75-f6fe-968a269626b0@st.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 3 Jun 2020 09:50:06 +0200
Message-ID: <CAKfTPtCbM-w_0VrTB5tsSM5PKRtC44f3sSmAR=U=P3e3KQ+cMw@mail.gmail.com>
Subject: Re: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 3 Jun 2020 at 09:34, Benjamin GAIGNARD <benjamin.gaignard@st.com> wrote:
>
>
>
> On 6/2/20 3:35 PM, Valentin Schneider wrote:
> > On 02/06/20 12:37, Benjamin GAIGNARD wrote:
> >> On 6/2/20 11:31 AM, Valentin Schneider wrote:
> >>>> @@ -99,6 +100,8 @@ enum state {
> >>>>
> >>>>    #define OVERRUN_ERROR_THRESHOLD 3
> >>>>
> >>>> +#define DCMI_MIN_FREQ     650000 /* in KHz */
> >>>> +
> >>> This assumes the handling part is guaranteed to always run on the same CPU
> >>> with the same performance profile (regardless of the platform). If that's
> >>> not guaranteed, it feels like you'd want this to be configurable in some
> >>> way.
> >> Yes I could add a st,stm32-dcmi-min-frequency (in KHz) parameter the
> >> device tree node.
> >>
> > Something like that - I'm not sure how well this fits with the DT
> > landscape, as you could argue it isn't really a description of the
> > hardware, more of a description of the performance expectations of the
> > software. I won't really argue here.
> >
> >>>>    struct dcmi_graph_entity {
> >>>>         struct v4l2_async_subdev asd;
> >>>>
> >>> [...]
> >>>> @@ -2020,6 +2042,8 @@ static int dcmi_probe(struct platform_device *pdev)
> >>>>                 goto err_cleanup;
> >>>>         }
> >>>>
> >>>> +  dcmi->policy = cpufreq_cpu_get(0);
> >>>> +
> >>> Ideally you'd want to fetch the policy of the CPU your IRQ (and handling
> >>> thread) is affined to; The only compatible DTS I found describes a single
> >>> A7, which is somewhat limited in the affinity area...
> >> If I move this code just before start streaming and use get_cpu(), would
> >> it works ?
> >>
> > AFAIA streaming_start() is not necessarily executing on the same CPU as the
> > one that will handle the interrupt. I was thinking you could use the IRQ's
> > effective affinity as a hint of which CPU(s) to boost, i.e. something like:
> >
> > ---
> >      struct cpumask_var_t visited;
> >      struct irq_data *d = irq_get_irq_data(irq);
> >
> >      err = alloc_cpumask_var(visited, GFP_KERNEL);
> >      /* ... */
> >      for_each_cpu(cpu, irq_data_get_effective_affinity_mask(d)) {
> >              /* check if not already spanned */
> >              if (cpumask_test_cpu(cpu, visited))
> >                      continue;
> >
> >              policy = cpufreq_cpu_get(cpu);
> >              cpumask_or(visited, visited, policy->cpus);
> >              /* do the boost for that policy here */
> >              /* ... */
> >              cpufreq_cpu_put(policy);
> >      }
> > ---
> >
> > That of course falls apart when hotplug gets involved, and the effective
> > affinity changes... There's irq_set_affinity_notifier() out there, but it
> > seems it's only about the affinity, not the effective_affinity, I'm not
> > sure how valid it would be to query the effective_affinity in that
> > notifier.
> If I wait to be in the irq it will be too late so I think I will do a
> loop over all possible CPUs
> before start the streaming to change the policies.

Can't you use irq_get_affinity_mask  and loop over it ?

Also You should better use freq_qos_add/remove_request during probe
and remove of the driver and use freq_qos_update_request in
dcmi_start/stop_streaming to set/unset your constraint.

>
> >
> >> Benjamin
> >>>>         dev_info(&pdev->dev, "Probe done\n");
> >>>>
> >>>>         platform_set_drvdata(pdev, dcmi);
> >>>> @@ -2049,6 +2073,9 @@ static int dcmi_remove(struct platform_device *pdev)
> >>>>
> >>>>         pm_runtime_disable(&pdev->dev);
> >>>>
> >>>> +  if (dcmi->policy)
> >>>> +          cpufreq_cpu_put(dcmi->policy);
> >>>> +
> >>>>         v4l2_async_notifier_unregister(&dcmi->notifier);
> >>>>         v4l2_async_notifier_cleanup(&dcmi->notifier);
> >>>>         media_entity_cleanup(&dcmi->vdev->entity);
