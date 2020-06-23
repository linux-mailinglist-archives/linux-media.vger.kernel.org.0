Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38764205AA5
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733228AbgFWS3a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:29:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42806 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387525AbgFWS32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:29:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A3AEC2A3C65
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [RFC 7/7] media: uapi: make H264 stateless codec interface public
Date:   Tue, 23 Jun 2020 15:28:09 -0300
Message-Id: <20200623182809.1375-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200623182809.1375-1-ezequiel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The H264 interface is now ready to be part of the official
public API.

In addition, sanitize header includes.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_hw.h                  | 5 ++---
 include/media/v4l2-ctrls.h                                | 3 ++-
 include/media/v4l2-h264.h                                 | 2 +-
 .../{media/h264-ctrls.h => uapi/linux/v4l2-h264-ctrls.h}  | 8 ++------
 4 files changed, 7 insertions(+), 11 deletions(-)
 rename include/{media/h264-ctrls.h => uapi/linux/v4l2-h264-ctrls.h} (96%)

diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 4053d8710e04..48d5be144319 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -11,9 +11,8 @@
 
 #include <linux/interrupt.h>
 #include <linux/v4l2-controls.h>
-#include <media/h264-ctrls.h>
-#include <media/mpeg2-ctrls.h>
-#include <media/vp8-ctrls.h>
+
+#include <media/v4l2-ctrls.h>
 #include <media/videobuf2-core.h>
 
 #define DEC_8190_ALIGN_MASK	0x07U
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index f40e2cbb21d3..fc725ba2ebd8 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -13,13 +13,14 @@
 #include <linux/videodev2.h>
 #include <media/media-request.h>
 
+#include <linux/v4l2-h264-ctrls.h>
+
 /*
  * Include the stateless codec compound control definitions.
  * This will move to the public headers once this API is fully stable.
  */
 #include <media/mpeg2-ctrls.h>
 #include <media/fwht-ctrls.h>
-#include <media/h264-ctrls.h>
 #include <media/vp8-ctrls.h>
 #include <media/hevc-ctrls.h>
 
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index f08ba181263d..d2314f4d4490 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -10,7 +10,7 @@
 #ifndef _MEDIA_V4L2_H264_H
 #define _MEDIA_V4L2_H264_H
 
-#include <media/h264-ctrls.h>
+#include <media/v4l2-ctrls.h>
 
 /**
  * struct v4l2_h264_reflist_builder - Reference list builder object
diff --git a/include/media/h264-ctrls.h b/include/uapi/linux/v4l2-h264-ctrls.h
similarity index 96%
rename from include/media/h264-ctrls.h
rename to include/uapi/linux/v4l2-h264-ctrls.h
index 6446ec9f283d..a06f60670d68 100644
--- a/include/media/h264-ctrls.h
+++ b/include/uapi/linux/v4l2-h264-ctrls.h
@@ -2,14 +2,10 @@
 /*
  * These are the H.264 state controls for use with stateless H.264
  * codec drivers.
- *
- * It turns out that these structs are not stable yet and will undergo
- * more changes. So keep them private until they are stable and ready to
- * become part of the official public API.
  */
 
-#ifndef _H264_CTRLS_H_
-#define _H264_CTRLS_H_
+#ifndef __LINUX_V4L2_H264_CONTROLS_H
+#define __LINUX_V4L2_H264_CONTROLS_H
 
 #include <linux/videodev2.h>
 
-- 
2.26.0.rc2

