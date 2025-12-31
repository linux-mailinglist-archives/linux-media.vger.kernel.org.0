Return-Path: <linux-media+bounces-49776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF15CCEB4B5
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 06:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F155D302034F
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 05:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD2830FC30;
	Wed, 31 Dec 2025 05:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrkrtWxf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D02264D5
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 05:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767158677; cv=none; b=KVVNRFHq0cem2PLrn0yPnKGvJErLnj4wkJcer4uGq1cUC2waDNjuEpFitLsQfjdCUYkjH++y2dum4VuAB2YZ3PF+iX6fjXRFNfMqae6WWyjWFF05IlAP1Sd23UNss9sCHqcqER/aTmxo4xF5NnUMpG0U6zbzZwovjq6MVRS4Czc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767158677; c=relaxed/simple;
	bh=c9ubX7ai/qwqA+ba+ASKq+KnXFMC1M1ULeLSCnqQ5vA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJPz0A+4OLnv+0HsJ4M6lisEo5MHejDQBkyzFPZg0aoFMXlekYrpf9KOc6UgeeuZcCjpYNrRV2DRmuefR2mBF8d2ZLnEOTS8Rjb0IxwLtxYOH6pvjPbn5CndvVIEHNemmGAO1Ju+MROHRyf3ltVEhx7pP1lJG4luBpdq1CAk8Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrkrtWxf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so12516496b3a.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 21:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767158675; x=1767763475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZBUgEksAy0wDWZsDFUpREOsS5QTTJSKv9aUl7dZr6M=;
        b=lrkrtWxfA3AoN3kEc/bvBEUnhm6g+Rm98Y+uP/7KjU4cTESGxgjFf1j1MtVVugBE5e
         S//2pRjO7z6MDkKjL7uchwu3GoGpMZCZeh8lgYVxs0+z78WxG55vg7Us5V0K3hifF22y
         KGriUWqfMWGlEy2RSIVpYjoRRsXdauo+12PAcMY12Vlau+Lt9yAYar7FpwfnYXfP7CIN
         JAD5BRw3+T4ay42lOHxaT72Cs6T4J5GDWCK/FGcBxPuvsKZytfsR6hfzEUzS/dQxUx9k
         cRJad6QFzsRAcZEoM/zE0gLQYsaBXWJ21HIgtSMjNUlAAkvCAluUjsoIVsYSkLr65WzV
         tuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767158675; x=1767763475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZBUgEksAy0wDWZsDFUpREOsS5QTTJSKv9aUl7dZr6M=;
        b=mNEP3wwP887/ZAVXSLDsHcCyKFRW7cRCx7YaJayMR7438+r76EwziWT3BqI9BzDnPS
         bjLcK14cN0lVuR8adJZm2GB5DAxgLjqDvm57p4hPJPQaP6yf8ayblwFFJgeUPpc/GnXB
         e5QV41Pc82Q5fOoGv1hxtge5jF36zdY4n02O0UOcc+lJZf6KUV9dvUtepbq07bFM7GUK
         WyuYNhfAJfW8z1BptCD6pMWhUczYJH74L7OguBJkzjGIegWBb+WHWfC8MBNaD4FGhY5L
         dRKmnCfu0N78ln8nquU3A5mlz+OtpnkV7A0JJ5Pc7TX0Pec0tr7civHldO3lp/6r124L
         Eozw==
X-Forwarded-Encrypted: i=1; AJvYcCVMcBmKUGI2fA56k0AD1Ov9Fqiyk5nl5HwC/DI3M7ybKZTInXa6t8SiQZ6Jtt88qBnfUO/aNpsIK4yCTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHe9CvgOXTkq9Zw0eVqK9NJ3tvAOj06oQVZ2Sf2GN9SESVtlQo
	GMyiSnh3hXnR1YUux8igpCYMwOECW9fme93pV1GINFcDT6cR0TlECqr0
X-Gm-Gg: AY/fxX6go9azmXypiu0FEzHTumWl615+p0qGSIZEUiw9IClnTkqJ5vRyqOo+6Z9UE6d
	/hygh4f3x9+5OoGBjzhLFWLEI/tnvBRofrn6GojbDoD53XM0euZ+SMIGz/evj8WpmZJdAv8a2nA
	FnTqExf50Y/IFZDgamB37jw2qkOqK9MfZhfRG+bVD/POSsErG9ASk5u7na0oX4YFF+UsWuLrTd1
	DEgWEej37hg6tt3neghcFXzWh1v6ImDzuDX9P2zDgM5o5F6NviXlgY5WxcTM3XgSsXK5zOx8WdI
	G49CHmjAeKOL4lsqjfFO5BDNWQLdCn3AzcP0qf0i6bkWz4S039FPwUNMvN/4R0jsqvc7cHjX6re
	zMfJ7WvDaZc0tizOWSaMJRF7YwirUbVcmZ+yaDyz3MRkN+e20dw+yXzFumlI40IJtkXsMx1Yw1K
	RDuaZsfdSoEEI=
X-Google-Smtp-Source: AGHT+IGyO1jeZ+2WgT5h8ytwtHL7NzTQKQbBl4WgLNbmRrgy9RVIz52E4M5tultTxpJqkmy8KLDOPA==
X-Received: by 2002:aa7:930b:0:b0:7ad:564:bf92 with SMTP id d2e1a72fcca58-7ff657a64f5mr33762165b3a.27.1767158675270;
        Tue, 30 Dec 2025 21:24:35 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423b9asm34388142b3a.28.2025.12.30.21.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 21:24:34 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] media: atomisp: remove private white balance IOCTLs
Date: Wed, 31 Dec 2025 10:54:27 +0530
Message-ID: <20251231052427.58840-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch resolves a MUST-FIX graduation blocker identified in the
atomisp TODO by removing the private ATOMISP_IOC_G_ISP_WHITE_BALANCE
and ATOMISP_IOC_S_ISP_WHITE_BALANCE and replacing them with standard
V4L2 control handling.

The private IOCTLs were used to set white balance parameters. This
functionality is now mapped to the standard V4L2 controls
V4L2_CID_RED_BALANCE and V4L2_CID_BLUE_BALANCE.

A helper function `atomisp_v4l2_set_wb` is introduced to translate the
V4L2 control values to the driver's internal configuration format.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  5 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 49 ++++++++++++++++---
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 3c8fa3f58..fcf116cc4 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -741,10 +741,7 @@ enum atomisp_burst_capture_options {
 	_IOW('v', BASE_VIDIOC_PRIVATE + 15, struct atomisp_ctc_table)
 
 /* white balance Correction */
-#define ATOMISP_IOC_G_ISP_WHITE_BALANCE \
-	_IOR('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
-#define ATOMISP_IOC_S_ISP_WHITE_BALANCE \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
+
 
 /* fpn table loading */
 #define ATOMISP_IOC_S_ISP_FPN_TABLE \
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f221..5c0a1d92b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1083,6 +1083,38 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
  * applications initialize the id and value fields of a struct v4l2_control
  * and call this ioctl.
  */
+static int atomisp_v4l2_set_wb(struct atomisp_sub_device *asd, int id,
+			       int value)
+{
+	struct atomisp_device *isp = asd->isp;
+	struct atomisp_wb_config config;
+	int ret;
+
+	if (atomisp_css_get_wb_config(asd, &config)) {
+		dev_err(isp->dev, "%s: can't get wb config\n", __func__);
+		return -EINVAL;
+	}
+
+	switch (id) {
+	case V4L2_CID_BLUE_BALANCE:
+		config.b = value << (16 - 8 - config.integer_bits + 1);
+		break;
+	case V4L2_CID_RED_BALANCE:
+		config.r = value << (16 - 8 - config.integer_bits + 1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = atomisp_white_balance_param(asd, 1, &config);
+	if (ret) {
+		dev_err(isp->dev, "%s: set wb config failed\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int atomisp_s_ctrl(struct file *file, void *fh,
 			  struct v4l2_control *control)
 {
@@ -1122,6 +1154,17 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	case V4L2_CID_ATOMISP_LOW_LIGHT:
 		ret = atomisp_low_light(asd, 1, &control->value);
 		break;
+	case V4L2_CID_AUTO_WHITE_BALANCE:
+		/*
+		 * TODO: Auto White Balance is not supported yet.
+		 * It is currently handled by the ISP.
+		 */
+		ret = 0;
+		break;
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = atomisp_v4l2_set_wb(asd, control->id, control->value);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -1484,13 +1527,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_ctc(asd, 1, arg);
 		break;
 
-	case ATOMISP_IOC_G_ISP_WHITE_BALANCE:
-		err = atomisp_white_balance_param(asd, 0, arg);
-		break;
 
-	case ATOMISP_IOC_S_ISP_WHITE_BALANCE:
-		err = atomisp_white_balance_param(asd, 1, arg);
-		break;
 
 	case ATOMISP_IOC_G_3A_CONFIG:
 		err = atomisp_3a_config_param(asd, 0, arg);
-- 
2.43.0


