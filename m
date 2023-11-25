Return-Path: <linux-media+bounces-1029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C54767F8D1B
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 19:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D1D42812DE
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 18:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1172E418;
	Sat, 25 Nov 2023 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="yC6lZiSk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630DB18C;
	Sat, 25 Nov 2023 10:25:39 -0800 (PST)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AP1kUfn029211;
	Sat, 25 Nov 2023 19:25:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=A8F7B7cE8kCF1aRSP01KDKaAlSolwScYTQsjr31vGjs=; b=yC
	6lZiSkddfTveFmKSYHrlQw7zfKow7CKBO36ok5bZTu6rdhqwrm4mFK0vRpZnes2x
	vL7/+Y+OlnI7CNVZr0XSkByhUobDrP/6m6oez8VDUj2vDSdx51o4MIVxl6vhUekb
	bvVLCQibHrrVDCmH1EtYXdtGCawp8P6EtM9r8HWAxXr0AhSRL2vbu0TFHC3smJ5N
	sqisCgkpVJKlzlS3ZOSt4/HLGt3PonogzPT69IPm7nJbgMA/tykgaZZWHvw2AMZI
	SNJTIDmLxPYaYLlD6a2d4TUOCXjeCYLKEt9rZuiYTQD+acyeLMYnnjzkRBrlumKr
	fnNHapQi2DpbE/9YrkCw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uhr8amwm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Nov 2023 19:25:31 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 10F4910002A;
	Sat, 25 Nov 2023 19:25:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0536523C6B9;
	Sat, 25 Nov 2023 19:25:30 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 25 Nov
 2023 19:25:30 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 7/7] media: i2c: st-mipid02: add Y8 format support
Date: Sat, 25 Nov 2023 19:20:55 +0100
Message-ID: <20231125182057.1379357-8-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231125182057.1379357-1-alain.volmat@foss.st.com>
References: <20231125182057.1379357-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-25_18,2023-11-22_01,2023-05-22_02

Add support of MEDIA_BUS_FMT_Y8_1X8.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/st-mipid02.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index ef0d7f8ba17d..366e840c8858 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -70,7 +70,7 @@ static const u32 mipid02_supported_fmt_codes[] = {
 	MEDIA_BUS_FMT_RGB565_2X8_LE, MEDIA_BUS_FMT_RGB565_2X8_BE,
 	MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_YVYU8_2X8,
 	MEDIA_BUS_FMT_UYVY8_2X8, MEDIA_BUS_FMT_VYUY8_2X8,
-	MEDIA_BUS_FMT_JPEG_1X8
+	MEDIA_BUS_FMT_Y8_1X8, MEDIA_BUS_FMT_JPEG_1X8
 };
 
 /* regulator supplies */
@@ -121,6 +121,7 @@ static int bpp_from_code(__u32 code)
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
 		return 8;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
@@ -158,6 +159,7 @@ static u8 data_type_from_code(__u32 code)
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
 		return MIPI_CSI2_DT_RAW8;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
-- 
2.25.1


