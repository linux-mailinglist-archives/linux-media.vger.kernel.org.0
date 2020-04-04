Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA2619E7EB
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 00:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDDWlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 18:41:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40688 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgDDWln (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 18:41:43 -0400
Received: by mail-pf1-f193.google.com with SMTP id c20so5558679pfi.7
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 15:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=UPJxoEsQLaSAAg+RZOwaayl8ZEAwHcYenJnUOeoyZ/cY4emK7+2kIi1FkQTzitJGsn
         BxByGnlX0sJ8p+wSCRRyeA6NjhcvTMENUTcYO1orYjI3PRBoA9aAm68PSE4z0h11ohqC
         HD2FixreSlC3vBohyaT9BiopmMoMNGm6pm7Wl1HXfWS1+rFVayACnKPatNdOCVD3rIvm
         YU4SVy0iNMCgTO0eMRE5Bh0JBTkiKMr1CaxTajdHsNAyRMzvHVFdfJcmQl2c2aolUzZR
         vPLIX71lwQVYj7gxMakt1acl3+ThD8JNh2ewMB8jsM5349V9WIrkE2BD92eCpHlxg4sh
         2kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=CuJyBV5TsdPv6NKjVpLbLP7vExWn2KbWeG1qD4D6dW4zXOuxIa8Fd+Bz9EHxqew/bp
         uSLMZKKQ2FuQFQ3K6f6embVXNpR4KQ6qQIB0X2SAZt3saeKsqXsKSyrvFYnyKdnvIrbT
         pSNVVU7PGuYQWaCsPONIrBcTDBbQDX2Dsz2vOzewQihwc6RqX+ixSx+IxlPdLyT4mHXX
         3PYITRXh+RMrKKTQS1YEzt6P70MV/Ax5IZzMZMYarOHcJydvNrfgCRIYZQy9pZ7Gu9a+
         ZT2TWndA3pZUlUg55hShytTPeMhY7dpTuDrmAExsPsiF6wDR5ln2DO4EhZcCbYiGcZ0r
         mCMg==
X-Gm-Message-State: AGi0PuavhYgEwF+9qMXAXh6BY5s/kVqA1h5UItfx6TqstOkDQ5H7kTC5
        yDZl4+KeCSsD98CxXd8JcMDnMd6q2x0=
X-Google-Smtp-Source: APiQypJFH06/AVG9Wa4y6iKbXnxZhAzBARKyyzNnNdVH9uNdGMVhBaO5SCPKsCsgoEax5sqNc08qfw==
X-Received: by 2002:a63:e856:: with SMTP id a22mr13888418pgk.283.1586040102362;
        Sat, 04 Apr 2020 15:41:42 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id o11sm8690989pjb.18.2020.04.04.15.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:41:41 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 03/11] media: imx: utils: Inline init_mbus_colorimetry() in its caller
Date:   Sat,  4 Apr 2020 15:41:22 -0700
Message-Id: <20200404224130.23118-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404224130.23118-1-slongerbeam@gmail.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The init_mbus_colorimetry() function is small and used in a single
place. The code becomes easier to follow if it gets inline in its
caller. Do so.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 24 +++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 00a71f01786c..cf0aba8d53ba 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -210,19 +210,6 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
 
 #define NUM_IPU_RGB_FORMATS ARRAY_SIZE(ipu_rgb_formats)
 
-static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *fmt)
-{
-	mbus->colorspace = (fmt->cs == IPUV3_COLORSPACE_RGB) ?
-		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
-	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
-	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
-	mbus->quantization =
-		V4L2_MAP_QUANTIZATION_DEFAULT(fmt->cs == IPUV3_COLORSPACE_RGB,
-					      mbus->colorspace,
-					      mbus->ycbcr_enc);
-}
-
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
 						  enum codespace_sel cs_sel,
@@ -423,7 +410,16 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	}
 
 	mbus->code = code;
-	init_mbus_colorimetry(mbus, lcc);
+
+	mbus->colorspace = (lcc->cs == IPUV3_COLORSPACE_RGB) ?
+		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
+	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
+	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
+	mbus->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(lcc->cs == IPUV3_COLORSPACE_RGB,
+					      mbus->colorspace,
+					      mbus->ycbcr_enc);
+
 	if (cc)
 		*cc = lcc;
 
-- 
2.17.1

