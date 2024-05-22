Return-Path: <linux-media+bounces-11741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73B8CC46C
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 17:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E91C61F224A8
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD09D1422B5;
	Wed, 22 May 2024 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fiFRHxzk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE21420B0;
	Wed, 22 May 2024 15:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716392874; cv=none; b=r7/IuhMweTV8+UbyouF/cHZZr/e2Oy5RVbVPeZBPO/JZlCPtIAi/VtWTFXOI72TEsyoWTtxzAzdMop4Ys7IwlgaMCtvNXw9XyriTEMxZBrAkpnqzo7FmEOUDqkvG9ZAuGWOTKt1EIMnnstJ4bLhYpz1PnM9CtEVkXwdO6YvJuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716392874; c=relaxed/simple;
	bh=BoNXGGWRux/7taabDEMnK9P34Zw9HTVcdlV88KGu1vk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Spta/WMR8MeMHvNwfR7gse5HAusV8Tszx67McHzczI4I8APiQ76QCES73+W4HIEM4QLpLkZBlmLBibQ0Iuce14AtJAPXMCXT0LodG8J2B/H1ernVNqgcpeB/SR4PYavbCb0swnf1ne72baPcFCpBkv691T3NJew18+OtKXdDS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fiFRHxzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MCZbmO009265;
	Wed, 22 May 2024 15:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=pn7R86st8lZrhRN2oh2i4beUSpSwJQmLT0BkEzLt9Pc=; b=fi
	FRHxzkq4t6C28w/9p+Oa7+N10F0u1vVG8SxTjPpt13jEVeG4cJjify2WGVvFaGru
	o7Sy8kNxQm89vH32WJdP72X4DbeWDnH7zZd07zBS70oKF5ldvAbb3aFix6o5lSDA
	nvMTstTgwdMWKhQr76ieqAXsTypEjXVR6pNBqAVdTCseXZtS5CVrdIQEsW4cyXQ2
	XhY2BdONdyqOfuy03hp09BUyhKoz60hvS4O684gTQCooOFEa9m94NLc2e8qX6VHv
	8aHKi8k9kqzA5AcvZdjRvmxgBoTa5YgFCOPrLr4h7v5qU99syM+Uywgdoxa0A+zD
	JOjz17Rs0FlimfHmUFCg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psb1ech-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MFlhpX000719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:43 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 08:47:40 -0700
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH v4 4/8] media: qcom: camss: Attach formats to CSIPHY resources
Date: Wed, 22 May 2024 18:46:55 +0300
Message-ID: <20240522154659.510-5-quic_grosikop@quicinc.com>
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
X-Proofpoint-GUID: cYgT26CaMWmYHXFwNVOkb8gTMDH_Ef4l
X-Proofpoint-ORIG-GUID: cYgT26CaMWmYHXFwNVOkb8gTMDH_Ef4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220106

From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>

Following the example of VFE and CSID, attach the CSIPHY
formats to the subdevices resources.

Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 60 ++++++++---------
 .../media/platform/qcom/camss/camss-csiphy.h  | 17 ++++-
 drivers/media/platform/qcom/camss/camss.c     | 66 ++++++++++++-------
 3 files changed, 85 insertions(+), 58 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f26ddf1af9d4..2f7361dfd461 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -24,12 +24,7 @@
 
 #define MSM_CSIPHY_NAME "msm_csiphy"
 
-struct csiphy_format {
-	u32 code;
-	u8 bpp;
-};
-
-static const struct csiphy_format csiphy_formats_8x16[] = {
+static const struct csiphy_format_info formats_8x16[] = {
 	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
 	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
 	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
@@ -49,7 +44,7 @@ static const struct csiphy_format csiphy_formats_8x16[] = {
 	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
 };
 
-static const struct csiphy_format csiphy_formats_8x96[] = {
+static const struct csiphy_format_info formats_8x96[] = {
 	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
 	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
 	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
@@ -73,7 +68,7 @@ static const struct csiphy_format csiphy_formats_8x96[] = {
 	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
 };
 
-static const struct csiphy_format csiphy_formats_sdm845[] = {
+static const struct csiphy_format_info formats_sdm845[] = {
 	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
 	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
 	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
@@ -98,6 +93,21 @@ static const struct csiphy_format csiphy_formats_sdm845[] = {
 	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
 };
 
+const struct csiphy_formats csiphy_formats_8x16 = {
+	.nformats = ARRAY_SIZE(formats_8x16),
+	.formats = formats_8x16
+};
+
+const struct csiphy_formats csiphy_formats_8x96 = {
+	.nformats = ARRAY_SIZE(formats_8x96),
+	.formats = formats_8x96
+};
+
+const struct csiphy_formats csiphy_formats_sdm845 = {
+	.nformats = ARRAY_SIZE(formats_sdm845),
+	.formats = formats_sdm845
+};
+
 /*
  * csiphy_get_bpp - map media bus format to bits per pixel
  * @formats: supported media bus formats array
@@ -106,7 +116,7 @@ static const struct csiphy_format csiphy_formats_sdm845[] = {
  *
  * Return number of bits per pixel
  */
-static u8 csiphy_get_bpp(const struct csiphy_format *formats,
+static u8 csiphy_get_bpp(const struct csiphy_format_info *formats,
 			 unsigned int nformats, u32 code)
 {
 	unsigned int i;
@@ -131,7 +141,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 	int i, j;
 	int ret;
 
-	u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
+	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
 
@@ -244,7 +254,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	struct csiphy_config *cfg = &csiphy->cfg;
 	s64 link_freq;
 	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
-	u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
+	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
 	u8 val;
@@ -350,12 +360,12 @@ static void csiphy_try_format(struct csiphy_device *csiphy,
 	case MSM_CSIPHY_PAD_SINK:
 		/* Set format on sink pad */
 
-		for (i = 0; i < csiphy->nformats; i++)
-			if (fmt->code == csiphy->formats[i].code)
+		for (i = 0; i < csiphy->res->formats->nformats; i++)
+			if (fmt->code == csiphy->res->formats->formats[i].code)
 				break;
 
 		/* If not found, use UYVY as default */
-		if (i >= csiphy->nformats)
+		if (i >= csiphy->res->formats->nformats)
 			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
 		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
@@ -392,10 +402,10 @@ static int csiphy_enum_mbus_code(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 
 	if (code->pad == MSM_CSIPHY_PAD_SINK) {
-		if (code->index >= csiphy->nformats)
+		if (code->index >= csiphy->res->formats->nformats)
 			return -EINVAL;
 
-		code->code = csiphy->formats[code->index].code;
+		code->code = csiphy->res->formats->formats[code->index].code;
 	} else {
 		if (code->index > 0)
 			return -EINVAL;
@@ -566,24 +576,6 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	csiphy->cfg.combo_mode = 0;
 	csiphy->res = &res->csiphy;
 
-	switch (camss->res->version) {
-	case CAMSS_8x16:
-		csiphy->formats = csiphy_formats_8x16;
-		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x16);
-		break;
-	case CAMSS_8x96:
-	case CAMSS_660:
-		csiphy->formats = csiphy_formats_8x96;
-		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
-		break;
-	case CAMSS_845:
-	case CAMSS_8250:
-	case CAMSS_8280XP:
-		csiphy->formats = csiphy_formats_sdm845;
-		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
-		break;
-	}
-
 	/* Memory */
 
 	csiphy->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 7bd68129ca49..47f0b6b09eba 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -42,6 +42,16 @@ struct csiphy_config {
 	struct csiphy_csi2_cfg *csi2;
 };
 
+struct csiphy_format_info {
+	u32 code;
+	u8 bpp;
+};
+
+struct csiphy_formats {
+	unsigned int nformats;
+	const struct csiphy_format_info *formats;
+};
+
 struct csiphy_device;
 
 struct csiphy_hw_ops {
@@ -65,6 +75,7 @@ struct csiphy_hw_ops {
 
 struct csiphy_subdev_resources {
 	const struct csiphy_hw_ops *hw_ops;
+	const struct csiphy_formats *formats;
 };
 
 struct csiphy_device {
@@ -83,8 +94,6 @@ struct csiphy_device {
 	struct csiphy_config cfg;
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
-	const struct csiphy_format *formats;
-	unsigned int nformats;
 };
 
 struct camss_subdev_resources;
@@ -98,6 +107,10 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 
 void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
 
+extern const struct csiphy_formats csiphy_formats_8x16;
+extern const struct csiphy_formats csiphy_formats_8x96;
+extern const struct csiphy_formats csiphy_formats_sdm845;
+
 extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
 extern const struct csiphy_hw_ops csiphy_ops_3ph_1_0;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8b7f02fcda44..1b75918fc35b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -44,7 +44,8 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_2ph_1_0
+			.hw_ops = &csiphy_ops_2ph_1_0,
+			.formats = &csiphy_formats_8x16
 		}
 	},
 
@@ -59,7 +60,8 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_2ph_1_0
+			.hw_ops = &csiphy_ops_2ph_1_0,
+			.formats = &csiphy_formats_8x16
 		}
 	}
 };
@@ -158,7 +160,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	},
 
@@ -173,7 +176,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	},
 
@@ -188,7 +192,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy2", "csiphy2_clk_mux" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	}
 };
@@ -357,7 +362,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	},
 
@@ -374,7 +380,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	},
 
@@ -391,7 +398,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy2", "csiphy2_clk_mux" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	}
 };
@@ -582,7 +590,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 
@@ -603,7 +612,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 
@@ -624,7 +634,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 
@@ -645,7 +656,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	}
 };
@@ -817,7 +829,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY1 */
@@ -829,7 +842,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY2 */
@@ -841,7 +855,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY3 */
@@ -853,7 +868,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY4 */
@@ -865,7 +881,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy4" },
 		.interrupt = { "csiphy4" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY5 */
@@ -877,7 +894,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy5" },
 		.interrupt = { "csiphy5" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	}
 };
@@ -1085,7 +1103,8 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY1 */
@@ -1097,7 +1116,8 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY2 */
@@ -1109,7 +1129,8 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY3 */
@@ -1121,7 +1142,8 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 };
-- 
2.17.1


