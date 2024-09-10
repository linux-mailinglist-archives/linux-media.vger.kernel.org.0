Return-Path: <linux-media+bounces-18133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DC397415F
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D48E287448
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494981AE039;
	Tue, 10 Sep 2024 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eopbo3p4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038621AC893;
	Tue, 10 Sep 2024 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990879; cv=none; b=hsxaVCAggg1seI5seuKmP5+bi4Rp+/q481bIQQg8zVOoBJ+7jKo+TVGY6aYSJCwIerIBX/hPAms6IkbJNIxWmMvkUq/qG0ryEOojRtEhcRBssxtvtUyvskOaIiY/sUpvhoCQp+sADIWsMk23v2MQd5iuRFFaRnhIaq5YO0f78U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990879; c=relaxed/simple;
	bh=92PJWxvu4hdjFtUY0RAGxCc3sRYdFrmtVdbPoU8oJtM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vA37ENe03ltF6CpKV9yYP9iDI+2U4QAdiomV0ub/jSFojDl1oO6QmcyeS9r5yeWROKRtJfjdCXa5H1bwtO4nD7jVF5U8dljuGw/lwM9PfkE2Y8EY9s8Gb8qrv26tK6iQIzMcLPztLHFosqrLEeJ4BNheOkde0UA/Tcn6S3PaWQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eopbo3p4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428e0d18666so53816565e9.3;
        Tue, 10 Sep 2024 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990876; x=1726595676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1FDqmmVAFWYeiOLy22eo1C5cXTJQk9ZLPSgkByFFAc=;
        b=eopbo3p4JiW5YPJ18/8W1fg3EyZ0I6YyC0bMThbfyRF5TmaKs/dzHSSrPb1k22cxRN
         e5ACf5XsQMzXw02I158b1mJygt/uhgCcfyPTwHRZb1KXvGuwHY1kx+PkYy3CBmhFhSvp
         xx6WUnTOFjkNWZDyf82K3dY6RevPs2zbrCjOgrfP7MOWIBCHZqPW4ERdwg+Qm4wBxT2g
         FEc1wWXiHVTjLSi/RD4FbZUVNifl6YA1Q+98uxcpaubqB5V2sObOql/bwONC5aNcRKfQ
         9UwQuAqTEOeM9sIGAVyEOByonejhZEEFuDrLQrtrTHo1yPTOLXB9pnKIm1go2211YYHQ
         uDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990876; x=1726595676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1FDqmmVAFWYeiOLy22eo1C5cXTJQk9ZLPSgkByFFAc=;
        b=DitBKge3niuZgK7tPx5c8ch4AcJmioo76MFdgwcvm0CJhQd+aBW0SBJaksCiM/kExz
         dKjfcM3gnhhpCVxuYJxMFNJTU5xOzQ/ZlGFSI/pvcNabGWqt7QWVYwNtJRf4a2m534q3
         gvshyFb+A/997/LPkVM80cJ3qiAFaMcAcfKdK2cmiYiZk8YjVlHgOMep41RHOGPcQYI0
         LCUQZP6NsBQTednKmR0pyBs+QmdXGwPyI2J2N0fb/jBfuXqPnI8vkv0Zrno0vXEP25X+
         B/x8bK5F0bP7BWdsacGKIOIuLPtQaZ5DHd7tl1qMHYec+9j7rEz6XTB2q6415mgT02p0
         64pg==
X-Forwarded-Encrypted: i=1; AJvYcCUcDwBG5K5gbgNg9LWlkggkSMRuEQ/o1t7V3D3cdKkjah9VDmInv6i0/QOdFe6z0OJzSm+h2HO+Ufda3oIQRGEJBy4=@vger.kernel.org, AJvYcCVwEe598nCS9VQXN86xDnnP9OYD2/3NDKi7n1Cn62KP8f8Vy8JsS71ABCV2jvw5Acf/IFbBRjtcnKHD+Wg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzltm29G1YMaSl0TDSIN1opUHxMgfGYlpggzW0Yl6wsEV90pnfO
	Xei9oo5lwu7kI+/ARvuz6lhG3goUCsXuX0rRwkiEmMKPlorhHdAL
X-Google-Smtp-Source: AGHT+IG4gGghGT9dWoHSijVgAkIzg4LFg89Kkdbbo3FUcCGzCcjL4mIYdjgr35Z9cVqOh18FTrJj8Q==
X-Received: by 2002:a05:600c:4f82:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-42cb9c82edfmr50186025e9.4.1725990876388;
        Tue, 10 Sep 2024 10:54:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 15/16] media: renesas: rzg2l-cru: Refactor ICnDMR register configuration
Date: Tue, 10 Sep 2024 18:53:56 +0100
Message-Id: <20240910175357.229075-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
`rzg2l_cru_ip_format` structure. This change introduces a new function
`rzg2l_cru_ip_pix_fmt_to_icndmr()` to map the pixel format to its
corresponding ICnDMR value.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h |  5 +++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c  | 12 ++++++++++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c   | 10 ++++------
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 24097df14881..3da9e8e7025a 100644
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
@@ -165,5 +169,6 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format);
 int rzg2l_cru_ip_index_to_pix_fmt(u32 index);
+int rzg2l_cru_ip_pix_fmt_to_icndmr(u32 format);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index c7bc82bf3f14..9b0563198b50 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -17,6 +17,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.format = V4L2_PIX_FMT_UYVY,
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
 		.bpp = 2,
+		.icndmr = ICnDMR_YCMODE_UYVY,
 	},
 };
 
@@ -50,6 +51,17 @@ int rzg2l_cru_ip_index_to_pix_fmt(u32 index)
 	return rzg2l_cru_ip_formats[index].format;
 }
 
+int rzg2l_cru_ip_pix_fmt_to_icndmr(u32 format)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
+		if (rzg2l_cru_ip_formats[i].format == format)
+			return rzg2l_cru_ip_formats[i].icndmr;
+
+	return -EINVAL;
+}
+
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_subdev_state *state;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index c32608c557a3..1f25dcff2515 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -88,7 +88,6 @@
 
 /* CRU Data Output Mode Register */
 #define ICnDMR				0x26c
-#define ICnDMR_YCMODE_UYVY		(1 << 4)
 
 #define RZG2L_TIMEOUT_MS		100
 #define RZG2L_RETRIES			10
@@ -316,6 +315,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	const struct v4l2_format_info *src_finfo, *dst_finfo;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 	u32 icndmr;
+	int ret;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
 	if (!cru_ip_fmt)
@@ -327,15 +327,13 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	dst_finfo = v4l2_format_info(cru->format.pixelformat);
 
 	/* Output format */
-	switch (cru->format.pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-		icndmr = ICnDMR_YCMODE_UYVY;
-		break;
-	default:
+	ret = rzg2l_cru_ip_pix_fmt_to_icndmr(cru->format.pixelformat);
+	if (ret < 0) {
 		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
 			cru->format.pixelformat);
 		return -EINVAL;
 	}
+	icndmr = ret;
 
 	/* If input and output use same colorspace, do bypass mode */
 	if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo))
-- 
2.34.1


