Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0FF1ECCC2
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 11:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgFCJlx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 05:41:53 -0400
Received: from foss.arm.com ([217.140.110.172]:59190 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgFCJlx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 05:41:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DFD431B;
        Wed,  3 Jun 2020 02:41:52 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A3F93F305;
        Wed,  3 Jun 2020 02:41:50 -0700 (PDT)
References: <20200527151613.16083-1-benjamin.gaignard@st.com> <jhjpnahizkm.mognet@arm.com> <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com> <jhjo8q1io9o.mognet@arm.com> <1b0ace18-e7f8-0b75-f6fe-968a269626b0@st.com> <CAKfTPtCbM-w_0VrTB5tsSM5PKRtC44f3sSmAR=U=P3e3KQ+cMw@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Benjamin GAIGNARD <benjamin.gaignard@st.com>,
        Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab\@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32\@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-media\@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32\@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel\@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rjw\@rjwysocki.net" <rjw@rjwysocki.net>
Subject: Re: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
In-reply-to: <CAKfTPtCbM-w_0VrTB5tsSM5PKRtC44f3sSmAR=U=P3e3KQ+cMw@mail.gmail.com>
Date:   Wed, 03 Jun 2020 10:41:41 +0100
Message-ID: <jhjmu5kiizu.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 03/06/20 08:50, Vincent Guittot wrote:
> On Wed, 3 Jun 2020 at 09:34, Benjamin GAIGNARD <benjamin.gaignard@st.com> wrote:
>> On 6/2/20 3:35 PM, Valentin Schneider wrote:
>> > AFAIA streaming_start() is not necessarily executing on the same CPU as the
>> > one that will handle the interrupt. I was thinking you could use the IRQ's
>> > effective affinity as a hint of which CPU(s) to boost, i.e. something like:
>> >
>> > ---
>> >      struct cpumask_var_t visited;
>> >      struct irq_data *d = irq_get_irq_data(irq);
>> >
>> >      err = alloc_cpumask_var(visited, GFP_KERNEL);
>> >      /* ... */
>> >      for_each_cpu(cpu, irq_data_get_effective_affinity_mask(d)) {
>> >              /* check if not already spanned */
>> >              if (cpumask_test_cpu(cpu, visited))
>> >                      continue;
>> >
>> >              policy = cpufreq_cpu_get(cpu);
>> >              cpumask_or(visited, visited, policy->cpus);
>> >              /* do the boost for that policy here */
>> >              /* ... */
>> >              cpufreq_cpu_put(policy);
>> >      }
>> > ---
>> >
>> > That of course falls apart when hotplug gets involved, and the effective
>> > affinity changes... There's irq_set_affinity_notifier() out there, but it
>> > seems it's only about the affinity, not the effective_affinity, I'm not
>> > sure how valid it would be to query the effective_affinity in that
>> > notifier.

>> If I wait to be in the irq it will be too late so I think I will do a
>> loop over all possible CPUs
>> before start the streaming to change the policies.
>

Yes, that's what I was thinking as well.

> Can't you use irq_get_affinity_mask  and loop over it ?
>

In the end that's the only usable option, I think.

I was looking at alternatives because on arm64 (and AFAICT that applies
to arm too; see irq-gic.c::gic_set_affinity()) the affinity mask spans
all CPUs by default, while the effective affinity mask spans only the
CPU that will actually handle the IRQ (+ where its thread should run).

That said, using the effective mask that way does feel like an
implementation leak. Sadly I couldn't find any better way to minimize
the number of boosted frequency domains.

> Also You should better use freq_qos_add/remove_request during probe
> and remove of the driver and use freq_qos_update_request in
> dcmi_start/stop_streaming to set/unset your constraint.
>
