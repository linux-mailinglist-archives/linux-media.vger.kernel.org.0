Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 071448EE92
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733120AbfHOOpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:45:05 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40825 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733112AbfHOOpE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:45:04 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGzohwQmCDqPeyGzvhYZPv; Thu, 15 Aug 2019 16:45:03 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 10/12] videodev2.h: add V4L2_DEC_CMD_FLUSH
Date:   Thu, 15 Aug 2019 16:44:54 +0200
Message-Id: <20190815144456.54583-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFJJyxnZhLHGX3EiV9x6pDL3chEbm25b9AQPuSWu+QTH61TQSF3PoCoxRGMDEyNYhwJdAwRfq9B3XZIXxLSoIuvc5PxrE/MTw7fWQ2iuQT9ysHTDlbZr
 WsX2z1uRuOWpWjsnXyKewZa7SujjIgD2aNDA8vYRAt1uDEf8bEmpc+o2Ia0gj691fKo9/sevbHTe/sWTf2qtOI+Ig/VnKWi4ztcYdrznzuQSeVO1UTYpGLuJ
 0vKKL1dMgMySDhFY3Qozy3Xsg3pd8KOUlIua8tDALnSbzls0zJYs8Q5c27qP4soA8ZFN1uZxjqFazZrCLDhmvmcgftoeINnxUkZ63OM6Hyc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst | 11 ++++++++++-
 Documentation/media/videodev2.h.rst.exceptions      |  1 +
 include/uapi/linux/videodev2.h                      |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
index 57f0066f4cff..0bffef6058f7 100644
--- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
@@ -208,7 +208,16 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
 	been started yet, the driver will return an ``EPERM`` error code. When
 	the decoder is already running, this command does nothing. No
 	flags are defined for this command.
-
+    * - ``V4L2_DEC_CMD_FLUSH``
+      - 4
+      - Flush any held capture buffers. Only valid for stateless decoders,
+        and only if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` was set.
+	This command is typically used when the application reached the
+	end of the stream and the last output buffer had the
+	``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
+	dequeueing the last capture buffer containing the last decoded frame.
+	So this command can be used to explicitly flush that last decoded
+	frame.
 
 Return Value
 ============
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index adeb6b7a15cb..a79028e4d929 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -434,6 +434,7 @@ replace define V4L2_DEC_CMD_START decoder-cmds
 replace define V4L2_DEC_CMD_STOP decoder-cmds
 replace define V4L2_DEC_CMD_PAUSE decoder-cmds
 replace define V4L2_DEC_CMD_RESUME decoder-cmds
+replace define V4L2_DEC_CMD_FLUSH decoder-cmds
 
 replace define V4L2_DEC_CMD_START_MUTE_AUDIO decoder-cmds
 replace define V4L2_DEC_CMD_PAUSE_TO_BLACK decoder-cmds
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4fa9f543742d..91a79e16089c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1978,6 +1978,7 @@ struct v4l2_encoder_cmd {
 #define V4L2_DEC_CMD_STOP        (1)
 #define V4L2_DEC_CMD_PAUSE       (2)
 #define V4L2_DEC_CMD_RESUME      (3)
+#define V4L2_DEC_CMD_FLUSH       (4)
 
 /* Flags for V4L2_DEC_CMD_START */
 #define V4L2_DEC_CMD_START_MUTE_AUDIO	(1 << 0)
-- 
2.20.1

