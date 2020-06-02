Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E8C1EB895
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 11:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgFBJb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 05:31:29 -0400
Received: from foss.arm.com ([217.140.110.172]:48558 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgFBJb2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 05:31:28 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45ACC55D;
        Tue,  2 Jun 2020 02:31:28 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A47393F305;
        Tue,  2 Jun 2020 02:31:26 -0700 (PDT)
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     hugues.fruchet@st.com, mchehab@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        vincent.guittot@linaro.org, rjw@rjwysocki.net
Subject: Re: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
In-reply-to: <20200527151613.16083-1-benjamin.gaignard@st.com>
Date:   Tue, 02 Jun 2020 10:31:21 +0100
Message-ID: <jhjpnahizkm.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Benjamin,

On 27/05/20 16:16, Benjamin Gaignard wrote:
> Before start streaming set cpufreq minimum frequency requirement.
> The cpufreq governor will adapt the frequencies and we will have
> no latency for handling interrupts.
>

Few comments below from someone oblivious to your platform, they may not
be all that relevant but I figured I'd pitch in anyway.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b8931490b83b..97c342351569 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -13,6 +13,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
> +#include <linux/cpufreq.h>
>  #include <linux/delay.h>
>  #include <linux/dmaengine.h>
>  #include <linux/init.h>
> @@ -99,6 +100,8 @@ enum state {
>
>  #define OVERRUN_ERROR_THRESHOLD	3
>
> +#define DCMI_MIN_FREQ	650000 /* in KHz */
> +

This assumes the handling part is guaranteed to always run on the same CPU
with the same performance profile (regardless of the platform). If that's
not guaranteed, it feels like you'd want this to be configurable in some
way.

>  struct dcmi_graph_entity {
>       struct v4l2_async_subdev asd;
>
[...]
> @@ -2020,6 +2042,8 @@ static int dcmi_probe(struct platform_device *pdev)
>               goto err_cleanup;
>       }
>
> +	dcmi->policy = cpufreq_cpu_get(0);
> +

Ideally you'd want to fetch the policy of the CPU your IRQ (and handling
thread) is affined to; The only compatible DTS I found describes a single
A7, which is somewhat limited in the affinity area...

>       dev_info(&pdev->dev, "Probe done\n");
>
>       platform_set_drvdata(pdev, dcmi);
> @@ -2049,6 +2073,9 @@ static int dcmi_remove(struct platform_device *pdev)
>
>       pm_runtime_disable(&pdev->dev);
>
> +	if (dcmi->policy)
> +		cpufreq_cpu_put(dcmi->policy);
> +
>       v4l2_async_notifier_unregister(&dcmi->notifier);
>       v4l2_async_notifier_cleanup(&dcmi->notifier);
>       media_entity_cleanup(&dcmi->vdev->entity);
