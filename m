Return-Path: <linux-media+bounces-19184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840D9936C5
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BFB61C214EB
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D99C1DF99D;
	Mon,  7 Oct 2024 18:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCA38Pfd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9041DF75E;
	Mon,  7 Oct 2024 18:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326952; cv=none; b=PNIs37Ow15/Cjn/azd/SoKX+mNMFGh5MPqpfdETUmQdfUzbpMSqCe0T1VjJqiFkRnAyAFg+64rWBLpx63qf4ma5LZBqqvJBxQsFzkYK2hIvJNmvhjDynk2f/TDhBwNCshbUvptxuj5cZuTewjY1jCigax1Ev+YKZCWkX7tu5VLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326952; c=relaxed/simple;
	bh=UCtXhtxZnFZgL0KF/t8ylnPBGBCvzRGghwPcP1nq4fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=es3NQjWLcLOBeOIpTSeOiOykWKdVbVbsEKl0Iv4xlWpYNpqCLfQSlpYPBeXl8EImJOKiSNWvQaeu5gLVOsoB8oGmi4tz0crlYZuOSe6cyBtwvQ7ajP7TnOzuFIBU6qcgBLoqb0xJ78T4j6IXwCYYDpyA0CVE/U/7/q3R9no7nPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCA38Pfd; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398b589032so7192122e87.1;
        Mon, 07 Oct 2024 11:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326949; x=1728931749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pnIGr9nmegsqFC6vGr76Zr9hZKIgM5DeB1/VBVOkKg=;
        b=WCA38Pfdgrtb9NBmpN3Cdy7pxY6QS4hYh9yyf2cgA6i2oi6RI5GjlL4A/n8BNMdN4C
         CFAEoftPDXx6zfV/RG/fM/rkJ0yylM2RSk4DX8AYP1Am3jtAuZpAVLGUPiPCIse7MnpZ
         0KFI2Kic4kGva2A/1q1i5cHKiFnsGvvqw14hTDTUbAvEckVdPMNZvdYeXMGj5FRGQ352
         gr2XzGcgDJNOd9bcFqcwUby2dqAAY1qx7X3YzPmuoTVNIOnuUGlH5YPTNAs5f9yq1sMA
         WMzNyKL0fbV7En2R1Ji+zNDw2PMqbXae9K6OKOxGhNgxTcnU7vK0/HBsCK2qJYxTQjog
         p0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326949; x=1728931749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pnIGr9nmegsqFC6vGr76Zr9hZKIgM5DeB1/VBVOkKg=;
        b=PJQFlN27Yn1NgVxfsj4lFC94CfH0s32iUQgpZCIQGEJMrnFh86IJbytYq7AOTxK5+S
         9qNfoTaDZtGcXkb6am+yfLPWw2SnsPkUgV5Ne4oCogQLeF9UkQwuynnM3TwkeXx/yzes
         WOohQdIOQlE+E8zfG/qQ9aR7W6OeMmx0rwbcIp0Z4KQru15jHRt+YsYtF09S14hpozkL
         E4rFEqbu04cSyEtrbyzdQ1EwgggXrPcs1Ux+BHAm75BLvovTSOuCT6NBLNlTlQ4JPDBi
         nd3c/T4FW/cNpOWZnysrf2jeZ3Nn2gSBJD10I2z+UPbKXc2gDujLu1GSkdUtM0eqTWIo
         EDvA==
X-Forwarded-Encrypted: i=1; AJvYcCUHbvmVmgoIiIPn8ii1uHg1N3cBeIy/z5dwYL/og9tsqIWAaymfvJXwlkrBSWlU3qk7pkc91lu8P0vrlz35PylPkgw=@vger.kernel.org, AJvYcCVX6QidpjxhZpnpKt+Nvn+F5lEvLSPoOARtXv60s5PtMDnkDEOCGpa+/ZCp7TB/wsDx+k5kfuHBm8Ht+1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qT/bOtUgQ1W3qZOe5ZS5W+2wIzg7K5prozHd64yHEmFjdZCh
	v+tpaortGcgodWNnumwIih35pdP0oCWkBI9hn2vVRSSCfxTPHui6
X-Google-Smtp-Source: AGHT+IELseBLIfVUHbLcfppXKA5SkBcSBcq0dcWI84Zzl8pNSbwpeG9QwoVP5fafPGjMZYeAxJd4Ow==
X-Received: by 2002:a05:6512:b07:b0:536:a7a4:c3d4 with SMTP id 2adb3069b0e04-539ab9cf1a9mr8877329e87.39.1728326949006;
        Mon, 07 Oct 2024 11:49:09 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:49:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 15/17] media: rzg2l-cru: Refactor ICnDMR register configuration
Date: Mon,  7 Oct 2024 19:48:37 +0100
Message-ID: <20241007184839.190519-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 39296a59b3da..51206373b7fe 100644
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
@@ -68,12 +70,14 @@ struct rzg2l_cru_ip {
  * @format: 4CC format identifier (V4L2_PIX_FMT_*)
  * @datatype: MIPI CSI2 data type
  * @bpp: bytes per pixel
+ * @icndmr: ICnDMR register value
  */
 struct rzg2l_cru_ip_format {
 	u32 code;
 	u32 format;
 	u32 datatype;
 	u8 bpp;
+	u32 icndmr;
 };
 
 /**
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index fc9fbac72762..383f4b30e2ee 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -17,6 +17,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.format = V4L2_PIX_FMT_UYVY,
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
 		.bpp = 2,
+		.icndmr = ICnDMR_YCMODE_UYVY,
 	},
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 385b4242db2f..a96590178cb9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -88,7 +88,6 @@
 
 /* CRU Data Output Mode Register */
 #define ICnDMR				0x26c
-#define ICnDMR_YCMODE_UYVY		(1 << 4)
 
 #define RZG2L_TIMEOUT_MS		100
 #define RZG2L_RETRIES			10
@@ -278,8 +277,8 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   u8 csi_vc)
 {
 	const struct v4l2_format_info *src_finfo, *dst_finfo;
+	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
-	u32 icndmr;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
 	rzg2l_cru_csi2_setup(cru, csi_vc, cru_ip_fmt->datatype);
@@ -288,11 +287,8 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	dst_finfo = v4l2_format_info(cru->format.pixelformat);
 
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
@@ -307,7 +303,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
 
 	/* Set output data format */
-	rzg2l_cru_write(cru, ICnDMR, icndmr);
+	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
 
 	return 0;
 }
-- 
2.43.0


