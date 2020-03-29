Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D18EA197063
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 22:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgC2U7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 16:59:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40587 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbgC2U7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 16:59:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id c20so5020447pfi.7
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 13:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qYBkInbfk4Je9+caiy8b4edch0lbPftvhGVf+jVJIDU=;
        b=Pw39nN5XRXyNMQFHOdu2NUIqyzgW+s/v+426mFbeIAjsZoSJRyWx1FDjsBrmNsnIPv
         cmgEFUoHa2cT5tiAe7MdBXmwSxO2kKuQzDJRXysXpH8BfIaN4Lia0wjdbhASxGZwI7Rq
         svYm/P6kSwToMrpn8jzS7G7/irrJ/Rw9XjVYNm+4F2rx3cjON7jEp/PwN9T1mRlja2xh
         kpgcUHvONMYLcwVVA04025Bqt42BdqChD5Q0TgPiK9uC56lBktLL5op9XUwX+Tj9h2DK
         3fwQbkdhFWGZgfZDYehfXY9vti29nmp4xSJ7M8F3+8HK8ETBwxAqzWtD6WzBHsUgHeos
         QvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qYBkInbfk4Je9+caiy8b4edch0lbPftvhGVf+jVJIDU=;
        b=aPaQ5F9MiJK5rg+OsuZBpg1fUL7GxCcQ2HGoMLU5WyrZ1Bb+66OAsDIxe60TkEhW4F
         7eR7QpFdUV9u2gxcw16zesbHYZZ2o6y8Uyow2HqJebirlGEvlkeHUupK9SrzqHquPJtU
         LNAJBkF4TD/o0AFdfD8SoIGxggWv7csvxM2qBvx48mA8ix9CYawhzZTbi2UeyPqommts
         V/IfNBjJ6CRUhxR0JzdqoUdZCteugTtM+tWh2Ib2rwC++lCJmnzUgAedgsVHatjIcBuF
         oqiN56/tdyv39kYqKnAaYpmQKvJDDG/b2myj8BLcySWvJNCkr2ck77Xb30+0Y6wi4iW1
         nwzw==
X-Gm-Message-State: ANhLgQ2930ZJBn83TpfGpKizcjwKQ0fa6orOZYjuP72IVsWHXDNfukgD
        aAYSkLfABf5r/BvZkGSSUAa0oROa4mE=
X-Google-Smtp-Source: ADFU+vtWRdYtKO4yw+LgO7Hd7Awq/3gsjunv0PPlZuidgTLMCCJI84PwpS8p0BoDBLaNnp1u05OnQA==
X-Received: by 2002:aa7:949d:: with SMTP id z29mr10089088pfk.111.1585515569233;
        Sun, 29 Mar 2020 13:59:29 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id 15sm8606049pfu.186.2020.03.29.13.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:59:28 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 02/11] media: imx: utils: fix media bus format enumeration
Date:   Sun, 29 Mar 2020 13:59:11 -0700
Message-Id: <20200329205920.20118-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329205920.20118-1-slongerbeam@gmail.com>
References: <20200329205920.20118-1-slongerbeam@gmail.com>
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

