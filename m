Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F04A319E7EA
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 00:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgDDWlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 18:41:42 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41852 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgDDWlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 18:41:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id a24so5554692pfc.8
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 15:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qYBkInbfk4Je9+caiy8b4edch0lbPftvhGVf+jVJIDU=;
        b=eY1DG2EJxOUR0cSgODlE0GxMRL/eM5R5DN49c7kfQ337/4V2tLt/x5qjM8nATeEXCM
         f7QmGHFi7I7wPbspABpEQkk6R6GC+6pJxB0xg9vCWK0Z+FaR2IKPoQNhn6+OCiKs/8DU
         GFIkjT1bO1T1LG8gBlJCuuA0IpubzBJPZonnQG0rg/ITbI1ghJDpJgpnlqjX0W4G3zf9
         VsRxnmPOC5x5p+YZJRFWiRAyDAyEybO+5DITJFcUo2l3h8Sg5ZEsECiZ/Shx2hMNjo/7
         sJgDAot76LFWJ4Bv1wSvDfvmARuWvPPBeQ2dDobSt7P+fTK3k/2DXHC64+FvyapdVK/M
         ratw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qYBkInbfk4Je9+caiy8b4edch0lbPftvhGVf+jVJIDU=;
        b=Ze0loA2TnMql8Q2ehnAoS6ISqblwDfiuRT/+905UjTAllDVx6mzZRgKqs0biwsiwkp
         GTB7A8M0ZuyLdm6Fp9q7zeob2sM+aE9Gb5ymq0L4nCUWC9JADyqNHK80OnFn5D73LBbL
         4g6u12yytsCeQ5a2PPphH6SAA9HtUsFgay44EO93cO7yWaIW5rChSbQxyJQNvFrAHGft
         4COL99rHY9ETUQn4rCpLS/ZpSGcGybVxzL6dayJ7UUAJheNZdeS+nL8iE/BMrYBcDx5Y
         LX2gyYGHDGlg8Ew/PVzkU2AyDE3aNWosdfnc62LatZfIxKuIt8Tt8h3yusCBwKMKY35f
         mcxw==
X-Gm-Message-State: AGi0PuYqYI1GoriLV/avbFcYkUV36LIttZxCjVRNKwbqjPZKi35EqduP
        cjqOi7avNkFOPpCTrLnO+Fz+4gjKxTM=
X-Google-Smtp-Source: APiQypIHLFQliHcE/PH9zAk5SjEMu3Kl09gVSkWXd72154oXFBj0yn0Mdv9PKLbZv8EzObpNP6lQEA==
X-Received: by 2002:a63:5e44:: with SMTP id s65mr15140616pgb.112.1586040101040;
        Sat, 04 Apr 2020 15:41:41 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id o11sm8690989pjb.18.2020.04.04.15.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:41:40 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 02/11] media: imx: utils: fix media bus format enumeration
Date:   Sat,  4 Apr 2020 15:41:21 -0700
Message-Id: <20200404224130.23118-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404224130.23118-1-slongerbeam@gmail.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

Iterate over all media bus formats, not just over the first format in
each imx_media_pixfmt entry.

Before:

  $ v4l2-ctl -d $(media-ctl -e ipu1_csi0) --list-subdev-mbus-codes 0
  ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
	0x2006: MEDIA_BUS_FMT_UYVY8_2X8
	0x2008: MEDIA_BUS_FMT_YUYV8_2X8
	0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
	0x100a: MEDIA_BUS_FMT_RGB888_1X24
	0x100d: MEDIA_BUS_FMT_ARGB8888_1X32
	0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
	0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
	0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
	0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
	0x3007: MEDIA_BUS_FMT_SBGGR10_1X10
	0x300e: MEDIA_BUS_FMT_SGBRG10_1X10
	0x300a: MEDIA_BUS_FMT_SGRBG10_1X10
	0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
	0x2001: MEDIA_BUS_FMT_Y8_1X8
	0x200a: MEDIA_BUS_FMT_Y10_1X10

After:

  $ v4l2-ctl -d $(media-ctl -e ipu1_csi0) --list-subdev-mbus-codes 0
  ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
	0x2006: MEDIA_BUS_FMT_UYVY8_2X8
	0x200f: MEDIA_BUS_FMT_UYVY8_1X16
	0x2008: MEDIA_BUS_FMT_YUYV8_2X8
	0x2011: MEDIA_BUS_FMT_YUYV8_1X16
	0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
	0x100a: MEDIA_BUS_FMT_RGB888_1X24
	0x100c: MEDIA_BUS_FMT_RGB888_2X12_LE
	0x100d: MEDIA_BUS_FMT_ARGB8888_1X32
	0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
	0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
	0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
	0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
	0x3007: MEDIA_BUS_FMT_SBGGR10_1X10
	0x3008: MEDIA_BUS_FMT_SBGGR12_1X12
	0x3019: MEDIA_BUS_FMT_SBGGR14_1X14
	0x301d: MEDIA_BUS_FMT_SBGGR16_1X16
	0x300e: MEDIA_BUS_FMT_SGBRG10_1X10
	0x3010: MEDIA_BUS_FMT_SGBRG12_1X12
	0x301a: MEDIA_BUS_FMT_SGBRG14_1X14
	0x301e: MEDIA_BUS_FMT_SGBRG16_1X16
	0x300a: MEDIA_BUS_FMT_SGRBG10_1X10
	0x3011: MEDIA_BUS_FMT_SGRBG12_1X12
	0x301b: MEDIA_BUS_FMT_SGRBG14_1X14
	0x301f: MEDIA_BUS_FMT_SGRBG16_1X16
	0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
	0x3012: MEDIA_BUS_FMT_SRGGB12_1X12
	0x301c: MEDIA_BUS_FMT_SRGGB14_1X14
	0x3020: MEDIA_BUS_FMT_SRGGB16_1X16
	0x2001: MEDIA_BUS_FMT_Y8_1X8
	0x200a: MEDIA_BUS_FMT_Y10_1X10
	0x2013: MEDIA_BUS_FMT_Y12_1X12

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

[Decrement index to replace loop counter k]
[Return directly from within the loops]
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 22 +++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 39469031e510..00a71f01786c 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -269,6 +269,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
 		enum codespace_sel fmt_cs_sel;
+		unsigned int j;
 
 		fmt_cs_sel = (fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			CS_SEL_YUV : CS_SEL_RGB;
@@ -278,15 +279,24 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
-		if (index == 0) {
-			if (fourcc)
-				*fourcc = fmt->fourcc;
-			if (code)
-				*code = fmt->codes[0];
+		if (fourcc && index == 0) {
+			*fourcc = fmt->fourcc;
 			return 0;
 		}
 
-		index--;
+		if (!code) {
+			index--;
+			continue;
+		}
+
+		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+			if (index == 0) {
+				*code = fmt->codes[j];
+				return 0;
+			}
+
+			index--;
+		}
 	}
 
 	return -EINVAL;
-- 
2.17.1

