Return-Path: <linux-media+bounces-6028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E733869071
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 13:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7113281EE2
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 12:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6C513F016;
	Tue, 27 Feb 2024 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ostZ3mv/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5614C13B7AC;
	Tue, 27 Feb 2024 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709036703; cv=none; b=qPQrf5qHEOxzGY0bkIq4hBHBr0bcqkKOJIB5ujzI4N/F5Cevg5myjK2mDdR6tLDYsAseBp7w50amfB0tVUWJaIiYfQG2bTR8/Ci85dx3lBLEmLCEf+sDSE9iiPWvkgL5fKISYh4UlvQ/E4Z+9W022GuIi1gYzJ7/QYJICu1p0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709036703; c=relaxed/simple;
	bh=X5HWmUE1vWzHgOjbWj4quSmp/yLvoYhLkgYnsSEInDY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbnNY8sacu3Pl2UcXZ7WRcBo2kdNrj6oFhgJd6D5NiVam9WFDHFStB2htjUwr41y6G/AuJZmOvkCp7+EG4PtdzyPLxl7jeVtdQoubkvWe/u/dmiPQr4td/IJ1o6sqqs892eli9+7Wev5wVcxpq0OwWtq2OPTM4eY17DYR06gCi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ostZ3mv/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R9YuGQ016684;
	Tue, 27 Feb 2024 12:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=8TIsEG87ikT7STMBny3V3w8RLZ29VCIWDtS2uSaWFm8=; b=os
	tZ3mv/K7MEJb42Amr0QjGRRKyy6leAd7HZHpPyCZXQAY6SHFryg7n0NEO1O+JGc/
	IYY7iCblf4pTfOKivj9SAGG4BNH7r8tvaQMbMlsfmQHzkHxiY40avpUSs/tXWvmX
	j6CBaKm2Bv2w3dRvs0TbMWp0eIITkXxW0LBLQf07MJSzTboGRmeUbe+nWhQdCrYm
	veoXnyF9cDyhSCClzTLuQ7vbnJ3mR/i/D7YeQ0jPw60LD0ZVjk8SM6ThRPKf537b
	3vSLlcTt9vfIsizjhsAnsdu+uH1zhMMdbaibv4UZbRoeDIMwGkjdsUbmOUU3crHU
	pRxvad5xDutVzpMAvgOA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh64h187k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:24:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RCOsXC003521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:24:54 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 27 Feb 2024 04:24:51 -0800
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH 4/9] media: qcom: camss: Attach formats to CSIPHY resources
Date: Tue, 27 Feb 2024 14:24:10 +0200
Message-ID: <20240227122415.491-5-quic_grosikop@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227122415.491-1-quic_grosikop@quicinc.com>
References: <20240227122415.491-1-quic_grosikop@quicinc.com>
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
X-Proofpoint-ORIG-GUID: K182GE_Dijr3ZGJ59zprmK1p85_s-pYY
X-Proofpoint-GUID: K182GE_Dijr3ZGJ59zprmK1p85_s-pYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402270097

From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>

Following the example of VFE and CSID, attach the CSIPHY
formats to the subdevices resources.

Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 59 ++++++++-----------
 .../media/platform/qcom/camss/camss-csiphy.h  | 17 +++++-
 drivers/media/platform/qcom/camss/camss.c     | 54 +++++++++++------
 3 files changed, 77 insertions(+), 53 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 0b8926a34ac5..2f7361dfd461 100644
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
@@ -566,23 +576,6 @@ int msm_csiphy_subdev_init(struct camss *camss,
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
index fcf87baf548a..eea6f050db64 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -45,7 +45,8 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 		.interrupt = { "csiphy0" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_2ph_1_0
+			.hw_ops = &csiphy_ops_2ph_1_0,
+			.formats = &csiphy_formats_8x16
 		}
 	},
 
@@ -61,7 +62,8 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 		.interrupt = { "csiphy1" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_2ph_1_0
+			.hw_ops = &csiphy_ops_2ph_1_0,
+			.formats = &csiphy_formats_8x16
 		}
 	}
 };
@@ -165,7 +167,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.interrupt = { "csiphy0" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	},
 
@@ -181,7 +184,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.interrupt = { "csiphy1" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	},
 
@@ -197,7 +201,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.interrupt = { "csiphy2" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	}
 };
@@ -374,7 +379,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.interrupt = { "csiphy0" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	},
 
@@ -392,7 +398,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.interrupt = { "csiphy1" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	},
 
@@ -410,7 +417,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.interrupt = { "csiphy2" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_8x96
 		}
 	}
 };
@@ -609,7 +617,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.interrupt = { "csiphy0" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 
@@ -631,7 +640,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.interrupt = { "csiphy1" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 
@@ -653,7 +663,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.interrupt = { "csiphy2" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 
@@ -675,7 +686,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.interrupt = { "csiphy3" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	}
 };
@@ -854,7 +866,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy0" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY1 */
@@ -867,7 +880,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy1" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY2 */
@@ -880,7 +894,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy2" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY3 */
@@ -893,7 +908,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy3" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY4 */
@@ -906,7 +922,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy4" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	},
 	/* CSIPHY5 */
@@ -919,7 +936,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy5" },
 		.type = CAMSS_SUBDEV_TYPE_CSIPHY,
 		.csiphy = {
-			.hw_ops = &csiphy_ops_3ph_1_0
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
 		}
 	}
 };
-- 
2.17.1


