Return-Path: <linux-media+bounces-23026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7429EAF0E
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05ED116A70C
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 11:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B0D2153D1;
	Tue, 10 Dec 2024 11:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DsXkfH8R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F2212D98;
	Tue, 10 Dec 2024 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828769; cv=none; b=D/TxvZDxk4PSknoWYl8xsFWuwhloWK7fj9HXr6AlAWCKpfRrGmkxJFufguBPPxQPFunYaVZbWOb7D769ETyoDD3RRwq/QGogYSSBIzcLM0h/Fx2L8zA8EdJKsvsh9gGZ4Sap1r+78g2OQ24zjzukz3MnGd6SvaR3Sru9PLyOVyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828769; c=relaxed/simple;
	bh=PHI3RsTcZ0AIGqdDl1+eJozZTc0inBf+dngW9exLc2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dQguVbreGGC1jq3Rdo3sU6osHGBzbnMgbvY1R8hv7vJtsCH1bzUabDnwqICV2w/wI5tAVQlqyBsOCFamWLaC5KlQiji5JsrvcQkggbmPRMcXVaEx0gY8XWgjLDMzn8NX9nTaUJzKD5mZPxoMg/UXZevymr2QXqICYUA9AXDamjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DsXkfH8R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA8Z8R0013573;
	Tue, 10 Dec 2024 11:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7ha27p3Mxu6pGXUkrhWcfBOWyAQjSeEwtyXOMeciGM=; b=DsXkfH8RvrI0d9cH
	5Gmj0xWYlLK6WwfejQgGJ1uq2uSImz0mRLCyqA4My/S1uyiH56/GWs6vwa6H0dM5
	H2lQblaD0SdqU3z/OOWALlKOxQE5Q9dd+ea9GwOGDYAltMZN8z6xd5ZA1M4d13ta
	0Z34oS9huoERUIZ90xkeGO2eUXdOyQbbFDMjz7tW84lsll1uSiiJtYuG5L6IqJZv
	rGhzJwqkfAC2AnOB09LmVsXCNmukt2fd93wCTfPtJwxN8Q9SzPy1EA4ifestWGCl
	caMimRdC16sxYAN33hHsYRS4/qK9b5aMNMDmBUqncS53YBAIWytKUQW0OgyO+0eR
	fY567g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxg2pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:05:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAB5uBO003238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:05:56 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 03:05:51 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 10 Dec 2024 16:35:07 +0530
Subject: [PATCH v8 03/28] media: iris: implement iris v4l2 file ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-qcom-video-iris-v8-3-42c5403cb1a3@quicinc.com>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733828732; l=13926;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=PHI3RsTcZ0AIGqdDl1+eJozZTc0inBf+dngW9exLc2s=;
 b=VnkYx4ZL9aUe7eRRRg6T8ShMpx5apwjgsMisecqleyMOcHwAccETLEbmFa4d+OQW4jMS/HdY5
 22K5WW8qgcTACUSSfm0zAAkNiYOoFZhXkBxdf408Ev6mC1KBnoo6X7j
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RrIDHvjY3TOwCvcNYmi8MOX15Xn1i5YV
X-Proofpoint-GUID: RrIDHvjY3TOwCvcNYmi8MOX15Xn1i5YV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100082

Implement open, close and poll ops.

Open:
Configure the vb2 queue and v4l2 file handler. Allocate a video instance
and add the instance to core instance list.

Close:
Free the instance and remove it from core instance list.

Poll:
Wait for an event on vb2 src and vb2 dst queues.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Kconfig           |   1 +
 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  13 ++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  12 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  22 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  11 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |  31 +++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |   2 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 147 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.h       |  15 +++
 13 files changed, 264 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 34a2f81c5db3..8debddec87a5 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -2,6 +2,7 @@ config VIDEO_QCOM_IRIS
         tristate "Qualcomm iris V4L2 decoder driver"
         depends on VIDEO_DEV
         depends on ARCH_QCOM || COMPILE_TEST
+        select V4L2_MEM2MEM_DEV
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
           hardware. It accelerates decoding operations on various
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 7e701361492e..6de584090a3a 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,4 +1,7 @@
-iris-objs += iris_platform_sm8550.o \
+iris-objs += iris_hfi_gen1_command.o \
+             iris_hfi_gen2_command.o \
+             iris_platform_sm8550.o \
              iris_probe.o \
+             iris_vidc.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 27bc2ca71e1b..aebb4eba7e15 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -25,6 +25,7 @@ struct icc_info {
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
  * @vdev_dec: iris video device structure for decoder
+ * @iris_v4l2_file_ops: iris v4l2 file ops
  * @icc_tbl: table of iris interconnects
  * @icc_count: count of iris interconnects
  * @pmdomain_tbl: table of iris power domains
@@ -41,6 +42,7 @@ struct iris_core {
 	int					irq;
 	struct v4l2_device			v4l2_dev;
 	struct video_device			*vdev_dec;
+	const struct v4l2_file_operations	*iris_v4l2_file_ops;
 	struct icc_bulk_data			*icc_tbl;
 	u32					icc_count;
 	struct dev_pm_domain_list		*pmdomain_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
new file mode 100644
index 000000000000..5d05be7470e0
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_HFI_GEN1_H__
+#define __IRIS_HFI_GEN1_H__
+
+struct iris_inst;
+
+struct iris_inst *iris_hfi_gen1_get_instance(void);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
new file mode 100644
index 000000000000..20c68f4ffb72
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_gen1.h"
+#include "iris_instance.h"
+
+struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	return kzalloc(sizeof(struct iris_inst), GFP_KERNEL);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
new file mode 100644
index 000000000000..c159ed7f64f9
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_HFI_GEN2_H__
+#define __IRIS_HFI_GEN2_H__
+
+#include "iris_instance.h"
+
+/**
+ * struct iris_inst_hfi_gen2 - holds per video instance parameters for hfi_gen2
+ *
+ * @inst: pointer to iris_instance structure
+ */
+struct iris_inst_hfi_gen2 {
+	struct iris_inst		inst;
+};
+
+struct iris_inst *iris_hfi_gen2_get_instance(void);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
new file mode 100644
index 000000000000..3ee33c8befae
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_gen2.h"
+
+struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	return kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
new file mode 100644
index 000000000000..527a270f12d4
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_INSTANCE_H__
+#define __IRIS_INSTANCE_H__
+
+#include "iris_core.h"
+
+/**
+ * struct iris_inst - holds per video instance parameters
+ *
+ * @core: pointer to core structure
+ * @ctx_q_lock: lock to serialize queues related ioctls
+ * @lock: lock to seralise forward and reverse threads
+ * @fh: reference of v4l2 file handler
+ * @m2m_dev:	a reference to m2m device structure
+ * @m2m_ctx:	a reference to m2m context structure
+ */
+
+struct iris_inst {
+	struct iris_core		*core;
+	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
+	struct mutex			lock; /* lock to serialize forward and reverse threads */
+	struct v4l2_fh			fh;
+	struct v4l2_m2m_dev		*m2m_dev;
+	struct v4l2_m2m_ctx		*m2m_ctx;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 31c53dad8136..f82081ea135f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -20,6 +20,7 @@ struct platform_clk_data {
 };
 
 struct iris_platform_data {
+	struct iris_inst *(*get_instance)(void);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const char * const *pmdomain_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 3dd91523d783..dba8d3c22ce5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -4,6 +4,7 @@
  */
 
 #include "iris_core.h"
+#include "iris_hfi_gen2.h"
 #include "iris_platform_common.h"
 
 static const struct icc_info sm8550_icc_table[] = {
@@ -24,6 +25,7 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 struct iris_platform_data sm8550_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 911e3bc1b434..ce16d894c809 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -11,6 +11,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_vidc.h"
 
 static int iris_init_icc(struct iris_core *core)
 {
@@ -139,6 +140,7 @@ static int iris_register_video_device(struct iris_core *core)
 
 	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
 	vdev->release = video_device_release;
+	vdev->fops = core->iris_v4l2_file_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
@@ -192,6 +194,7 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	iris_init_ops(core);
 	ret = iris_init_resources(core);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
new file mode 100644
index 000000000000..e91d661c6280
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "iris_vidc.h"
+#include "iris_instance.h"
+#include "iris_platform_common.h"
+
+#define IRIS_DRV_NAME "iris_driver"
+#define IRIS_BUS_NAME "platform:iris_icc"
+#define STEP_WIDTH 1
+#define STEP_HEIGHT 1
+
+static void iris_v4l2_fh_init(struct iris_inst *inst)
+{
+	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
+	v4l2_fh_add(&inst->fh);
+}
+
+static void iris_v4l2_fh_deinit(struct iris_inst *inst)
+{
+	v4l2_fh_del(&inst->fh);
+	v4l2_fh_exit(&inst->fh);
+}
+
+static inline struct iris_inst *iris_get_inst(struct file *filp, void *fh)
+{
+	return container_of(filp->private_data, struct iris_inst, fh);
+}
+
+static void iris_m2m_device_run(void *priv)
+{
+}
+
+static void iris_m2m_job_abort(void *priv)
+{
+	struct iris_inst *inst = priv;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+
+	v4l2_m2m_job_finish(inst->m2m_dev, m2m_ctx);
+}
+
+static const struct v4l2_m2m_ops iris_m2m_ops = {
+	.device_run = iris_m2m_device_run,
+	.job_abort = iris_m2m_job_abort,
+};
+
+static int
+iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
+{
+	struct iris_inst *inst = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->drv_priv = inst;
+	src_vq->dev = inst->core->dev;
+	src_vq->lock = &inst->ctx_q_lock;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->drv_priv = inst;
+	dst_vq->dev = inst->core->dev;
+	dst_vq->lock = &inst->ctx_q_lock;
+
+	return vb2_queue_init(dst_vq);
+}
+
+int iris_open(struct file *filp)
+{
+	struct iris_core *core = video_drvdata(filp);
+	struct iris_inst *inst;
+	int ret;
+
+	inst = core->iris_platform_data->get_instance();
+	if (!inst)
+		return -ENOMEM;
+
+	inst->core = core;
+
+	mutex_init(&inst->ctx_q_lock);
+
+	iris_v4l2_fh_init(inst);
+
+	inst->m2m_dev = v4l2_m2m_init(&iris_m2m_ops);
+	if (IS_ERR_OR_NULL(inst->m2m_dev)) {
+		ret = -EINVAL;
+		goto fail_v4l2_fh_deinit;
+	}
+
+	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, iris_m2m_queue_init);
+	if (IS_ERR_OR_NULL(inst->m2m_ctx)) {
+		ret = -EINVAL;
+		goto fail_m2m_release;
+	}
+
+	inst->fh.m2m_ctx = inst->m2m_ctx;
+	filp->private_data = &inst->fh;
+
+	return 0;
+
+fail_m2m_release:
+	v4l2_m2m_release(inst->m2m_dev);
+fail_v4l2_fh_deinit:
+	iris_v4l2_fh_deinit(inst);
+	mutex_destroy(&inst->ctx_q_lock);
+	kfree(inst);
+
+	return ret;
+}
+
+int iris_close(struct file *filp)
+{
+	struct iris_inst *inst = iris_get_inst(filp, NULL);
+
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+	v4l2_m2m_release(inst->m2m_dev);
+	iris_v4l2_fh_deinit(inst);
+	mutex_destroy(&inst->ctx_q_lock);
+	kfree(inst);
+	filp->private_data = NULL;
+
+	return 0;
+}
+
+static struct v4l2_file_operations iris_v4l2_file_ops = {
+	.owner                          = THIS_MODULE,
+	.open                           = iris_open,
+	.release                        = iris_close,
+	.unlocked_ioctl                 = video_ioctl2,
+	.poll                           = v4l2_m2m_fop_poll,
+	.mmap                           = v4l2_m2m_fop_mmap,
+};
+
+void iris_init_ops(struct iris_core *core)
+{
+	core->iris_v4l2_file_ops = &iris_v4l2_file_ops;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.h b/drivers/media/platform/qcom/iris/iris_vidc.h
new file mode 100644
index 000000000000..a26054ff55b5
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vidc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_VIDC_H__
+#define __IRIS_VIDC_H__
+
+struct iris_core;
+
+void iris_init_ops(struct iris_core *core);
+int iris_open(struct file *filp);
+int iris_close(struct file *filp);
+
+#endif

-- 
2.34.1


