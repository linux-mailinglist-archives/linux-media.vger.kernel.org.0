Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 958D81969FD
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 00:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbgC1XKQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 19:10:16 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35729 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbgC1XKQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 19:10:16 -0400
Received: by mail-pl1-f195.google.com with SMTP id c12so2232504plz.2
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2020 16:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=CDoulhxeryTOyqjePm2MyaWP2k8gZTxlUYgqZPPDUSy9WNIga76ODt8oyfEIcIxnmf
         t/nzAK9hLku3RVulWQyk5DBeqvoxkYFSx8Tbm2hmUZ15Ljlt2qo2zaW6l2Q8p7gNcDl8
         ycBb0ZviypHqGvLwqD9sf83aO5hGAqGOZMqFBI/wASEMwoz6YoGN7meLG36ykvN7xeeG
         sLm1uZ4agsqgqtW7t6S0b7M4hrKmKn4cQCSUpyeGSaB0gVPrN/Lwq2kRoByB1xhUF8ps
         NJzxKXswA+TwyTMfoGyH32y36r9I9JVwNgrIzcckZ63HggfwCV1MHZnofPEbQXX4TtND
         53tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=Ukf27JUQfsIWcR5ASGDvQcQ9XABQngZ0SvMzYA4TTSNBukrQUkBDuVoEMd4Ys0UmP+
         nq11k3pulO/8C8601wHTLunnbeSS7X9Po1/uisYDi4uK4gKMzEpNGMqQv2D/6R2gAoPM
         nO4Hp+D1Cl2Yf53Bon5s4EuaJMMusq1ypqzShU2aA7ib80SXj8iTpLbi75av390kSj+s
         wtjbB8lqcHDCQasJH1iH6v3sHZ/DeZd74+xABlBmh0NeUDzaJ0xHom7HkwXo4QNGlxaX
         v7Aw6Z/zRUsesBURH7nZLndeUeRJVuK0FKxvedTdCLpwTWJZm4kXH/6mCG6oLt47tXMp
         J4gg==
X-Gm-Message-State: ANhLgQ3zYvYX1SGqzpyYXYxnRlzVUKwpQPaEYqnTM3qispFClHtcXvcb
        ae1lZE89O8PaH1cprQ8gGL/Fqq46xSw=
X-Google-Smtp-Source: ADFU+vsVlBMIUrBRiRSL6/E7wBVewzKDsn5Z5Oqn3zwL71fGnP1aBoox4S9DTJiJiXJK4rUhv2TL7w==
X-Received: by 2002:a17:902:9003:: with SMTP id a3mr5669809plp.331.1585437014798;
        Sat, 28 Mar 2020 16:10:14 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:3081:8132:c81a:db99])
        by smtp.gmail.com with ESMTPSA id w74sm3978602pfd.112.2020.03.28.16.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 16:10:14 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 03/10] media: imx: utils: Inline init_mbus_colorimetry() in its caller
Date:   Sat, 28 Mar 2020 16:09:55 -0700
Message-Id: <20200328231002.649-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328231002.649-1-slongerbeam@gmail.com>
References: <20200328231002.649-1-slongerbeam@gmail.com>
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

