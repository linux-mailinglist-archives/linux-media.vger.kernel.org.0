Return-Path: <linux-media+bounces-19238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E5B9947AE
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D80681C24B5A
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BCE1DED4D;
	Tue,  8 Oct 2024 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ppaYkq35"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790A61DE885;
	Tue,  8 Oct 2024 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388203; cv=none; b=kipxpbBclrxqLt4oMChpz2sFwt6TXtnHZ2aKpOOBjekyEltfp3fCBgaOoAeAn9ut0hH+2ggTRbowv0qaBd1fSmAJPy6blfGW/oEEvaDdyGx3p+oSJOOhU/cDMuTb7fkoGSbRx4iYmH8j1fWLvlDrExvMbBk7jlFXCQSK0XfUFzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388203; c=relaxed/simple;
	bh=pZcmBcG9FLKU1llHOrmXLZfBhX2yPux5vJpR9zTp4E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HdVAMWUYOPPwptk6NSrLcimh9CvUSXixNxLQ9OwKRP2h60IJZbz0aCkAuUDu7kWSJzORiQIU2yCPUTt7Wzb9th55ygnRWxrAM2LmZExbVbpl2zWj5/MOl8T/e3MPeIFRvndAv5VexO6DIhV4NThjJkVuPi222NNsJPOYrWJN1v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ppaYkq35; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989AUt9017178;
	Tue, 8 Oct 2024 13:49:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Mnz/aGX3LHgwwUDqxrcB+OMCoex8kw2JOndT63O5sNk=; b=ppaYkq35pSVCCZOO
	ZX70CPTh+ekXk0cfAtiS5mxvyIsA8GOFSiYribiB+H1/5o7UGh+RuFfleUFljQ1h
	Q0BfGYJ5rgXjEV0NYRZocHzrrM2UneS3Xd0ZjH6ntuUas79awc5VeCIXADx7ne7m
	vzJd90ROddaj66ba72bMexPLeEtzauPkpug3Tf7FHH3vK4r+DYAiaHPCqCR6CAhu
	l7ZUH5qyFGyWnAiZ2GSD5MjEyFMGPnUmsGb83Gr1u2lYXuHnr4ucoCz9xfH3z6UR
	3gAUQMezlzvf/wqtl77AKxGbYJGm/3EErneUBoGWFasEOF+b8PuXooeiWYQtRpBE
	PHphbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv7658w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:49:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A7D734004F;
	Tue,  8 Oct 2024 13:49:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEED52649E9;
	Tue,  8 Oct 2024 13:46:37 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:46:37 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:46:08 +0200
Subject: [PATCH 4/4] media: i2c: st-mipid02: remove parallel mbus format on
 sink pad
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-st-mipid02-streams-v1-4-775c2d25cef9@foss.st.com>
References: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
In-Reply-To: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Alain
 Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

2X.. mbus formats are related to parallel interface and
as such should not be acceptable on the sink pad of the bridge.
Only keep their csi counterpart in 1X..

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/st-mipid02.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 635b8a433d63..f08db3cfe076 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -68,9 +68,6 @@ static const u32 mipid02_supported_fmt_codes[] = {
 	MEDIA_BUS_FMT_YUYV8_1X16, MEDIA_BUS_FMT_YVYU8_1X16,
 	MEDIA_BUS_FMT_UYVY8_1X16, MEDIA_BUS_FMT_VYUY8_1X16,
 	MEDIA_BUS_FMT_RGB565_1X16, MEDIA_BUS_FMT_BGR888_1X24,
-	MEDIA_BUS_FMT_RGB565_2X8_LE, MEDIA_BUS_FMT_RGB565_2X8_BE,
-	MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_YVYU8_2X8,
-	MEDIA_BUS_FMT_UYVY8_2X8, MEDIA_BUS_FMT_VYUY8_2X8,
 	MEDIA_BUS_FMT_Y8_1X8, MEDIA_BUS_FMT_JPEG_1X8
 };
 
@@ -140,12 +137,6 @@ static int bpp_from_code(__u32 code)
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_VYUY8_1X16:
 	case MEDIA_BUS_FMT_RGB565_1X16:
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_YVYU8_2X8:
-	case MEDIA_BUS_FMT_UYVY8_2X8:
-	case MEDIA_BUS_FMT_VYUY8_2X8:
-	case MEDIA_BUS_FMT_RGB565_2X8_LE:
-	case MEDIA_BUS_FMT_RGB565_2X8_BE:
 		return 16;
 	case MEDIA_BUS_FMT_BGR888_1X24:
 		return 24;
@@ -177,16 +168,10 @@ static u8 data_type_from_code(__u32 code)
 	case MEDIA_BUS_FMT_YVYU8_1X16:
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_VYUY8_1X16:
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_YVYU8_2X8:
-	case MEDIA_BUS_FMT_UYVY8_2X8:
-	case MEDIA_BUS_FMT_VYUY8_2X8:
 		return MIPI_CSI2_DT_YUV422_8B;
 	case MEDIA_BUS_FMT_BGR888_1X24:
 		return MIPI_CSI2_DT_RGB888;
 	case MEDIA_BUS_FMT_RGB565_1X16:
-	case MEDIA_BUS_FMT_RGB565_2X8_LE:
-	case MEDIA_BUS_FMT_RGB565_2X8_BE:
 		return MIPI_CSI2_DT_RGB565;
 	default:
 		return 0;

-- 
2.25.1


