Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BE019FA3E
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgDFQjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35585 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbgDFQjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:16 -0400
Received: by mail-pg1-f196.google.com with SMTP id k5so205458pga.2
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qYBkInbfk4Je9+caiy8b4edch0lbPftvhGVf+jVJIDU=;
        b=A6S4ETeXXvUhQmtqoLJWlXKFKLlob3kWpyKSgPZL/139uwroHizZHCe8xOGtizWNYy
         pYR9dpoW8ncP8jqTkEMjfU0AxU8Tz18njsd4Uh4Z57pW6tcfFEShlXpI2YEk3sed6FMW
         Vmzl13X31rf+kS2DKGQPvIihLzklGnicF69zWAKHF0LnHN7pR6gScIIv8mIVt8N1wUxg
         Wc+txErvyAkZZnxCOcUaucuRLdtB40uCg3ujCDkYV5JKl6sjnnGakLqeg8W2x4CPU6A9
         0FUkf4U1RSFqNLJc3uP165HD2Y7M0aRI1x4Pzz3Cc1Ybxxiowpp+R32CL2LsAyg6aGjV
         317w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qYBkInbfk4Je9+caiy8b4edch0lbPftvhGVf+jVJIDU=;
        b=NUAm4UpmgFz592fSAriOg0hXwLZq88EJOwEbKRTfveVnKeJy/beL++7S7hNKj2DDUE
         /u902n4vwFxENU4EDLjSt1A6/EbQja6IICB3K1SkyFp95jZzwWOUnPCfY1TxAjUOp19Q
         544JJ4EbgZbDrRMxC9CzZR8RE3VX2C+z60H/rMEjYXIE3Jtxz0SXR91N7pOPCHP/xgyc
         MrGztq298MckVXgm25tEn1FzlldppiDtFzb0FHeZSrWSjVdTApjxKTNVfecQdgKa6O+2
         u2JqJiYkCg3503HNeOnubG/CgtBzEpDyQCC+I0ce1CdeXJmVK81YsI+8caN2NJpovjKq
         Au7A==
X-Gm-Message-State: AGi0PubwU2bS4DQCoYiMAVUYoRQQ4zfVCGd7TtE7F4i9yD4vOMiK+LPo
        rLIAO8DdR5ao/Okgv7QniW4GSRaB6Y8=
X-Google-Smtp-Source: APiQypLIw3HWd/pK+lD/z6+jY1fcgq2zWdlufuz803yEXysgwtbCLQBfNCLzNc+sM3arV/h4n1Kb1Q==
X-Received: by 2002:a63:6dc6:: with SMTP id i189mr11710770pgc.69.1586191155010;
        Mon, 06 Apr 2020 09:39:15 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:14 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 02/11] media: imx: utils: fix media bus format enumeration
Date:   Mon,  6 Apr 2020 09:38:56 -0700
Message-Id: <20200406163905.24475-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-1-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
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

