Return-Path: <linux-media+bounces-20869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 270959BC767
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AEF5B22121
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D8F1FF05A;
	Tue,  5 Nov 2024 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="IeCMdxPn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A6C1FDFA0;
	Tue,  5 Nov 2024 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793130; cv=none; b=K8DzIRZzRNpolBdUbdMq39k8CofRofaJQbjDnXnz6tIJC6XKdXo76CEXf+wXxnKRvi+UtTJobNlBPJ1sGPX7l4884acFvhhpNOmL7QcffxfC8IdGhUicPwYSKNjablLgqB5LoaNLIUsniH2x52sNRy2SDG8kINTu1e0kfPnA3ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793130; c=relaxed/simple;
	bh=I7l3/M2qaiyoegFrTjSIvWPFvYUUxhxa8ZQTpsAoRBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jY4Jyhe5NM2QnFrr8NHXhImfeGkHVwjknanCF7pB/rWDmE/L8klgq8WBzDTp2IX2rH48omDbLSc+blZiux1+etAJiCAuyo2JxrgnsuM0sEdsBokc7rb6yZnA4MYwvU/2Eb0XXo2enbiCcBHmsCy9MumEl4DnqIsgQg7UlKXCf4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=IeCMdxPn; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A50ipN5016086;
	Tue, 5 Nov 2024 08:51:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	CljfqA+tRNBhppv+/47HW/+wKiyeRMWC8XV1LMidIbQ=; b=IeCMdxPnny2UPDK0
	EXen4p37aawTZIZW2wC2Fz2wJMNyeVnpOXjmELySXjsrJk3NjspCUFVLkaCxuJR2
	6G529OZvRWbUAsSElVjsimfm6MJQ+lSRo3sWoPXQex1/WoYj+JXDl3erKvQ90QAG
	QrQOkw8Wuwrw/paZHQpbDTvFNzVPxTf17wyX4DBNDyMnbG+y+uAP9LErDSoVTYmd
	x40kBkKwcanler5KGKmfEWOU1crEDryUemnO+KBTcPx0zj54NccLZEUJncgddqum
	Tq6UVFNIWxYT7JiKXkI6yOB0Yk/qPFNCokfYjBTlwjrsM3eJgYj553e9otUWVpWz
	/jt/gQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nywn8931-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:51:51 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B99D54004D;
	Tue,  5 Nov 2024 08:50:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02345250FB2;
	Tue,  5 Nov 2024 08:49:34 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:12 +0100
Subject: [PATCH v2 09/15] media: stm32: dcmipp: add 1X16 RGB / YUV formats
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-9-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add 1X16 RGB & YUV formats support within bytecap & byteproc.
Slightly change the link_validate function to be able to validate
against either 1X16 or 2X8 variant of a format.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 23 ++++++++++++++++------
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  5 +++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index d6fad99e44bba5bcab1df056ba9208e82aff4bea..99732d19dc4d5f4692588118eadb236d4ed9c8a1 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -56,10 +56,15 @@ struct dcmipp_bytecap_pix_map {
 
 static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
+	PIXMAP_MBUS_PFMT(RGB565_1X16, RGB565),
 	PIXMAP_MBUS_PFMT(YUYV8_2X8, YUYV),
+	PIXMAP_MBUS_PFMT(YUYV8_1X16, YUYV),
 	PIXMAP_MBUS_PFMT(YVYU8_2X8, YVYU),
+	PIXMAP_MBUS_PFMT(YVYU8_1X16, YVYU),
 	PIXMAP_MBUS_PFMT(UYVY8_2X8, UYVY),
+	PIXMAP_MBUS_PFMT(UYVY8_1X16, UYVY),
 	PIXMAP_MBUS_PFMT(VYUY8_2X8, VYUY),
+	PIXMAP_MBUS_PFMT(VYUY8_1X16, VYUY),
 	PIXMAP_MBUS_PFMT(Y8_1X8, GREY),
 	PIXMAP_MBUS_PFMT(SBGGR8_1X8, SBGGR8),
 	PIXMAP_MBUS_PFMT(SGBRG8_1X8, SGBRG8),
@@ -819,8 +824,7 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = link->source->index,
 	};
-	const struct dcmipp_bytecap_pix_map *vpix;
-	int ret;
+	int ret, i;
 
 	ret = v4l2_subdev_call(source_sd, pad, get_fmt, NULL, &source_fmt);
 	if (ret < 0)
@@ -834,10 +838,17 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 		return -EINVAL;
 	}
 
-	vpix = dcmipp_bytecap_pix_map_by_pixelformat(vcap->format.pixelformat);
-	if (source_fmt.format.code != vpix->code) {
-		dev_err(vcap->dev, "Wrong mbus_code 0x%x, (0x%x expected)\n",
-			vpix->code, source_fmt.format.code);
+	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
+		if (dcmipp_bytecap_pix_map_list[i].pixelformat ==
+			vcap->format.pixelformat &&
+		    dcmipp_bytecap_pix_map_list[i].code ==
+			source_fmt.format.code)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list)) {
+		dev_err(vcap->dev, "mbus code 0x%x do not match capture device format (0x%x)\n",
+			vcap->format.pixelformat, source_fmt.format.code);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 72f1bb4c64ad4c194c14467dfc354a04bc69e208..3c742a546441e190b7d93d5e9401d6824acf509b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -48,10 +48,15 @@ struct dcmipp_byteproc_pix_map {
 	}
 static const struct dcmipp_byteproc_pix_map dcmipp_byteproc_pix_map_list[] = {
 	PIXMAP_MBUS_BPP(RGB565_2X8_LE, 2),
+	PIXMAP_MBUS_BPP(RGB565_1X16, 2),
 	PIXMAP_MBUS_BPP(YUYV8_2X8, 2),
+	PIXMAP_MBUS_BPP(YUYV8_1X16, 2),
 	PIXMAP_MBUS_BPP(YVYU8_2X8, 2),
+	PIXMAP_MBUS_BPP(YVYU8_1X16, 2),
 	PIXMAP_MBUS_BPP(UYVY8_2X8, 2),
+	PIXMAP_MBUS_BPP(UYVY8_1X16, 2),
 	PIXMAP_MBUS_BPP(VYUY8_2X8, 2),
+	PIXMAP_MBUS_BPP(VYUY8_1X16, 2),
 	PIXMAP_MBUS_BPP(Y8_1X8, 1),
 	PIXMAP_MBUS_BPP(SBGGR8_1X8, 1),
 	PIXMAP_MBUS_BPP(SGBRG8_1X8, 1),

-- 
2.25.1


