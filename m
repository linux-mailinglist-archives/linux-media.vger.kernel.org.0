Return-Path: <linux-media+bounces-23294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA39EE5AD
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5761888CA1
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EF221506B;
	Thu, 12 Dec 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bpdD65EF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF70212B38;
	Thu, 12 Dec 2024 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004352; cv=none; b=rTGltwKDg1jYCJgw5itwWTonI8wU3z/gvzpZdh9ivwWbCBJVg/1fEWOBFnH1SK9vBttP4xAmWrn0ZfyWnFyuya3GvvSDU77MfwyPxOnxZI2eE9rg9xmRNf2rgWjd2eRQTNFauGpwiRHYw6LDFpoxB0n7pvWDxIY4I66rJjzXYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004352; c=relaxed/simple;
	bh=Bfl89ptY5bKnqVQeeeZqQXieLSaXgX4w5DTImjXVzPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=X8Ynwtb3dopfwycWdFz8LVSBPu+wVoJUj2Lksr0Hsvk/+437achJBTcLkRRg1Yohvvb3wWBUrtY6LFQg+THLPeBLz9wl7MznVECR2hFmR+qcdZB7s8AnT1AIxrZ0NvtOaPhFrIdHtvYsQtUL3F35mCPrdiKoqpD3f6KjO20YFHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bpdD65EF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7pC97002061;
	Thu, 12 Dec 2024 11:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTVIrTey/UVLEXurcd9mD7cQU0wIcOWi1QHPGfNkoUQ=; b=bpdD65EFKpSKCwnP
	RoI/vQXfx9C6SmIaWJwV8G9A9667qebpsHY0wjGkeDja0Xra3pkhXykwZuGfyF3Z
	ZRl4jBP7RLA/c5xnyw9rIyvedoGNDS/pEs/tmd3CBjubtFANn2Pbkw0adTdFYhgU
	g+PJirAB7LyjM7vns11DoqIguWFM5ajdh/WmADzL52rGg+UFzmx0iz3EtGyYJgzG
	iirBureX1GAepAMDfitXo73F0Nd+72DnkYvBOOpvdjlMgCabqzSdC8Ip6n080NIB
	Wb1FNwlr5LgYU9+8nrVu+u3ttC3q4wJ94lYd/xRVuA4kZCPpFItgxKC2YzQmiOqs
	ATnP2A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg65a8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:52:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCBqHii025366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:52:17 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 03:52:11 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 12 Dec 2024 17:21:28 +0530
Subject: [PATCH v9 06/28] media: iris: implement boot sequence of the
 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-qcom-video-iris-v9-6-e8c2c6bd4041@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734004294; l=6600;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Bfl89ptY5bKnqVQeeeZqQXieLSaXgX4w5DTImjXVzPU=;
 b=ijEeHoyNQEaA053nvkM+RPsDKcwqHMs63vzNKDe2FYGFWYKlSOTvmSX9+S1iRRmNhmqD3OsZi
 +GWoAO6rqomA/eqLGsSsHHANTk3TpB0gNVKG6QScEWCHwZSdkFzVPN3
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QG7-NaaCmG3Qy_3Tfqwuy9wLhIXnzLVT
X-Proofpoint-ORIG-GUID: QG7-NaaCmG3Qy_3Tfqwuy9wLhIXnzLVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120085

Set memory region to firmware and implement boot sequence.

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 drivers/media/platform/qcom/iris/iris_core.c       |  7 ++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  3 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 89 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 13 ++++
 6 files changed, 114 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 6906caa2c481..792f1d6ac8f3 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -6,5 +6,6 @@ iris-objs += iris_core.o \
              iris_platform_sm8550.o \
              iris_probe.o \
              iris_vidc.o \
+             iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8c7d53c57086..5ad66ac113ae 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -6,6 +6,7 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 #include "iris_state.h"
+#include "iris_vpu_common.h"
 
 void iris_core_deinit(struct iris_core *core)
 {
@@ -39,10 +40,16 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_queue_deinit;
 
+	ret = iris_vpu_boot_firmware(core);
+	if (ret)
+		goto error_unload_fw;
+
 	mutex_unlock(&core->lock);
 
 	return 0;
 
+error_unload_fw:
+	iris_fw_unload(core);
 error_queue_deinit:
 	iris_hfi_queues_deinit(core);
 error:
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 42c1fe8e4fa6..7e661e8928bd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -44,6 +44,7 @@ struct iris_platform_data {
 	const char *fwname;
 	u32 pas_id;
 	struct tz_cp_config *tz_cp_config_data;
+	u32 core_arch;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 96d9d6e816a0..4f40bfeeecf1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -7,6 +7,8 @@
 #include "iris_hfi_gen2.h"
 #include "iris_platform_common.h"
 
+#define VIDEO_ARCH_LX 1
+
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -47,4 +49,5 @@ struct iris_platform_data sm8550_data = {
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.core_arch = VIDEO_ARCH_LX,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
new file mode 100644
index 000000000000..959ed46e8f47
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/iopoll.h>
+
+#include "iris_core.h"
+#include "iris_vpu_common.h"
+
+#define CPU_BASE_OFFS				0x000A0000
+
+#define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
+
+#define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
+#define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
+
+#define CTRL_ERROR_STATUS__M			0xfe
+
+#define QTBL_INFO				(CPU_CS_BASE_OFFS + 0x50)
+#define QTBL_ENABLE				BIT(0)
+
+#define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
+#define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
+#define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
+#define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
+
+#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
+#define HOST2XTENSA_INTR_ENABLE			BIT(0)
+
+#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
+
+static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
+{
+	u32 queue_size, value;
+
+	/* Iris hardware requires 4K queue alignment */
+	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
+		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
+
+	value = (u32)core->iface_q_table_daddr;
+	writel(value, core->reg_base + UC_REGION_ADDR);
+
+	/* Iris hardware requires 1M queue alignment */
+	value = ALIGN(SFR_SIZE + queue_size, SZ_1M);
+	writel(value, core->reg_base + UC_REGION_SIZE);
+
+	value = (u32)core->iface_q_table_daddr;
+	writel(value, core->reg_base + QTBL_ADDR);
+
+	writel(QTBL_ENABLE, core->reg_base + QTBL_INFO);
+
+	if (core->sfr_daddr) {
+		value = (u32)core->sfr_daddr + core->iris_platform_data->core_arch;
+		writel(value, core->reg_base + SFR_ADDR);
+	}
+}
+
+int iris_vpu_boot_firmware(struct iris_core *core)
+{
+	u32 ctrl_init = BIT(0), ctrl_status = 0, count = 0, max_tries = 1000;
+
+	iris_vpu_setup_ucregion_memory_map(core);
+
+	writel(ctrl_init, core->reg_base + CTRL_INIT);
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
+	while (!ctrl_status && count < max_tries) {
+		ctrl_status = readl(core->reg_base + CTRL_STATUS);
+		if ((ctrl_status & CTRL_ERROR_STATUS__M) == 0x4) {
+			dev_err(core->dev, "invalid setting for uc_region\n");
+			break;
+		}
+
+		usleep_range(50, 100);
+		count++;
+	}
+
+	if (count >= max_tries) {
+		dev_err(core->dev, "error booting up iris firmware\n");
+		return -ETIME;
+	}
+
+	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
+	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
new file mode 100644
index 000000000000..bafcf46520fd
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_VPU_COMMON_H__
+#define __IRIS_VPU_COMMON_H__
+
+struct iris_core;
+
+int iris_vpu_boot_firmware(struct iris_core *core);
+
+#endif

-- 
2.34.1


