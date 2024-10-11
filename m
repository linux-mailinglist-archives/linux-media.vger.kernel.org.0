Return-Path: <linux-media+bounces-19468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01F99AA53
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DED1C20996
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696741E284B;
	Fri, 11 Oct 2024 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUrc4Ttn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119381D270F;
	Fri, 11 Oct 2024 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667885; cv=none; b=dPa3RpZWG/adlQghGVrqjsJykdD5yctNS3bcxbCg165kWazCUlj6YmgpQ3Ky0zBFykOxkKZuT1ALxpqE7L8zKOF70M7h0TckqK63WfIUPgU7r2+WIk9VT3qLx0/O22miI1pCybz3FlM/MKoUVZtatb8VsAusbpoDJcKHo1efJWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667885; c=relaxed/simple;
	bh=dbBLP3+NjouqpjK/Rm2H9o60ChL3mY538dfZoaHJnrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CW3g/AVqrwDAatpwolqBrwASSLCqdvudDANfxgDC/LsDWvv17sekTdyfaPOEcoNEJ8uZjwEj0yqbZW9bfTektloKKjpgs15i4z4buo9XJ4ec/SA2DRBiiRdZrKBAz8o97pdPyQ8niDcBoBQ5SsqZda/5n/YuYq7eqeOev9HStlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUrc4Ttn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4311c285bc9so11680065e9.3;
        Fri, 11 Oct 2024 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667882; x=1729272682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjKH7Fuin3JQQgYx9/IMe+nE5SjnwHB7Sl3pQnlj3L8=;
        b=HUrc4TtnK6kV579QV8AMDBNXlclMCHXauORHP05vDdi8zG7jjhvrgL3BGZfYwf6zuD
         odyNzd2aLGY3ORxwafVVqBMkof3gsbkOo6tfRDRRB8uYjS16XR4utkpMnaLK/tGpGfpe
         VEW9+ApSW27DALNNt2dRrQTTfd9mOSFRhNmuDXGoH7GYKJXm/KcHRMJQrCQfmDhcKsOV
         JCoK/T9N333u2hNG2VDGKde/SrXjHZEc14/sBP3z5NzmrV44dYiKSbnxA/RJaECNtWzU
         Cy1a0r1C979fhGXLTiNgvXYClfiTqXLlH+AzDOIceq/CrqbNWJhZtBRXZyYzSEWCyQWz
         GArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667882; x=1729272682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjKH7Fuin3JQQgYx9/IMe+nE5SjnwHB7Sl3pQnlj3L8=;
        b=YSIuV+s3Cr6cYCFCKFu52PFnwEzzzyk3YjQyMYYtyMpjvDhhAmwA0AUJCh9PsLO1z4
         lW/uixfHZXlJcL00Dd3DESc5eAhfYSfhbOvoMXqwPmdsZ/B6yUA5cINAYiMj8Q2pnq8p
         eA1gcWY2UjDpnmrNClaW5u+aN+CMlJ/CY5+qt5w+RqEzRi2AFGYfyA8YDxurVcRYJpUw
         FrZqi813jwdDKndxUHnXktyeR3UgAolK8qeZ4uDd0IqbmNWchhgFlqR6J2X3aFaGzlXq
         7uPK9J29VR+KeROCDxekv42NSr72Mdu8+xgmQWi9tNeiN1HRHOE4/zXs/n96PMO9VoSu
         sUIA==
X-Forwarded-Encrypted: i=1; AJvYcCUT9w5jkzLNMWbt4frpY6eCZt/6NE2V6jsqiYA0otAj5Og95Np8UZ0ivdCHhROUHB1POxe9lm0YnjTVp6zmUct0s2g=@vger.kernel.org, AJvYcCXZFu+W5Ftw29gHo6buqNDKdLC1U4LPKMbsKPXbS8jyYXm5c9W+2Lw2EgkNQijTNQwuwnI08snb2pg+Jug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqmijsXXJ4byiuad8aLTkzeCcbKfKIGxLVmZh5GttTaGzncw8s
	V5DLRjgekCJlX6mfE8Srq/T5kf8QffSuoZQi7uyYAQcLRF+Bgj3z
X-Google-Smtp-Source: AGHT+IHRrel2erb0LyIl5I+yVHP8vY2YRgdZ4i2AfxN3+X7iL5LyafPWdhxxkM0kvLPQHumZjeMG+A==
X-Received: by 2002:a05:600c:3588:b0:42f:5ca3:d784 with SMTP id 5b1f17b1804b1-4311ded5412mr30694385e9.14.1728667882238;
        Fri, 11 Oct 2024 10:31:22 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:21 -0700 (PDT)
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
Subject: [PATCH v5 20/22] media: rzg2l-cru: Refactor ICnDMR register configuration
Date: Fri, 11 Oct 2024 18:30:50 +0100
Message-ID: <20241011173052.1088341-21-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


