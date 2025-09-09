Return-Path: <linux-media+bounces-42115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0AB4FE86
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61E33179FC0
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE050343D7B;
	Tue,  9 Sep 2025 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDjwuCbW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78011341655;
	Tue,  9 Sep 2025 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426393; cv=none; b=TU32aj2s1gEMr4YpuZe9Ex91DLVNrDM8CgmcethW8Z+6DKwQBMI3l4+h798fmh/QhK5IzgXxXuQS/qNmXpC+7eySpwOsw9OIvAv2fDtcwx8hASiRAJgpPpcSn55GE8DLtBr0qvIHpDlWQ6xhg9e8o6NYjfVbvzOVQGjoCIwGxFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426393; c=relaxed/simple;
	bh=Ooi38CTO9y94G7kQWU2w8H927jPS8s7RIsep5Zxzgus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wtc620269ME3udern3k2T4Azae4f8u6ytnVWr4Eo2qs6MpRHDzgll558jeURIesAXwm/ypIFoihXfFJEnuDkSRtrhRovZGc22IgmWsyxgoZ4Pp1IYWMfyDPwJ5w3b7PvBgEr8ts/IL85dwXH9P42PMvR3NKXlPXIbixQ+0ITTpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDjwuCbW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b04ba3de760so393743866b.0;
        Tue, 09 Sep 2025 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757426390; x=1758031190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePGprLaaKlvYdjB1fqLw5+HQREvzO/LGGScF1pi9CXY=;
        b=HDjwuCbWwCpY61GXyPIAugHU8caS7kuI2RSlBlraC+o08NLJ7kiU4YZsx8awdoMMeo
         g3SDbQo6JhC6Fv+5YXNglDHaB+uhzhSwL5ppv6HtA6cEyG04o8nGjrhKpAq2Amla9nH/
         Qy/G6IwZbNIJMnJic5wtHi8pgIRUk1cIBpeIux7CkJf6KwAMWm0P0BTKCESDLk3FHSlq
         9TKK4AL/UWx7UW45IAT+B8ma/zVdtLmuWqMgpC42XFFyF3OJyquhYku/QIgLBpajVT7x
         fdt0qDjRROJCefzkdf7kdghc/+Oab6U03FDVVGC5JGMyz2A3kkRIIGl6hZu/pMV3M4K0
         K/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426390; x=1758031190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePGprLaaKlvYdjB1fqLw5+HQREvzO/LGGScF1pi9CXY=;
        b=gWUp4KvUFFdAKuujMCcqzh4oAHqA6BQ6T/bCEpPWwnEFVEyAwzBMErQLrg0DxZRQb2
         SXsH89bBsGPtCRCQw8xyeTlh7ilIvjCz7lVA7YnbGZPmZd9Fk/UTP5T7mBoGykkOYdWv
         mv/ogt5qERJLOmRDSQuYGcSvafjg+TQt85lFnDMTIuwddmeyDhD23Y+Qp/zh26dTGydV
         Twz4/L7CjD8rCRTDIFt98ggyBQEB4tnkriYBe8mjmhg1gfI7x8VGo5x86YwTk2yGKdyM
         xUMjTqXYMd9Fs7Omh8R2lYso07Xm+wVW5JwqRq6807VPBgErXetALDe5DV9v9aUY11TI
         o5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlRh4z6Q52A7LFm2Sa1q789PqNy2tHaYG5md55H3lZ88ICFI1mLlO1MxXAyW+aNNX16wa4xnjchZtKvhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl6Mcg77bDBIMKOV6J3RUf9wdYfGkvOchrh+io3Y7XhsrJLVwg
	OeBNeZTPP/Exix08ZssLnLqh18FkbJga1FhlFSoLfEWXZj3Z/0nf2k0e6pp3hA==
X-Gm-Gg: ASbGncubh/ckVhdrew/co+KjX6FH+5kSRdlIBeN6XZZMEI/f7y/6nkhiECOzDfswbG1
	1LoJx7yYrbZOqJtc34HnJqYG5R6ZpWGM0JGgaUY4iIkt2EJBxa/QCVRGzxu5jUdxrNdQw1F8D2j
	C77TFDGeUS2kZOlT9sq5fe3+3UqByGyiPU15NYZw3huPDTOnEfZUR3U8NVi9J0bpLkuJa50zfjs
	ibv74xM6cr95Buia/culzOm3q0oUNLUEjN6clRYnGpBGt/6N4emwLZVFzUDE5v7oJGu3BeeqS6M
	POXjTh8plGe2JD40dCJoTUBfTNR87ThTAcsUVnpySttQI4CcfPoDD6NhrjDA9GbdMUhF6VfKViq
	oOzgN3s21FrchP55tzcMX+8vAtymApjz/zBff6vKU1P8=
X-Google-Smtp-Source: AGHT+IFd6xSrfSOMRB1k4N6UPhFDL3Utq+jDImuzRF1t5QZe5NxqNQTSpldDZv2NOSpYDZdQzqOJUw==
X-Received: by 2002:a17:907:9806:b0:b04:7123:1c85 with SMTP id a640c23a62f3a-b04b16673c6mr1133222566b.41.1757426389487;
        Tue, 09 Sep 2025 06:59:49 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b043fd772bcsm1942173966b.14.2025.09.09.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:59:49 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: alvium: cleanup media bus formats
Date: Tue,  9 Sep 2025 15:59:37 +0200
Message-ID: <20250909135938.2841635-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes MEDIA_BUS_FMT_RBG888_1X24 and MEDIA_BUS_FMT_BGR888_1X24
as of that formats are not supported by Alvium currently.
The missing and supported MEDIA_BUS_FMT_RGB565_1X16 has been added.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
changes since v1:
 - subject changed because typo

 drivers/media/i2c/alvium-csi2.c | 28 +++++++++-------------------
 drivers/media/i2c/alvium-csi2.h |  3 +--
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index c63af96d3b31..743b300fba4c 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -94,19 +94,9 @@ static const struct alvium_pixfmt alvium_csi2_fmts[] = {
 		.bay_fmt_regval = -1,
 		.is_raw = 0,
 	}, {
-		/* RBG888_1X24 */
-		.id = ALVIUM_FMT_RBG888_1X24,
-		.code = MEDIA_BUS_FMT_RBG888_1X24,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.fmt_av_bit = ALVIUM_BIT_RGB888,
-		.bay_av_bit = ALVIUM_BIT_BAY_NONE,
-		.mipi_fmt_regval = MIPI_CSI2_DT_RGB888,
-		.bay_fmt_regval = -1,
-		.is_raw = 0,
-	}, {
-		/* BGR888_1X24 */
-		.id = ALVIUM_FMT_BGR888_1X24,
-		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		/* RGB888_3X8 */
+		.id = ALVIUM_FMT_RGB888_3X8,
+		.code = MEDIA_BUS_FMT_RGB888_3X8,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.fmt_av_bit = ALVIUM_BIT_RGB888,
 		.bay_av_bit = ALVIUM_BIT_BAY_NONE,
@@ -114,15 +104,15 @@ static const struct alvium_pixfmt alvium_csi2_fmts[] = {
 		.bay_fmt_regval = -1,
 		.is_raw = 0,
 	}, {
-		/* RGB888_3X8 */
-		.id = ALVIUM_FMT_RGB888_3X8,
-		.code = MEDIA_BUS_FMT_RGB888_3X8,
+		/* RGB565_1X16 */
+		.id = ALVIUM_FMT_RGB565_1X16,
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
 		.colorspace = V4L2_COLORSPACE_SRGB,
-		.fmt_av_bit = ALVIUM_BIT_RGB888,
+		.fmt_av_bit = ALVIUM_BIT_RGB565,
 		.bay_av_bit = ALVIUM_BIT_BAY_NONE,
-		.mipi_fmt_regval = MIPI_CSI2_DT_RGB888,
+		.mipi_fmt_regval = MIPI_CSI2_DT_RGB565,
 		.bay_fmt_regval = -1,
-		.is_raw = 0,
+		.is_raw = 0,
 	}, {
 		/* Y8_1X8 */
 		.id = ALVIUM_FMT_Y8_1X8,
diff --git a/drivers/media/i2c/alvium-csi2.h b/drivers/media/i2c/alvium-csi2.h
index 978af44f76c7..0f1af5e5355c 100644
--- a/drivers/media/i2c/alvium-csi2.h
+++ b/drivers/media/i2c/alvium-csi2.h
@@ -224,9 +224,8 @@ enum alvium_mipi_fmt {
 	ALVIUM_FMT_YUYV8_2X8,
 	ALVIUM_FMT_YUYV10_1X20,
 	ALVIUM_FMT_RGB888_1X24,
-	ALVIUM_FMT_RBG888_1X24,
-	ALVIUM_FMT_BGR888_1X24,
 	ALVIUM_FMT_RGB888_3X8,
+	ALVIUM_FMT_RGB565_1X16,
 	ALVIUM_FMT_Y8_1X8,
 	ALVIUM_FMT_SGRBG8_1X8,
 	ALVIUM_FMT_SRGGB8_1X8,
-- 
2.43.0


