Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60D82C5170
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389660AbgKZJh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389572AbgKZJh0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:37:26 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E61CC0613D4;
        Thu, 26 Nov 2020 01:37:26 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A60901F4575B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 11/14] media: uapi: Move the H264 stateless control types out of staging
Date:   Thu, 26 Nov 2020 06:36:15 -0300
Message-Id: <20201126093618.137292-12-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126093618.137292-1-ezequiel@collabora.com>
References: <20201126093618.137292-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the H264 stateless control types out of staging,
and re-number them to avoid any confusion.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 include/media/h264-ctrls.h     | 8 --------
 include/uapi/linux/videodev2.h | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index d98c5b885379..c15fed956bf5 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -35,14 +35,6 @@
 #define V4L2_CID_MPEG_VIDEO_H264_START_CODE	(V4L2_CID_CODEC_BASE+1006)
 #define V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS	(V4L2_CID_CODEC_BASE+1007)
 
-/* enum v4l2_ctrl_type type values */
-#define V4L2_CTRL_TYPE_H264_SPS			0x0110
-#define V4L2_CTRL_TYPE_H264_PPS			0x0111
-#define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
-#define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
-#define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
-#define V4L2_CTRL_TYPE_H264_PRED_WEIGHTS	0x0115
-
 /**
  * enum v4l2_mpeg_video_h264_decode_mode - Decoding mode
  *
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index ed6a85f1442e..485654fd2a7e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1780,6 +1780,13 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+
+	V4L2_CTRL_TYPE_H264_SPS             = 0x0200,
+	V4L2_CTRL_TYPE_H264_PPS		    = 0x0201,
+	V4L2_CTRL_TYPE_H264_SCALING_MATRIX  = 0x0202,
+	V4L2_CTRL_TYPE_H264_SLICE_PARAMS    = 0x0203,
+	V4L2_CTRL_TYPE_H264_DECODE_PARAMS   = 0x0204,
+	V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    = 0x0205,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.27.0

