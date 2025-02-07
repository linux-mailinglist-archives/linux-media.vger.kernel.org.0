Return-Path: <linux-media+bounces-25756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C691A2BD12
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09321168BDF
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 07:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F1A237A4D;
	Fri,  7 Feb 2025 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M7mxIOhg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF6234973;
	Fri,  7 Feb 2025 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914957; cv=none; b=sFbxy3CV4Mp5xa+RjlLbeTxSGDtmwTHb3eKCDSYHqkc2pAJ7fUWW2v/cF7xDKj18kEkOGQEhkHWZo3LApobLiyfzWKUkjPUiE5wr6r2nvDskst1tT881IlIB1Dvc+7ADyQCLKKP6sjGVoc53xlueY4vHF/r9Xc4YsTUfNvd7mW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914957; c=relaxed/simple;
	bh=ldjW0qfjOMi5Cp3jQPyURy1Yu7ZZqEgUy1MvjdK8llU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UKyWga59vQwf1S0/wQyiHxmNNpbUnsBgz1YwBhNOXPjkVQ2RzjwLsrDhmMxGthSMLLJvRgmSvAvynhmcKLE5kc56byHTp5XblEqWbA9ry+wNFtZy63hOnSySRnJKKNB6+079qmvWmEeRxnARZBgZ4t5REbCLcWA+oLWMhNKv8u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M7mxIOhg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5175HHkh021719;
	Fri, 7 Feb 2025 07:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a0aEZxESiQA/pzHlLz+rA8U3LRjJXTCRtaAhVHfxSYM=; b=M7mxIOhgDv4coKum
	j5mrq68s4Ke1ZPt4Jr7AL0KCxYsAX5EWUu8PN5t6tv8WgFtgD0j1tFCLQiHx6M9/
	NlBSnxeynZQGVfbnm2CzBgD21Ee1ZGP6QOWefk70Go/ttQDX7uqK5wxFlVaZ+T6q
	+wWPzyDrFtxllloXcBbNSic1oEL0EjYEpzDGnR00pjK/EEbiFL8LZW81fIDDsp7P
	TX1ydxDc32XDbODLYbiUKIWc9DpPGVOvY0iOhzPLCyi8pHUFNB60chDXeemiqpzL
	4DGzX1cS1tQmfICk0vDOMZN7rb1/Oh5IH+/hEcnSHpbprVLJwcIp6X+Oq1IODP6X
	EpNsrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nbvurbtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:55:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177teBl008808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:55:40 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:55:33 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 7 Feb 2025 13:24:46 +0530
Subject: [PATCH v10 06/28] media: iris: implement the boot sequence of the
 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-qcom-video-iris-v10-6-ab66eeffbd20@quicinc.com>
References: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
In-Reply-To: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
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
        Joel Stanley <joel@jms.id.au>, "Johan
 Hovold" <johan@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738914892; l=6767;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ldjW0qfjOMi5Cp3jQPyURy1Yu7ZZqEgUy1MvjdK8llU=;
 b=kHnciWWcq1TpePGSdrXEaWn6dfNBA8fJYi1Lrc4/wETDRnMcv8fGaT4a7i1eZbOjZ7cFYWxDh
 xtxGHdNKu3WDttHdsvzKuIbYhezhIDx/I/8+Xlwr0eyagVRE22rtLc/
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z5t_STtHTXNpMfJI3REs3bq3GSYwb0v4
X-Proofpoint-ORIG-GUID: z5t_STtHTXNpMfJI3REs3bq3GSYwb0v4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070060

Set the memory region on the firmware and implement the boot sequence.

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell XPS 13 9345)
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
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
index bf389181d8cc..237f932946d6 100644
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
@@ -48,4 +50,5 @@ struct iris_platform_data sm8550_data = {
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


