Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10FD01A5E76
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 14:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgDLMFP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 08:05:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37300 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgDLMFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 08:05:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 25E4E2A079A
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, sakari.ailus@linux.intel.com
Subject: [PATCH v2 2/4] media: staging: rkisp1: rsz: remove redundant if statement and add inline doc
Date:   Sun, 12 Apr 2020 14:05:02 +0200
Message-Id: <20200412120504.6536-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200412120504.6536-1-dafna.hirschfeld@collabora.com>
References: <20200412120504.6536-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The statement "if (rsz->fmt_type == V4L2_PIXEL_ENC_YUV)"
can be removed since the value of rsz->fmt_type is either
V4L2_PIXEL_ENC_YUV or V4L2_PIXEL_ENC_BAYER and the function
returns if it is bayer. In addition some doc with clarification
is added.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 84f23a91b0a0..c28919b9af44 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -365,12 +365,17 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	struct v4l2_rect sink_y, sink_c, src_y, src_c;
 	struct v4l2_mbus_framefmt *src_fmt;
 	struct v4l2_rect *sink_crop;
+	struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
 
 	sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
 					    V4L2_SUBDEV_FORMAT_ACTIVE);
 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SRC,
 					 V4L2_SUBDEV_FORMAT_ACTIVE);
 
+	/*
+	 * The resizer only works on yuv formats,
+	 * so return if it is bayer format.
+	 */
 	if (rsz->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		rkisp1_rsz_disable(rsz, when);
 		return;
@@ -384,13 +389,15 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	sink_c.width = sink_y.width / RKISP1_MBUS_FMT_HDIV;
 	sink_c.height = sink_y.height / RKISP1_MBUS_FMT_VDIV;
 
-	if (rsz->pixel_enc == V4L2_PIXEL_ENC_YUV) {
-		struct rkisp1_capture *cap =
-			&rsz->rkisp1->capture_devs[rsz->id];
+	/*
+	 * The resizer is used not only to change the dimensions of the frame
+	 * but also to change the scale for YUV formats,
+	 * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
+	 * streams should be set according to the pixel format in the capture.
+	 */
+	hdiv = cap->pix.info->hdiv;
+	vdiv = cap->pix.info->vdiv;
 
-		hdiv = cap->pix.info->hdiv;
-		vdiv = cap->pix.info->vdiv;
-	}
 	src_c.width = src_y.width / hdiv;
 	src_c.height = src_y.height / vdiv;
 
-- 
2.17.1

