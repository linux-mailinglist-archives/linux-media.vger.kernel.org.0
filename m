Return-Path: <linux-media+bounces-25323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 511CDA2058C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 09:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 911363A487C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 08:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7631DEFF4;
	Tue, 28 Jan 2025 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nlCySCLI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DDD8462;
	Tue, 28 Jan 2025 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051535; cv=none; b=Ink6KOFEk7tE3sQuIeL78ejRAPKB42CuhHdZoEZW/U1ewVJHXLYEmITn7ogprWg7j1adNCIsSushzMObaLhG2HdBp3BdqBkgpJMARblAVK871WIOyndRRDEJZw9EpG7djoFupk763OFihUfNnNZ4BJX/EgsGiNtLQITS1hJ8zrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051535; c=relaxed/simple;
	bh=P2cCKmvjiVGyz3aZlVis7QWWtNl98gsucLHH68Ds1ZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E70qGtxSNZDbWsmw8xfcnSXBL6REGPW7aGA6+Wg753W9A0M1uvVlsP7Np3T/evDJxE/cUnAlYn4nKqJQTS5wMe6XUVLJuVWMuJlDHm0kxaBgMcblCjke5K+5zR2LfxAonlCoFGyE7lEFBt1JcYDgRhoQwVBgR1cwgocSDFR8/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nlCySCLI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1chcu017126;
	Tue, 28 Jan 2025 08:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XuadnqemqlHlUFbQ8N2KzZulOJDtNacuwMdHlxS11S4=; b=nlCySCLI3L7T6jbK
	9yaLx/bbfTJ6gi3ca5lP+FGVgBnBTRVVv5z8OBYiPTu0Bdjwk3Lt2RLt/OLTvq2w
	guP7c/urt7Yh6IJZUt5WDJlhnW8ak1tmjNBtZ6oDaGcBx/yK36g/g4byGI5UMeP4
	PiqY46UUrIRHxMvwQivYLt3RBtCCg5rtksAVDAaZCGNkZEx6OZUN3LZ6rkfPIyY8
	2Fp4G1QdNZXZ1utujiLJTA6QLoaKadRBiZRO3/MC8hBeyIvNDxuNiCHiGmVvvXuL
	eWq+fUqrDxjKZxPuTNRMC+MIPy0SxKs7Emnu7RRCNfDZT6NEoN4QCTo3jzPGFUHE
	vW+kBw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enrq8n5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 08:05:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S85OCm013971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 08:05:24 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 00:05:17 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC: <hverkuil@xs4all.nl>, <sebastian.fricke@collabora.com>,
        <bryan.odonoghue@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <nicolas@ndufresne.ca>,
        <u.kleine-koenig@baylibre.com>, <stefan.schmidt@linaro.org>,
        <lujianhua000@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <johan@kernel.org>, <quic_dikshita@quicinc.com>
Subject: [RFC PATCH v10 1/2] media: iris: introduce helper module to select video driver
Date: Tue, 28 Jan 2025 13:34:28 +0530
Message-ID: <20250128080429.3911091-2-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w6VKo6SZETstTKa6kiABSnTMmxRIFRix
X-Proofpoint-ORIG-GUID: w6VKo6SZETstTKa6kiABSnTMmxRIFRix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280061

Introduce a helper module with a kernel param to select between
venus and iris drivers for platforms supported by both drivers.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/Makefile          |  1 +
 drivers/media/platform/qcom/iris/iris_core.h  |  1 +
 drivers/media/platform/qcom/iris/iris_probe.c |  3 +
 drivers/media/platform/qcom/venus/core.c      |  5 ++
 .../platform/qcom/video_drv_helper/Makefile   |  4 ++
 .../qcom/video_drv_helper/video_drv_helper.c  | 70 +++++++++++++++++++
 .../qcom/video_drv_helper/video_drv_helper.h  | 11 +++
 7 files changed, 95 insertions(+)
 create mode 100644 drivers/media/platform/qcom/video_drv_helper/Makefile
 create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
 create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h

diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
index ea2221a202c0..15accde3bd67 100644
--- a/drivers/media/platform/qcom/Makefile
+++ b/drivers/media/platform/qcom/Makefile
@@ -2,3 +2,4 @@
 obj-y += camss/
 obj-y += iris/
 obj-y += venus/
+obj-y += video_drv_helper/
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 37fb4919fecc..7108e751ff88 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -107,5 +107,6 @@ struct iris_core {
 
 int iris_core_init(struct iris_core *core);
 void iris_core_deinit(struct iris_core *core);
+extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 954cc7c0cc97..276461ade811 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
 	u64 dma_mask;
 	int ret;
 
+	if (!video_drv_should_bind(&pdev->dev, true))
+		return -ENODEV;
+
 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
 	if (!core)
 		return -ENOMEM;
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 77d48578ecd2..b38be7812efe 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -369,12 +369,17 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
 static void venus_remove_dynamic_nodes(struct venus_core *core) {}
 #endif
 
+extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct venus_core *core;
 	int ret;
 
+	if (!video_drv_should_bind(&pdev->dev, false))
+		return -ENODEV;
+
 	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
 	if (!core)
 		return -ENOMEM;
diff --git a/drivers/media/platform/qcom/video_drv_helper/Makefile b/drivers/media/platform/qcom/video_drv_helper/Makefile
new file mode 100644
index 000000000000..82567e0392fb
--- /dev/null
+++ b/drivers/media/platform/qcom/video_drv_helper/Makefile
@@ -0,0 +1,4 @@
+# Makefile for Video driver helper
+
+obj-m := video_drv_helper.o
+
diff --git a/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
new file mode 100644
index 000000000000..9009c2906e54
--- /dev/null
+++ b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include "video_drv_helper.h"
+
+/* The venus driver supports only hfi gen1 to communicate with the firmware while
+ * the iris driver supports both hfi gen1 and hfi gen2.
+ * The support of hfi gen1 is added to the iris driver with the intention that
+ * it can support old gen1 interface based firmware, while enabling gen2 based future SOCs.
+ * With this, the plan is to migrate older SOCs from venus to iris.
+ * As of now, since the iris driver supports only entry level features and doesn't have
+ * feature parity with the venus driver, a runtime-selection is provided to user via
+ * module parameter 'prefer_venus' to select the driver.
+ * This selection is available only for the SoCs which are supported by both venus
+ * and iris eg: SM8250.
+ * When the feature parity is achieved, the plan is to switch the default to point to
+ * the iris driver, then gradually start removing platforms from venus.
+ * Hardware supported by only venus - 8916, 8996, SDM660, SDM845, SC7180, SC7280
+ * Hardware supported by only iris - SM8550
+ * Hardware supported by both venus and iris - SM8250
+ */
+
+#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS) || !IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
+bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
+{
+	/* If just a single driver is enabled, use it no matter what */
+	return true;
+}
+
+#else
+static bool prefer_venus = true;
+MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
+module_param(prefer_venus, bool, 0444);
+
+/* list all platforms supported by both venus and iris drivers */
+static const char *const venus_to_iris_migration[] = {
+	"qcom,sm8250-venus",
+	NULL,
+};
+
+bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
+{
+	if (of_device_compatible_match(dev->of_node, venus_to_iris_migration))
+		return prefer_venus ? !is_iris_driver : is_iris_driver;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(video_drv_should_bind);
+#endif
+
+static int __init video_drv_helper_init(void)
+{
+	return 0;
+}
+
+static void __exit video_drv_helper_exit(void)
+{
+}
+
+module_init(video_drv_helper_init);
+module_exit(video_drv_helper_exit);
+
+MODULE_DESCRIPTION("A video driver helper module");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
new file mode 100644
index 000000000000..6d835227fec2
--- /dev/null
+++ b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __VIDEO_DRV_HELPER_H__
+#define __VIDEO_DRV_HELPER_H__
+
+bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
+
+#endif
-- 
2.34.1


