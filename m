Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF611ED018
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 14:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgFCMq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 08:46:26 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:29786 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725890AbgFCMqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 08:46:23 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 053CgD4A004142;
        Wed, 3 Jun 2020 14:46:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=G0SILNyXS/efu63PjZczmnDmrnvI2LtMCvhjjF9NXC8=;
 b=FsQ0BrJww4WP8OAH0RIssayIft7sb6jnj0uQ+/fpiDkSVRh5Cujhpl+YhxA4BVg551RY
 n8WbluBSOfOAqcNBvs7HXfcw2kPnNHbbYg9wYas6M4T5NFULnNAPu13ImuirxvHAdAk0
 xIk0R3L4zE85Lz7NjlICX8w5HTGtKzpJrhnLivfHbwErxEUv5+hMaNmrDuraMZzim9WE
 vBv+fIeTrVgfMHJfI3sm1SgcZ3VphI5AaUevGv5K1vIQvM8TSkJQGya9Uwq7NbsyYTJD
 OiC0I2dfYv3fA7eqSvc4vXQCbwiBhYfa7OI73e+K8WQ/cXO769s4IzPwNRer4G95a5tv Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31bcm94qej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 Jun 2020 14:46:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05C3E100039;
        Wed,  3 Jun 2020 14:46:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC5B62CB37C;
        Wed,  3 Jun 2020 14:46:06 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 3 Jun 2020 14:46:06
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <hugues.fruchet@st.com>, <mchehab@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <vincent.guittot@linaro.org>,
        <valentin.schneider@arm.com>, <rjw@rjwysocki.net>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v2 2/3] media: stm32-dcmi: Set minimum cpufreq requirement
Date:   Wed, 3 Jun 2020 14:45:58 +0200
Message-ID: <20200603124559.22652-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200603124559.22652-1-benjamin.gaignard@st.com>
References: <20200603124559.22652-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-03_12:2020-06-02,2020-06-03 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before start streaming set cpufreq minimum frequency requirement.
The cpufreq governor will adapt the frequencies and we will have
no latency for handling interrupts.
The frequency requirement is retrieved from the device-tree node.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 90 ++++++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b8931490b83b..1b9f24986694 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -13,10 +13,12 @@
 
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/cpufreq.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -99,6 +101,9 @@ enum state {
 
 #define OVERRUN_ERROR_THRESHOLD	3
 
+static DEFINE_PER_CPU(struct cpufreq_policy *, policy);
+static DEFINE_PER_CPU(struct freq_qos_request, qos_req);
+
 struct dcmi_graph_entity {
 	struct v4l2_async_subdev asd;
 
@@ -133,6 +138,7 @@ struct stm32_dcmi {
 	struct resource			*res;
 	struct reset_control		*rstc;
 	int				sequence;
+	int				irq;
 	struct list_head		buffers;
 	struct dcmi_buf			*active;
 
@@ -173,6 +179,8 @@ struct stm32_dcmi {
 	struct media_device		mdev;
 	struct media_pad		vid_cap_pad;
 	struct media_pipeline		pipeline;
+
+	u32				min_frequency;
 };
 
 static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
@@ -722,6 +730,62 @@ static void dcmi_pipeline_stop(struct stm32_dcmi *dcmi)
 	dcmi_pipeline_s_stream(dcmi, 0);
 }
 
+static void dcmi_get_min_frequency(struct stm32_dcmi *dcmi)
+{
+	struct device_node *np = dcmi->mdev.dev->of_node;
+
+	dcmi->min_frequency = FREQ_QOS_MIN_DEFAULT_VALUE;
+
+	of_property_read_u32(np, "st,stm32-dcmi-min-frequency",
+			     &dcmi->min_frequency);
+}
+
+static void dcmi_get_cpu_policy(struct stm32_dcmi *dcmi)
+{
+	struct cpufreq_policy *p;
+	int cpu;
+
+	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
+		p = cpufreq_cpu_get(cpu);
+		if (!p)
+			continue;
+
+		freq_qos_add_request(&p->constraints, &per_cpu(qos_req, cpu),
+				     FREQ_QOS_MIN, FREQ_QOS_MIN_DEFAULT_VALUE);
+
+		per_cpu(policy, cpu) = p;
+	}
+}
+
+static void dcmi_put_cpu_policy(struct stm32_dcmi *dcmi)
+{
+	struct cpufreq_policy *p;
+	int cpu;
+
+	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
+		p = per_cpu(policy, cpu);
+		if (!p)
+			continue;
+
+		freq_qos_remove_request(&per_cpu(qos_req, cpu));
+		cpufreq_cpu_put(p);
+	}
+}
+
+static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, u64 freq)
+{
+	struct cpufreq_policy *p;
+	int cpu;
+
+	for_each_cpu(cpu, irq_get_affinity_mask(dcmi->irq)) {
+		p = per_cpu(policy, cpu);
+		if (!p)
+			continue;
+
+		freq_qos_update_request(&per_cpu(qos_req, cpu), freq);
+	}
+}
+
 static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
@@ -736,11 +800,13 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_release_buffers;
 	}
 
+	dcmi_set_min_frequency(dcmi, dcmi->min_frequency);
+
 	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
 	if (ret < 0) {
 		dev_err(dcmi->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
 			__func__, ret);
-		goto err_pm_put;
+		goto err_drop_qos;
 	}
 
 	ret = dcmi_pipeline_start(dcmi);
@@ -835,7 +901,8 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 err_media_pipeline_stop:
 	media_pipeline_stop(&dcmi->vdev->entity);
 
-err_pm_put:
+err_drop_qos:
+	dcmi_set_min_frequency(dcmi, FREQ_QOS_MIN_DEFAULT_VALUE);
 	pm_runtime_put(dcmi->dev);
 
 err_release_buffers:
@@ -863,6 +930,8 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 
 	media_pipeline_stop(&dcmi->vdev->entity);
 
+	dcmi_set_min_frequency(dcmi, FREQ_QOS_MIN_DEFAULT_VALUE);
+
 	spin_lock_irq(&dcmi->irqlock);
 
 	/* Disable interruptions */
@@ -1838,7 +1907,6 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct vb2_queue *q;
 	struct dma_chan *chan;
 	struct clk *mclk;
-	int irq;
 	int ret = 0;
 
 	match = of_match_device(of_match_ptr(stm32_dcmi_of_match), &pdev->dev);
@@ -1879,9 +1947,9 @@ static int dcmi_probe(struct platform_device *pdev)
 	dcmi->bus.bus_width = ep.bus.parallel.bus_width;
 	dcmi->bus.data_shift = ep.bus.parallel.data_shift;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return irq ? irq : -ENXIO;
+	dcmi->irq = platform_get_irq(pdev, 0);
+	if (dcmi->irq <= 0)
+		return dcmi->irq ? dcmi->irq : -ENXIO;
 
 	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!dcmi->res) {
@@ -1895,11 +1963,12 @@ static int dcmi_probe(struct platform_device *pdev)
 		return PTR_ERR(dcmi->regs);
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,
+	ret = devm_request_threaded_irq(&pdev->dev, dcmi->irq,
+					dcmi_irq_callback,
 					dcmi_irq_thread, IRQF_ONESHOT,
 					dev_name(&pdev->dev), dcmi);
 	if (ret) {
-		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
+		dev_err(&pdev->dev, "Unable to request irq %d\n", dcmi->irq);
 		return ret;
 	}
 
@@ -2022,6 +2091,9 @@ static int dcmi_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "Probe done\n");
 
+	dcmi_get_min_frequency(dcmi);
+	dcmi_get_cpu_policy(dcmi);
+
 	platform_set_drvdata(pdev, dcmi);
 
 	pm_runtime_enable(&pdev->dev);
@@ -2049,6 +2121,8 @@ static int dcmi_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	dcmi_put_cpu_policy(dcmi);
+
 	v4l2_async_notifier_unregister(&dcmi->notifier);
 	v4l2_async_notifier_cleanup(&dcmi->notifier);
 	media_entity_cleanup(&dcmi->vdev->entity);
-- 
2.15.0

