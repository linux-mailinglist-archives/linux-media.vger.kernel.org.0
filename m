Return-Path: <linux-media+bounces-9111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DD8A14FA
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 14:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FA91284491
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 12:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CBA14EC58;
	Thu, 11 Apr 2024 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kKctaW/I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18DF14E2C4;
	Thu, 11 Apr 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839607; cv=none; b=Dzo9qAfZmLwLOOsod2fikC7SmiMCzOJAxFy6kJemPqVdnTtJKsr0KJbbJsQCwqnjNY8fMt2utNAO4EK3PA9Ms+wFBYHCTjvVlz0qWzgQr+No7iudG1BLVFkvbqh4lvJ/wzaTNw1y0/vsXGieYmORJyHFMFehawRM75Q6vc4FoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839607; c=relaxed/simple;
	bh=I55biUp2jrLpFfj0rkNYjImrAY3jvgGQEtzI3FoPxVI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNJkq4ZWOyyvH6U13SdXt9AZn36/fuODDmyjibIExct7juC2++LBL1Qw1j3K6LKHHEh7QDP/hY/gCn9yiVPUH6uto4vIMSjeJReUpNm7Gnz+cxtt/5pkBVtZUpTon9RqOmGKsCOxB77F+grQnRBNcQ6n31ccBtOIkGqUPzVDr4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kKctaW/I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B9KnXP032140;
	Thu, 11 Apr 2024 12:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=5G7axZYkFj5I063ZBqn6X9z9LFERumwdx7c+iM2Mybs=; b=kK
	ctaW/IsyL5Eo+Eqg8YRtHipo/jaOO0hC/uc4976c/pD2uF98cdV1eJwqFP1ShPGP
	d+8oCI3OCBfuzfVOvCGY+oxkg6Pu1ckl1AaWCjaz2ZHj9EhXHtb1E317oDY2xS+D
	DaSZHhIeehphVcKuLCbEHbrXk6jrakl0b9ufJNtfqlYvdGsn0KOTBXt9RFALaUjK
	VA1BZgm8pjba2cdBRxe/aupvTJJDVkhKJ6SPdD5H2lsj1T1Yyqop6GLUr3zE3eLL
	hP4jPNCIOsKRU4F3ONjkzVfkSmVv72s0lfU/Z16icFJLFwokqYuLBXOrOw6uCnQe
	131A+RBMV31IkIRTJVYA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xec6dh2x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 12:46:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BCkcAT019331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 12:46:38 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 05:46:35 -0700
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH v3 6/8] media: qcom: camss: Split testgen, RDI and RX for CSID 170
Date: Thu, 11 Apr 2024 15:45:41 +0300
Message-ID: <20240411124543.199-7-quic_grosikop@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411124543.199-1-quic_grosikop@quicinc.com>
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kyCtTb2y0qV9UoWBAcsApig8d9cMVey5
X-Proofpoint-ORIG-GUID: kyCtTb2y0qV9UoWBAcsApig8d9cMVey5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_06,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110093

From: Milen Mitkov <quic_mmitkov@quicinc.com>

Split the RAW interface (RDI), the CSID receiver (RX)
and test pattern generator (testgen), configurations
for CSID on Titan 170

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
---
 .../platform/qcom/camss/camss-csid-gen2.c     | 252 ++++++++++--------
 1 file changed, 139 insertions(+), 113 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eb5dabe2639a..2d8398a91fc2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -176,150 +176,176 @@
 #define		TPG_COLOR_BOX_CFG_MODE		0
 #define		TPG_COLOR_BOX_PATTERN_SEL	2
 
-static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy, int vc)
 {
-	struct csid_testgen_config *tg = &csid->testgen;
-	u32 val;
-	u32 phy_sel = 0;
 	u8 lane_cnt = csid->phy.lane_cnt;
-	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
-	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
-								   csid->res->formats->nformats,
-								   input_format->code);
+	int val;
 
 	if (!lane_cnt)
 		lane_cnt = 4;
 
-	if (!tg->enabled)
-		phy_sel = csid->phy.csiphy_id;
+	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
-	if (enable) {
-		/*
-		 * DT_ID is a two bit bitfield that is concatenated with
-		 * the four least significant bits of the five bit VC
-		 * bitfield to generate an internal CID value.
-		 *
-		 * CSID_RDI_CFG0(vc)
-		 * DT_ID : 28:27
-		 * VC    : 26:22
-		 * DT    : 21:16
-		 *
-		 * CID   : VC 3:0 << 2 | DT_ID 1:0
-		 */
-		u8 dt_id = vc & 0x03;
-
-		if (tg->enabled) {
-			/* configure one DT, infinite frames */
-			val = vc << TPG_VC_CFG0_VC_NUM;
-			val |= INTELEAVING_MODE_ONE_SHOT << TPG_VC_CFG0_LINE_INTERLEAVING_MODE;
-			val |= 0 << TPG_VC_CFG0_NUM_FRAMES;
-			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG0);
-
-			val = 0x740 << TPG_VC_CFG1_H_BLANKING_COUNT;
-			val |= 0x3ff << TPG_VC_CFG1_V_BLANKING_COUNT;
-			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG1);
-
-			writel_relaxed(0x12345678, csid->base + CSID_TPG_LFSR_SEED);
-
-			val = (input_format->height & 0x1fff) << TPG_DT_n_CFG_0_FRAME_HEIGHT;
-			val |= (input_format->width & 0x1fff) << TPG_DT_n_CFG_0_FRAME_WIDTH;
-			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
-
-			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
-			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
-
-			val = (tg->mode - 1) << TPG_DT_n_CFG_2_PAYLOAD_MODE;
-			val |= 0xBE << TPG_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD;
-			val |= format->decode_format << TPG_DT_n_CFG_2_ENCODE_FORMAT;
-			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_2(0));
-
-			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BARS_CFG);
-
-			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BOX_CFG);
-		}
+	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	if (vc > 3)
+		val |= 1 << CSI2_RX_CFG1_VC_MODE;
+	val |= 1 << CSI2_RX_CFG1_MISR_EN;
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
+}
 
-		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
-		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
-		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
-		/* note: for non-RDI path, this should be format->decode_format */
-		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-		val |= format->data_type << RDI_CFG0_DATA_TYPE;
-		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
-		val |= dt_id << RDI_CFG0_DT_ID;
-		writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val;
 
-		/* CSID_TIMESTAMP_STB_POST_IRQ */
-		val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
-		writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
+	if (enable)
+		val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
+	else
+		val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
+	writel_relaxed(val, csid->base + CSID_RDI_CTRL(rdi));
+}
 
-		val = 1;
-		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
+static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 vc)
+{
+	struct csid_testgen_config *tg = &csid->testgen;
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u8 lane_cnt = csid->phy.lane_cnt;
+	u32 val;
 
-		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(vc));
+	if (!lane_cnt)
+		lane_cnt = 4;
 
-		val = 1;
-		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
+	/* configure one DT, infinite frames */
+	val = vc << TPG_VC_CFG0_VC_NUM;
+	val |= INTELEAVING_MODE_ONE_SHOT << TPG_VC_CFG0_LINE_INTERLEAVING_MODE;
+	val |= 0 << TPG_VC_CFG0_NUM_FRAMES;
+	writel_relaxed(val, csid->base + CSID_TPG_VC_CFG0);
 
-		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
+	val = 0x740 << TPG_VC_CFG1_H_BLANKING_COUNT;
+	val |= 0x3ff << TPG_VC_CFG1_V_BLANKING_COUNT;
+	writel_relaxed(val, csid->base + CSID_TPG_VC_CFG1);
 
-		val = 1;
-		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(vc));
+	writel_relaxed(0x12345678, csid->base + CSID_TPG_LFSR_SEED);
 
-		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(vc));
+	val = (input_format->height & 0x1fff) << TPG_DT_n_CFG_0_FRAME_HEIGHT;
+	val |= (input_format->width & 0x1fff) << TPG_DT_n_CFG_0_FRAME_WIDTH;
+	writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
 
-		val = 1;
-		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(vc));
+	val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
+	writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
 
-		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(vc));
+	val = (tg->mode - 1) << TPG_DT_n_CFG_2_PAYLOAD_MODE;
+	val |= 0xBE << TPG_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD;
+	val |= format->decode_format << TPG_DT_n_CFG_2_ENCODE_FORMAT;
+	writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_2(0));
 
-		val = 0;
-		writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
+	writel_relaxed(0, csid->base + CSID_TPG_COLOR_BARS_CFG);
 
-		val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
-		val |=  1 << RDI_CFG0_ENABLE;
-		writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
-	}
+	writel_relaxed(0, csid->base + CSID_TPG_COLOR_BOX_CFG);
 
-	if (tg->enabled) {
-		val = enable << TPG_CTRL_TEST_EN;
-		val |= 1 << TPG_CTRL_FS_PKT_EN;
-		val |= 1 << TPG_CTRL_FE_PKT_EN;
-		val |= (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LANES;
-		val |= 0x64 << TPG_CTRL_CYCLES_BETWEEN_PKTS;
-		val |= 0xA << TPG_CTRL_NUM_TRAIL_BYTES;
-		writel_relaxed(val, csid->base + CSID_TPG_CTRL);
-	}
+	val = enable << TPG_CTRL_TEST_EN;
+	val |= 1 << TPG_CTRL_FS_PKT_EN;
+	val |= 1 << TPG_CTRL_FE_PKT_EN;
+	val |= (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LANES;
+	val |= 0x64 << TPG_CTRL_CYCLES_BETWEEN_PKTS;
+	val |= 0xA << TPG_CTRL_NUM_TRAIL_BYTES;
+	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
+}
 
-	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
-	val |= csid->phy.lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= phy_sel << CSI2_RX_CFG0_PHY_NUM_SEL;
-	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+{
+	struct csid_testgen_config *tg = &csid->testgen;
+	u32 val;
+	u32 phy_sel = 0;
+	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
 
-	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
-	if (vc > 3)
-		val |= 1 << CSI2_RX_CFG1_VC_MODE;
-	val |= 1 << CSI2_RX_CFG1_MISR_EN;
-	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
+	if (!tg->enabled)
+		phy_sel = csid->phy.csiphy_id;
 
-	if (enable)
-		val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
-	else
-		val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
+	/*
+	 * DT_ID is a two bit bitfield that is concatenated with
+	 * the four least significant bits of the five bit VC
+	 * bitfield to generate an internal CID value.
+	 *
+	 * CSID_RDI_CFG0(vc)
+	 * DT_ID : 28:27
+	 * VC    : 26:22
+	 * DT    : 21:16
+	 *
+	 * CID   : VC 3:0 << 2 | DT_ID 1:0
+	 */
+	u8 dt_id = vc & 0x03;
+
+	val = 1 << RDI_CFG0_BYTE_CNTR_EN;
+	val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
+	val |= 1 << RDI_CFG0_TIMESTAMP_EN;
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= format->data_type << RDI_CFG0_DATA_TYPE;
+	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
+	val |= dt_id << RDI_CFG0_DT_ID;
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+
+	/* CSID_TIMESTAMP_STB_POST_IRQ */
+	val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
+	writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
+
+	val = 1;
+	writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(vc));
+
+	val = 1;
+	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
+
+	val = 1;
+	writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(vc));
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(vc));
+
+	val = 1;
+	writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(vc));
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(vc));
+
+	val = 0;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
+
+	val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
+	val |=  enable << RDI_CFG0_ENABLE;
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
+	struct csid_testgen_config *tg = &csid->testgen;
 	u8 i;
 	/* Loop through all enabled VCs and configure stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i))
-			__csid_configure_stream(csid, enable, i);
+		if (csid->phy.en_vc & BIT(i)) {
+			if (tg->enabled)
+				__csid_configure_testgen(csid, enable, i);
+
+			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_ctrl_rdi(csid, enable, i);
+		}
 }
 
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
-- 
2.17.1


