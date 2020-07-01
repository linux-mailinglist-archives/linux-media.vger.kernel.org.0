Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0E9210B70
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 14:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730744AbgGAM7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 08:59:40 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:36717 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729959AbgGAM7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 08:59:38 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061Cqq2Q019382;
        Wed, 1 Jul 2020 14:59:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jSND8GqGx1dznUA4xyMR4NQdgjDfoJ4h3T0XJgWGvbw=;
 b=qIB+o9oYWWEbinBNs11Mfkd/Nie8OjzQ/0bpmaM5hCxLFTGc4EW1VIkZhIxGwBvA1Mxm
 13qH+RPkuAjE+vTc3c/2PaNT5B09eABQ85jO1e1TRNBKHPbq8F4fZKm8yiNx8gH59qCV
 lb15T7RPPneH3KxOudTUy3yATCetyKHcq4zWHt7fjNiN0cCVcQut8OpepT+ybLxWp41r
 yPgvoc5cNGhKV9j8+MSwwCHE5ek9QR7lBaY7c/YVtV1gPalsK/yrWnmbTIU/gNL/9gbb
 mClTYq2xUDIJgsvCsnsRRfAKoU8R4MOpw13vcTQPbIHciJ4hgf3UPnVLDElmp8Lzwq6m Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuvwa2bg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 14:59:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1277A10002A;
        Wed,  1 Jul 2020 14:59:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 023752B66DE;
        Wed,  1 Jul 2020 14:59:24 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul 2020 14:59:23
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <hugues.fruchet@st.com>, <mchehab@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <vincent.guittot@linaro.org>,
        <valentin.schneider@arm.com>, <rjw@rjwysocki.net>,
        <devicetree@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v6 2/3] media: stm32-dcmi: Set minimum cpufreq requirement
Date:   Wed, 1 Jul 2020 14:59:17 +0200
Message-ID: <20200701125918.30793-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200701125918.30793-1-benjamin.gaignard@st.com>
References: <20200701125918.30793-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_08:2020-07-01,2020-07-01 signatures=0
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
version 6:
- come back to version 4 and follow Valentin's suggestions about notifier
- add Valentin's comment about notifier set/unset

version 5:
- add a mutex to protect dcmi_irq_notifier_notify()
- register notifier a probe time

version 4:
- simplify irq affinity handling by using only dcmi_irq_notifier_notify() 

version 3:
- add a cpumask field to track boosted CPUs
- add irq_affinity_notify callback
- protect cpumask field with a mutex 

 drivers/media/platform/stm32/stm32-dcmi.c | 138 ++++++++++++++++++++++++++++--
 1 file changed, 130 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b8931490b83b..382df6e7c864 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -13,10 +13,13 @@
 
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/cpufreq.h>
+#include <linux/cpumask.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -99,6 +102,8 @@ enum state {
 
 #define OVERRUN_ERROR_THRESHOLD	3
 
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
 
@@ -173,6 +179,11 @@ struct stm32_dcmi {
 	struct media_device		mdev;
 	struct media_pad		vid_cap_pad;
 	struct media_pipeline		pipeline;
+
+	struct mutex			freq_lock;
+	u32				min_frequency;
+	cpumask_var_t			boosted;
+	struct irq_affinity_notify	notify;
 };
 
 static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
@@ -722,6 +733,99 @@ static void dcmi_pipeline_stop(struct stm32_dcmi *dcmi)
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
+static void dcmi_irq_notifier_notify(struct irq_affinity_notify *notify,
+				     const cpumask_t *mask)
+{
+	struct stm32_dcmi *dcmi = container_of(notify,
+					       struct stm32_dcmi,
+					       notify);
+	struct cpufreq_policy *p;
+	int cpu;
+
+	mutex_lock(&dcmi->freq_lock);
+	/*
+	 * For all boosted CPUs check if it is still the case
+	 * if not remove the request
+	 */
+	for_each_cpu(cpu, dcmi->boosted) {
+		if (cpumask_test_cpu(cpu, mask))
+			continue;
+
+		p = cpufreq_cpu_get(cpu);
+		if (!p)
+			continue;
+
+		freq_qos_remove_request(&per_cpu(qos_req, cpu));
+		cpumask_andnot(dcmi->boosted, dcmi->boosted, p->cpus);
+
+		cpufreq_cpu_put(p);
+	}
+
+	/*
+	 * For CPUs in the mask check if they are boosted if not add
+	 * a request
+	 */
+	for_each_cpu(cpu, mask) {
+		if (cpumask_test_cpu(cpu, dcmi->boosted))
+			continue;
+
+		p = cpufreq_cpu_get(cpu);
+		if (!p)
+			continue;
+
+		freq_qos_add_request(&p->constraints, &per_cpu(qos_req, cpu),
+				     FREQ_QOS_MIN, dcmi->min_frequency);
+		cpumask_or(dcmi->boosted, dcmi->boosted, p->cpus);
+		cpufreq_cpu_put(p);
+	}
+
+	mutex_unlock(&dcmi->freq_lock);
+}
+
+static void dcmi_irq_notifier_release(struct kref *ref)
+{
+	/*
+	 * This is required by affinity notifier. We don't have anything to
+	 * free here.
+	 */
+}
+
+static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, s32 freq)
+{
+	struct irq_affinity_notify *notify = &dcmi->notify;
+	struct cpumask clear;
+
+	if (freq) {
+		/*
+		 * Register the notifier before doing any change, so the
+		 * callback can be queued if an affinity change happens *while*
+		 * we are requesting the boosts.
+		 */
+		irq_set_affinity_notifier(dcmi->irq, notify);
+		dcmi_irq_notifier_notify(notify,
+					 irq_get_affinity_mask(dcmi->irq));
+	} else {
+		/*
+		 * Unregister the notifier before clearing the boost requests,
+		 * as we don't want to boost again if an affinity change happens
+		 * *while* we are clearing the requests
+		 */
+		irq_set_affinity_notifier(dcmi->irq, NULL);
+		cpumask_clear(&clear);
+		dcmi_irq_notifier_notify(notify, &clear);
+	}
+}
+
 static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
@@ -736,11 +840,13 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
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
@@ -835,7 +941,8 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 err_media_pipeline_stop:
 	media_pipeline_stop(&dcmi->vdev->entity);
 
-err_pm_put:
+err_drop_qos:
+	dcmi_set_min_frequency(dcmi, FREQ_QOS_MIN_DEFAULT_VALUE);
 	pm_runtime_put(dcmi->dev);
 
 err_release_buffers:
@@ -863,6 +970,8 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 
 	media_pipeline_stop(&dcmi->vdev->entity);
 
+	dcmi_set_min_frequency(dcmi, FREQ_QOS_MIN_DEFAULT_VALUE);
+
 	spin_lock_irq(&dcmi->irqlock);
 
 	/* Disable interruptions */
@@ -1834,11 +1943,11 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *match = NULL;
 	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
+	struct irq_affinity_notify *notify;
 	struct stm32_dcmi *dcmi;
 	struct vb2_queue *q;
 	struct dma_chan *chan;
 	struct clk *mclk;
-	int irq;
 	int ret = 0;
 
 	match = of_match_device(of_match_ptr(stm32_dcmi_of_match), &pdev->dev);
@@ -1879,9 +1988,9 @@ static int dcmi_probe(struct platform_device *pdev)
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
@@ -1895,11 +2004,12 @@ static int dcmi_probe(struct platform_device *pdev)
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
 
@@ -1922,6 +2032,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	spin_lock_init(&dcmi->irqlock);
 	mutex_init(&dcmi->lock);
 	mutex_init(&dcmi->dma_lock);
+	mutex_init(&dcmi->freq_lock);
 	init_completion(&dcmi->complete);
 	INIT_LIST_HEAD(&dcmi->buffers);
 
@@ -1930,6 +2041,13 @@ static int dcmi_probe(struct platform_device *pdev)
 	dcmi->state = STOPPED;
 	dcmi->dma_chan = chan;
 
+	if (!alloc_cpumask_var(&dcmi->boosted, GFP_KERNEL))
+		return -ENODEV;
+
+	notify = &dcmi->notify;
+	notify->notify = dcmi_irq_notifier_notify;
+	notify->release = dcmi_irq_notifier_release;
+
 	q = &dcmi->queue;
 
 	dcmi->v4l2_dev.mdev = &dcmi->mdev;
@@ -2022,6 +2140,8 @@ static int dcmi_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "Probe done\n");
 
+	dcmi_get_min_frequency(dcmi);
+
 	platform_set_drvdata(pdev, dcmi);
 
 	pm_runtime_enable(&pdev->dev);
@@ -2049,6 +2169,8 @@ static int dcmi_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	free_cpumask_var(dcmi->boosted);
+
 	v4l2_async_notifier_unregister(&dcmi->notifier);
 	v4l2_async_notifier_cleanup(&dcmi->notifier);
 	media_entity_cleanup(&dcmi->vdev->entity);
-- 
2.15.0

