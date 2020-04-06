Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83B4519FA3F
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbgDFQjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37302 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbgDFQjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:17 -0400
Received: by mail-pg1-f193.google.com with SMTP id r4so199626pgg.4
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=OWZDrReZRBsbxEWBrflatJ3uPUmKGb3InI0InOMF3KZ6G4vBrPRDJ8lveTP8ycYp+D
         29+cGhztcJr5aDB21ygy/ubxdSnuTNOdCToWUNE9arf8djIGOo7FkKckh12bTgebXOKM
         mT/Rrf2zYzfzTXSfkha5LIfQX/MarO5effyC6yAd1CTA2c8L0H3mIBqJipopCi0Qmd/t
         Y0FeoMOLoDrKRS0Dg/x6aO75WciPbDl527W49a7TTAVjbqLN5i1RtVMwua3VpNSHSBBJ
         XRCU7stdCja+6BbfpyuD5Z2pDDsTWN/d5oQ7murFyZperS0/s4agkV9ARJIAU+RU/1qN
         jNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=P6q8JO/cNtrNnY/+dYiyQdZIZvdiMDIWkib1z7c0sF19DkM8qJmnaBnsswwsCVgc2B
         H1sY4ZMe4ChJfO9knnZZewPTF32/n7IiCH9zb/FV2sWmO87MslKihz7iPaxcrbU2VB9u
         qwmvxuvYrBwtt3ln59x6FPACab4fGeiGjGECXM1fA+e8j64RW1uY+YxKvUpwYHrN+ePA
         QA+VJ6j+uzXpc15TFmr4bDbRYVNR+/QuNkNF7gbZ2OuHwFZTHh02xDEkt0OieHGNs9pF
         VArhwppPsa5Q5Jdud+yGKFRBG2yEC/dHYg9PumL0ax6gpnpY5TiX96ZVOk6pYmE9c77C
         NAoA==
X-Gm-Message-State: AGi0PuYlvMfpd7RGj0lEIF7HYlgh5UDBA04OSJJy4Sj2MXelndgPsA63
        dQXlBv7zH7tpaxEVvZlCPOgW7R1JEE4=
X-Google-Smtp-Source: APiQypKl0Oe5/p7IQzbd9OFpsz/WxPF4lLAUJvInldPdY9CHAKy0rRP4Rz9n4EkIjpNfUyL//POw+A==
X-Received: by 2002:a63:dd09:: with SMTP id t9mr21163005pgg.432.1586191156180;
        Mon, 06 Apr 2020 09:39:16 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:15 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 03/11] media: imx: utils: Inline init_mbus_colorimetry() in its caller
Date:   Mon,  6 Apr 2020 09:38:57 -0700
Message-Id: <20200406163905.24475-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-1-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
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

