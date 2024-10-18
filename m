Return-Path: <linux-media+bounces-19881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D269A400B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7985B2412E
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FC3205AB6;
	Fri, 18 Oct 2024 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFuWGX4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7869C204F7D;
	Fri, 18 Oct 2024 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258524; cv=none; b=l3R2HvmZTG7vR4rZpgJnfkDrLBmqnqT2WHrv9QCZP030DaFtcXOIK3akbkvDQGeBCxkAp+9TlxJk36Gp0BjMvpEha1Ettg0xirz22rMIdfqsAKxRzru/oAD17n4N8hz1+7LLFK5aYWpYdt7sXdWUvwBcn67TRIAwmpesqbSH98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258524; c=relaxed/simple;
	bh=dbBLP3+NjouqpjK/Rm2H9o60ChL3mY538dfZoaHJnrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvIt8+JwVYidZIygq+aDywtPffmVZzdSRJu/EFjGCcyZ2OubOpXGsZHFZp8kd/2cqtZxfwXx4gU4ExRjzYMatXg/DJ+6ZJmXadQsLpM5KFz9FQK3xK+wP5OoYFUrvIVBDZD7+KTNEw61zyJUPtH2S3Zm3Uu+eA8wHEplUzSGXfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFuWGX4Y; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-431481433bdso21471575e9.3;
        Fri, 18 Oct 2024 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258521; x=1729863321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjKH7Fuin3JQQgYx9/IMe+nE5SjnwHB7Sl3pQnlj3L8=;
        b=TFuWGX4YOtLNQ8OzReQhKUPVXGCpQxzgoS+J1JNc37sSQ2ElySlmRIbWwTk+yfbKoZ
         gPIlJURW7b6WrWBU1pwOv9FbSKIl743DQHsRg+o5aITg9/SHw1rMEIGApBTRpk6GOZfn
         GgdeVc65ALz5HnK+wJdHD8zWcMAvYA6QbGObSuVFnOm2REYtsmEaHHDWu3FJ7oMDX5z/
         9dpP7Whkgrw29FBN0BPURMtv+0LZcsKE7FavuEYW+v01TR4iqgR03gvyWGbIToraQWF3
         0rD9Q2yXWPAwCyO28wA0oek6HUusL6MSI6QfsQZFKvCIkSABmFLX3zcDf9urp5ORT4fh
         VPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258521; x=1729863321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjKH7Fuin3JQQgYx9/IMe+nE5SjnwHB7Sl3pQnlj3L8=;
        b=vMCUowPuiGG4jeTP+7jL/5j/g/Trkv/TCgl9LR/PMPbWEG6fBn2Z0xSfcBW9kiFwDK
         /AglHxYexQoK/aO6sAJIoRAOD8dGMGU+/0P4gNoKSCbAy9PLYonQ84URz1p8kQzoW54/
         wrueQT3k4z4hyMyM+9Hfelv98AGJ0y88smkQmx0ipgAq9BvOuD3fO1ZxrGVOVExr/HDf
         Gc++mV+NlKqW7qxCoR6rW3Llebf0Qc4AeMWJ+DsIZIwmlx0CXk7o7qXebX+Gez91QT1I
         1tyrbK5ucrXbWtvKpW8pv5bw7k2oxKBpH6Et8tQG/LvWElp6MdT0U7c+qJFYHKYhRjIH
         N+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVdBiEipmDOLdFI0nqP4abap4EuNpee4pIYjhRhHPUjtonudZcjui1s5N3y7sDDUbxsJ2iVsA34HKq9j+M=@vger.kernel.org, AJvYcCWjH2heSyG4u/7pyPwU1+vmvSsvgKHJL0dI5IjcHseh3pUSEp+lvrx9zVk52srscnmNxYMywPSU7TxvANUQgm6vo9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKNgoKS96TMuWmr37SANr/bOwJ2Zl6jRD03IsY+ZnZ3u0iZsEP
	izmRZkK6r2ONmRYGyMyeUiU3Fr4E1JvnRufkhwlDMQQMyyRQRzAL
X-Google-Smtp-Source: AGHT+IE/8ta528YuHeu5X79u5PL/Z7iTJ9aCJFTiAlRITMb9G+RqR04lRLi+YlHxf14zlEIDD4ms5A==
X-Received: by 2002:adf:ee0f:0:b0:37c:c5fc:89f4 with SMTP id ffacd0b85a97d-37eb489803bmr2066665f8f.51.1729258520536;
        Fri, 18 Oct 2024 06:35:20 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 20/23] media: rzg2l-cru: Refactor ICnDMR register configuration
Date: Fri, 18 Oct 2024 14:34:43 +0100
Message-ID: <20241018133446.223516-21-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the ICnDMR register configuration in
`rzg2l_cru_initialize_image_conv()` by adding a new member `icndmr` in the
`rzg2l_cru_ip_format` structure.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h |  4 ++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c  |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c   | 12 ++++--------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 327516272e53..c40754732576 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -31,6 +31,8 @@
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
 #define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
+#define ICnDMR_YCMODE_UYVY		(1 << 4)
+
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
 	RZG2L_CRU_IP_SOURCE,
@@ -67,12 +69,14 @@ struct rzg2l_cru_ip {
  * @code: Media bus code
  * @datatype: MIPI CSI2 data type
  * @format: 4CC format identifier (V4L2_PIX_FMT_*)
+ * @icndmr: ICnDMR register value
  * @bpp: bytes per pixel
  */
 struct rzg2l_cru_ip_format {
 	u32 code;
 	u32 datatype;
 	u32 format;
+	u32 icndmr;
 	u8 bpp;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 07859c89be77..ad470de440ad 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -16,6 +16,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
 		.format = V4L2_PIX_FMT_UYVY,
 		.bpp = 2,
+		.icndmr = ICnDMR_YCMODE_UYVY,
 	},
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index df6114cbe5c7..a686a5cd4f59 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -88,7 +88,6 @@
 
 /* CRU Data Output Mode Register */
 #define ICnDMR				0x26c
-#define ICnDMR_YCMODE_UYVY		(1 << 4)
 
 #define RZG2L_TIMEOUT_MS		100
 #define RZG2L_RETRIES			10
@@ -279,18 +278,15 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   u8 csi_vc)
 {
 	const struct v4l2_format_info *src_finfo, *dst_finfo;
+	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
-	u32 icndmr;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
 	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
-	switch (cru->format.pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-		icndmr = ICnDMR_YCMODE_UYVY;
-		break;
-	default:
+	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
+	if (!cru_video_fmt) {
 		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
 			cru->format.pixelformat);
 		return -EINVAL;
@@ -308,7 +304,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
 
 	/* Set output data format */
-	rzg2l_cru_write(cru, ICnDMR, icndmr);
+	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
 
 	return 0;
 }
-- 
2.43.0


