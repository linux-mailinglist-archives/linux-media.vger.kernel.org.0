Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4CF64E3F6
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 23:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiLOWrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 17:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiLOWqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 17:46:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5DE5FB92
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 14:46:45 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p5wzt-0003mJ-SM; Thu, 15 Dec 2022 23:46:37 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1p5wzs-004nK6-5U; Thu, 15 Dec 2022 23:46:36 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1p5wzr-009pzz-Ud; Thu, 15 Dec 2022 23:46:35 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 4/5] media: v4l2: move v4l_fill_fmtdesc to common v4l2_fill_fmtdesc function
Date:   Thu, 15 Dec 2022 23:45:13 +0100
Message-Id: <20221215224514.2344656-5-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221215224514.2344656-1-m.grzeschik@pengutronix.de>
References: <20221215224514.2344656-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function v4l_fill_fmtdesc is a function that fills v4l2_fmtdesc with
its description data and compressed flag that is matching the
pixelformat. Since more v4l2 users other than v4l_enum_fmt can benefit
from it we move the function to the v4l2-common code and rename it to
v4l2_fill_fmtdesc.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - added reviewed and tested tags
---
 drivers/media/v4l2-core/v4l2-common.c | 263 +++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c  | 264 +-------------------------
 include/media/v4l2-common.h           |   2 +
 3 files changed, 266 insertions(+), 263 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 40f56e044640d7..e92974a6d9ecd6 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -570,3 +570,266 @@ u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator)
 	return denominator ? numerator * multiplier / denominator : 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fraction_to_interval);
+
+void v4l2_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
+{
+	const unsigned sz = sizeof(fmt->description);
+	const char *descr = NULL;
+	u32 flags = 0;
+
+	/*
+	 * We depart from the normal coding style here since the descriptions
+	 * should be aligned so it is easy to see which descriptions will be
+	 * longer than 31 characters (the max length for a description).
+	 * And frankly, this is easier to read anyway.
+	 *
+	 * Note that gcc will use O(log N) comparisons to find the right case.
+	 */
+	switch (fmt->pixelformat) {
+	/* Max description length mask:	descr = "0123456789012345678901234567890" */
+	case V4L2_PIX_FMT_RGB332:	descr = "8-bit RGB 3-3-2"; break;
+	case V4L2_PIX_FMT_RGB444:	descr = "16-bit A/XRGB 4-4-4-4"; break;
+	case V4L2_PIX_FMT_ARGB444:	descr = "16-bit ARGB 4-4-4-4"; break;
+	case V4L2_PIX_FMT_XRGB444:	descr = "16-bit XRGB 4-4-4-4"; break;
+	case V4L2_PIX_FMT_RGBA444:	descr = "16-bit RGBA 4-4-4-4"; break;
+	case V4L2_PIX_FMT_RGBX444:	descr = "16-bit RGBX 4-4-4-4"; break;
+	case V4L2_PIX_FMT_ABGR444:	descr = "16-bit ABGR 4-4-4-4"; break;
+	case V4L2_PIX_FMT_XBGR444:	descr = "16-bit XBGR 4-4-4-4"; break;
+	case V4L2_PIX_FMT_BGRA444:	descr = "16-bit BGRA 4-4-4-4"; break;
+	case V4L2_PIX_FMT_BGRX444:	descr = "16-bit BGRX 4-4-4-4"; break;
+	case V4L2_PIX_FMT_RGB555:	descr = "16-bit A/XRGB 1-5-5-5"; break;
+	case V4L2_PIX_FMT_ARGB555:	descr = "16-bit ARGB 1-5-5-5"; break;
+	case V4L2_PIX_FMT_XRGB555:	descr = "16-bit XRGB 1-5-5-5"; break;
+	case V4L2_PIX_FMT_ABGR555:	descr = "16-bit ABGR 1-5-5-5"; break;
+	case V4L2_PIX_FMT_XBGR555:	descr = "16-bit XBGR 1-5-5-5"; break;
+	case V4L2_PIX_FMT_RGBA555:	descr = "16-bit RGBA 5-5-5-1"; break;
+	case V4L2_PIX_FMT_RGBX555:	descr = "16-bit RGBX 5-5-5-1"; break;
+	case V4L2_PIX_FMT_BGRA555:	descr = "16-bit BGRA 5-5-5-1"; break;
+	case V4L2_PIX_FMT_BGRX555:	descr = "16-bit BGRX 5-5-5-1"; break;
+	case V4L2_PIX_FMT_RGB565:	descr = "16-bit RGB 5-6-5"; break;
+	case V4L2_PIX_FMT_RGB555X:	descr = "16-bit A/XRGB 1-5-5-5 BE"; break;
+	case V4L2_PIX_FMT_ARGB555X:	descr = "16-bit ARGB 1-5-5-5 BE"; break;
+	case V4L2_PIX_FMT_XRGB555X:	descr = "16-bit XRGB 1-5-5-5 BE"; break;
+	case V4L2_PIX_FMT_RGB565X:	descr = "16-bit RGB 5-6-5 BE"; break;
+	case V4L2_PIX_FMT_BGR666:	descr = "18-bit BGRX 6-6-6-14"; break;
+	case V4L2_PIX_FMT_BGR24:	descr = "24-bit BGR 8-8-8"; break;
+	case V4L2_PIX_FMT_RGB24:	descr = "24-bit RGB 8-8-8"; break;
+	case V4L2_PIX_FMT_BGR32:	descr = "32-bit BGRA/X 8-8-8-8"; break;
+	case V4L2_PIX_FMT_ABGR32:	descr = "32-bit BGRA 8-8-8-8"; break;
+	case V4L2_PIX_FMT_XBGR32:	descr = "32-bit BGRX 8-8-8-8"; break;
+	case V4L2_PIX_FMT_RGB32:	descr = "32-bit A/XRGB 8-8-8-8"; break;
+	case V4L2_PIX_FMT_ARGB32:	descr = "32-bit ARGB 8-8-8-8"; break;
+	case V4L2_PIX_FMT_XRGB32:	descr = "32-bit XRGB 8-8-8-8"; break;
+	case V4L2_PIX_FMT_BGRA32:	descr = "32-bit ABGR 8-8-8-8"; break;
+	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
+	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
+	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
+	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y10:		descr = "10-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y12:		descr = "12-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y14:		descr = "14-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y16:		descr = "16-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
+	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
+	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
+	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
+	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
+	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
+	case V4L2_PIX_FMT_CNF4:		descr = "4-bit Depth Confidence (Packed)"; break;
+	case V4L2_PIX_FMT_PAL8:		descr = "8-bit Palette"; break;
+	case V4L2_PIX_FMT_UV8:		descr = "8-bit Chrominance UV 4-4"; break;
+	case V4L2_PIX_FMT_YVU410:	descr = "Planar YVU 4:1:0"; break;
+	case V4L2_PIX_FMT_YVU420:	descr = "Planar YVU 4:2:0"; break;
+	case V4L2_PIX_FMT_YUYV:		descr = "YUYV 4:2:2"; break;
+	case V4L2_PIX_FMT_YYUV:		descr = "YYUV 4:2:2"; break;
+	case V4L2_PIX_FMT_YVYU:		descr = "YVYU 4:2:2"; break;
+	case V4L2_PIX_FMT_UYVY:		descr = "UYVY 4:2:2"; break;
+	case V4L2_PIX_FMT_VYUY:		descr = "VYUY 4:2:2"; break;
+	case V4L2_PIX_FMT_YUV422P:	descr = "Planar YUV 4:2:2"; break;
+	case V4L2_PIX_FMT_YUV411P:	descr = "Planar YUV 4:1:1"; break;
+	case V4L2_PIX_FMT_Y41P:		descr = "YUV 4:1:1 (Packed)"; break;
+	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
+	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
+	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
+	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
+	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
+	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
+	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
+	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
+	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
+	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
+	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
+	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
+	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
+	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
+	case V4L2_PIX_FMT_M420:		descr = "YUV 4:2:0 (M420)"; break;
+	case V4L2_PIX_FMT_NV12:		descr = "Y/CbCr 4:2:0"; break;
+	case V4L2_PIX_FMT_NV21:		descr = "Y/CrCb 4:2:0"; break;
+	case V4L2_PIX_FMT_NV16:		descr = "Y/CbCr 4:2:2"; break;
+	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
+	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
+	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
+	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/CbCr 4:2:0"; break;
+	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/CbCr 4:2:0 (4x4 Linear)"; break;
+	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/CbCr 4:2:0 (16x16 Linear)"; break;
+	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 Linear)"; break;
+	case V4L2_PIX_FMT_P010_4L4:	descr = "10-bit Y/CbCr 4:2:0 (4x4 Linear)"; break;
+	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
+	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
+	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
+	case V4L2_PIX_FMT_NV61M:	descr = "Y/CrCb 4:2:2 (N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT:	descr = "Y/CbCr 4:2:0 (64x32 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/CbCr 4:2:0 (16x16 MB, N-C)"; break;
+	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
+	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
+	case V4L2_PIX_FMT_YUV422M:	descr = "Planar YUV 4:2:2 (N-C)"; break;
+	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
+	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
+	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
+	case V4L2_PIX_FMT_SBGGR8:	descr = "8-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB8:	descr = "8-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SBGGR10:	descr = "10-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG10:	descr = "10-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG10:	descr = "10-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB10:	descr = "10-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SBGGR10P:	descr = "10-bit Bayer BGBG/GRGR Packed"; break;
+	case V4L2_PIX_FMT_SGBRG10P:	descr = "10-bit Bayer GBGB/RGRG Packed"; break;
+	case V4L2_PIX_FMT_SGRBG10P:	descr = "10-bit Bayer GRGR/BGBG Packed"; break;
+	case V4L2_PIX_FMT_SRGGB10P:	descr = "10-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_IPU3_SBGGR10: descr = "10-bit bayer BGGR IPU3 Packed"; break;
+	case V4L2_PIX_FMT_IPU3_SGBRG10: descr = "10-bit bayer GBRG IPU3 Packed"; break;
+	case V4L2_PIX_FMT_IPU3_SGRBG10: descr = "10-bit bayer GRBG IPU3 Packed"; break;
+	case V4L2_PIX_FMT_IPU3_SRGGB10: descr = "10-bit bayer RGGB IPU3 Packed"; break;
+	case V4L2_PIX_FMT_SBGGR10ALAW8:	descr = "8-bit Bayer BGBG/GRGR (A-law)"; break;
+	case V4L2_PIX_FMT_SGBRG10ALAW8:	descr = "8-bit Bayer GBGB/RGRG (A-law)"; break;
+	case V4L2_PIX_FMT_SGRBG10ALAW8:	descr = "8-bit Bayer GRGR/BGBG (A-law)"; break;
+	case V4L2_PIX_FMT_SRGGB10ALAW8:	descr = "8-bit Bayer RGRG/GBGB (A-law)"; break;
+	case V4L2_PIX_FMT_SBGGR10DPCM8:	descr = "8-bit Bayer BGBG/GRGR (DPCM)"; break;
+	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
+	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
+	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
+	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
+	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
+	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
+	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB14:	descr = "14-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SBGGR14P:	descr = "14-bit Bayer BGBG/GRGR Packed"; break;
+	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
+	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
+	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
+	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
+	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
+	case V4L2_PIX_FMT_SPCA508:	descr = "GSPCA SPCA508"; break;
+	case V4L2_PIX_FMT_STV0680:	descr = "GSPCA STV0680"; break;
+	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
+	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
+	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit Block Format"; break;
+	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
+	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
+	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
+	case V4L2_SDR_FMT_CU16LE:	descr = "Complex U16LE"; break;
+	case V4L2_SDR_FMT_CS8:		descr = "Complex S8"; break;
+	case V4L2_SDR_FMT_CS14LE:	descr = "Complex S14LE"; break;
+	case V4L2_SDR_FMT_RU12LE:	descr = "Real U12LE"; break;
+	case V4L2_SDR_FMT_PCU16BE:	descr = "Planar Complex U16BE"; break;
+	case V4L2_SDR_FMT_PCU18BE:	descr = "Planar Complex U18BE"; break;
+	case V4L2_SDR_FMT_PCU20BE:	descr = "Planar Complex U20BE"; break;
+	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit Signed Deltas"; break;
+	case V4L2_TCH_FMT_DELTA_TD08:	descr = "8-bit Signed Deltas"; break;
+	case V4L2_TCH_FMT_TU16:		descr = "16-bit Unsigned Touch Data"; break;
+	case V4L2_TCH_FMT_TU08:		descr = "8-bit Unsigned Touch Data"; break;
+	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
+	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
+	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
+	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
+	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
+	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
+	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
+	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
+	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr = "10-bit NV12M (8x128 Linear, BE)"; break;
+
+	default:
+		/* Compressed formats */
+		flags = V4L2_FMT_FLAG_COMPRESSED;
+		switch (fmt->pixelformat) {
+		/* Max description length mask:	descr = "0123456789012345678901234567890" */
+		case V4L2_PIX_FMT_MJPEG:	descr = "Motion-JPEG"; break;
+		case V4L2_PIX_FMT_JPEG:		descr = "JFIF JPEG"; break;
+		case V4L2_PIX_FMT_DV:		descr = "1394"; break;
+		case V4L2_PIX_FMT_MPEG:		descr = "MPEG-1/2/4"; break;
+		case V4L2_PIX_FMT_H264:		descr = "H.264"; break;
+		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
+		case V4L2_PIX_FMT_H264_MVC:	descr = "H.264 MVC"; break;
+		case V4L2_PIX_FMT_H264_SLICE:	descr = "H.264 Parsed Slice Data"; break;
+		case V4L2_PIX_FMT_H263:		descr = "H.263"; break;
+		case V4L2_PIX_FMT_MPEG1:	descr = "MPEG-1 ES"; break;
+		case V4L2_PIX_FMT_MPEG2:	descr = "MPEG-2 ES"; break;
+		case V4L2_PIX_FMT_MPEG2_SLICE:	descr = "MPEG-2 Parsed Slice Data"; break;
+		case V4L2_PIX_FMT_MPEG4:	descr = "MPEG-4 Part 2 ES"; break;
+		case V4L2_PIX_FMT_XVID:		descr = "Xvid"; break;
+		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
+		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
+		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
+		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
+		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
+		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
+		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
+		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
+		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
+		case V4L2_PIX_FMT_FWHT_STATELESS:	descr = "FWHT Stateless"; break; /* used in vicodec */
+		case V4L2_PIX_FMT_CPIA1:	descr = "GSPCA CPiA YUV"; break;
+		case V4L2_PIX_FMT_WNVA:		descr = "WNVA"; break;
+		case V4L2_PIX_FMT_SN9C10X:	descr = "GSPCA SN9C10X"; break;
+		case V4L2_PIX_FMT_PWC1:		descr = "Raw Philips Webcam Type (Old)"; break;
+		case V4L2_PIX_FMT_PWC2:		descr = "Raw Philips Webcam Type (New)"; break;
+		case V4L2_PIX_FMT_ET61X251:	descr = "GSPCA ET61X251"; break;
+		case V4L2_PIX_FMT_SPCA561:	descr = "GSPCA SPCA561"; break;
+		case V4L2_PIX_FMT_PAC207:	descr = "GSPCA PAC207"; break;
+		case V4L2_PIX_FMT_MR97310A:	descr = "GSPCA MR97310A"; break;
+		case V4L2_PIX_FMT_JL2005BCD:	descr = "GSPCA JL2005BCD"; break;
+		case V4L2_PIX_FMT_SN9C2028:	descr = "GSPCA SN9C2028"; break;
+		case V4L2_PIX_FMT_SQ905C:	descr = "GSPCA SQ905C"; break;
+		case V4L2_PIX_FMT_PJPG:		descr = "GSPCA PJPG"; break;
+		case V4L2_PIX_FMT_OV511:	descr = "GSPCA OV511"; break;
+		case V4L2_PIX_FMT_OV518:	descr = "GSPCA OV518"; break;
+		case V4L2_PIX_FMT_JPGL:		descr = "JPEG Lite"; break;
+		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
+		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
+		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
+		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
+		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
+		default:
+			if (fmt->description[0])
+				return;
+			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
+			flags = 0;
+			snprintf(fmt->description, sz, "%p4cc",
+				 &fmt->pixelformat);
+			break;
+		}
+	}
+
+	if (descr)
+		WARN_ON(strscpy(fmt->description, descr, sz) < 0);
+	fmt->flags |= flags;
+}
+EXPORT_SYMBOL_GPL(v4l2_fill_fmtdesc);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index fddba75d907458..9693ee39f6dc83 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1251,268 +1251,6 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
 	return ops->vidioc_enum_output(file, fh, p);
 }
 
-static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
-{
-	const unsigned sz = sizeof(fmt->description);
-	const char *descr = NULL;
-	u32 flags = 0;
-
-	/*
-	 * We depart from the normal coding style here since the descriptions
-	 * should be aligned so it is easy to see which descriptions will be
-	 * longer than 31 characters (the max length for a description).
-	 * And frankly, this is easier to read anyway.
-	 *
-	 * Note that gcc will use O(log N) comparisons to find the right case.
-	 */
-	switch (fmt->pixelformat) {
-	/* Max description length mask:	descr = "0123456789012345678901234567890" */
-	case V4L2_PIX_FMT_RGB332:	descr = "8-bit RGB 3-3-2"; break;
-	case V4L2_PIX_FMT_RGB444:	descr = "16-bit A/XRGB 4-4-4-4"; break;
-	case V4L2_PIX_FMT_ARGB444:	descr = "16-bit ARGB 4-4-4-4"; break;
-	case V4L2_PIX_FMT_XRGB444:	descr = "16-bit XRGB 4-4-4-4"; break;
-	case V4L2_PIX_FMT_RGBA444:	descr = "16-bit RGBA 4-4-4-4"; break;
-	case V4L2_PIX_FMT_RGBX444:	descr = "16-bit RGBX 4-4-4-4"; break;
-	case V4L2_PIX_FMT_ABGR444:	descr = "16-bit ABGR 4-4-4-4"; break;
-	case V4L2_PIX_FMT_XBGR444:	descr = "16-bit XBGR 4-4-4-4"; break;
-	case V4L2_PIX_FMT_BGRA444:	descr = "16-bit BGRA 4-4-4-4"; break;
-	case V4L2_PIX_FMT_BGRX444:	descr = "16-bit BGRX 4-4-4-4"; break;
-	case V4L2_PIX_FMT_RGB555:	descr = "16-bit A/XRGB 1-5-5-5"; break;
-	case V4L2_PIX_FMT_ARGB555:	descr = "16-bit ARGB 1-5-5-5"; break;
-	case V4L2_PIX_FMT_XRGB555:	descr = "16-bit XRGB 1-5-5-5"; break;
-	case V4L2_PIX_FMT_ABGR555:	descr = "16-bit ABGR 1-5-5-5"; break;
-	case V4L2_PIX_FMT_XBGR555:	descr = "16-bit XBGR 1-5-5-5"; break;
-	case V4L2_PIX_FMT_RGBA555:	descr = "16-bit RGBA 5-5-5-1"; break;
-	case V4L2_PIX_FMT_RGBX555:	descr = "16-bit RGBX 5-5-5-1"; break;
-	case V4L2_PIX_FMT_BGRA555:	descr = "16-bit BGRA 5-5-5-1"; break;
-	case V4L2_PIX_FMT_BGRX555:	descr = "16-bit BGRX 5-5-5-1"; break;
-	case V4L2_PIX_FMT_RGB565:	descr = "16-bit RGB 5-6-5"; break;
-	case V4L2_PIX_FMT_RGB555X:	descr = "16-bit A/XRGB 1-5-5-5 BE"; break;
-	case V4L2_PIX_FMT_ARGB555X:	descr = "16-bit ARGB 1-5-5-5 BE"; break;
-	case V4L2_PIX_FMT_XRGB555X:	descr = "16-bit XRGB 1-5-5-5 BE"; break;
-	case V4L2_PIX_FMT_RGB565X:	descr = "16-bit RGB 5-6-5 BE"; break;
-	case V4L2_PIX_FMT_BGR666:	descr = "18-bit BGRX 6-6-6-14"; break;
-	case V4L2_PIX_FMT_BGR24:	descr = "24-bit BGR 8-8-8"; break;
-	case V4L2_PIX_FMT_RGB24:	descr = "24-bit RGB 8-8-8"; break;
-	case V4L2_PIX_FMT_BGR32:	descr = "32-bit BGRA/X 8-8-8-8"; break;
-	case V4L2_PIX_FMT_ABGR32:	descr = "32-bit BGRA 8-8-8-8"; break;
-	case V4L2_PIX_FMT_XBGR32:	descr = "32-bit BGRX 8-8-8-8"; break;
-	case V4L2_PIX_FMT_RGB32:	descr = "32-bit A/XRGB 8-8-8-8"; break;
-	case V4L2_PIX_FMT_ARGB32:	descr = "32-bit ARGB 8-8-8-8"; break;
-	case V4L2_PIX_FMT_XRGB32:	descr = "32-bit XRGB 8-8-8-8"; break;
-	case V4L2_PIX_FMT_BGRA32:	descr = "32-bit ABGR 8-8-8-8"; break;
-	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
-	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
-	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
-	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Y10:		descr = "10-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Y12:		descr = "12-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Y14:		descr = "14-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Y16:		descr = "16-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
-	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
-	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
-	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
-	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
-	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
-	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
-	case V4L2_PIX_FMT_CNF4:		descr = "4-bit Depth Confidence (Packed)"; break;
-	case V4L2_PIX_FMT_PAL8:		descr = "8-bit Palette"; break;
-	case V4L2_PIX_FMT_UV8:		descr = "8-bit Chrominance UV 4-4"; break;
-	case V4L2_PIX_FMT_YVU410:	descr = "Planar YVU 4:1:0"; break;
-	case V4L2_PIX_FMT_YVU420:	descr = "Planar YVU 4:2:0"; break;
-	case V4L2_PIX_FMT_YUYV:		descr = "YUYV 4:2:2"; break;
-	case V4L2_PIX_FMT_YYUV:		descr = "YYUV 4:2:2"; break;
-	case V4L2_PIX_FMT_YVYU:		descr = "YVYU 4:2:2"; break;
-	case V4L2_PIX_FMT_UYVY:		descr = "UYVY 4:2:2"; break;
-	case V4L2_PIX_FMT_VYUY:		descr = "VYUY 4:2:2"; break;
-	case V4L2_PIX_FMT_YUV422P:	descr = "Planar YUV 4:2:2"; break;
-	case V4L2_PIX_FMT_YUV411P:	descr = "Planar YUV 4:1:1"; break;
-	case V4L2_PIX_FMT_Y41P:		descr = "YUV 4:1:1 (Packed)"; break;
-	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
-	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
-	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
-	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
-	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
-	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
-	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
-	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
-	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
-	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
-	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
-	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
-	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
-	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
-	case V4L2_PIX_FMT_M420:		descr = "YUV 4:2:0 (M420)"; break;
-	case V4L2_PIX_FMT_NV12:		descr = "Y/CbCr 4:2:0"; break;
-	case V4L2_PIX_FMT_NV21:		descr = "Y/CrCb 4:2:0"; break;
-	case V4L2_PIX_FMT_NV16:		descr = "Y/CbCr 4:2:2"; break;
-	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
-	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
-	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
-	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/CbCr 4:2:0"; break;
-	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/CbCr 4:2:0 (4x4 Linear)"; break;
-	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/CbCr 4:2:0 (16x16 Linear)"; break;
-	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 Linear)"; break;
-	case V4L2_PIX_FMT_P010_4L4:	descr = "10-bit Y/CbCr 4:2:0 (4x4 Linear)"; break;
-	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
-	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
-	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
-	case V4L2_PIX_FMT_NV61M:	descr = "Y/CrCb 4:2:2 (N-C)"; break;
-	case V4L2_PIX_FMT_NV12MT:	descr = "Y/CbCr 4:2:0 (64x32 MB, N-C)"; break;
-	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/CbCr 4:2:0 (16x16 MB, N-C)"; break;
-	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
-	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
-	case V4L2_PIX_FMT_YUV422M:	descr = "Planar YUV 4:2:2 (N-C)"; break;
-	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
-	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
-	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
-	case V4L2_PIX_FMT_SBGGR8:	descr = "8-bit Bayer BGBG/GRGR"; break;
-	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
-	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
-	case V4L2_PIX_FMT_SRGGB8:	descr = "8-bit Bayer RGRG/GBGB"; break;
-	case V4L2_PIX_FMT_SBGGR10:	descr = "10-bit Bayer BGBG/GRGR"; break;
-	case V4L2_PIX_FMT_SGBRG10:	descr = "10-bit Bayer GBGB/RGRG"; break;
-	case V4L2_PIX_FMT_SGRBG10:	descr = "10-bit Bayer GRGR/BGBG"; break;
-	case V4L2_PIX_FMT_SRGGB10:	descr = "10-bit Bayer RGRG/GBGB"; break;
-	case V4L2_PIX_FMT_SBGGR10P:	descr = "10-bit Bayer BGBG/GRGR Packed"; break;
-	case V4L2_PIX_FMT_SGBRG10P:	descr = "10-bit Bayer GBGB/RGRG Packed"; break;
-	case V4L2_PIX_FMT_SGRBG10P:	descr = "10-bit Bayer GRGR/BGBG Packed"; break;
-	case V4L2_PIX_FMT_SRGGB10P:	descr = "10-bit Bayer RGRG/GBGB Packed"; break;
-	case V4L2_PIX_FMT_IPU3_SBGGR10: descr = "10-bit bayer BGGR IPU3 Packed"; break;
-	case V4L2_PIX_FMT_IPU3_SGBRG10: descr = "10-bit bayer GBRG IPU3 Packed"; break;
-	case V4L2_PIX_FMT_IPU3_SGRBG10: descr = "10-bit bayer GRBG IPU3 Packed"; break;
-	case V4L2_PIX_FMT_IPU3_SRGGB10: descr = "10-bit bayer RGGB IPU3 Packed"; break;
-	case V4L2_PIX_FMT_SBGGR10ALAW8:	descr = "8-bit Bayer BGBG/GRGR (A-law)"; break;
-	case V4L2_PIX_FMT_SGBRG10ALAW8:	descr = "8-bit Bayer GBGB/RGRG (A-law)"; break;
-	case V4L2_PIX_FMT_SGRBG10ALAW8:	descr = "8-bit Bayer GRGR/BGBG (A-law)"; break;
-	case V4L2_PIX_FMT_SRGGB10ALAW8:	descr = "8-bit Bayer RGRG/GBGB (A-law)"; break;
-	case V4L2_PIX_FMT_SBGGR10DPCM8:	descr = "8-bit Bayer BGBG/GRGR (DPCM)"; break;
-	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
-	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
-	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
-	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
-	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
-	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
-	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
-	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
-	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
-	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
-	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
-	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
-	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
-	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
-	case V4L2_PIX_FMT_SRGGB14:	descr = "14-bit Bayer RGRG/GBGB"; break;
-	case V4L2_PIX_FMT_SBGGR14P:	descr = "14-bit Bayer BGBG/GRGR Packed"; break;
-	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
-	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
-	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
-	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
-	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
-	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
-	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
-	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
-	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
-	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
-	case V4L2_PIX_FMT_SPCA508:	descr = "GSPCA SPCA508"; break;
-	case V4L2_PIX_FMT_STV0680:	descr = "GSPCA STV0680"; break;
-	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
-	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
-	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
-	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit Block Format"; break;
-	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
-	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
-	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
-	case V4L2_SDR_FMT_CU16LE:	descr = "Complex U16LE"; break;
-	case V4L2_SDR_FMT_CS8:		descr = "Complex S8"; break;
-	case V4L2_SDR_FMT_CS14LE:	descr = "Complex S14LE"; break;
-	case V4L2_SDR_FMT_RU12LE:	descr = "Real U12LE"; break;
-	case V4L2_SDR_FMT_PCU16BE:	descr = "Planar Complex U16BE"; break;
-	case V4L2_SDR_FMT_PCU18BE:	descr = "Planar Complex U18BE"; break;
-	case V4L2_SDR_FMT_PCU20BE:	descr = "Planar Complex U20BE"; break;
-	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit Signed Deltas"; break;
-	case V4L2_TCH_FMT_DELTA_TD08:	descr = "8-bit Signed Deltas"; break;
-	case V4L2_TCH_FMT_TU16:		descr = "16-bit Unsigned Touch Data"; break;
-	case V4L2_TCH_FMT_TU08:		descr = "8-bit Unsigned Touch Data"; break;
-	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
-	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
-	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
-	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
-	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
-	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
-	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
-	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
-	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr = "10-bit NV12M (8x128 Linear, BE)"; break;
-
-	default:
-		/* Compressed formats */
-		flags = V4L2_FMT_FLAG_COMPRESSED;
-		switch (fmt->pixelformat) {
-		/* Max description length mask:	descr = "0123456789012345678901234567890" */
-		case V4L2_PIX_FMT_MJPEG:	descr = "Motion-JPEG"; break;
-		case V4L2_PIX_FMT_JPEG:		descr = "JFIF JPEG"; break;
-		case V4L2_PIX_FMT_DV:		descr = "1394"; break;
-		case V4L2_PIX_FMT_MPEG:		descr = "MPEG-1/2/4"; break;
-		case V4L2_PIX_FMT_H264:		descr = "H.264"; break;
-		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
-		case V4L2_PIX_FMT_H264_MVC:	descr = "H.264 MVC"; break;
-		case V4L2_PIX_FMT_H264_SLICE:	descr = "H.264 Parsed Slice Data"; break;
-		case V4L2_PIX_FMT_H263:		descr = "H.263"; break;
-		case V4L2_PIX_FMT_MPEG1:	descr = "MPEG-1 ES"; break;
-		case V4L2_PIX_FMT_MPEG2:	descr = "MPEG-2 ES"; break;
-		case V4L2_PIX_FMT_MPEG2_SLICE:	descr = "MPEG-2 Parsed Slice Data"; break;
-		case V4L2_PIX_FMT_MPEG4:	descr = "MPEG-4 Part 2 ES"; break;
-		case V4L2_PIX_FMT_XVID:		descr = "Xvid"; break;
-		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
-		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
-		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
-		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
-		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
-		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
-		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
-		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
-		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
-		case V4L2_PIX_FMT_FWHT_STATELESS:	descr = "FWHT Stateless"; break; /* used in vicodec */
-		case V4L2_PIX_FMT_CPIA1:	descr = "GSPCA CPiA YUV"; break;
-		case V4L2_PIX_FMT_WNVA:		descr = "WNVA"; break;
-		case V4L2_PIX_FMT_SN9C10X:	descr = "GSPCA SN9C10X"; break;
-		case V4L2_PIX_FMT_PWC1:		descr = "Raw Philips Webcam Type (Old)"; break;
-		case V4L2_PIX_FMT_PWC2:		descr = "Raw Philips Webcam Type (New)"; break;
-		case V4L2_PIX_FMT_ET61X251:	descr = "GSPCA ET61X251"; break;
-		case V4L2_PIX_FMT_SPCA561:	descr = "GSPCA SPCA561"; break;
-		case V4L2_PIX_FMT_PAC207:	descr = "GSPCA PAC207"; break;
-		case V4L2_PIX_FMT_MR97310A:	descr = "GSPCA MR97310A"; break;
-		case V4L2_PIX_FMT_JL2005BCD:	descr = "GSPCA JL2005BCD"; break;
-		case V4L2_PIX_FMT_SN9C2028:	descr = "GSPCA SN9C2028"; break;
-		case V4L2_PIX_FMT_SQ905C:	descr = "GSPCA SQ905C"; break;
-		case V4L2_PIX_FMT_PJPG:		descr = "GSPCA PJPG"; break;
-		case V4L2_PIX_FMT_OV511:	descr = "GSPCA OV511"; break;
-		case V4L2_PIX_FMT_OV518:	descr = "GSPCA OV518"; break;
-		case V4L2_PIX_FMT_JPGL:		descr = "JPEG Lite"; break;
-		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
-		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
-		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
-		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
-		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
-		default:
-			if (fmt->description[0])
-				return;
-			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
-			flags = 0;
-			snprintf(fmt->description, sz, "%p4cc",
-				 &fmt->pixelformat);
-			break;
-		}
-	}
-
-	if (descr)
-		WARN_ON(strscpy(fmt->description, descr, sz) < 0);
-	fmt->flags |= flags;
-}
-
 static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -1585,7 +1323,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 		break;
 	}
 	if (ret == 0)
-		v4l_fill_fmtdesc(p);
+		v4l2_fill_fmtdesc(p);
 	return ret;
 }
 
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 1bdaea24808947..16c9870f6655d5 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -594,4 +594,6 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
 	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
 }
 
+void v4l2_fill_fmtdesc(struct v4l2_fmtdesc *fmt);
+
 #endif /* V4L2_COMMON_H_ */
-- 
2.30.2

