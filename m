Return-Path: <linux-media+bounces-25996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D450EA30812
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 11:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1761889A98
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 10:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A641F5435;
	Tue, 11 Feb 2025 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PcGUBa5+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F701F3D4A;
	Tue, 11 Feb 2025 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268551; cv=none; b=MJ/8HtXLqgjwR4MBMq26LDu1vc7dI2dqUkbK4TgY6HnIzPWOPG2x6cNKl/Z9jpmo5GGWtT4b6Ki2FC2Z0CfvXHW74QfhWwg8AYLl1vkK9eswqDT2eiAn7vKsWUv4W9IGrA8j52E6+ud+ZuhilUCq05ULtnI4Cz4W/IABrP5FulQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268551; c=relaxed/simple;
	bh=Arm/4iAQNJG/NzyUkyTcR4eoObnkPM0+Mrxc99rLtDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sT+Mazpj1d6c9wJLC8ZJcgrPE5eN2SjvL43mbgMs3vaoN1p+GTJqdA/7iOeNSByMb4LX1Gz2tVDMLmSDdbDyrAGPUokz8ZkFJKCrLP4meD6wiq2mIvPU4XJiEvB2tN45/4EBarDip3roGvOmzEeyYsAai9xk/jx5nzsOleVJJG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PcGUBa5+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B8oaKL008247;
	Tue, 11 Feb 2025 10:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CA3uGWWpXCNgEhm7nAHZteu1E3I+bqsYlvOFx0spe1E=; b=PcGUBa5+bzPM8PP6
	efL2aDiQH0wHrqyR3UWftI/tpxQyponatGzSxSeRVHg6MBjsaNt2S7KF9r7GiQ8g
	PD4mSR4VCtVBJUG1HSHg7WlCUNro3cCeSudUrRi+DNTB6Omn0e5cc9CDGuFx+YlP
	1KyZPc6cw9KFonWM7QeJIjnVKtIQBabBKvntgLhVJiBr82LchKi6a3cdlyVk7yq+
	dVO5HMza3+Li79t9DmuqBIpsQeGFs4nKVywpA4Svr6n4h9fr30y1oyxM/8Ba9s3e
	H+R6DGHy0CvajK7G0JhYsvwFaXR1mnlPSbbAlME3mzElE2qiw5Tmr8jHvJ+jCUoY
	YQ/1/w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh3jjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:09:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BA943B018112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:09:05 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 02:09:02 -0800
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Tue, 11 Feb 2025 18:07:58 +0800
Subject: [PATCH 3/3] media: qcom: camss: tpg: Add TPG support for SA8775P
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250211-sa8775p_tpg-v1-3-3f76c5f8431f@quicinc.com>
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
In-Reply-To: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739268533; l=12718;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=Arm/4iAQNJG/NzyUkyTcR4eoObnkPM0+Mrxc99rLtDA=;
 b=qDrDi72pq/yY4pI0pgphNbXrr64FQZz1E7MudhT3BAuEWGCHvSf4jth6kOSQ3XyTaPpEdc/lz
 lqz28s1Yi5+A/gY/1Ao6p+pyv+rKBi6+wXGHx5GdfI5hKC360TAK0Ut
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ACSl6Nfa_pqj-KPQk2as8DVu4Yr8yQD0
X-Proofpoint-GUID: ACSl6Nfa_pqj-KPQk2as8DVu4Yr8yQD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110063

Add support for TPG found on SA8775P (Titan 690).

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   3 +-
 drivers/media/platform/qcom/camss/camss-csid-690.c |  15 ++
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 245 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          |  56 +++++
 4 files changed, 318 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 65a83a60de00facbe3e94481aa0e121ffcf7b221..5c764ba32546b440f2c07bce1829dc37aa6032a6 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -24,6 +24,7 @@ qcom-camss-objs += \
 		camss-vfe.o \
 		camss-video.o \
 		camss-format.o \
-		camss-tpg.o
+		camss-tpg.o \
+		camss-tpg-gen1.o
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-csid-690.c b/drivers/media/platform/qcom/camss/camss-csid-690.c
index a05ee76301177fb9a686c7d11235de4bf31d3457..f82fe5013555959b90eea68cda11e074e0d51c36 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-690.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-690.c
@@ -108,13 +108,28 @@ static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
 {
 	int val;
+	struct camss *camss;
+	struct tpg_device *tpg;
 
+	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
 	if (vc > 3)
 		val |= 1 << CSI2_RX_CFG0_VC_MODE;
 
+	if (camss->tpg) {
+		tpg = &camss->tpg[phy->csiphy_id];
+
+		if (tpg->testgen.mode > 0) {
+			val |= (phy->csiphy_id + 1) << CSI2_RX_CFG0_TPG_NUM_SEL;
+			val |= 1 << CSI2_RX_CFG0_TPG_NUM_EN;
+		} else {
+			val |= 0 << CSI2_RX_CFG0_TPG_NUM_SEL;
+			val |= 0 << CSI2_RX_CFG0_TPG_NUM_EN;
+		}
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
new file mode 100644
index 0000000000000000000000000000000000000000..a8899ccac52b0ad66296182f3fb70ad34bb1f711
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-tpg-gen1.c
+ *
+ * Qualcomm MSM Camera Subsystem - TPG (Test Patter Generator) Module
+ *
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss-tpg.h"
+#include "camss.h"
+
+#define TPG_HW_VERSION		0x0
+#define		HW_VERSION_STEPPING		0
+#define		HW_VERSION_REVISION		16
+#define		HW_VERSION_GENERATION		28
+
+#define TPG_HW_STATUS		0x4
+
+#define TPG_VC_n_GAIN_CFG(n)	(0x60 + (n) * 0x60)
+
+#define TPG_CTRL	0x64
+#define		TPG_CTRL_TEST_EN		0
+#define		TPG_CTRL_PHY_SEL		3
+#define		TPG_CTRL_NUM_ACTIVE_LANES	4
+#define		TPG_CTRL_VC_DT_PATTERN_ID	6
+#define		TPG_CTRL_OVERLAP_SHDR_EN	10
+#define		TPG_CTRL_NUM_ACTIVE_VC		30
+#define			NUM_ACTIVE_VC_0_ENABLED		0
+#define			NUM_ACTIVE_VC_0_1_ENABLED	1
+#define			NUM_ACTIVE_VC_0_1_2_ENABLED	2
+#define			NUM_ACTIVE_VC_0_1_3_ENABLED	3
+
+#define TPG_VC_n_CFG0(n)	(0x68 + (n) * 0x60)
+#define		TPG_VC_n_CFG0_VC_NUM		0
+#define		TPG_VC_n_CFG0_NUM_ACTIVE_DT	8
+#define			NUM_ACTIVE_SLOTS_0_ENABLED		0
+#define			NUM_ACTIVE_SLOTS_0_1_ENABLED		1
+#define			NUM_ACTIVE_SLOTS_0_1_2_ENABLED		2
+#define			NUM_ACTIVE_SLOTS_0_1_3_ENABLED		3
+#define		TPG_VC_n_CFG0_NUM_BATCH		12
+#define		TPG_VC_n_CFG0_NUM_FRAMES	16
+
+#define TPG_VC_n_LSFR_SEED(n)		(0x6C + (n) * 0x60)
+
+#define TPG_VC_n_HBI_CFG(n)		(0x70 + (n) * 0x60)
+
+#define TPG_VC_n_VBI_CFG(n)		(0x74 + (n) * 0x60)
+
+#define TPG_VC_n_COLOR_BARS_CFG(n)		(0x78 + (n) * 0x60)
+#define		TPG_VC_n_COLOR_BARS_CFG_PIX_PATTERN		0
+#define		TPG_VC_n_COLOR_BARS_CFG_QCFA_EN			3
+#define		TPG_VC_n_COLOR_BARS_CFG_SPLIT_EN		4
+#define		TPG_VC_n_COLOR_BARS_CFG_NOISE_EN		5
+#define		TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD		8
+#define		TPG_VC_n_COLOR_BARS_CFG_XCFA_EN			16
+#define		TPG_VC_n_COLOR_BARS_CFG_SIZE_X			24
+#define		TPG_VC_n_COLOR_BARS_CFG_SIZE_Y			28
+
+#define TPG_VC_m_DT_n_CFG_0(m, n)	(0x7C + (m) * 0x60 + (n) * 0xC)
+#define		TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT	0
+#define		TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH		16
+
+#define TPG_VC_m_DT_n_CFG_1(m, n)	(0x80 + (m) * 0x60 + (n) * 0xC)
+#define		TPG_VC_m_DT_n_CFG_1_DATA_TYPE		0
+#define		TPG_VC_m_DT_n_CFG_1_ECC_XOR_MASK	8
+#define		TPG_VC_m_DT_n_CFG_1_CRC_XOR_MASK	16
+
+#define TPG_VC_m_DT_n_CFG_2(m, n)	(0x84 + (m) * 0x60 + (n) * 0xC)
+#define		TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE		0
+#define		TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD	4
+#define		TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT		28
+
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR0(n)	(0xB0 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR1(n)	(0xB4 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR2(n)	(0xB8 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR3(n)	(0xBC + (n) * 0x60)
+
+/* Line offset between VC(n) and VC(n-1), n form 1 to 3 */
+#define TPG_VC_n_SHDR_CFG	(0x84 + (n) * 0x60)
+
+#define TPG_TOP_IRQ_STATUS	0x1E0
+#define TPG_TOP_IRQ_MASK	0x1E4
+#define TPG_TOP_IRQ_CLEAR	0x1E8
+#define TPG_TOP_IRQ_SET		0x1EC
+#define TPG_IRQ_CMD		0x1F0
+#define TPG_CLEAR		0x1F4
+
+static int tpg_stream_on(struct tpg_device *tpg)
+{
+	struct tpg_testgen_config *tg = &tpg->testgen;
+	struct v4l2_mbus_framefmt *input_format;
+	const struct tpg_format_info *format;
+	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 i;
+	u8 dt_cnt = 0;
+	u32 val;
+
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < tpg->res->vc_cnt; i++) {
+		input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
+		format = tpg_get_fmt_entry(tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   input_format->code);
+
+		val = (input_format->height & 0xffff) << TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT;
+		val |= (input_format->width & 0xffff) << TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH;
+		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
+
+		val = format->data_type << TPG_VC_m_DT_n_CFG_1_DATA_TYPE;
+		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
+
+		val = (tg->mode - 1) << TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE;
+		val |= 0xBE << TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD;
+		val |= format->encode_format << TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT;
+		writel_relaxed(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
+
+		writel_relaxed(0xA00, tpg->base + TPG_VC_n_COLOR_BARS_CFG(i));
+
+		writel_relaxed(0x4701, tpg->base + TPG_VC_n_HBI_CFG(i));
+		writel_relaxed(0x438, tpg->base + TPG_VC_n_VBI_CFG(i));
+
+		writel_relaxed(0x12345678, tpg->base + TPG_VC_n_LSFR_SEED(i));
+
+		/* configure one DT, infinite frames */
+		val = i << TPG_VC_n_CFG0_VC_NUM;
+		val |= 0 << TPG_VC_n_CFG0_NUM_FRAMES;
+		writel_relaxed(val, tpg->base + TPG_VC_n_CFG0(i));
+	}
+
+	writel_relaxed(1, tpg->base + TPG_TOP_IRQ_MASK);
+
+	val = 1 << TPG_CTRL_TEST_EN;
+	val |= 0 << TPG_CTRL_PHY_SEL;
+	val |= (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LANES;
+	val |= 0 << TPG_CTRL_VC_DT_PATTERN_ID;
+	val |= (tpg->res->vc_cnt - 1) << TPG_CTRL_NUM_ACTIVE_VC;
+	writel_relaxed(val, tpg->base + TPG_CTRL);
+
+	return 0;
+}
+
+static void tpg_stream_off(struct tpg_device *tpg)
+{
+	writel_relaxed(0, tpg->base + TPG_CTRL);
+	writel_relaxed(0, tpg->base + TPG_TOP_IRQ_MASK);
+	writel_relaxed(1, tpg->base + TPG_TOP_IRQ_CLEAR);
+	writel_relaxed(1, tpg->base + TPG_IRQ_CMD);
+	writel_relaxed(1, tpg->base + TPG_CLEAR);
+}
+
+static void tpg_configure_stream(struct tpg_device *tpg, u8 enable)
+{
+	if (enable)
+		tpg_stream_on(tpg);
+	else
+		tpg_stream_off(tpg);
+}
+
+static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 val)
+{
+	if (val > 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
+		tpg->testgen.mode = val;
+
+	return 0;
+}
+
+/*
+ * tpg_hw_version - tpg hardware version query
+ * @tpg: tpg device
+ *
+ * Return HW version or error
+ */
+static u32 tpg_hw_version(struct tpg_device *tpg)
+{
+	u32 hw_version;
+	u32 hw_gen;
+	u32 hw_rev;
+	u32 hw_step;
+
+	hw_version = readl_relaxed(tpg->base + TPG_HW_VERSION);
+	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
+	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
+	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
+	dev_dbg(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
+		hw_gen, hw_rev, hw_step);
+
+	return hw_version;
+}
+
+/*
+ * tpg_isr - tpg module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: tpg device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t tpg_isr(int irq, void *dev)
+{
+	struct tpg_device *tpg = dev;
+	u32 val;
+
+	val = readl_relaxed(tpg->base + TPG_TOP_IRQ_STATUS);
+	writel_relaxed(val, tpg->base + TPG_TOP_IRQ_CLEAR);
+	writel_relaxed(1, tpg->base + TPG_IRQ_CMD);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * tpg_reset - Trigger reset on tpg module and wait to complete
+ * @tpg: tpg device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_reset(struct tpg_device *tpg)
+{
+	writel_relaxed(0, tpg->base + TPG_CTRL);
+	writel_relaxed(0, tpg->base + TPG_TOP_IRQ_MASK);
+	writel_relaxed(1, tpg->base + TPG_TOP_IRQ_CLEAR);
+	writel_relaxed(1, tpg->base + TPG_IRQ_CMD);
+	writel_relaxed(1, tpg->base + TPG_CLEAR);
+
+	return 0;
+}
+
+static void tpg_subdev_init(struct tpg_device *tpg)
+{
+	tpg->testgen.modes = testgen_payload_modes;
+	tpg->testgen.nmodes = TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
+}
+
+const struct tpg_hw_ops tpg_ops_gen1 = {
+	.configure_stream = tpg_configure_stream,
+	.configure_testgen_pattern = tpg_configure_testgen_pattern,
+	.hw_version = tpg_hw_version,
+	.isr = tpg_isr,
+	.reset = tpg_reset,
+	.subdev_init = tpg_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1efcc7a5ee62c7aa644b2390832b6f1f29cc69ff..48d3d4f9dfbc8a730c150f175b39c4b8780a86b9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2331,6 +2331,53 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_8775p[] = {
+	/* TPG0 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx" },
+		.clock_rate = { { 400000000 } },
+		.reg = { "tpg0" },
+		.interrupt = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG1 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx" },
+		.clock_rate = { { 400000000 } },
+		.reg = { "tpg1" },
+		.interrupt = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG2 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx" },
+		.clock_rate = { { 400000000 } },
+		.reg = { "tpg2" },
+		.interrupt = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID0 */
 	{
@@ -3535,6 +3582,13 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
+	if (camss->res->version == CAMSS_8775P) {
+		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
+					  sizeof(*camss->tpg), GFP_KERNEL);
+		if (!camss->tpg)
+			return -ENOMEM;
+	}
+
 	camss->csid = devm_kcalloc(dev, camss->res->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
 	if (!camss->csid)
@@ -3714,11 +3768,13 @@ static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8775p,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sa8775p,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),

-- 
2.34.1


