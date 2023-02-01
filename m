Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052BA686B44
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjBAQMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbjBAQMD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:12:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A874751AD
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:12:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 407B861706
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E794CC4339C;
        Wed,  1 Feb 2023 16:12:00 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 5/8] cx18: properly report pixelformats
Date:   Wed,  1 Feb 2023 17:11:50 +0100
Message-Id: <20230201161153.883376-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
References: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

The MPEG device reported non-MPEG pixelformats, and the YUV device reported
the MPEG pixelformat as well.

Separate the two: either report MPEG or HM12/UYUV, not all three.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 61 ++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index af6e72ffe4b7..549aa5e3c898 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -27,6 +27,28 @@
 #include <media/tveeprom.h>
 #include <media/v4l2-event.h>
 
+static const struct v4l2_fmtdesc cx18_formats_yuv[] = {
+	{
+		.index = 0,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.pixelformat = V4L2_PIX_FMT_NV12_16L16,
+	},
+	{
+		.index = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.pixelformat = V4L2_PIX_FMT_UYVY,
+	},
+};
+
+static const struct v4l2_fmtdesc cx18_formats_mpeg[] = {
+	{
+		.index = 0,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+		.pixelformat = V4L2_PIX_FMT_MPEG,
+	},
+};
+
 u16 cx18_service2vbi(int type)
 {
 	switch (type) {
@@ -210,11 +232,18 @@ static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
 
 	w = min(w, 720);
 	w = max(w, 2);
+
 	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
+		if (fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_NV12_16L16 &&
+		    fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_UYVY)
+			fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
 		/* YUV height must be a multiple of 32 */
 		h &= ~0x1f;
 		min_h = 32;
+	} else {
+		fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_MPEG;
 	}
+
 	h = min(h, cx->is_50hz ? 576 : 480);
 	h = max(h, min_h);
 
@@ -463,31 +492,17 @@ static int cx18_g_selection(struct file *file, void *fh,
 static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
 					struct v4l2_fmtdesc *fmt)
 {
-	static const struct v4l2_fmtdesc formats[] = {
-		{
-			.index = 0,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.description = "HM12 (YUV 4:1:1)",
-			.pixelformat = V4L2_PIX_FMT_NV12_16L16,
-		},
-		{
-			.index = 1,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.flags = V4L2_FMT_FLAG_COMPRESSED,
-			.description = "MPEG",
-			.pixelformat = V4L2_PIX_FMT_MPEG,
-		},
-		{
-			.index = 2,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.description = "UYVY 4:2:2",
-			.pixelformat = V4L2_PIX_FMT_UYVY,
-		},
-	};
+	struct cx18_open_id *id = fh2id(fh);
 
-	if (fmt->index > ARRAY_SIZE(formats) - 1)
+	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
+		if (fmt->index >= ARRAY_SIZE(cx18_formats_yuv))
+			return -EINVAL;
+		*fmt = cx18_formats_yuv[fmt->index];
+		return 0;
+	}
+	if (fmt->index)
 		return -EINVAL;
-	*fmt = formats[fmt->index];
+	*fmt = cx18_formats_mpeg[0];
 	return 0;
 }
 
-- 
2.39.0

