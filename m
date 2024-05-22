Return-Path: <linux-media+bounces-11742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553728CC470
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 17:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E5D0B229F1
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D2D13D893;
	Wed, 22 May 2024 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jmoKxmvY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475D1422A3;
	Wed, 22 May 2024 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716392876; cv=none; b=P2KfJ5onZcCzaq2ZNq5GvyfgbrHOdnR4Lh5P1D3uv9S22LcDN4gQiY5KvSqlyzNvS1Eus62RosxN3ZOGcOUitkHPP8VJXmkPmFFWNia61oztXBg3Mg5FHJ0TVQlnyx9WHjtCPLQ2M4oAfOdE8KqLOIEjBbMXF5/vvuMcRHN0bvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716392876; c=relaxed/simple;
	bh=iVwGTkQWxWcI80tu9hvA2cccEZBD5dYeoIGWBpubkI0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Au5Ll++59AKnxpnqIB2h4Sm+umZTREH7wK0x5AAiR4Odn7od28xMKojFhsaXco1nDwpN32zgLJaCcuAX7JZ7h+OnHOp3c7t+6PHfH+xAQ0Q9a29kSne28D/8rEH8Lujj+aLBTtoUcJ5RH1GUhiGmuPBpXGY/edNEWbTfotYmdw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jmoKxmvY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MAhkwC025789;
	Wed, 22 May 2024 15:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=gsvffkTPVXOXICWUX5BrUDc5/r53jyK/EqGR9pH7S4g=; b=jm
	oKxmvY5zoVjXb3rr3NBGw7nJqF8FxErVe4Uk9dzCMZxTgRKa5Yg7qmSxURoqoT/C
	hgPnyIh4TlAt7GtZUR8eMoX2p5Uv9Cp0rz5s9MsSTor8aGknc5PhTKu5xxlq/Bjm
	3K3Bkxvj147GzUr5ihTyusllrT8aoVlefx51+txSRhv/HdIbWZvX3bQjU0kRjwzG
	LYF6W3WQATkmsOw7RHFmfiWYSlwzBy1ejSHvZhoYNdTIjmhIsWuVOtOqa5hp6FjS
	GVWqL4TmUTgJyZQiUgAu1ICsuiBrEmgP3HlCDAS10i2EyMUK8Dnn7kApP7+TIfUa
	ekAOYKYNbSvg7BREWyfA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc9jn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MFlkmA011015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:46 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 08:47:43 -0700
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH v4 5/8] media: qcom: camss: Move format related functions
Date: Wed, 22 May 2024 18:46:56 +0300
Message-ID: <20240522154659.510-6-quic_grosikop@quicinc.com>
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
X-Proofpoint-ORIG-GUID: _KK5ymMTfcqzxl75PL-13Mk21dy5W519
X-Proofpoint-GUID: _KK5ymMTfcqzxl75PL-13Mk21dy5W519
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220107

From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>

Move out the format related helper functions from vfe and video in a
separate file. The goal here is to create a format API.

Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile    |  1 +
 .../media/platform/qcom/camss/camss-format.c  | 91 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  5 +
 drivers/media/platform/qcom/camss/camss-vfe.c | 86 +++++-------------
 .../media/platform/qcom/camss/camss-video.c   | 26 +-----
 5 files changed, 121 insertions(+), 88 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-format.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 0d4389ab312d..e636968a1126 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -19,5 +19,6 @@ qcom-camss-objs += \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
 		camss-video.o \
+		camss-format.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
new file mode 100644
index 000000000000..4a3d5549615c
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-format.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-format.c
+ *
+ * Qualcomm MSM Camera Subsystem - Format helpers
+ *
+ * Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+#include <linux/bug.h>
+#include <linux/errno.h>
+
+#include "camss-format.h"
+
+/*
+ * camss_format_get_bpp - Map media bus format to bits per pixel
+ * @formats: supported media bus formats array
+ * @nformats: size of @formats array
+ * @code: media bus format code
+ *
+ * Return number of bits per pixel
+ */
+u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nformats, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < nformats; i++)
+		if (code == formats[i].code)
+			return formats[i].mbus_bpp;
+
+	WARN(1, "Unknown format\n");
+
+	return formats[0].mbus_bpp;
+}
+
+/*
+ * camss_format_find_code - Find a format code in an array
+ * @code: a pointer to media bus format codes array
+ * @n_code: size of @code array
+ * @index: index of code in the array
+ * @req_code: required code
+ *
+ * Return media bus format code
+ */
+u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code)
+{
+	unsigned int i;
+
+	if (!req_code && index >= n_code)
+		return 0;
+
+	for (i = 0; i < n_code; i++) {
+		if (req_code) {
+			if (req_code == code[i])
+				return req_code;
+		} else {
+			if (i == index)
+				return code[i];
+		}
+	}
+
+	return code[0];
+}
+
+/*
+ * camss_format_find_format - Find a format in an array
+ * @code: media bus format code
+ * @pixelformat: V4L2 pixel format FCC identifier
+ * @formats: a pointer to formats array
+ * @nformats: size of @formats array
+ *
+ * Return index of a format or a negative error code otherwise
+ */
+int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
+			     unsigned int nformats)
+{
+	unsigned int i;
+
+	for (i = 0; i < nformats; i++) {
+		if (formats[i].code == code &&
+		    formats[i].pixelformat == pixelformat)
+			return i;
+	}
+
+	for (i = 0; i < nformats; i++) {
+		if (formats[i].code == code)
+			return i;
+	}
+
+	return -EINVAL;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
index e0231ca6a5ca..923a48c9c3fb 100644
--- a/drivers/media/platform/qcom/camss/camss-format.h
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -54,4 +54,9 @@ struct camss_formats {
 	const struct camss_format_info *formats;
 };
 
+u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nformats, u32 code);
+u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
+int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
+			     unsigned int nformats);
+
 #endif /* __CAMSS_FORMAT_H__ */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2d5a64c055f1..83c5a36d071f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -278,48 +278,6 @@ const struct camss_formats vfe_formats_pix_845 = {
 	.formats = formats_rdi_845
 };
 
-/*
- * vfe_get_bpp - map media bus format to bits per pixel
- * @formats: supported media bus formats array
- * @nformats: size of @formats array
- * @code: media bus format code
- *
- * Return number of bits per pixel
- */
-static u8 vfe_get_bpp(const struct camss_format_info *formats,
-		      unsigned int nformats, u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < nformats; i++)
-		if (code == formats[i].code)
-			return formats[i].mbus_bpp;
-
-	WARN(1, "Unknown format\n");
-
-	return formats[0].mbus_bpp;
-}
-
-static u32 vfe_find_code(u32 *code, unsigned int n_code,
-			 unsigned int index, u32 req_code)
-{
-	int i;
-
-	if (!req_code && (index >= n_code))
-		return 0;
-
-	for (i = 0; i < n_code; i++)
-		if (req_code) {
-			if (req_code == code[i])
-				return req_code;
-		} else {
-			if (i == index)
-				return code[i];
-		}
-
-	return code[0];
-}
-
 static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			    unsigned int index, u32 src_req_code)
 {
@@ -335,8 +293,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 				MEDIA_BUS_FMT_YUYV8_1_5X8,
 			};
 
-			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
-					     index, src_req_code);
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
 		}
 		case MEDIA_BUS_FMT_YVYU8_1X16:
 		{
@@ -345,8 +303,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 				MEDIA_BUS_FMT_YVYU8_1_5X8,
 			};
 
-			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
-					     index, src_req_code);
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
 		}
 		case MEDIA_BUS_FMT_UYVY8_1X16:
 		{
@@ -355,8 +313,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 				MEDIA_BUS_FMT_UYVY8_1_5X8,
 			};
 
-			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
-					     index, src_req_code);
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
 		}
 		case MEDIA_BUS_FMT_VYUY8_1X16:
 		{
@@ -365,8 +323,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 				MEDIA_BUS_FMT_VYUY8_1_5X8,
 			};
 
-			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
-					     index, src_req_code);
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
 		}
 		default:
 			if (index > 0)
@@ -391,8 +349,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 				MEDIA_BUS_FMT_YUYV8_1_5X8,
 			};
 
-			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
-					     index, src_req_code);
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
 		}
 		case MEDIA_BUS_FMT_YVYU8_1X16:
 		{
@@ -404,8 +362,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 				MEDIA_BUS_FMT_YVYU8_1_5X8,
 			};
 
-			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
-					     index, src_req_code);
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
 		}
 		case MEDIA_BUS_FMT_UYVY8_1X16:
 		{
@@ -417,8 +375,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 				MEDIA_BUS_FMT_UYVY8_1_5X8,
 			};
 
-			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
-					     index, src_req_code);
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
 		}
 		case MEDIA_BUS_FMT_VYUY8_1X16:
 		{
@@ -430,8 +388,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 				MEDIA_BUS_FMT_VYUY8_1_5X8,
 			};
 
-			return vfe_find_code(src_code, ARRAY_SIZE(src_code),
-					     index, src_req_code);
+			return camss_format_find_code(src_code, ARRAY_SIZE(src_code),
+						      index, src_req_code);
 		}
 		default:
 			if (index > 0)
@@ -714,9 +672,9 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 				} else {
 					struct vfe_line *l = &vfe->line[j];
 
-					bpp = vfe_get_bpp(l->formats,
-						l->nformats,
-						l->fmt[MSM_VFE_PAD_SINK].code);
+					bpp = camss_format_get_bpp(l->formats,
+								   l->nformats,
+								   l->fmt[MSM_VFE_PAD_SINK].code);
 					tmp = pixel_clock[j] * bpp / 64;
 				}
 
@@ -795,9 +753,9 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 				} else {
 					struct vfe_line *l = &vfe->line[j];
 
-					bpp = vfe_get_bpp(l->formats,
-						l->nformats,
-						l->fmt[MSM_VFE_PAD_SINK].code);
+					bpp = camss_format_get_bpp(l->formats,
+								   l->nformats,
+								   l->fmt[MSM_VFE_PAD_SINK].code);
 					tmp = pixel_clock[j] * bpp / 64;
 				}
 
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 2fe706838469..cd72feca618c 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -28,27 +28,6 @@
  * Helper functions
  */
 
-static int video_find_format(u32 code, u32 pixelformat,
-			     const struct camss_format_info *formats,
-			     unsigned int nformats)
-{
-	int i;
-
-	for (i = 0; i < nformats; i++) {
-		if (formats[i].code == code &&
-		    formats[i].pixelformat == pixelformat)
-			return i;
-	}
-
-	for (i = 0; i < nformats; i++)
-		if (formats[i].code == code)
-			return i;
-
-	WARN_ON(1);
-
-	return -EINVAL;
-}
-
 /*
  * video_mbus_to_pix_mp - Convert v4l2_mbus_framefmt to v4l2_pix_format_mplane
  * @mbus: v4l2_mbus_framefmt format (input)
@@ -121,9 +100,8 @@ static int video_get_subdev_format(struct camss_video *video,
 	if (ret)
 		return ret;
 
-	ret = video_find_format(fmt.format.code,
-				format->fmt.pix_mp.pixelformat,
-				video->formats, video->nformats);
+	ret = camss_format_find_format(fmt.format.code, format->fmt.pix_mp.pixelformat,
+				       video->formats, video->nformats);
 	if (ret < 0)
 		return ret;
 
-- 
2.17.1


