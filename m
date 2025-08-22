Return-Path: <linux-media+bounces-40758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0330B31744
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0807CB0495A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 12:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2C02FD1C9;
	Fri, 22 Aug 2025 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gDKZYUdx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6629E2FCBE8;
	Fri, 22 Aug 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864608; cv=none; b=H46OE7Sb90aDcBwLTVpnEANcdAPmXHjxygkwz8OMRCudd1w77nhwo8zJ+dJnHifulFG95FLMHpOJy05zZUW8xHxJodPMvh1dkSULrMk59jfPkcbbd7xgitfwDbjXKLbVUsuXenhTDEHzNoeHPnfLiu6ZL8O5E9vpQFzVNpLcolk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864608; c=relaxed/simple;
	bh=A7e4WA2/mlaneyWWBhdDiDjGJMBAaDnF4ihd8CyB0Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GyfxO/S3/CSN1aHQhAhqZnFtji4iUUK1sjGmIBScpVC2VuzKYu1S3fKxBGg3mky4H8Y77MDQZd190o9JmHrujv8zxdIRdC+OyKPS05I4tFqZflT/0mCtKfr+/YfeJ1ZGG2ZQxBFkrRC06z6q2zKDPzhMQ7Xv4jIbLKtX8ay6msY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gDKZYUdx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UdFT001340;
	Fri, 22 Aug 2025 12:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEZjixj3QlAZurCDy4DGlD6ZYee0x7e6mb/CwwMXGig=; b=gDKZYUdxerlebGlJ
	mHGLDffX3UdqCx+aLgDD72Uh3YPABaBbm6aaN+vqnDOTbZek88+Jkp19P10Ea9WI
	JT8YcVZBG1s/ZLqLhop0GKnaUfq3Xl9Y65uKAYCtIp4wD5WD/iKIGh23b8fCwvap
	j0WnuUtMMcVRojvDaNf6fWR8NWpeFERmUaVN8mt2mXKWS7x76QvUXfqivVGz8shJ
	rXzY90MfcKTeIT/KKlU51TK509zNTlnxEmB8EtvErBGifVQMz4LOaLryKzlpxvjW
	QUpgZAuZn1LXGChQK9B3AMp2Rd7ZHEymMlT8uAIniLRrVJ325XEYjFFkvW32guy6
	Eml5xA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529952y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 12:10:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57MCA061030031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 12:10:00 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 22 Aug 2025 05:09:58 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Fri, 22 Aug 2025 20:09:21 +0800
Subject: [PATCH v3 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P and QCS8300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-camss_tpg-v3-3-c7833a5f10d0@quicinc.com>
References: <20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com>
In-Reply-To: <20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755864589; l=16527;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=A7e4WA2/mlaneyWWBhdDiDjGJMBAaDnF4ihd8CyB0Ao=;
 b=IWWxN3hxQRrOQyGEraLogj5slm31weYe36vVmuyaHB0bIn2UnLyjVwY7RfZVijKgRDvLyfsbp
 xU3ZJNYkvUECB0rEMePnihhKQhkB98B1CAlmLZxAebQXkdtMd4br9Y0
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eGz3fbWJRCty08gyBBPkre2isuYMtGSr
X-Proofpoint-ORIG-GUID: eGz3fbWJRCty08gyBBPkre2isuYMtGSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxDLIUJUBlEzR
 oRlvhsyD9Z6ZKp4+/XZu1XYrK9c0LfUvnSjDcUJ6VKhW/eWLymgXeboaP7wgIo1dD35qNpcfpQE
 +x8D9UMozYomQz/qtlMVA6I9263205knqKZVSJBoAb8Q/2PDmFIJMT91fxKc9J2cPt1dQGY/slO
 39grHVQPynad2uIggaCfbgXDuTAyd8z+vUqeOt7RyIEGJ9tb96Q+9ZemPvpZ/Y0+KtnpYA88XTp
 L6yLmxzJSKtPZ60tk4V5m2k7V3w5uwwk6sLwFQ1ZSFKe8/8wk9ewsCAGnXt8hCRW/nDcqMREr53
 vNvW/lKVz1fed+8x7TXp9OR+2XtwPEcWbtg4qjOQWv94C0f8bGPSbt6zioGFz87tE11zGe0LnaN
 A3dp+NhFLioNnDmybcmIy1pmrhU6eg==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a85e19 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=La8v_oc1BwVkbj4Qz5QA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add support for TPG found on SA8775P and QCS8300.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  17 ++
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 219 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          |  78 ++++++++
 4 files changed, 315 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index e4cf3033b8798cf0ffeff85409ae4ed3559879c1..274fa1e8fef3ce972a94e7355651c3801bc1dddc 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -25,5 +25,6 @@ qcom-camss-objs += \
 		camss-video.o \
 		camss-format.o \
 		camss-tpg.o \
+		camss-tpg-gen1.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..8e0b0cbaa0010f4b4a156877ac2fe805e5c4422e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,8 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_TPG_NUM_EN		27
+#define		CSI2_RX_CFG0_TPG_NUM_SEL	28
 
 #define CSID_CSI2_RX_CFG1		0x204
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
@@ -109,11 +111,26 @@ static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
 {
 	int val;
+	struct camss *camss;
+	struct tpg_device *tpg;
 
+	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
 
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
index 0000000000000000000000000000000000000000..e498e4065d53eca7982590a057c2532eaa12ac68
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Qualcomm MSM Camera Subsystem - TPG (Test Patter Generator) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/completion.h>
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
+#define TPG_CLEAR		0x1F4
+
+#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT	0xBE
+#define TPG_HBI_CFG_DEFAULT		0x4701
+#define TPG_VBI_CFG_DEFAULT		0x438
+#define TPG_LFSR_SEED_DEFAULT	0x12345678
+#define TPG_COLOR_BARS_CFG_STANDARD \
+	(0xA << TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD)
+
+static int tpg_stream_on(struct tpg_device *tpg)
+{
+	struct tpg_testgen_config *tg = &tpg->testgen;
+	struct v4l2_mbus_framefmt *input_format;
+	const struct tpg_format_info *format;
+	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 dt_cnt = 0;
+	u8 i;
+	u32 val;
+
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < tpg->res->vc_cnt; i++) {
+		input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
+		format = tpg_get_fmt_entry(tpg,
+					   tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   input_format->code);
+
+		val = (input_format->height & 0xffff) << TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT;
+		val |= (input_format->width & 0xffff) << TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH;
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
+
+		val = format->data_type << TPG_VC_m_DT_n_CFG_1_DATA_TYPE;
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
+
+		val = (tg->mode - 1) << TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE;
+		val |= TPG_USER_SPECIFIED_PAYLOAD_DEFAULT <<
+			TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD;
+		val |= format->encode_format << TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT;
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
+
+		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(i));
+
+		writel(TPG_HBI_CFG_DEFAULT, tpg->base + TPG_VC_n_HBI_CFG(i));
+		writel(TPG_VBI_CFG_DEFAULT, tpg->base + TPG_VC_n_VBI_CFG(i));
+
+		writel(TPG_LFSR_SEED_DEFAULT, tpg->base + TPG_VC_n_LSFR_SEED(i));
+
+		/* configure one DT, infinite frames */
+		val = i << TPG_VC_n_CFG0_VC_NUM;
+		val |= 0 << TPG_VC_n_CFG0_NUM_FRAMES;
+		writel(val, tpg->base + TPG_VC_n_CFG0(i));
+	}
+
+	val = 1 << TPG_CTRL_TEST_EN;
+	val |= 0 << TPG_CTRL_PHY_SEL;
+	val |= (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LANES;
+	val |= 0 << TPG_CTRL_VC_DT_PATTERN_ID;
+	val |= (tpg->res->vc_cnt - 1) << TPG_CTRL_NUM_ACTIVE_VC;
+	writel(val, tpg->base + TPG_CTRL);
+
+	return 0;
+}
+
+static void tpg_stream_off(struct tpg_device *tpg)
+{
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
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
+	hw_version = readl(tpg->base + TPG_HW_VERSION);
+	hw_gen = FIELD_GET(0xF << HW_VERSION_GENERATION, hw_version);
+	hw_rev = FIELD_GET(0xFFF << HW_VERSION_REVISION, hw_version);
+	hw_step = FIELD_GET(0xFFFF << HW_VERSION_STEPPING, hw_version);
+	dev_dbg_once(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
+		     hw_gen, hw_rev, hw_step);
+
+	return hw_version;
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
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
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
+	.reset = tpg_reset,
+	.subdev_init = tpg_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 53477a97dcba8385611398dfd07d41653e6ebaf9..3bdd8427fe6d6f1768a65204518075dd8a09ca08 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2611,6 +2611,62 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_8775p[] = {
+	/* TPG0 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
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
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
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
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
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
@@ -4088,6 +4144,13 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
+	if (camss->res->tpg_num > 0) {
+		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
+					  sizeof(*camss->tpg), GFP_KERNEL);
+		if (!camss->tpg)
+			return -ENOMEM;
+	}
+
 	camss->csid = devm_kcalloc(dev, camss->res->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
 	if (!camss->csid)
@@ -4234,6 +4297,7 @@ static const struct camss_resources msm8916_resources = {
 	.ispif_res = &ispif_res_8x16,
 	.vfe_res = vfe_res_8x16,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_8x16),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x16),
 	.link_entities = camss_link_entities
@@ -4248,6 +4312,7 @@ static const struct camss_resources msm8953_resources = {
 	.ispif_res = &ispif_res_8x53,
 	.vfe_res = vfe_res_8x53,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_8x53),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x53),
 	.link_entities = camss_link_entities
@@ -4260,6 +4325,7 @@ static const struct camss_resources msm8996_resources = {
 	.ispif_res = &ispif_res_8x96,
 	.vfe_res = vfe_res_8x96,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_8x96),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x96),
 	.link_entities = camss_link_entities
@@ -4269,11 +4335,13 @@ static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8300,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_qcs8300,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
@@ -4284,11 +4352,13 @@ static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8775p,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
@@ -4302,6 +4372,7 @@ static const struct camss_resources sdm660_resources = {
 	.ispif_res = &ispif_res_660,
 	.vfe_res = vfe_res_660,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_660),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_660),
 	.vfe_num = ARRAY_SIZE(vfe_res_660),
 	.link_entities = camss_link_entities
@@ -4313,6 +4384,7 @@ static const struct camss_resources sdm670_resources = {
 	.csid_res = csid_res_670,
 	.vfe_res = vfe_res_670,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_670),
 	.vfe_num = ARRAY_SIZE(vfe_res_670),
 	.link_entities = camss_link_entities
@@ -4325,6 +4397,7 @@ static const struct camss_resources sdm845_resources = {
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_845),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_845),
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
 	.link_entities = camss_link_entities
@@ -4339,6 +4412,7 @@ static const struct camss_resources sm8250_resources = {
 	.icc_res = icc_res_sm8250,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8250),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
 	.link_entities = camss_link_entities
@@ -4354,6 +4428,7 @@ static const struct camss_resources sc8280xp_resources = {
 	.icc_res = icc_res_sc8280xp,
 	.icc_path_num = ARRAY_SIZE(icc_res_sc8280xp),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sc8280xp),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_sc8280xp),
 	.vfe_num = ARRAY_SIZE(vfe_res_sc8280xp),
 	.link_entities = camss_link_entities
@@ -4368,6 +4443,7 @@ static const struct camss_resources sc7280_resources = {
 	.icc_res = icc_res_sc7280,
 	.icc_path_num = ARRAY_SIZE(icc_res_sc7280),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_7280),
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
 	.link_entities = camss_link_entities
@@ -4383,6 +4459,7 @@ static const struct camss_resources sm8550_resources = {
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
 	.link_entities = camss_link_entities
@@ -4398,6 +4475,7 @@ static const struct camss_resources x1e80100_resources = {
 	.icc_res = icc_res_x1e80100,
 	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
+	.tpg_num = 0,
 	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 	.link_entities = camss_link_entities

-- 
2.34.1


