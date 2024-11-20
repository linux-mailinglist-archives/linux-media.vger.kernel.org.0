Return-Path: <linux-media+bounces-21652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 884669D3E46
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E9ACB22B35
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D1F1C9B9F;
	Wed, 20 Nov 2024 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NNkKd5vj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B71C729E;
	Wed, 20 Nov 2024 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114041; cv=none; b=igH3i++l+q9Gl0K3VJOQpmBH/rTot7TCVPOec5V+QsViq3q6ZIip06gldPbEIUFE2FoUSpsHsGWl7WJZa2CxLu+4dHah7Sgxha0tnI5OxfmVbV4JQvgyNJSnLdhTs67naLqm6DJOXP5C1FaOln37bWHQ90zCVt48Loc3RJBNj6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114041; c=relaxed/simple;
	bh=pXlI2be3NSxKkFF/yjKAHLnHfb0ajxlbAf1AdFNFifQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L829wYPR4oT7pSNIGmJ8jcQpx87cJNrvy9wcVAsh7p5qmu+oxribs3BxIGcodVCKkpu2ydOzhaAZ8sFl8bKNEDWNtvrbt48Zu2SD0W2lWWwNXZlVHLwoLkyNvKHDUo756/B7GAqF0xK1e5Dp6iPLfiAEEik9d1o9VHO34YUFHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NNkKd5vj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FUfv014398;
	Wed, 20 Nov 2024 14:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bz2lUMjiQhDe1uqS06DXdmjbtqwEL8OFi7q1kOYPm34=; b=NNkKd5vjomZJ6NTi
	Hyqe1faK8ABDvZ6zst+RDUY7Gv+q8ZWxYAZhvHFqyeQzie4OP8PuclRUdaeZtcq+
	f53unwLOqkbGZC14GTV8fhTaZqTMIq8bwvf8DU98uNw6pJRgNgzRrCSfi/VV7ZbM
	LO1Db0ZSyTAzcaI6NTNJWrhVOVrWO2uzfOBE7SV5HaVBRtTcJ9KWzVg6REuSZoXz
	SxXg6z7rFRL7XLO4DB+rZ62VW9XvAn0c8sObf8liiuqqZKYcqUFfgEBke98HHC21
	UmFjYzm0DWTAQO88AuzAfxGYGcetuUdG8qGhgH1yEOa7X/6rUxyPKnfdgCtyBU6/
	JBTqiw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y964n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:47:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKEl4uC031177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 14:47:04 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 06:46:58 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Nov 2024 20:15:56 +0530
Subject: [PATCH v6 06/28] media: iris: implement boot sequence of the
 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-qcom-video-iris-v6-6-a8cf6704e992@quicinc.com>
References: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
In-Reply-To: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
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
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732113983; l=6471;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=pXlI2be3NSxKkFF/yjKAHLnHfb0ajxlbAf1AdFNFifQ=;
 b=SMOOcFwDNPMshBIc2PLBY8eUquMh95PwnJ2o/gQyKjqfYTkNN0DDuL715pvpd6nZFIZ0UBeFi
 f+GHANtI/0uChr5zf65eKPx+IagMO9vhJGsKnIDgz7VwBWshFD8Q30Z
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MNZdFFEtF2CuMJWohIing7Xx0O99UDjX
X-Proofpoint-ORIG-GUID: MNZdFFEtF2CuMJWohIing7Xx0O99UDjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411200098

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


