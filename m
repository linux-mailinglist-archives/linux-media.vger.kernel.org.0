Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E7556792
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 13:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfFZL1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 07:27:55 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:57919 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726339AbfFZL1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 07:27:55 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g65chWtPYSfvXg65ghKPM3; Wed, 26 Jun 2019 13:27:52 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/5] v4l2-ioctl: add missing pixelformats
Date:   Wed, 26 Jun 2019 13:27:44 +0200
Message-Id: <20190626112748.31730-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
References: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMKOgTtT8UA5CseeUhsW7bKYG0DGOBH9K5CcM7QLizq6uJ/XU75aFy1DzPREDKwcsgFfkazqGuvsJOfxRAPoXpKBK8awLab+V5+cZ7pAT4MnL5xnr04n
 3sMz5rdinuE6eUGKTiXf/pa0IA+JehRaOrlAMZhmQfxsN5jNuakXNe19TGLqY0Cc8skN06IeufISuCai/XsMVtXdypMZJBGRPzOHxGUDBzf0L2jzWrsN4SlU
 FekXOEsSFN5nkipIuTJzUm4cIPDOkNrC2yvvW9lcc1o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l_fill_fmtdesc() is supposed to be updated whenever a new pixelformat
is added, but a bunch of recently added pixelformats were forgotten.

Update the list.

Also change a few lower case words to upper case to keep the same style.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 29 ++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b1f4b991dba6..c1faa7ca1925 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1169,9 +1169,21 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_RGB444:	descr = "16-bit A/XRGB 4-4-4-4"; break;
 	case V4L2_PIX_FMT_ARGB444:	descr = "16-bit ARGB 4-4-4-4"; break;
 	case V4L2_PIX_FMT_XRGB444:	descr = "16-bit XRGB 4-4-4-4"; break;
+	case V4L2_PIX_FMT_RGBA444:	descr = "16-bit RGBA 4-4-4-4"; break;
+	case V4L2_PIX_FMT_RGBX444:	descr = "16-bit RGBX 4-4-4-4"; break;
+	case V4L2_PIX_FMT_ABGR444:	descr = "16-bit ABGR 4-4-4-4"; break;
+	case V4L2_PIX_FMT_XBGR444:	descr = "16-bit XBGR 4-4-4-4"; break;
+	case V4L2_PIX_FMT_BGRA444:	descr = "16-bit BGRA 4-4-4-4"; break;
+	case V4L2_PIX_FMT_BGRX444:	descr = "16-bit BGRX 4-4-4-4"; break;
 	case V4L2_PIX_FMT_RGB555:	descr = "16-bit A/XRGB 1-5-5-5"; break;
 	case V4L2_PIX_FMT_ARGB555:	descr = "16-bit ARGB 1-5-5-5"; break;
 	case V4L2_PIX_FMT_XRGB555:	descr = "16-bit XRGB 1-5-5-5"; break;
+	case V4L2_PIX_FMT_ABGR555:	descr = "16-bit ABGR 1-5-5-5"; break;
+	case V4L2_PIX_FMT_XBGR555:	descr = "16-bit XBGR 1-5-5-5"; break;
+	case V4L2_PIX_FMT_RGBA555:	descr = "16-bit RGBA 1-5-5-5"; break;
+	case V4L2_PIX_FMT_RGBX555:	descr = "16-bit RGBX 1-5-5-5"; break;
+	case V4L2_PIX_FMT_BGRA555:	descr = "16-bit BGRA 1-5-5-5"; break;
+	case V4L2_PIX_FMT_BGRX555:	descr = "16-bit BGRX 1-5-5-5"; break;
 	case V4L2_PIX_FMT_RGB565:	descr = "16-bit RGB 5-6-5"; break;
 	case V4L2_PIX_FMT_RGB555X:	descr = "16-bit A/XRGB 1-5-5-5 BE"; break;
 	case V4L2_PIX_FMT_ARGB555X:	descr = "16-bit ARGB 1-5-5-5 BE"; break;
@@ -1186,6 +1198,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_RGB32:	descr = "32-bit A/XRGB 8-8-8-8"; break;
 	case V4L2_PIX_FMT_ARGB32:	descr = "32-bit ARGB 8-8-8-8"; break;
 	case V4L2_PIX_FMT_XRGB32:	descr = "32-bit XRGB 8-8-8-8"; break;
+	case V4L2_PIX_FMT_BGRA32:	descr = "32-bit ABGR 8-8-8-8"; break;
+	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
+	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
+	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
 	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
@@ -1301,13 +1317,14 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_SDR_FMT_PCU16BE:	descr = "Planar Complex U16BE"; break;
 	case V4L2_SDR_FMT_PCU18BE:	descr = "Planar Complex U18BE"; break;
 	case V4L2_SDR_FMT_PCU20BE:	descr = "Planar Complex U20BE"; break;
-	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit signed deltas"; break;
-	case V4L2_TCH_FMT_DELTA_TD08:	descr = "8-bit signed deltas"; break;
-	case V4L2_TCH_FMT_TU16:		descr = "16-bit unsigned touch data"; break;
-	case V4L2_TCH_FMT_TU08:		descr = "8-bit unsigned touch data"; break;
+	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit Signed Deltas"; break;
+	case V4L2_TCH_FMT_DELTA_TD08:	descr = "8-bit Signed Deltas"; break;
+	case V4L2_TCH_FMT_TU16:		descr = "16-bit Unsigned Touch Data"; break;
+	case V4L2_TCH_FMT_TU08:		descr = "8-bit Unsigned Touch Data"; break;
 	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
-	case V4L2_META_FMT_UVC:		descr = "UVC payload header metadata"; break;
+	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
+	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
 
 	default:
 		/* Compressed formats */
@@ -1326,7 +1343,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_MPEG1:	descr = "MPEG-1 ES"; break;
 		case V4L2_PIX_FMT_MPEG2:	descr = "MPEG-2 ES"; break;
 		case V4L2_PIX_FMT_MPEG2_SLICE:	descr = "MPEG-2 Parsed Slice Data"; break;
-		case V4L2_PIX_FMT_MPEG4:	descr = "MPEG-4 part 2 ES"; break;
+		case V4L2_PIX_FMT_MPEG4:	descr = "MPEG-4 Part 2 ES"; break;
 		case V4L2_PIX_FMT_XVID:		descr = "Xvid"; break;
 		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
 		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
-- 
2.20.1

