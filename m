Return-Path: <linux-media+bounces-6026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3E586906C
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 13:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BCE281962
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 12:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD94E13B7A2;
	Tue, 27 Feb 2024 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lUUghuqO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F47813B2BE;
	Tue, 27 Feb 2024 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709036700; cv=none; b=WMfuO175wHdK0K1o8znH3KKBCC3F2r10KLwK1jt8GBD8p/6xvMkvHV3L/aj/aMmEL/yWQGjvL0VvHx1VQpiM6xAMob6B7GO5cm5V3/ddkXn7NxiaVpXENSrqtO/j+tFJPVMODmFs9qO5rzJiAAZaLd0gjOrcg8hIM6dN0HjqoOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709036700; c=relaxed/simple;
	bh=2801bPbMh2iTK1Rgr07Bg5FEQaeciBOKdwtM5VG67UA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fG4+2I7liq2oi5pV8jPMULoCo7A8foRty5Z4ErShmNens4Z9LIgrcafratOVIhOsaGWa5LZbijsXQkq8LtDSlw+8/havPuwrOkXK4sZMl30DLvIIhV6U+YsmMQcH4T2ZgX0Yp9SO3gevONcZHR/MThV4rfv0aHNga6cRdK2mPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lUUghuqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41RBr1ZT021889;
	Tue, 27 Feb 2024 12:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=6UyRCziWDiskooSaNofNSnPQRqC5r6k7wLwCJmXvAOo=; b=lU
	UghuqO49jZU/+JK/MeQGcehPsAKIBuOwSoV6SKFOHvR04K8u/3XE8AmqdKh5Tcbz
	RMtyhZVI7Mt2N/yJQFNu2UVDHXsrrZ7PDWUGVIciLd0nbJ9Iq37iwlAiRaOyKXm2
	9XaqWnbvcWvQQCFoyZJNUgwYe9lbp0ftLe1J+hzRW2u5KGs6nVakU59jAocNa+zy
	2WdKTmDz17Q3QMZdhqnamJpTdJ5UJHkk5rEIkVItH5SpgTjn5eKA7ieW6d1J9ubG
	gKxBEljONTYxlfo4Dvha4qYnEpvFGRBSO+f59i5xYIyGmL2XrIl/KCH7cp01h58+
	Eh8LOI7zBU+ec5N69Y7A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whedvr5fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:24:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RCOmof013459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:24:48 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 27 Feb 2024 04:24:45 -0800
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH 2/9] media: qcom: camss: Attach formats to VFE resources
Date: Tue, 27 Feb 2024 14:24:08 +0200
Message-ID: <20240227122415.491-3-quic_grosikop@quicinc.com>
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
X-Proofpoint-GUID: GfTljOfqc1JnbZmYiHrqYFx98ZKs5gA-
X-Proofpoint-ORIG-GUID: GfTljOfqc1JnbZmYiHrqYFx98ZKs5gA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402270097

From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>

Video node formats have direct dependency by the sub-device pad formats.
Remove dependency for SoC version and move format definitions in device
which creates video node.

This commit attaches a struct to the VFE resources that holds format
description, so it is much easier to assign them to the video node.
No need to use a switch-case.

NOTE: The mbus_bpp is used to calculate the clock rates and is different
from bpp which is the bits per pixel written to memory. We need to keep
both values to not break the calcualtions.

Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
---
 .../media/platform/qcom/camss/camss-format.h  |  62 +++
 drivers/media/platform/qcom/camss/camss-vfe.c | 358 ++++++++++++------
 drivers/media/platform/qcom/camss/camss-vfe.h |  11 +-
 .../media/platform/qcom/camss/camss-video.c   | 268 +------------
 .../media/platform/qcom/camss/camss-video.h   |   5 +-
 drivers/media/platform/qcom/camss/camss.c     |  48 ++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 7 files changed, 359 insertions(+), 394 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-format.h

diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
new file mode 100644
index 000000000000..bfbc761bd46c
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#define PER_PLANE_DATA(plane, h_fract_num, h_fract_den, v_fract_num, v_fract_den, _bpp)		\
+	.hsub[(plane)].numerator	= (h_fract_num),					\
+	.hsub[(plane)].denominator	= (h_fract_den),					\
+	.vsub[(plane)].numerator	= (v_fract_num),					\
+	.vsub[(plane)].denominator	= (v_fract_den),					\
+	.bpp[(plane)]			= (_bpp)
+
+#ifndef __CAMSS_FORMAT_H__
+#define __CAMSS_FORMAT_H__
+
+#include <linux/types.h>
+
+/*
+ * struct fract - Represents a fraction
+ * @numerator: Store the numerator part of the fraction
+ * @denominator: Store the denominator part of the fraction
+ */
+struct fract {
+	u8 numerator;
+	u8 denominator;
+};
+
+/*
+ * struct camss_format_info - ISP media bus format information
+ * @code: V4L2 media bus format code
+ * @mbus_bpp: Media bus bits per pixel
+ * @pixelformat: V4L2 pixel format FCC identifier
+ * @planes: Number of planes
+ * @hsub: Horizontal subsampling (for each plane)
+ * @vsub: Vertical subsampling (for each plane)
+ * @bpp: Bits per pixel when stored in memory (for each plane)
+ */
+struct camss_format_info {
+	u32 code;
+	u32 mbus_bpp;
+	u32 pixelformat;
+	u8 planes;
+	struct fract hsub[3];
+	struct fract vsub[3];
+	unsigned int bpp[3];
+};
+
+struct camss_formats {
+	unsigned int nformats;
+	const struct camss_format_info *formats;
+};
+
+#endif /* __CAMSS_FORMAT_H__ */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index dbc6d83bb1c6..3daba9e26aee 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -32,96 +32,250 @@
 
 #define SCALER_RATIO_MAX 16
 
-struct vfe_format {
-	u32 code;
-	u8 bpp;
+static const struct camss_format_info formats_rdi_8x16[] = {
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_Y10_1X10, 10, V4L2_PIX_FMT_Y10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+};
+
+static const struct camss_format_info formats_rdi_8x96[] = {
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_SBGGR10, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, V4L2_PIX_FMT_SBGGR14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, V4L2_PIX_FMT_SGBRG14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, V4L2_PIX_FMT_SGRBG14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, V4L2_PIX_FMT_SRGGB14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_Y10_1X10, 10, V4L2_PIX_FMT_Y10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_Y10, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+};
+
+static const struct camss_format_info formats_rdi_845[] = {
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_SBGGR10, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, V4L2_PIX_FMT_SBGGR14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, V4L2_PIX_FMT_SGBRG14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, V4L2_PIX_FMT_SGRBG14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, V4L2_PIX_FMT_SRGGB14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_Y8_1X8, 8, V4L2_PIX_FMT_GREY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_Y10_1X10, 10, V4L2_PIX_FMT_Y10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_Y10, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+};
+
+static const struct camss_format_info formats_pix_8x16[] = {
+	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+};
+
+static const struct camss_format_info formats_pix_8x96[] = {
+	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+};
+
+const struct camss_formats vfe_formats_rdi_8x16 = {
+	.nformats = ARRAY_SIZE(formats_rdi_8x16),
+	.formats = formats_rdi_8x16
 };
 
-static const struct vfe_format formats_rdi_8x16[] = {
-	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
-	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
+const struct camss_formats vfe_formats_pix_8x16 = {
+	.nformats = ARRAY_SIZE(formats_pix_8x16),
+	.formats = formats_pix_8x16
 };
 
-static const struct vfe_format formats_pix_8x16[] = {
-	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
+const struct camss_formats vfe_formats_rdi_8x96 = {
+	.nformats = ARRAY_SIZE(formats_rdi_8x96),
+	.formats = formats_rdi_8x96
 };
 
-static const struct vfe_format formats_rdi_8x96[] = {
-	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16 },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14 },
-	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
-	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
-	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
-	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
-	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
+const struct camss_formats vfe_formats_pix_8x96 = {
+	.nformats = ARRAY_SIZE(formats_pix_8x96),
+	.formats = formats_pix_8x96
 };
 
-static const struct vfe_format formats_pix_8x96[] = {
-	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
+const struct camss_formats vfe_formats_rdi_845 = {
+	.nformats = ARRAY_SIZE(formats_rdi_845),
+	.formats = formats_rdi_845
 };
 
-static const struct vfe_format formats_rdi_845[] = {
-	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16 },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
-	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14 },
-	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
-	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
-	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
-	{ MEDIA_BUS_FMT_Y8_1X8, 8 },
-	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
-	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
+/* TODO: Replace with pix formats */
+const struct camss_formats vfe_formats_pix_845 = {
+	.nformats = ARRAY_SIZE(formats_rdi_845),
+	.formats = formats_rdi_845
 };
 
 /*
@@ -132,18 +286,18 @@ static const struct vfe_format formats_rdi_845[] = {
  *
  * Return number of bits per pixel
  */
-static u8 vfe_get_bpp(const struct vfe_format *formats,
+static u8 vfe_get_bpp(const struct camss_format_info *formats,
 		      unsigned int nformats, u32 code)
 {
 	unsigned int i;
 
 	for (i = 0; i < nformats; i++)
 		if (code == formats[i].code)
-			return formats[i].bpp;
+			return formats[i].mbus_bpp;
 
 	WARN(1, "Unknown format\n");
 
-	return formats[0].bpp;
+	return formats[0].mbus_bpp;
 }
 
 static u32 vfe_find_code(u32 *code, unsigned int n_code,
@@ -1494,31 +1648,12 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		init_completion(&l->output.sof);
 		init_completion(&l->output.reg_update);
 
-		switch (camss->res->version) {
-		case CAMSS_8x16:
-			if (i == VFE_LINE_PIX) {
-				l->formats = formats_pix_8x16;
-				l->nformats = ARRAY_SIZE(formats_pix_8x16);
-			} else {
-				l->formats = formats_rdi_8x16;
-				l->nformats = ARRAY_SIZE(formats_rdi_8x16);
-			}
-			break;
-		case CAMSS_8x96:
-		case CAMSS_660:
-			if (i == VFE_LINE_PIX) {
-				l->formats = formats_pix_8x96;
-				l->nformats = ARRAY_SIZE(formats_pix_8x96);
-			} else {
-				l->formats = formats_rdi_8x96;
-				l->nformats = ARRAY_SIZE(formats_rdi_8x96);
-			}
-			break;
-		case CAMSS_845:
-		case CAMSS_8250:
-			l->formats = formats_rdi_845;
-			l->nformats = ARRAY_SIZE(formats_rdi_845);
-			break;
+		if (i == VFE_LINE_PIX) {
+			l->nformats = res->vfe.formats_pix->nformats;
+			l->formats = res->vfe.formats_pix->formats;
+		} else {
+			l->nformats = res->vfe.formats_rdi->nformats;
+			l->formats = res->vfe.formats_rdi->formats;
 		}
 	}
 
@@ -1669,10 +1804,13 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			video_out->bpl_alignment = 16;
 			video_out->line_based = 1;
 		}
+
+		video_out->nformats = vfe->line[i].nformats;
+		video_out->formats = vfe->line[i].formats;
+
 		snprintf(name, ARRAY_SIZE(name), "%s%d_%s%d",
 			 MSM_VFE_NAME, vfe->id, "video", i);
-		ret = msm_video_register(video_out, v4l2_dev, name,
-					 i == VFE_LINE_PIX ? 1 : 0);
+		ret = msm_video_register(video_out, v4l2_dev, name);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register video node: %d\n",
 				ret);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 87fc159c48cc..10e2cc3c0b83 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -92,7 +92,7 @@ struct vfe_line {
 	struct v4l2_rect crop;
 	struct camss_video video_out;
 	struct vfe_output output;
-	const struct vfe_format *formats;
+	const struct camss_format_info *formats;
 	unsigned int nformats;
 };
 
@@ -132,6 +132,8 @@ struct vfe_subdev_resources {
 	bool has_pd;
 	char *pd_name;
 	const struct vfe_hw_ops *hw_ops;
+	const struct camss_formats *formats_rdi;
+	const struct camss_formats *formats_pix;
 };
 
 struct vfe_device {
@@ -224,6 +226,13 @@ void vfe_pm_domain_off(struct vfe_device *vfe);
  */
 int vfe_pm_domain_on(struct vfe_device *vfe);
 
+extern const struct camss_formats vfe_formats_rdi_8x16;
+extern const struct camss_formats vfe_formats_pix_8x16;
+extern const struct camss_formats vfe_formats_rdi_8x96;
+extern const struct camss_formats vfe_formats_pix_8x96;
+extern const struct camss_formats vfe_formats_rdi_845;
+extern const struct camss_formats vfe_formats_pix_845;
+
 extern const struct vfe_hw_ops vfe_ops_4_1;
 extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index a89da5ef4710..cd13a432e291 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -24,244 +24,6 @@
 #define CAMSS_FRAME_MAX_HEIGHT_RDI	8191
 #define CAMSS_FRAME_MAX_HEIGHT_PIX	4096
 
-struct fract {
-	u8 numerator;
-	u8 denominator;
-};
-
-/*
- * struct camss_format_info - ISP media bus format information
- * @code: V4L2 media bus format code
- * @pixelformat: V4L2 pixel format FCC identifier
- * @planes: Number of planes
- * @hsub: Horizontal subsampling (for each plane)
- * @vsub: Vertical subsampling (for each plane)
- * @bpp: Bits per pixel when stored in memory (for each plane)
- */
-struct camss_format_info {
-	u32 code;
-	u32 pixelformat;
-	u8 planes;
-	struct fract hsub[3];
-	struct fract vsub[3];
-	unsigned int bpp[3];
-};
-
-static const struct camss_format_info formats_rdi_8x16[] = {
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_PIX_FMT_SGBRG8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_PIX_FMT_SGRBG8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_PIX_FMT_SRGGB8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, V4L2_PIX_FMT_SBGGR10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, V4L2_PIX_FMT_SGBRG10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, V4L2_PIX_FMT_SGRBG10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_PIX_FMT_SRGGB10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, V4L2_PIX_FMT_SBGGR12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, V4L2_PIX_FMT_SGBRG12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, V4L2_PIX_FMT_SGRBG12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, V4L2_PIX_FMT_SRGGB12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-};
-
-static const struct camss_format_info formats_rdi_8x96[] = {
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_PIX_FMT_SGBRG8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_PIX_FMT_SGRBG8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_PIX_FMT_SRGGB8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, V4L2_PIX_FMT_SBGGR10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, V4L2_PIX_FMT_SGBRG10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, V4L2_PIX_FMT_SGRBG10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_PIX_FMT_SRGGB10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, V4L2_PIX_FMT_SBGGR10, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, V4L2_PIX_FMT_SBGGR12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, V4L2_PIX_FMT_SGBRG12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, V4L2_PIX_FMT_SGRBG12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, V4L2_PIX_FMT_SRGGB12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SBGGR14_1X14, V4L2_PIX_FMT_SBGGR14P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
-	{ MEDIA_BUS_FMT_SGBRG14_1X14, V4L2_PIX_FMT_SGBRG14P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
-	{ MEDIA_BUS_FMT_SGRBG14_1X14, V4L2_PIX_FMT_SGRBG14P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
-	{ MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
-	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-};
-
-static const struct camss_format_info formats_rdi_845[] = {
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_PIX_FMT_SGBRG8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_PIX_FMT_SGRBG8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_PIX_FMT_SRGGB8, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, V4L2_PIX_FMT_SBGGR10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, V4L2_PIX_FMT_SGBRG10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, V4L2_PIX_FMT_SGRBG10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_PIX_FMT_SRGGB10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, V4L2_PIX_FMT_SBGGR10, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, V4L2_PIX_FMT_SBGGR12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, V4L2_PIX_FMT_SGBRG12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, V4L2_PIX_FMT_SGRBG12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, V4L2_PIX_FMT_SRGGB12P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
-	{ MEDIA_BUS_FMT_SBGGR14_1X14, V4L2_PIX_FMT_SBGGR14P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
-	{ MEDIA_BUS_FMT_SGBRG14_1X14, V4L2_PIX_FMT_SGBRG14P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
-	{ MEDIA_BUS_FMT_SGRBG14_1X14, V4L2_PIX_FMT_SGRBG14P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
-	{ MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
-	{ MEDIA_BUS_FMT_Y8_1X8, V4L2_PIX_FMT_GREY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
-	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
-	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-};
-
-static const struct camss_format_info formats_pix_8x16[] = {
-	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV12, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV21, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV21, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV16, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV16, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV16, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV16, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV61, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV61, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV61, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV61, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-};
-
-static const struct camss_format_info formats_pix_8x96[] = {
-	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV12, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV12, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV21, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV21, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
-	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV16, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV16, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV16, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV16, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV61, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV61, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV61, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV61, 1,
-	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
-	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-};
-
 /* -----------------------------------------------------------------------------
  * Helper functions
  */
@@ -968,8 +730,7 @@ static int msm_video_init_format(struct camss_video *video)
  * Return 0 on success or a negative error code otherwise
  */
 
-int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
-		       const char *name, int is_pix)
+int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev, const char *name)
 {
 	struct media_pad *pad = &video->pad;
 	struct video_device *vdev;
@@ -1006,33 +767,6 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	mutex_init(&video->lock);
 
-	switch (video->camss->res->version) {
-	case CAMSS_8x16:
-		if (is_pix) {
-			video->formats = formats_pix_8x16;
-			video->nformats = ARRAY_SIZE(formats_pix_8x16);
-		} else {
-			video->formats = formats_rdi_8x16;
-			video->nformats = ARRAY_SIZE(formats_rdi_8x16);
-		}
-		break;
-	case CAMSS_8x96:
-	case CAMSS_660:
-		if (is_pix) {
-			video->formats = formats_pix_8x96;
-			video->nformats = ARRAY_SIZE(formats_pix_8x96);
-		} else {
-			video->formats = formats_rdi_8x96;
-			video->nformats = ARRAY_SIZE(formats_rdi_8x96);
-		}
-		break;
-	case CAMSS_845:
-	case CAMSS_8250:
-		video->formats = formats_rdi_845;
-		video->nformats = ARRAY_SIZE(formats_rdi_845);
-		break;
-	}
-
 	ret = msm_video_init_format(video);
 	if (ret < 0) {
 		dev_err(v4l2_dev->dev, "Failed to init format: %d\n", ret);
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index bdbae8424140..4f6c0821ead2 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -33,8 +33,6 @@ struct camss_video_ops {
 			     enum vb2_buffer_state state);
 };
 
-struct camss_format_info;
-
 struct camss_video {
 	struct camss *camss;
 	struct vb2_queue vb2_q;
@@ -52,8 +50,7 @@ struct camss_video {
 	unsigned int nformats;
 };
 
-int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
-		       const char *name, int is_pix);
+int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev, const char *name);
 
 void msm_video_unregister(struct camss_video *video);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 4005824c65d1..9777f714d5e9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -143,7 +143,9 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
 		.type = CAMSS_SUBDEV_TYPE_VFE,
 		.vfe = {
 			.line_num = 3,
-			.hw_ops = &vfe_ops_4_1
+			.hw_ops = &vfe_ops_4_1,
+			.formats_rdi = &vfe_formats_rdi_8x16,
+			.formats_pix = &vfe_formats_pix_8x16
 		}
 	}
 };
@@ -318,7 +320,9 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 		.vfe = {
 			.line_num = 3,
 			.has_pd = true,
-			.hw_ops = &vfe_ops_4_7
+			.hw_ops = &vfe_ops_4_7,
+			.formats_rdi = &vfe_formats_rdi_8x96,
+			.formats_pix = &vfe_formats_pix_8x96
 		}
 	},
 
@@ -342,7 +346,9 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 		.vfe = {
 			.line_num = 3,
 			.has_pd = true,
-			.hw_ops = &vfe_ops_4_7
+			.hw_ops = &vfe_ops_4_7,
+			.formats_rdi = &vfe_formats_rdi_8x96,
+			.formats_pix = &vfe_formats_pix_8x96
 		}
 	}
 };
@@ -538,7 +544,9 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 		.vfe = {
 			.line_num = 3,
 			.has_pd = true,
-			.hw_ops = &vfe_ops_4_8
+			.hw_ops = &vfe_ops_4_8,
+			.formats_rdi = &vfe_formats_rdi_8x96,
+			.formats_pix = &vfe_formats_pix_8x96
 		}
 	},
 
@@ -565,7 +573,9 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 		.vfe = {
 			.line_num = 3,
 			.has_pd = true,
-			.hw_ops = &vfe_ops_4_8
+			.hw_ops = &vfe_ops_4_8,
+			.formats_rdi = &vfe_formats_rdi_8x96,
+			.formats_pix = &vfe_formats_pix_8x96
 		}
 	}
 };
@@ -758,7 +768,9 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.vfe = {
 			.line_num = 4,
 			.has_pd = true,
-			.hw_ops = &vfe_ops_170
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 
@@ -784,7 +796,9 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.vfe = {
 			.line_num = 4,
 			.has_pd = true,
-			.hw_ops = &vfe_ops_170
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 
@@ -809,7 +823,9 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
-			.hw_ops = &vfe_ops_170
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
 		}
 	}
 };
@@ -985,7 +1001,9 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.hw_ops = &vfe_ops_480
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 	/* VFE1 */
@@ -1010,7 +1028,9 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.hw_ops = &vfe_ops_480
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 	/* VFE2 (lite) */
@@ -1033,7 +1053,9 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
-			.hw_ops = &vfe_ops_480
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 	/* VFE3 (lite) */
@@ -1056,7 +1078,9 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
-			.hw_ops = &vfe_ops_480
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index bb4ad4a16d5c..5abde7481caf 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -22,6 +22,7 @@
 #include "camss-csiphy.h"
 #include "camss-ispif.h"
 #include "camss-vfe.h"
+#include "camss-format.h"
 
 #define to_camss(ptr_module)	\
 	container_of(ptr_module, struct camss, ptr_module)
-- 
2.17.1


