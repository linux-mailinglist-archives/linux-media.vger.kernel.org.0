Return-Path: <linux-media+bounces-16152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9394F00E
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 16:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE931280CB3
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 14:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8621F18C346;
	Mon, 12 Aug 2024 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SpV1TwFu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54729189B8A;
	Mon, 12 Aug 2024 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473752; cv=none; b=o/2w22/aF6MOWVvg1qGm7dillk6dI+sjzCmU5JjvtUc2dav5RcUrGv5bAeHTd/QbMm5UochhnJR0SdW4a1bI6jOcY5z9jBNFlL/l1D5BMJNleTdw8UkWf8Oh0gn1QM4hmKu08zKFchpwn2urbTJYU/I/CDZxA5kVJyhwt3sf3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473752; c=relaxed/simple;
	bh=JhTjJAh/LmeC44NhKyuX/jv8ctGPiZoMJsx4VqSDuzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qW6hctGhH/9iD6yRiSvODoNNKIEIT0pC93tZ3Moy0RHX9M54jSugCieZmYfaDnatvIN9+QyzlhbS6xD5J93aW8QJNmGaPx0nH7WQ/o7VY4IThQieC3orwcApkaZWlMXX/xjN0sdTwAUqr1vyS/JkHvrrVWDBLP3NANVJPbKOg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SpV1TwFu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSst0025770;
	Mon, 12 Aug 2024 14:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8SfqwEFdVBcioHeMx74e8/Nflho/Tbj6kCBRpUHKsY=; b=SpV1TwFuAVkv33mR
	kFaYMyNcjhvq+7FP3EzaWFe45pyxm/9hCcTXp2Hsy2wRHB4FOJz7/HxsOYBvyree
	1noajgJcY8c7KG7q5bY+63KRtOf4hj98y6RwUV7FPABhf3zqdwO8TVTTVMyyFkXx
	BYKIAdaegHTEF0kaz0I2JE+vox6BqdHiPUIN/nHVkvisfvlJpqwth4TgwKhNENMP
	bPmF2tQqPZYxTcK1H/EVJA2fr9MmyG3Gr7o63JxYfuWsKxIwPxFQKz3L/chc8e/x
	UHLmW2JEeJLl8s60iv/NR+1SxljrLRa/Ubv2nkzCnyRY9kAU2DmpGxXg1Dc1M/H5
	L3wrfw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x16s4h9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:42:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CEgP0j003375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:42:25 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 07:42:20 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_depengs@quicinc.com>
Subject: [PATCH 11/13] media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2 two-phase MIPI CSI-2 DPHY support
Date: Mon, 12 Aug 2024 20:11:29 +0530
Message-ID: <20240812144131.369378-12-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812144131.369378-1-quic_depengs@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0E8ncdlMkMWtuwc-d21qmOh_CK-EN9nj
X-Proofpoint-ORIG-GUID: 0E8ncdlMkMWtuwc-d21qmOh_CK-EN9nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408120109

Add a PHY configuration sequence and PHY resource for the sm8550 which
uses a Qualcomm Gen 2 version 2.1.2 CSI-2 PHY.

The PHY can be configured as two phase or three phase in C-PHY or D-PHY
mode. This configuration supports two-phase D-PHY mode.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 111 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c     | 110 +++++++++++++++++
 2 files changed, 221 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 1219a25ec55b..06463d7eeb2a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -324,6 +324,111 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 2.1.2 2PH DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_sm8550[] = {
+	{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x005C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x045C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x085C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0860, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0864, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C5C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C60, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 				   struct device *dev)
 {
@@ -526,6 +631,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8550:
 		ret = true;
 		break;
 	}
@@ -613,6 +719,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sc8280xp[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
 		break;
+	case CAMSS_8550:
+		regs->lane_regs = &lane_regs_sm8550[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
+		regs->offset = 0x1000;
+		break;
 	default:
 		WARN(1, "unknown csiphy version\n");
 		return -ENODEV;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 519b37794745..1cdd40f49c27 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1480,6 +1480,114 @@ static const struct resources_icc icc_res_sc8280xp[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8550[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {},
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {},
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {},
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {},
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {},
+		.clock = { "csiphy4", "csiphy4_timer" },
+		.clock_rate = { { 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = {},
+		.clock = { "csiphy5", "csiphy5_timer" },
+		.clock_rate = { { 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY6 */
+	{
+		.regulators = {},
+		.clock = { "csiphy6", "csiphy6_timer" },
+		.clock_rate = { { 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy6" },
+		.interrupt = { "csiphy6" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY7 */
+	{
+		.regulators = {},
+		.clock = { "csiphy7", "csiphy7_timer" },
+		.clock_rate = {
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 },
+				{ 300000000, 400000000, 400000000, 400000000, 400000000 } },
+		.reg = { "csiphy7" },
+		.interrupt = { "csiphy7" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8550[] = {
 	{
 		.name = "ahb",
@@ -2469,8 +2577,10 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.link_entities = camss_link_entities
 };
 
-- 
2.34.1


