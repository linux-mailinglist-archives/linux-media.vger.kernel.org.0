Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 162B3194700
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgCZTFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:05:54 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40345 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727939AbgCZTFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:05:54 -0400
Received: by mail-pj1-f65.google.com with SMTP id kx8so2805136pjb.5
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tBQl4xZ+XPJAC9ZGkbcMqT8sniHRBi+uWgBr2NZSgMs=;
        b=He15aY06wq+LgwAfoU7gjLRKYVJe1TdnMKM0rDXtG6ZS5D0YyC934bYZAvLHx9U392
         8L1pgUF3llXNq3ueCGKxLYkCe+yk6zNWtMiGdUJxF9bWMvYCtW5ibZY+H3PCg6COwMFd
         qWi/5jpdiyPWdZQ6nL5PZAepLcjISHN4EulzlHoefJh+Unqt22SrS3tALAd73v+N73ce
         GVZltZt9SRPvc4eE8veOq9kwaRnM2idWktW0yUxCPmPhkwXkkUiUhItRHFdJ0lKsUbGl
         xuDUXXob59umzMPTVw1q+tDmKt5w3CoeMwtliFU1FRZlcMZLtoh/UFw8ikBiySonm5ee
         Nt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tBQl4xZ+XPJAC9ZGkbcMqT8sniHRBi+uWgBr2NZSgMs=;
        b=l/dk+wSsqPviqpRFr1/9kZL2GvwO2v+9AMU5N0B4yPD0Sn2c6uhomN65NM43LeiiNO
         dxurZcaKF3w4Qb8+5nAa7jVUt8xUcCA8kn0rEdOBrampnCTAEe6BIDFRvTYBeuHZP84P
         NiaV5P7L8i2c3Y21ZFmzeYddWwqb0GaYNVUn1w54bTvhOmVDgkum6DnjZkYWSMUho75v
         PWMhkYV7F8rFdxA6VOXfVYZ+zMLQqQOspxdaHsW9FzfYpyHivRkR2OPDpxk1RkFEqbGa
         hzfm8zORU3sIeYn54vV6g2zM3ViPg6qPsqxOjblJRepJYsABgBPcDun104lH2wLHHkjL
         v20w==
X-Gm-Message-State: ANhLgQ16M40Nl9O4JzsdUWAO4ayVEgE6icFrtPLnhpyCHXhzVq48yiZt
        QFbddnMDBaTqw8NCVChIt8354d17exU=
X-Google-Smtp-Source: ADFU+vttTy27nl7FOcZOqnsSGFbZMycrVzBvXxM7BT/lTcqZDnOHnMjBrm63t7k2LnF0kSfgLuXOkA==
X-Received: by 2002:a17:90a:198b:: with SMTP id 11mr1661780pji.23.1585249553085;
        Thu, 26 Mar 2020 12:05:53 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:52 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 03/10] media: imx: utils: Inline init_mbus_colorimetry() in its caller
Date:   Thu, 26 Mar 2020 12:05:37 -0700
Message-Id: <20200326190544.16349-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
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
index 97568a6ee101..61fbb64777a2 100644
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
@@ -426,7 +413,16 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
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

