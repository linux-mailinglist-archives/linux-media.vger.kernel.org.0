Return-Path: <linux-media+bounces-6027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 539E586906E
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 13:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D381C20B7C
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 12:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2999713EFE0;
	Tue, 27 Feb 2024 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PdlXUK93"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C913A86C;
	Tue, 27 Feb 2024 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709036702; cv=none; b=alS+SihVn+BKIbmy+gUy1qHKe5xD6Em7MVSgP6GaKPXAij0USxyUotKdamlPL1Cf815NnbYkLu8V2tzow2gmp9HdFkqh+UiPkG1Ymoo3xsqCLKTbq48SwN8sTuze1hVOIgX5nAhnB0aHB2GzmiDxZBDbT6ViEB2yqFJ6JbDHtx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709036702; c=relaxed/simple;
	bh=zh2FZybKXnIzG2oTQBeLY8ivS4cQJ69UewaPPnBxsB4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgGFVKAeopw5NAKQpWHN7xWt5bp/K/k6o8O62VBbVKvnTKZJ9rL7SA0tyhbJYRJQeULmaRwBerkVM0V2+dTfRfRihyuTzIWA4ZmSSFLNcFbiF2BQfou0+LYkT4ghzoCuFX8FpOhFoI8BurQnOQReA+OWPOLje2AXfL07Kob8yMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PdlXUK93; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41RBbDF7021447;
	Tue, 27 Feb 2024 12:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=GTCVotH0mYOdNzSmvgPngZUJqQhQKQ1LljNnVmscwus=; b=Pd
	lXUK936iMI6uVcCUR/tDHgcD5Tjb7CfMUPsjCySlemiLLbGUkaTn7myYttG2b6Gq
	ef5+sYKdZmSY9l6Y3Zxveew6EHortrYRe9fZJokNo0DTgRnBjD//VMh4SXPj0rSY
	OtZhZDZ+f0jkOo7ll7rm2G6fc5VvK5mpN+5sCu5oQmTsJSLRX2nNWMKZ9MVxJoH0
	Xose/b0XYZbUgow0SW/gZ0DIabhimqIIJ0S4RsrobgaMl52k6hdICG+sjtH3e1ie
	yCYLR4xL4MdC+ToKzKL3VfhL1H4mKz2hKJbQ9AfY2P1VX4oQ2/hNgFEshwVy4Blp
	hiHg0o245+EpC/n7wiCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whd7b0ax9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:24:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RCOpO6012768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:24:51 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 27 Feb 2024 04:24:48 -0800
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH 3/9] media: qcom: camss: Attach formats to CSID resources
Date: Tue, 27 Feb 2024 14:24:09 +0200
Message-ID: <20240227122415.491-4-quic_grosikop@quicinc.com>
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
X-Proofpoint-GUID: b6WHU5-shN42aqX9E-cqzc8CV9PfN9J9
X-Proofpoint-ORIG-GUID: b6WHU5-shN42aqX9E-cqzc8CV9PfN9J9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402270097

From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>

Following the example of VFE, move all formats of the decoder
to camss-csid.c and attach them to the subdevices resources.

Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
---
 .../platform/qcom/camss/camss-csid-4-1.c      | 132 +----
 .../platform/qcom/camss/camss-csid-4-7.c      | 160 +-----
 .../platform/qcom/camss/camss-csid-gen2.c     | 164 +-----
 .../media/platform/qcom/camss/camss-csid.c    | 474 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csid.h    |  24 +-
 drivers/media/platform/qcom/camss/camss.c     |  51 +-
 6 files changed, 522 insertions(+), 483 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
index dd49a40e6a70..c95861420502 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -45,128 +45,6 @@
 #define CAMSS_CSID_TG_DT_n_CGG_1(n)	(0x0b0 + 0xc * (n))
 #define CAMSS_CSID_TG_DT_n_CGG_2(n)	(0x0b4 + 0xc * (n))
 
-static const struct csid_format csid_formats[] = {
-	{
-		MEDIA_BUS_FMT_UYVY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_VYUY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YUYV8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YVYU8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_Y10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-};
-
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
@@ -174,7 +52,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	if (enable) {
 		struct v4l2_mbus_framefmt *input_format;
-		const struct csid_format *format;
+		const struct csid_format_info *format;
 		u8 vc = 0; /* Virtual Channel 0 */
 		u8 cid = vc * 4; /* id of Virtual Channel and Data Type set */
 		u8 dt_shift;
@@ -184,7 +62,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			u32 num_lines, num_bytes_per_line;
 
 			input_format = &csid->fmt[MSM_CSID_PAD_SRC];
-			format = csid_get_fmt_entry(csid->formats, csid->nformats,
+			format = csid_get_fmt_entry(csid->res->formats->formats,
+						    csid->res->formats->nformats,
 						    input_format->code);
 			num_bytes_per_line = input_format->width * format->bpp * format->spp / 8;
 			num_lines = input_format->height;
@@ -211,7 +90,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			struct csid_phy_config *phy = &csid->phy;
 
 			input_format = &csid->fmt[MSM_CSID_PAD_SINK];
-			format = csid_get_fmt_entry(csid->formats, csid->nformats,
+			format = csid_get_fmt_entry(csid->res->formats->formats,
+						    csid->res->formats->nformats,
 						    input_format->code);
 
 			val = phy->lane_cnt - 1;
@@ -311,8 +191,6 @@ static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
 
 static void csid_subdev_init(struct csid_device *csid)
 {
-	csid->formats = csid_formats;
-	csid->nformats = ARRAY_SIZE(csid_formats);
 	csid->testgen.modes = csid_testgen_modes;
 	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-7.c b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
index 6b26e036294e..08578a143688 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -44,156 +44,6 @@
 #define CAMSS_CSID_TG_DT_n_CGG_1(n)	(0x0b8 + 0xc * (n))
 #define CAMSS_CSID_TG_DT_n_CGG_2(n)	(0x0bc + 0xc * (n))
 
-static const struct csid_format csid_formats[] = {
-	{
-		MEDIA_BUS_FMT_UYVY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_VYUY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YUYV8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YVYU8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_Y10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-};
-
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
@@ -203,7 +53,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	if (enable) {
 		struct v4l2_mbus_framefmt *input_format;
-		const struct csid_format *format;
+		const struct csid_format_info *format;
 		u8 vc = 0; /* Virtual Channel 0 */
 		u8 cid = vc * 4; /* id of Virtual Channel and Data Type set */
 		u8 dt_shift;
@@ -213,7 +63,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			u32 num_bytes_per_line, num_lines;
 
 			input_format = &csid->fmt[MSM_CSID_PAD_SRC];
-			format = csid_get_fmt_entry(csid->formats, csid->nformats,
+			format = csid_get_fmt_entry(csid->res->formats->formats,
+						    csid->res->formats->nformats,
 						    input_format->code);
 			num_bytes_per_line = input_format->width * format->bpp * format->spp / 8;
 			num_lines = input_format->height;
@@ -240,7 +91,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			struct csid_phy_config *phy = &csid->phy;
 
 			input_format = &csid->fmt[MSM_CSID_PAD_SINK];
-			format = csid_get_fmt_entry(csid->formats, csid->nformats,
+			format = csid_get_fmt_entry(csid->res->formats->formats,
+						    csid->res->formats->nformats,
 						    input_format->code);
 
 			val = phy->lane_cnt - 1;
@@ -387,8 +239,6 @@ static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
 
 static void csid_subdev_init(struct csid_device *csid)
 {
-	csid->formats = csid_formats;
-	csid->nformats = ARRAY_SIZE(csid_formats);
 	csid->testgen.modes = csid_testgen_modes;
 	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index b11de4797cca..eb5dabe2639a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -176,163 +176,6 @@
 #define		TPG_COLOR_BOX_CFG_MODE		0
 #define		TPG_COLOR_BOX_PATTERN_SEL	2
 
-static const struct csid_format csid_formats[] = {
-	{
-		MEDIA_BUS_FMT_UYVY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_VYUY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YUYV8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YVYU8_1X16,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_Y8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_Y10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-};
-
 static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
@@ -341,8 +184,9 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
 	u8 lane_cnt = csid->phy.lane_cnt;
 	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
-	const struct csid_format *format = csid_get_fmt_entry(csid->formats, csid->nformats,
-							      input_format->code);
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
 
 	if (!lane_cnt)
 		lane_cnt = 4;
@@ -612,8 +456,6 @@ static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
 
 static void csid_subdev_init(struct csid_device *csid)
 {
-	csid->formats = csid_formats;
-	csid->nformats = ARRAY_SIZE(csid_formats);
 	csid->testgen.modes = csid_testgen_modes;
 	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index d1a22e07fdb6..5b23f5b8746d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -45,6 +45,450 @@ const char * const csid_testgen_modes[] = {
 	NULL
 };
 
+static const struct csid_format_info formats_4_1[] = {
+	{
+		MEDIA_BUS_FMT_UYVY8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_VYUY8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YUYV8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YVYU8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+};
+
+static const struct csid_format_info formats_4_7[] = {
+	{
+		MEDIA_BUS_FMT_UYVY8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_VYUY8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YUYV8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YVYU8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+};
+
+static const struct csid_format_info formats_gen2[] = {
+	{
+		MEDIA_BUS_FMT_UYVY8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_VYUY8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YUYV8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YVYU8_1X16,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_Y8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+};
+
+const struct csid_formats csid_formats_4_1 = {
+	.nformats = ARRAY_SIZE(formats_4_1),
+	.formats = formats_4_1
+};
+
+const struct csid_formats csid_formats_4_7 = {
+	.nformats = ARRAY_SIZE(formats_4_7),
+	.formats = formats_4_7
+};
+
+const struct csid_formats csid_formats_gen2 = {
+	.nformats = ARRAY_SIZE(formats_gen2),
+	.formats = formats_gen2
+};
+
 u32 csid_find_code(u32 *codes, unsigned int ncodes,
 		   unsigned int match_format_idx, u32 match_code)
 {
@@ -65,9 +509,9 @@ u32 csid_find_code(u32 *codes, unsigned int ncodes,
 	return codes[0];
 }
 
-const struct csid_format *csid_get_fmt_entry(const struct csid_format *formats,
-					     unsigned int nformats,
-					     u32 code)
+const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info *formats,
+						  unsigned int nformats,
+						  u32 code)
 {
 	unsigned int i;
 
@@ -87,12 +531,12 @@ const struct csid_format *csid_get_fmt_entry(const struct csid_format *formats,
 static int csid_set_clock_rates(struct csid_device *csid)
 {
 	struct device *dev = csid->camss->dev;
-	const struct csid_format *fmt;
+	const struct csid_format_info *fmt;
 	s64 link_freq;
 	int i, j;
 	int ret;
 
-	fmt = csid_get_fmt_entry(csid->formats, csid->nformats,
+	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
 				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
 	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
 					csid->phy.lane_cnt);
@@ -301,12 +745,12 @@ static void csid_try_format(struct csid_device *csid,
 	case MSM_CSID_PAD_SINK:
 		/* Set format on sink pad */
 
-		for (i = 0; i < csid->nformats; i++)
-			if (fmt->code == csid->formats[i].code)
+		for (i = 0; i < csid->res->formats->nformats; i++)
+			if (fmt->code == csid->res->formats->formats[i].code)
 				break;
 
 		/* If not found, use UYVY as default */
-		if (i >= csid->nformats)
+		if (i >= csid->res->formats->nformats)
 			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
 		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
@@ -330,12 +774,12 @@ static void csid_try_format(struct csid_device *csid,
 			/* Test generator is enabled, set format on source */
 			/* pad to allow test generator usage */
 
-			for (i = 0; i < csid->nformats; i++)
-				if (csid->formats[i].code == fmt->code)
+			for (i = 0; i < csid->res->formats->nformats; i++)
+				if (csid->res->formats->formats[i].code == fmt->code)
 					break;
 
 			/* If not found, use UYVY as default */
-			if (i >= csid->nformats)
+			if (i >= csid->res->formats->nformats)
 				fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
 			fmt->width = clamp_t(u32, fmt->width, 1, 8191);
@@ -363,10 +807,10 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 
 	if (code->pad == MSM_CSID_PAD_SINK) {
-		if (code->index >= csid->nformats)
+		if (code->index >= csid->res->formats->nformats)
 			return -EINVAL;
 
-		code->code = csid->formats[code->index].code;
+		code->code = csid->res->formats->formats[code->index].code;
 	} else {
 		if (csid->testgen_mode->cur.val == 0) {
 			struct v4l2_mbus_framefmt *sink_fmt;
@@ -380,10 +824,10 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
 			if (!code->code)
 				return -EINVAL;
 		} else {
-			if (code->index >= csid->nformats)
+			if (code->index >= csid->res->formats->nformats)
 				return -EINVAL;
 
-			code->code = csid->formats[code->index].code;
+			code->code = csid->res->formats->formats[code->index].code;
 		}
 	}
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 8d2971aa9ef8..0e385d17c250 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -67,7 +67,7 @@ enum csid_testgen_mode {
 	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2 = 9, /* excluding disabled */
 };
 
-struct csid_format {
+struct csid_format_info {
 	u32 code;
 	u8 data_type;
 	u8 decode_format;
@@ -75,6 +75,11 @@ struct csid_format {
 	u8 spp; /* bus samples per pixel */
 };
 
+struct csid_formats {
+	unsigned int nformats;
+	const struct csid_format_info *formats;
+};
+
 struct csid_testgen_config {
 	enum csid_testgen_mode mode;
 	const char * const*modes;
@@ -152,6 +157,7 @@ struct csid_hw_ops {
 struct csid_subdev_resources {
 	bool is_lite;
 	const struct csid_hw_ops *hw_ops;
+	const struct csid_formats *formats;
 };
 
 struct csid_device {
@@ -172,8 +178,6 @@ struct csid_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSID_PADS_NUM];
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *testgen_mode;
-	const struct csid_format *formats;
-	unsigned int nformats;
 	const struct csid_subdev_resources *res;
 };
 
@@ -193,16 +197,16 @@ u32 csid_find_code(u32 *codes, unsigned int ncode,
 		   unsigned int match_format_idx, u32 match_code);
 
 /*
- * csid_get_fmt_entry - Find csid_format entry with matching format code
- * @formats: Array of format csid_format entries
+ * csid_get_fmt_entry - Find csid_format_info entry with matching format code
+ * @formats: Array of format csid_format_info entries
  * @nformats: Length of @nformats array
  * @code: Desired format code
  *
  * Return formats[0] on failure to find code
  */
-const struct csid_format *csid_get_fmt_entry(const struct csid_format *formats,
-					     unsigned int nformats,
-					     u32 code);
+const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info *formats,
+						  unsigned int nformats,
+						  u32 code);
 
 int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 			 const struct camss_subdev_resources *res, u8 id);
@@ -216,6 +220,10 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id);
 
 extern const char * const csid_testgen_modes[];
 
+extern const struct csid_formats csid_formats_4_1;
+extern const struct csid_formats csid_formats_4_7;
+extern const struct csid_formats csid_formats_gen2;
+
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_gen2;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9777f714d5e9..fcf87baf548a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -84,7 +84,8 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 		.interrupt = { "csid0" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_1
+			.hw_ops = &csid_ops_4_1,
+			.formats = &csid_formats_4_1
 		}
 	},
 
@@ -105,7 +106,8 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 		.interrupt = { "csid1" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_1
+			.hw_ops = &csid_ops_4_1,
+			.formats = &csid_formats_4_1
 		}
 	},
 };
@@ -218,7 +220,8 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.interrupt = { "csid0" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_7
+			.hw_ops = &csid_ops_4_7,
+			.formats = &csid_formats_4_7
 		}
 	},
 
@@ -239,7 +242,8 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.interrupt = { "csid1" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_7
+			.hw_ops = &csid_ops_4_7,
+			.formats = &csid_formats_4_7
 		}
 	},
 
@@ -260,7 +264,8 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.interrupt = { "csid2" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_7
+			.hw_ops = &csid_ops_4_7,
+			.formats = &csid_formats_4_7
 		}
 	},
 
@@ -281,7 +286,8 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.interrupt = { "csid3" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_7
+			.hw_ops = &csid_ops_4_7,
+			.formats = &csid_formats_4_7
 		}
 	}
 };
@@ -430,7 +436,8 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.interrupt = { "csid0" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_7
+			.hw_ops = &csid_ops_4_7,
+			.formats = &csid_formats_4_7
 		}
 	},
 
@@ -454,7 +461,8 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.interrupt = { "csid1" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_7
+			.hw_ops = &csid_ops_4_7,
+			.formats = &csid_formats_4_7
 		}
 	},
 
@@ -478,7 +486,8 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.interrupt = { "csid2" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_7
+			.hw_ops = &csid_ops_4_7,
+			.formats = &csid_formats_4_7
 		}
 	},
 
@@ -502,7 +511,8 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.interrupt = { "csid3" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_4_7
+			.hw_ops = &csid_ops_4_7,
+			.formats = &csid_formats_4_7
 		}
 	}
 };
@@ -691,7 +701,8 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.interrupt = { "csid0" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_gen2
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
 		}
 	},
 
@@ -715,7 +726,8 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.interrupt = { "csid1" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_gen2
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
 		}
 	},
 
@@ -740,7 +752,8 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
 			.is_lite = true,
-			.hw_ops = &csid_ops_gen2
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
 		}
 	}
 };
@@ -925,7 +938,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid0" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_gen2
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
 		}
 	},
 	/* CSID1 */
@@ -941,7 +955,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid1" },
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
-			.hw_ops = &csid_ops_gen2
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
 		}
 	},
 	/* CSID2 */
@@ -957,7 +972,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
 			.is_lite = true,
-			.hw_ops = &csid_ops_gen2
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
 		}
 	},
 	/* CSID3 */
@@ -973,7 +989,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.type = CAMSS_SUBDEV_TYPE_CSID,
 		.csid = {
 			.is_lite = true,
-			.hw_ops = &csid_ops_gen2
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
 		}
 	}
 };
-- 
2.17.1


