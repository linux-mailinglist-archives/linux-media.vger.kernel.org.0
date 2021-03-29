Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A2034D6BC
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 20:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhC2SOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 14:14:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52902 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhC2SOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 14:14:36 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id DFE691F455BD
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 8/9] media: uapi: Move the MPEG-2 stateless control type out of staging
Date:   Mon, 29 Mar 2021 15:13:28 -0300
Message-Id: <20210329181329.48006-9-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210329181329.48006-1-ezequiel@collabora.com>
References: <20210329181329.48006-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the MPEG-2 stateless control types out of staging,
and re-number it to avoid any confusion.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 include/media/mpeg2-ctrls.h    | 4 ----
 include/uapi/linux/videodev2.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 62a8a49c1e8b..9237e1a4befe 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -16,10 +16,6 @@
 #define V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE		(V4L2_CID_CODEC_BASE+253)
 
 /* enum v4l2_ctrl_type type values */
-#define V4L2_CTRL_TYPE_MPEG2_QUANTIZATION 0x0131
-#define V4L2_CTRL_TYPE_MPEG2_SEQUENCE 0x0132
-#define V4L2_CTRL_TYPE_MPEG2_PICTURE 0x0133
-
 #define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE		0x0001
 
 /**
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 8d15f6ccc4b4..558dfc8cb8d8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1804,6 +1804,10 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
 
 	V4L2_CTRL_TYPE_VP8_FRAME            = 0x0240,
+
+	V4L2_CTRL_TYPE_MPEG2_QUANTIZATION   = 0x0250,
+	V4L2_CTRL_TYPE_MPEG2_SEQUENCE       = 0x0251,
+	V4L2_CTRL_TYPE_MPEG2_PICTURE        = 0x0252,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.30.0

