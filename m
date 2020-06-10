Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81841F52F9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 13:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgFJLUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 07:20:07 -0400
Received: from foss.arm.com ([217.140.110.172]:57230 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728264AbgFJLUH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 07:20:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7D6B1FB;
        Wed, 10 Jun 2020 04:20:06 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 257703F66F;
        Wed, 10 Jun 2020 04:20:05 -0700 (PDT)
References: <20200609115825.10748-1-benjamin.gaignard@st.com> <20200609115825.10748-3-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     hugues.fruchet@st.com, mchehab@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        vincent.guittot@linaro.org, rjw@rjwysocki.net
Subject: Re: [PATCH v5 2/3] media: stm32-dcmi: Set minimum cpufreq requirement
In-reply-to: <20200609115825.10748-3-benjamin.gaignard@st.com>
Date:   Wed, 10 Jun 2020 12:20:02 +0100
Message-ID: <jhjtuzj2mn1.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Benjamin,

On 09/06/20 12:58, Benjamin Gaignard wrote:
> +static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, s32 freq)
> +{
> +	struct irq_affinity_notify *notify = &dcmi->notify;
> +	struct cpumask clear;
> +
> +	mutex_lock(&dcmi->freq_lock);
> +	dcmi->targeted_frequency = freq;
> +	mutex_unlock(&dcmi->freq_lock);
> +
> +	if (freq) {
> +		dcmi_irq_notifier_notify(notify,
> +					 irq_get_affinity_mask(dcmi->irq));
> +	} else {
> +		cpumask_clear(&clear);
> +		dcmi_irq_notifier_notify(notify, &clear);
> +	}
> +}
> +

IIUC the changes in this version, you would now need a call to
freq_qos_update_request() in the notifier. That's because you can now go
through the notifier callback with

  targeted_frequency = FREQ_QOS_MIN_DEFAULT_VALUE

yet still add CPUs to the boosted mask. I think you were pretty close to a
decent solution in your previous version, with some notifier registration
movement. This is what I had in mind (the diff is against v4; ofc
absolutely untested!):

---
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index c2389776a958..cc147de6ea70 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -801,15 +801,22 @@ static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, s32 freq)
        struct irq_affinity_notify *notify = &dcmi->notify;

        if (freq) {
+		/*
+		 * Register the notifier before doing any change, so the
+		 * callback can be queued if an affinity change happens *while*
+		 * we are requesting the boosts.
+		 */
+		irq_set_affinity_notifier(dcmi->irq, notify);
                dcmi_irq_notifier_notify(notify,
                                         irq_get_affinity_mask(dcmi->irq));
-
-		notify->notify = dcmi_irq_notifier_notify;
-		notify->release = dcmi_irq_notifier_release;
-		irq_set_affinity_notifier(dcmi->irq, notify);
        } else {
                struct cpumask clear;

+		/*
+		 * Unregister the notifier before clearing the boost requests,
+		 * as we don't want to boost again if an affinity change happens
+		 * *while* we are clearing the requests
+		 */
                irq_set_affinity_notifier(dcmi->irq, NULL);
                cpumask_clear(&clear);
                dcmi_irq_notifier_notify(notify, &clear);
@@ -2032,6 +2039,9 @@ static int dcmi_probe(struct platform_device *pdev)
        if (!alloc_cpumask_var(&dcmi->boosted, GFP_KERNEL))
                return -ENODEV;

+	dcmi->notify->notify = dcmi_irq_notifier_notify;
+	dcmi->notify->release = dcmi_irq_notifier_release;
+
        q = &dcmi->queue;

        dcmi->v4l2_dev.mdev = &dcmi->mdev;
---

Does that make sense to you?
