Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9580E1946FF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgCZTFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:05:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44650 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgCZTFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:05:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id b72so3249030pfb.11
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xLYZwd0gwNDf1QrH/c7/diJRH1vhJhsgmlo/bWPVYtg=;
        b=Hz34vNEgxB4DW6uXh6xREtp3MGrd4Jnwol5impFhnFINRgDBHfGrpXiQi7JiAMbKN3
         +orm+L8Webs+v4mQP8qv4XdSMywL9ZRQSM0n7iNkIRHnb5XQmnAeusQvdaUI2wnFJZk/
         RYZfa+xApfPRmN9xklDXEPSByR2bUpRt+agay4DwzvIl+tReug9qYwgKutQ6u22B3LDj
         YQwQJoLBBdI1K0IMZmggrIFsuHbNR1g4B06FeUhElbN15v+KkYdXSRepF2M1oJX6mBad
         cOxP9T33+IpEnYZuSLkleCuAMG9/K2rKpLSZg84lxtLGdL+wgBtLsXt9bR0nIWI/VAY1
         bcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xLYZwd0gwNDf1QrH/c7/diJRH1vhJhsgmlo/bWPVYtg=;
        b=jaEvtDCJ9NM27UuspROYj0U6AE0p1bsF+2ujOlp+3aOoxmsrPlqvzHN7e5SLXlg1X3
         87bYUouvO30d+pUUNVCqI9TG8snhosI3V9pT0fOfcR0RtW9VSFivgb0DzGvjwmCgnmJL
         +vGAZGnUQ6ce1RSMH8/VmBtCQRvgWUWccQBB3stecM9gqHRSQmlsdQR1NZK5DkX0eaMx
         JEg5asaSnoYX98/hSMMqn/w8a/vQSxj54zwR/5tVYBGd/9U8snspiXrEpEwXopm4S+Eo
         JPjHdfWKkz65Ai+B4cibODNvgj5Bk/HAU3QB/JOINJ+iltuHGTop5vQb+CwQQZeXFbkB
         Ws8w==
X-Gm-Message-State: ANhLgQ2sGRXBDDWalwUXlUFrNpuLb9KV4RT8/4bNIWd98GBHrmDQor68
        7rG5bhQf/FtyMrUlKvqMCAYO9ED73w0=
X-Google-Smtp-Source: ADFU+vtMM2JvBUH+xnlhHsmLqdeKY2sE48wd0bmfzDw+RQX1yGtaUocSu+jkqMTHxjKIr5cEH6ODtQ==
X-Received: by 2002:a62:160b:: with SMTP id 11mr193010pfw.189.1585249552107;
        Thu, 26 Mar 2020 12:05:52 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:51 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 02/10] media: imx: utils: fix media bus format enumeration
Date:   Thu, 26 Mar 2020 12:05:36 -0700
Message-Id: <20200326190544.16349-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
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
---
 drivers/staging/media/imx/imx-media-utils.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 8ff175b08836..97568a6ee101 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -264,7 +264,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 		       bool allow_bayer)
 {
 	const struct imx_media_pixfmt *fmt;
-	unsigned int i, match_index = 0;
+	unsigned int i, j = 0, match_index = 0;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		enum codespace_sel fmt_cs_sel;
@@ -278,18 +278,29 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
-		if (index == match_index)
+		if (fourcc && index == match_index)
 			break;
 
-		match_index++;
+		if (!code) {
+			match_index++;
+			continue;
+		}
+
+		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
+			if (index == match_index)
+				goto out;
+
+			match_index++;
+		}
 	}
 	if (i == ARRAY_SIZE(pixel_formats))
 		return -EINVAL;
 
+out:
 	if (fourcc)
 		*fourcc = fmt->fourcc;
 	if (code)
-		*code = fmt->codes[0];
+		*code = fmt->codes[j];
 
 	return 0;
 }
-- 
2.17.1

