Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A834196EF9
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 19:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgC2RkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 13:40:22 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35427 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgC2RkW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 13:40:22 -0400
Received: by mail-pj1-f66.google.com with SMTP id g9so6286946pjp.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 10:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=YI9Lf+ps1mxn2zRqF0zPgYgM2SqyP55qGzKhNsbvOyXLL2q/trjfLZ4QokYaVtCo5k
         tYaDabrBZJ1dtmm7YDX/a3iEfKO2SBXUk2iEfGg141oovbYPug+xrqKcFsoDuHHJqSLQ
         Vdy/Q0XZhwN3hxcXGAI9+84x/numjzaYU396IQfl+A7rPUAj0IO7/fRINiVJ80DwIFze
         yp2XvtOL2WnjlyMW/y2nkFJHVRZauJOoHpXk7XoBFcU5oSZVGLF15yZ8LkKeWWbaH1JB
         WzCuQIazdKPj930T5/GR/s1IS+cMQHfPosn1EbgzzTN2UFj0HQWdvOPCZ9v6RSx+28Pp
         h9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=oURSNk7TksiUdTHoSZ3jxkj1SjGU1O5EFEbzMAfK1p/3Vsnwa5x/0Y86Ugr1+UOlBh
         VOw9yJquS6Z7ssmULmch7RG0HEMAJOZlNVtjrrIEdzkEEJJi9r6GUKV6g3fO1eo9ov9G
         bwxX27E6Rx/TgMmRSD2vOHar+nvENPg3V8yiqARwATaAFTubomGXGaz9KPCo+8sd5Hlr
         v5Q0yq+ILafTGz5YPMnJcz/wLapeOh6khnVST+cGhY6BfNrwIF8BMrGXkQqup1NwZdXM
         3Ic4HHdjOlE4PZjSdhKvfZh9wPQAkIZ2PejGyPKKEci2AYEcVW1BIgz/BBhk6twslGWG
         flkQ==
X-Gm-Message-State: ANhLgQ0dUNvb8hbBwfCTX1lfeRCGGPmUkPzxPJ8BK6dwfrD2eaSN0H1W
        e90XosShaEAUDLLeYl3LGUNmUw+TO6Q=
X-Google-Smtp-Source: ADFU+vuJ7uroV1Q7G1Z311Z46/JW1jmaFqADkTgwF7EiOz2WcQzn2yj+LsMZ4JDnlYK/5xikYzmC9Q==
X-Received: by 2002:a17:902:ba8e:: with SMTP id k14mr8675203pls.298.1585503620233;
        Sun, 29 Mar 2020 10:40:20 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id b133sm7031253pfb.180.2020.03.29.10.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:40:19 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 03/10] media: imx: utils: Inline init_mbus_colorimetry() in its caller
Date:   Sun, 29 Mar 2020 10:40:03 -0700
Message-Id: <20200329174010.12304-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329174010.12304-1-slongerbeam@gmail.com>
References: <20200329174010.12304-1-slongerbeam@gmail.com>
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

