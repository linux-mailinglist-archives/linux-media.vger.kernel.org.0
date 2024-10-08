Return-Path: <linux-media+bounces-19228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 255939946A9
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A496B24C91
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEED41DF26B;
	Tue,  8 Oct 2024 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="P8V2Ncs2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8991D2B3C;
	Tue,  8 Oct 2024 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386509; cv=none; b=Mg++pu3t7QwyJZ2xWFXQcvKvALxNouvLDofmFrDnM6j5q+snrtRCZ+eDIA7JPe3x5/jxGNniyPY6MUW/5OlLQdxpoMS+lAaDZaABJCJrsSq7w5BDxpmaEUkRrRWV34ut5olmQpfc3XWLgNUPDPKnnTNPr5kYpReW7ICIvqTUJJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386509; c=relaxed/simple;
	bh=BZNPaEW8yThUhVAR4fIYowHy3Kpq6TY8VoTtClQchtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ubETfgszOQuhNSKThpaAYRk/3Ndh9QpCrggUcOXsYMQI4o/ZKTANZUWie0TIBf7SBNWgSpiLIvxBhgWJDvv0X5XXoLmCTVyj2SzTbnCxfVDpSybsYkROaLHjAeuSBYRQB+lY39VKuWv3wdWJKpLJNCHgS4gjkHs5qUELW8jGSpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=P8V2Ncs2; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989HT5W006696;
	Tue, 8 Oct 2024 13:21:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	tVw5V3N7oxijnAT3uS7ZS+U54mpSzsyRVWli7nkwvYk=; b=P8V2Ncs2nNUbIsSn
	oM5XkytT9R5cvjaU0HaGzqQ/Be6jgHPXBFxUT7Rufj2T7I6A+w/vF7eyj7MPfzc8
	2caj4hMpG7MQs1rVlgpEz9aNHVjApGD1yaJf7rpa9NEOHXWBjwGnFJ8GzKekrlNt
	VNKwQGj26TRN5jP9HySHfvy0DBRj9wESPlq0sdL6Zokudwa2Vz+3MWDmW39vx2+4
	NAeX7PaMckV7HJvf49FlOnnXLlSZ/bT6WWX85NQDeLlZORxsjJ1UZsNgSpL3inHr
	gDvOBxM8pjRKjJbyZGaMmK1AdwHVvokemiPCBR18k+sbGD/djN2PAVZ2xLAafJTy
	cefJDg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xs1dyme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 223724005A;
	Tue,  8 Oct 2024 13:20:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A73EA28519B;
	Tue,  8 Oct 2024 13:18:18 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:18 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:10 +0200
Subject: [PATCH 08/15] media: stm32: dcmipp: add bayer 10~14 bits formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-8-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
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
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add support for bayer formats from 10 to 14 bits.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c    | 12 ++++++++++++
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c   | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 48596592bfd5..d6fad99e44bb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -65,6 +65,18 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(SGBRG8_1X8, SGBRG8),
 	PIXMAP_MBUS_PFMT(SGRBG8_1X8, SGRBG8),
 	PIXMAP_MBUS_PFMT(SRGGB8_1X8, SRGGB8),
+	PIXMAP_MBUS_PFMT(SBGGR10_1X10, SBGGR10),
+	PIXMAP_MBUS_PFMT(SGBRG10_1X10, SGBRG10),
+	PIXMAP_MBUS_PFMT(SGRBG10_1X10, SGRBG10),
+	PIXMAP_MBUS_PFMT(SRGGB10_1X10, SRGGB10),
+	PIXMAP_MBUS_PFMT(SBGGR12_1X12, SBGGR12),
+	PIXMAP_MBUS_PFMT(SGBRG12_1X12, SGBRG12),
+	PIXMAP_MBUS_PFMT(SGRBG12_1X12, SGRBG12),
+	PIXMAP_MBUS_PFMT(SRGGB12_1X12, SRGGB12),
+	PIXMAP_MBUS_PFMT(SBGGR14_1X14, SBGGR14),
+	PIXMAP_MBUS_PFMT(SGBRG14_1X14, SGBRG14),
+	PIXMAP_MBUS_PFMT(SGRBG14_1X14, SGRBG14),
+	PIXMAP_MBUS_PFMT(SRGGB14_1X14, SRGGB14),
 	PIXMAP_MBUS_PFMT(JPEG_1X8, JPEG),
 };
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index a19c8235af56..72f1bb4c64ad 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -57,6 +57,18 @@ static const struct dcmipp_byteproc_pix_map dcmipp_byteproc_pix_map_list[] = {
 	PIXMAP_MBUS_BPP(SGBRG8_1X8, 1),
 	PIXMAP_MBUS_BPP(SGRBG8_1X8, 1),
 	PIXMAP_MBUS_BPP(SRGGB8_1X8, 1),
+	PIXMAP_MBUS_BPP(SBGGR10_1X10, 2),
+	PIXMAP_MBUS_BPP(SGBRG10_1X10, 2),
+	PIXMAP_MBUS_BPP(SGRBG10_1X10, 2),
+	PIXMAP_MBUS_BPP(SRGGB10_1X10, 2),
+	PIXMAP_MBUS_BPP(SBGGR12_1X12, 2),
+	PIXMAP_MBUS_BPP(SGBRG12_1X12, 2),
+	PIXMAP_MBUS_BPP(SGRBG12_1X12, 2),
+	PIXMAP_MBUS_BPP(SRGGB12_1X12, 2),
+	PIXMAP_MBUS_BPP(SBGGR14_1X14, 2),
+	PIXMAP_MBUS_BPP(SGBRG14_1X14, 2),
+	PIXMAP_MBUS_BPP(SGRBG14_1X14, 2),
+	PIXMAP_MBUS_BPP(SRGGB14_1X14, 2),
 	PIXMAP_MBUS_BPP(JPEG_1X8, 1),
 };
 

-- 
2.25.1


