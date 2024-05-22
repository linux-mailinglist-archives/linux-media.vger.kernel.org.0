Return-Path: <linux-media+bounces-11743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E88CC473
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 17:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7775D281580
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A3B145B2B;
	Wed, 22 May 2024 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KiNTjvws"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5141422D7;
	Wed, 22 May 2024 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716392878; cv=none; b=UI0/w88t1poLu8Z3zMKv54bUHi2fnBHbWgn1aFs2AQ818oFx10/1KRShAXBY2hHyV1RO2MEoAom5OeRodROMtjTP7s6fXJldD53R7lswiaMs5gao6UvSIRYhi8WnXBXj+6SvLOSz+CPHth/Ao0BwvAByXLDxELpjGaRXWet8KLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716392878; c=relaxed/simple;
	bh=lnT6ancv6Z5yFtfC/lVH6fEp8A6ZngUN6gmXgsA0lNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZXdWGSA1G/Fmh5B4gZuvICxIBsoJa3vxIURbeG9CT1/+kFytwzcSun8clt+Yj8FIzLLtxY3bk1vRA6hH6nHZxNmc6mxlC41fKxtQxeT6dx0LlD7tw0+4RGH/dwLjJk+GJ89FWlaOEWmbUcKY06CW2V9nosxwjO/tvVcMieuss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KiNTjvws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MC54ri016423;
	Wed, 22 May 2024 15:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=qXmEXDNN0mdlmLl4c9nvIl2Z5bqBqliSbDpwlEJUo/o=; b=Ki
	NTjvwsWwDPUtnuU/wQui4ce1GWCQyTPU+HeJdbHxH7lfvFF/1jHYFXbr6izWAC9+
	QQpNTrUGIPd2w5gj25mCz+I1lNvEA45KAaz7vj9AembSsgB+FlCO2mSTUBmGEyAo
	hqPgIBII0g6Z5IhubDZ8SZhJDiEpwaIqVr6NQtchVDjzk0YbjuVngYKEr/5FCyUi
	BVH4u8S6ELL8AD7+jjZI1JUkVXnszDRQ/a4AGHuYVkhQyKna/CbMcGopYCOCouR8
	J/pE0BIsv6MKGP1114STnrSdHD0mo3F4agokdEsJEHYX5jPAA/4ScZkI4BRLsaBH
	a/oJzRyXlJJEmrwzqprw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4ghbm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MFlnGg016010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:49 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 08:47:46 -0700
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for CSID 170
Date: Wed, 22 May 2024 18:46:57 +0300
Message-ID: <20240522154659.510-7-quic_grosikop@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522154659.510-1-quic_grosikop@quicinc.com>
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EA3WUaNpG_vOuL5dOAsLv8cGeOhaa9jw
X-Proofpoint-ORIG-GUID: EA3WUaNpG_vOuL5dOAsLv8cGeOhaa9jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220106

From: Milen Mitkov <quic_mmitkov@quicinc.com>

Split the RAW interface (RDI), the CSID receiver (RX)
and test pattern generator (testgen), configurations
for CSID on Titan 170

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
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


