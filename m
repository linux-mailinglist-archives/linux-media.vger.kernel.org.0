Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EA332D4FA
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 15:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239716AbhCDOJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 09:09:27 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51560 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240014AbhCDOJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 09:09:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D1AF01F46448
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 5/8] media: uapi: Move the VP8 stateless control type out of staging
Date:   Thu,  4 Mar 2021 11:07:52 -0300
Message-Id: <20210304140755.85581-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210304140755.85581-1-ezequiel@collabora.com>
References: <20210304140755.85581-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the VP8 stateless control types out of staging,
and re-number it to avoid any confusion.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 include/media/vp8-ctrls.h      | 1 -
 include/uapi/linux/videodev2.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
index 50c92c5ed0eb..409a87f9e609 100644
--- a/include/media/vp8-ctrls.h
+++ b/include/media/vp8-ctrls.h
@@ -14,7 +14,6 @@
 #include <linux/types.h>
 
 #define V4L2_CID_MPEG_VIDEO_VP8_FRAME (V4L2_CID_CODEC_BASE + 2000)
-#define V4L2_CTRL_TYPE_VP8_FRAME 0x301
 
 #define V4L2_VP8_SEGMENT_FLAG_ENABLED              0x01
 #define V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP           0x02
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a1d903c6f9f0..611b75df7f17 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1793,6 +1793,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    = 0x0205,
 
 	V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
+
+	V4L2_CTRL_TYPE_VP8_FRAME            = 0x0240,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.30.0

