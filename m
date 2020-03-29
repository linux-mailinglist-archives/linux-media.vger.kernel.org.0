Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 334A6197065
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 22:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgC2U7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 16:59:33 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33110 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgC2U7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 16:59:32 -0400
Received: by mail-pl1-f196.google.com with SMTP id g18so5903463plq.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 13:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=uGKVBdEILGYfhUEYeN59pAuI8n1gKjdGGKdWAYDP7rn98eg/g9ymGzKjBDo92CLrCu
         rVRFCfhGrJIRPkBrf4I1ZOciSf6Izq1dNOYViCN7H6eDAh0fuFgQ8g+BA8VPU+q9xH2C
         FWaT2mzq6Akkx+C3pCUyTJnrgsBnRie+FRA5hyf4nMZ/vmAaHFpTDM7CCq+71rWbgEYM
         xRCqJTTnHEb3cPY8MvOyXqlVZHmHU7gVIzU8iv4wSAPLbP93LCjiCe9X6oebRDoZkwU/
         sapq436rZ+dTuzt4z1vgDM0038edmXdpMyKIxd4I02HIK45Ix+l7UELhTIUkiMNTpBFF
         6A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=pNYbRkaod8OnfXD59Q/g2vw9W/3VX9WOU+YzrqhdhdhoPg9Arzq9hDHM1CM/aAKe5q
         Rx3taP8hNQ21Y9+c7BZb5LCW7ROzzFYpv7SQvBtbtsA50LlRAH1x1eLw8z5/GqWqQ5lC
         i9dHaXazW1cxxyoOm55cg8kgumFvMp8Uo8qn2+YK+hw5afXjBOAOP9w1ZPMyzvi1Swr2
         TmIuNbFTAqAYG+aHdrzMVuZRY+AfYHVnbM66Ce5CVSqFb3ihcpJydOZRDU94sUr6LAeg
         isEFUEuM31CDBeqtccryi9FsVI9jniKoZmILme+SkRWMaN2xkWwYmbPh06ctx9UBKCjU
         HOCA==
X-Gm-Message-State: ANhLgQ1eI/T3QE3Q/pksU7oaP8ZUSl6d+L6ezsDfljoB9cg9aj2roWY4
        rS98T7sgZVfpdAd8f/Q45ks2jUjSju4=
X-Google-Smtp-Source: ADFU+vvp7IfNysJGovVD/qZ7JEN22lCQ8PSwAc/z6+XwRsfXZUP9j2Ayu1AsTNxHBm/i2sjlKY0/5A==
X-Received: by 2002:a17:902:aa01:: with SMTP id be1mr9306577plb.227.1585515570374;
        Sun, 29 Mar 2020 13:59:30 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id 15sm8606049pfu.186.2020.03.29.13.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:59:29 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 03/11] media: imx: utils: Inline init_mbus_colorimetry() in its caller
Date:   Sun, 29 Mar 2020 13:59:12 -0700
Message-Id: <20200329205920.20118-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329205920.20118-1-slongerbeam@gmail.com>
References: <20200329205920.20118-1-slongerbeam@gmail.com>
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

