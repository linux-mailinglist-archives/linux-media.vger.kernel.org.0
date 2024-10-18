Return-Path: <linux-media+bounces-19874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD059A3FF4
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7705EB21F30
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66478204013;
	Fri, 18 Oct 2024 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9vYIQtB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF08C20370D;
	Fri, 18 Oct 2024 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258514; cv=none; b=aMwF25kkMi8S3NltfMP58RGs/PCvN93cZq9E8vEgxu3k6LXOTjb4sov2+r/siWIpnk+WWK0Q0ynUwtX8Gz7vuUSlo5J5bfOTRojyuWdwOx7z2FLSaThQcKflBDiRkP5NqcmuOElMG5h/Dz9hy+CFe7bFXE96fHKUSAjtqz+wOOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258514; c=relaxed/simple;
	bh=CDD08ujuKX9CULa5McYzbHMVjexSF2pbzyKN2Eu45Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsYNEfecPtcUcrffn2OkDnVmnFTmnZ9RJVkP7vuE1Xbj85BeJ8B+shKbkJnNJXsNEAKjV5VREo/NS5rTrlXe2C6HxHstjrkccRKW/p2KzcG/+xCHJxpN/Vp/92LeaQuFdhj+TlBAqhIsIxAHJNuikNnA/I+bOkUURJa2ksa9Cp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9vYIQtB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43159c9f617so17783895e9.2;
        Fri, 18 Oct 2024 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258511; x=1729863311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trsgOkHMBaD2DU4Cng+2eCbnxFBSbjCokXCeMUaoZyk=;
        b=N9vYIQtBBb1lE437g0YX6uFL3WUrJ2dtpJtQEMDlvfWxgFZdngP6wuAS/ltaBxqWU6
         0UvP/lCIthGEoaGk5Ys2r5PwLgW8uiweRwbASJ6t43nyxZQc42PxvCbcaRL0L4gakcMo
         UXLwhPAUKi8qSkPxNlge4ciQU+fUz0K5UiQUk+huemD0A6nJOYN3rcTtqTpNErNq00x8
         wPn4V+W9l3d7Hy0Y/PlgPrFRziS6ndRAi+sG4+ytvEVlMv37t8wcxIIJdHhp88vAM2IS
         Hymiy/HEfqlL+4EPjOOJOooQ/ItiqVPLnixkI124w4OJFawPMaOqL2aXmqaAbeqKSJXd
         zcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258511; x=1729863311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trsgOkHMBaD2DU4Cng+2eCbnxFBSbjCokXCeMUaoZyk=;
        b=rq0z2IHyWKzIJWxPEcrjV8p3E1iq4yRSnIzLlmO6tDMMf6Kvg6rsQN/VOLAdkTPD9k
         fOgnrD2fLZKk7JpUCKz7JpTMToFOK9FKVj+JlQotT1NDZnVFepKN8MAVuwT7zgQvt/0g
         XEaciUv3LQNFNUmP9Lquglxv5rXQUDyAoXbc9DZ36pZgJ5pwqZo909SKb0pILy69JpUz
         tohVUhEmJOPvNXb+FXz3xBuB3KY8MqtJ/8XXaFpNwnbms2Rj8WXmwhwmZLyTse0OBpou
         PYnxyw2CYvh5Jd3xxJzEuehxyKHX0NKlWc9wvZf9XSfBw/itzUBYKbyAHfx2rmkp5KH3
         O1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU3yCv98YW79bGkm55xwY+6yvgRseFVlPyqtAAISozpRkcKiEmt2tZWIbTWZgWeuIWiyXdSieQzIjaI8PE=@vger.kernel.org, AJvYcCV+HG7AwMYa9q3DI0K89dBWThtj7lThlssa+rUlXTTAA8a+I/bkUX1A9q5tTFsjikXIwiQtdixJpfVHlMng9WVpg/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiV3xOL1/CVL/x/DgGbOi6Obvd8PvlTDt60vKwhIAY9KSdGQUZ
	qTE26mOVfKi+623Qp1JRdbE1cyAOQOgrdByevneE4LJ+nFW9Fpqt
X-Google-Smtp-Source: AGHT+IFGEkUsM7YOlEV0+1ew1xlNnTv8lx7ph5Fn2RUW+0lYvdZlVXVDDXxEP/thwC6zWqrq7vi48w==
X-Received: by 2002:a05:600c:3b89:b0:431:5d4f:73b9 with SMTP id 5b1f17b1804b1-43161689882mr18609445e9.26.1729258510721;
        Fri, 18 Oct 2024 06:35:10 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:10 -0700 (PDT)
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
Subject: [PATCH v6 13/23] media: rzg2l-cru: Simplify handling of supported formats
Date: Fri, 18 Oct 2024 14:34:36 +0100
Message-ID: <20241018133446.223516-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Refactor the handling of supported formats in the RZ/G2L CRU driver by
adding `pixelformat` and `bpp` members to the `rzg2l_cru_ip_format`
structure.

New helper functions, `rzg2l_cru_ip_format_to_fmt()` and
`rzg2l_cru_ip_index_to_fmt()`, are added to retrieve format information
based on 4CC format and index, respectively. These helpers allow the
removal of the now redundant `rzg2l_cru_format_from_pixel()` function.

The new helpers are used in `rzg2l_cru_format_bytesperline()`,
`rzg2l_cru_format_align()`, and `rzg2l_cru_enum_fmt_vid_cap()`,
streamlining the handling of supported formats and improving code
maintainability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  6 ++++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 22 +++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 33 +++++--------------
 3 files changed, 37 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 9b1ba015df3b..327516272e53 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -66,10 +66,14 @@ struct rzg2l_cru_ip {
  * struct rzg2l_cru_ip_format - CRU IP format
  * @code: Media bus code
  * @datatype: MIPI CSI2 data type
+ * @format: 4CC format identifier (V4L2_PIX_FMT_*)
+ * @bpp: bytes per pixel
  */
 struct rzg2l_cru_ip_format {
 	u32 code;
 	u32 datatype;
+	u32 format;
+	u8 bpp;
 };
 
 /**
@@ -161,5 +165,7 @@ void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 8f9683bf31fa..a40b0184b955 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -14,6 +14,8 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 	{
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.format = V4L2_PIX_FMT_UYVY,
+		.bpp = 2,
 	},
 };
 
@@ -28,6 +30,26 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
 	return NULL;
 }
 
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
+		if (rzg2l_cru_ip_formats[i].format == format)
+			return &rzg2l_cru_ip_formats[i];
+	}
+
+	return NULL;
+}
+
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
+{
+	if (index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
+		return NULL;
+
+	return &rzg2l_cru_ip_formats[index];
+}
+
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_subdev_state *state;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 6a4f0455dc9c..a0fa4542ac43 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -812,37 +812,19 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
  * V4L2 stuff
  */
 
-static const struct v4l2_format_info rzg2l_cru_formats[] = {
-	{
-		.format = V4L2_PIX_FMT_UYVY,
-		.bpp[0] = 2,
-	},
-};
-
-const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_formats); i++)
-		if (rzg2l_cru_formats[i].format == format)
-			return rzg2l_cru_formats + i;
-
-	return NULL;
-}
-
 static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
 {
-	const struct v4l2_format_info *fmt;
+	const struct rzg2l_cru_ip_format *fmt;
 
-	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
+	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
 
-	return pix->width * fmt->bpp[0];
+	return pix->width * fmt->bpp;
 }
 
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
-	if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
+	if (!rzg2l_cru_ip_format_to_fmt(pix->pixelformat))
 		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
 
 	switch (pix->field) {
@@ -934,10 +916,13 @@ static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
 static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(rzg2l_cru_formats))
+	const struct rzg2l_cru_ip_format *fmt;
+
+	fmt = rzg2l_cru_ip_index_to_fmt(f->index);
+	if (!fmt)
 		return -EINVAL;
 
-	f->pixelformat = rzg2l_cru_formats[f->index].format;
+	f->pixelformat = fmt->format;
 
 	return 0;
 }
-- 
2.43.0


