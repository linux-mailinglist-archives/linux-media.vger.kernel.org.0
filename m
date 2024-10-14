Return-Path: <linux-media+bounces-19564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB18D99C4E5
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9D51F21061
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9D71607B7;
	Mon, 14 Oct 2024 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DY3dGSwY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38D315F3EF;
	Mon, 14 Oct 2024 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896895; cv=none; b=avRVQvdPy4DJbhAI1+QOV7zcfyklbGbTK2pElGkBaqd8CAlzYAxqYnYBb/F+MmQpfhUr7um/++cH/7YG9WsswhE+z9fPKe6EkamvEr2ngM3vJSHwrfgKlEUhM7a4OBfl2Yj7wnMquqrI1ocr7LnR509CDc64wi8onQmD6TK30Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896895; c=relaxed/simple;
	bh=49EIILk720PXnc5Kh7CgOtBfpluusSg2fkHqXRkjZrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BnEIdjKmYH/gaHo8wbijuJ3zc5nDryGDZ5AHxUfMh2dUMqcboY2G/k4FNZxc+sB8lFHABJYlmoxurK4aVc5ifFqOZfyUwomIfHqc7E0EGpQmO1kSgdRnVPDhQmfvWrBWS6LAlNbBRcCgKpkfBx64ZkYniU9Gfz8qPyrPdFxG4FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DY3dGSwY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DNBsNH025174;
	Mon, 14 Oct 2024 09:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86nKPLmVO/AUvfMG54neGwqXlLsxNCVa52GvGNWfD6k=; b=DY3dGSwYoCONOsGq
	W0aYZyzVkhqviTdfae+OHzG/Azw7EmB5tmlOQs0ftCxo4XksWh/lUwuWzwTMnHeo
	kkFd9uCdhFeA6XZrW8bzFKFzr2rM4ktrdXUUwdq5ezJz3JTGAU/7w9BtcyHSjTp8
	fEdxY3nj9QFlgA3wEuFt3WYpbFni5tyi2M3PChb1KkDyITEZNeuk9Hb66TBU/ckk
	foZhvLIOxzu0MGoe51qBcgCvodfAKpXKWV5il84Pwi/lGD6drKb3HAZEvoLLbqyo
	T735pTEjRU8MbIFXUN9a3OoUWywmRVcyRUcyrg1hZszZb6T4fVoGQ/U8Y5cG0lv/
	dUEIeg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hg73um7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:08:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E986Aq014938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:08:06 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:08:01 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:27 +0530
Subject: [PATCH v4 06/28] media: iris: implement boot sequence of the
 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-6-c5eaa4e9ab9e@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
In-Reply-To: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
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
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896854; l=6467;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=49EIILk720PXnc5Kh7CgOtBfpluusSg2fkHqXRkjZrA=;
 b=5ZO9nlDQ+b9M+uCbZTD6cOGdo2f92Mfb32pmwpYdfFNxoms5D3elANkad0BRsV+hXGSgOnf8C
 /s2v7CaIUIlCTOMIE9oa6v8Y0kY03fsv7NeLrhM1tsHY9DD0PH3jSYR
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gt6s8OWY8W5C8lrGzbMj0-l7lAC04yVQ
X-Proofpoint-GUID: gt6s8OWY8W5C8lrGzbMj0-l7lAC04yVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140066

Set memory region to firmware and implement boot sequence.

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
index 04bef37b7b77..33ae340052b8 100644
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
index 000000000000..d9b8df6e3f80
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_VPU_COMMON_H_
+#define _IRIS_VPU_COMMON_H_
+
+struct iris_core;
+
+int iris_vpu_boot_firmware(struct iris_core *core);
+
+#endif

-- 
2.34.1


