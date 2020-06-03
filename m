Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782D21ED347
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 17:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgFCPZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 11:25:10 -0400
Received: from foss.arm.com ([217.140.110.172]:34708 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgFCPZK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 11:25:10 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3362B55D;
        Wed,  3 Jun 2020 08:25:10 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FCFA3F52E;
        Wed,  3 Jun 2020 08:25:08 -0700 (PDT)
References: <20200603124559.22652-1-benjamin.gaignard@st.com> <20200603124559.22652-3-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     hugues.fruchet@st.com, mchehab@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        vincent.guittot@linaro.org, rjw@rjwysocki.net
Subject: Re: [PATCH v2 2/3] media: stm32-dcmi: Set minimum cpufreq requirement
In-reply-to: <20200603124559.22652-3-benjamin.gaignard@st.com>
Date:   Wed, 03 Jun 2020 16:25:01 +0100
Message-ID: <jhjk10oi33m.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 03/06/20 13:45, Benjamin Gaignard wrote:
> +static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, u64 freq)
> +{
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
> +		p = per_cpu(policy, cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_update_request(&per_cpu(qos_req, cpu), freq);
> +	}
> +}
> +

You may want to use a "visited" cpumask as I suggested in the previous
thread, since a policy can cover more than one CPU (IOW, a frequency domain
can span more than one CPU). It's not required per-se, AFAICT, but it makes
things a bit neater.

I also think you'll have to use the affinity notifier
(irq_set_affinity_notifier()), since AFAICT userspace can change the
affinity of that IRQ. I suppose you'll want something like:
- Check if we currently are in streaming mode
- Clear the QoS request for CPUs that were previously boosted but that
  aren't in the new mask
- Add the request for the new CPUs.

You'll probably need serialize the reading of the mask in the regular
dcmi_set_min_frequency() as well. I concur all of that is somewhat
annoying, but AFAICT that's required for a sturdy implementation.

>  static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>       struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
