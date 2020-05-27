Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE471E41F2
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 14:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgE0MWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 08:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgE0MWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 08:22:40 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9B7C08C5C2
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 05:22:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m12so26237379ljc.6
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9b4AFKGw4ZZqotl5s77CmzWTjWCoCCtFECSbH9IYsSA=;
        b=m/5Y8vGmTNwpX4AY/6YSPBzyxbV9CKofpxuLOV0rT4OW1WUwRQh+L2hmPkrR89JHho
         mp29JMpeTbkjSCFWI18PSTIgrgmgOjy6tersXf5zegumqtO4wPcztIOrlczKxAfBaip/
         dkflMMQCcfol0dxbIx4Vta1k0hWUb/ffJAZUrQBY2F7BSIYH4RLzFuT9RagreGHhUs+E
         3L0R+LudxVmrH/FaiNK0F4I8Vh+kXtqFQu+TEGgkAFqZTdN1Sg6Gr7h26V9rvn/PGWT1
         Ny2xAtgPKwRyY+mbbM43KJUc8HGCnx2gqGjVEeQgynYclzEh+vg+qkDRfKBwTGMzbIHG
         +zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9b4AFKGw4ZZqotl5s77CmzWTjWCoCCtFECSbH9IYsSA=;
        b=Is3vl7LIqvIiezKsu3hoEfRpKApvEKWhyLPUTRW5Z44pQ3FXsqPreQlPwh1iAG0dJR
         1PWGrX6iY0cqvyNbdS7URokak0CEX76aC68r94XXFIpjl+l3KqZ5zRSW5zFY8CUmQbVP
         3wlEYC24UpDkhUhLb39ClJnHI5gm2ikYlkCcHYGk2qxoQX1bJdRlj9P0022fRjOKKF6L
         0OsXXgeoyzzEBM7ieM9mwQVMy1xLfAn2afP3SZcC9R9xR0j6ytJclH+NjwQ1p548ihjf
         iAU1CnjFSj+H6iBhL6SQ8RjZorBn/02nFtEEmam0O/gv4reDhlfL5gHdw4FffPKb/pjJ
         9uOg==
X-Gm-Message-State: AOAM532kjlpyjhL5YZfwjWIRFK90PsreTSK8tCN4yVQuOTlB6HNqN4qN
        lFstlB4eIi1hO5Gt6OwVi1cxO3ksaLeM4v0mmuKYSg==
X-Google-Smtp-Source: ABdhPJxTsWDgeOe5Djkxbz5Vhm5vLbaAAlGQFkDtkkPWtJUSrez+RPSqeMSp1e9eKl58SCBsVQ5ilU3q78cT0eLqwnc=
X-Received: by 2002:a2e:9510:: with SMTP id f16mr3179414ljh.111.1590582158421;
 Wed, 27 May 2020 05:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200526151619.8779-1-benjamin.gaignard@st.com>
 <jhjk10xu1tq.mognet@arm.com> <ab4340c0-bda3-e752-9073-e162e6325bb1@st.com>
In-Reply-To: <ab4340c0-bda3-e752-9073-e162e6325bb1@st.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 27 May 2020 14:22:27 +0200
Message-ID: <CAKfTPtBt6Ju-CnETnn6_FkgR0CAJ+jYnySz9OHP9X2hmxWHM7w@mail.gmail.com>
Subject: Re: [RFC RESEND 0/3] Introduce cpufreq minimum load QoS
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
        Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "len.brown@intel.com" <len.brown@intel.com>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 27 May 2020 at 13:17, Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 5/27/20 12:09 PM, Valentin Schneider wrote:
> > Hi Benjamin,
> >
> > On 26/05/20 16:16, Benjamin Gaignard wrote:
> >> A first round [1] of discussions and suggestions have already be done on
> >> this series but without found a solution to the problem. I resend it to
> >> progress on this topic.
> >>
> > Apologies for sleeping on that previous thread.
> >
> > So what had been suggested over there was to use uclamp to boost the
> > frequency of the handling thread; however if you use threaded IRQs you
> > get RT threads, which already get the max frequency by default (at least
> > with schedutil).
> >
> > Does that not work for you, and if so, why?
> That doesn't work because almost everything is done by the hardware blocks
> without charge the CPU so the thread isn't running. I have done the
> tests with schedutil
> and ondemand scheduler (which is the one I'm targeting). I have no
> issues when using
> performance scheduler because it always keep the highest frequencies.

IMHO, the only way to ensure a min frequency for anything else than a
thread is to use freq_qos_add_request() just like cpufreq cooling
device but for the opposite QoS. This can be applied only on the
frequency domain of the CPU which handles the interrupt.
Have you also checked the wakeup latency of your idle state ?

>
>
> >
> >> When start streaming from the sensor the CPU load could remain very low
> >> because almost all the capture pipeline is done in hardware (i.e. without
> >> using the CPU) and let believe to cpufreq governor that it could use lower
> >> frequencies. If the governor decides to use a too low frequency that
> >> becomes a problem when we need to acknowledge the interrupt during the
> >> blanking time.
> >> The delay to ack the interrupt and perform all the other actions before
> >> the next frame is very short and doesn't allow to the cpufreq governor to
> >> provide the required burst of power. That led to drop the half of the frames.
> >>
> >> To avoid this problem, DCMI driver informs the cpufreq governors by adding
> >> a cpufreq minimum load QoS resquest.
> >>
> >> Benjamin
> >>
> >> [1] https://lkml.org/lkml/2020/4/24/360
> >>
> >> Benjamin Gaignard (3):
> >>    PM: QoS: Introduce cpufreq minimum load QoS
> >>    cpufreq: governor: Use minimum load QoS
> >>    media: stm32-dcmi: Inform cpufreq governors about cpu load needs
> >>
> >>   drivers/cpufreq/cpufreq_governor.c        |   5 +
> >>   drivers/media/platform/stm32/stm32-dcmi.c |   8 ++
> >>   include/linux/pm_qos.h                    |  12 ++
> >>   kernel/power/qos.c                        | 213 ++++++++++++++++++++++++++++++
> >>   4 files changed, 238 insertions(+)
