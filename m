Return-Path: <linux-media+bounces-23273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E739EE2BB
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7264188B4AD
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB1B21325C;
	Thu, 12 Dec 2024 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="15l/gyKS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540622116F8;
	Thu, 12 Dec 2024 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995239; cv=none; b=dIxDWP9f4WsYcqaCzwNqr4i84n68rcRXmycM7BnM6ugggxgINkLOARbviNV21Olo/CpJ4SqQ818NTOLUgr+/5uN9Y6FCpj2ASUn9H/I3MUOV18kvMKGrB+0ac/1P+LBmX0o5IyPtm7RyvebULKa/SGDriU6ZtUN9kkakzomrhUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995239; c=relaxed/simple;
	bh=Sm73YnAQcEQ/0DmoV74zONz5SxJXZw3R8ON0xjmh7V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HuAYGxn6hgxfsnSsv4BD3zLPLk+jgh1SqvH6vBtMN50nb8xgwaD3YmAm8X2YDR5YRXxq72E4wLuuREoNR2eYkmYLRC26h368fy1QVIzDLhxFIOdaslSK6BNx5NCYNfJBojkHvr4plg+JZA/0QAKMWyd1ngiDScn3EAtGJWLuxfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=15l/gyKS; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC5Vf6b011897;
	Thu, 12 Dec 2024 10:20:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	7+wWOoqw+gOX7y7oNU5VEfZSmfXoO7EaxBJi4Xrq3TI=; b=15l/gyKS9vmQQuwX
	ItKFYJdhuA/FFvgePLQHTNpa0QX7ixCMgIgLe6XsY/REaHWSzzW4QIbnLJzHx2mn
	2RZ/sIxy33GThoZl7guHFYnSFmdf+8Huom+NRF54fhagR0ytlD0/1CeLHAsXNTGY
	YVO9CaQFq06o/AFvnYpgHPwGF6EJ40SuRYxyNeM/7WJOF0EqnM+UXZrVIPHQ4F3v
	pjh57oyT/KWJvQnkc/0IbapivlAMKjmaunQwJ8DNfZrjBIWDwVHK63Ju3YMvJkdv
	fCAqokK/Ag5BFTL1aq07YnMUHBty0ePL0LeNfp53Vkll0pr4Rx7mSDi5+/LlVucl
	RaffTw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43e2w9x8v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:20:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 94A0740054;
	Thu, 12 Dec 2024 10:19:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EC752576FA;
	Thu, 12 Dec 2024 10:18:08 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:08 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:33 +0100
Subject: [PATCH v4 09/15] media: stm32: dcmipp: add 1X16 RGB / YUV formats
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-csi_dcmipp_mp25-v4-9-fbeb55a05ed7@foss.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
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
index 6596902a1760..da80e1aa37ca 100644
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
@@ -813,8 +818,7 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = link->source->index,
 	};
-	const struct dcmipp_bytecap_pix_map *vpix;
-	int ret;
+	int ret, i;
 
 	ret = v4l2_subdev_call(source_sd, pad, get_fmt, NULL, &source_fmt);
 	if (ret < 0)
@@ -828,10 +832,17 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
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
index 72f1bb4c64ad..3c742a546441 100644
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
2.34.1


