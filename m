Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5901A8D99
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 23:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633811AbgDNVXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 17:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633809AbgDNVXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 17:23:45 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75C2C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 14:23:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x26so488928pgc.10
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 14:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yCA2LMbNhClkk53hmq32lGLb+QwXeVthgiRfEJ0ncM4=;
        b=BDb9Tt4RrGs/Vj32KRdusVxZMS3ma43fiJBs3SqkvCC7rd3ONZuzeUYB4j+RWCRxL4
         hfF/t0gxgTux1fuhIcJgIpoYUQjkcI7/duzwmzD8nCTVypebGtuecrblGOGw/RPN04NY
         pqVXTdWHR7GBV8smVPHaAhz7CZfP8Qk+93dI00FPz7W3b/1MnBcowHueR8Mlnwm8P+UI
         cjJlRRPx6BZX1VCMOMIWDF/PBpu1Vy7cYoJMkEiIBZGFn3mAxG4eijqRjb6RYQFy2FIx
         2m9ZIN2P6mSUkhYDlhsMBeOhXxA7TJS492Suk+iwO1X+LvyxoRFdeIPTf9xFQzI2XijC
         nhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yCA2LMbNhClkk53hmq32lGLb+QwXeVthgiRfEJ0ncM4=;
        b=hxgk5hHhzotfgecMthLFukmKY6UoqFmwC3ZzTZpmDYmh1RygkRdVR22eF62qQ9v13E
         awiNoGqTOAsQu48y0hsPMNkKsU+ESE4viw46kT2HbeUDdDO57b98mz2cTCel/S2uLme7
         nsa7QXi5Y2Ond+PTfePcNnBqPmtgt7QfaiwvcePskYoQ+dkuo0ht8xegAzr1ue5AJ4em
         GAh52sSw53/CAASMue+9DigJrYeEKUFATfW4oe/hmS1MMwYCc3nqitlQepiI+UUgD7rN
         blv21iGuOdozEMTftmVtRfHjuOqBbElAKCO2LHY4MeUhwmAOcqnGktXM/xqVGtPlb3qQ
         ZO+w==
X-Gm-Message-State: AGi0PuZZQCgIjrWwSbshW8q1QX/W2V2CG3LvkeDk++UsccpRuWgbrDDm
        V5WX7TlwZVi0Lo6HmNC2NHBTOWSTnVw=
X-Google-Smtp-Source: APiQypJkovw4oaVlSL3vdp5E5AqWiHrzQyITv3a8KWzmegvzkU4ydT5wKFr8ycmUB8i+Fok6oZk2ag==
X-Received: by 2002:a62:62c3:: with SMTP id w186mr24053757pfb.238.1586899424859;
        Tue, 14 Apr 2020 14:23:44 -0700 (PDT)
Received: from mappy.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id 10sm708069pfn.204.2020.04.14.14.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:23:44 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7.1 02/11] media: imx: utils: fix media bus format enumeration
Date:   Tue, 14 Apr 2020 14:23:38 -0700
Message-Id: <20200414212338.20488-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-3-slongerbeam@gmail.com>
References: <20200406163905.24475-3-slongerbeam@gmail.com>
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

Fixes: e130291212df5 ("[media] media: Add i.MX media core driver")
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

