Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA5F89C5C
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbfHLLH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:07:28 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45235 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728054AbfHLLH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:07:28 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x8AdhQBpVur8Tx8Aghi1Mn; Mon, 12 Aug 2019 13:07:27 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 10/12] videodev2.h: add V4L2_DEC_CMD_FLUSH
Date:   Mon, 12 Aug 2019 13:05:11 +0200
Message-Id: <20190812110513.23774-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEPdHQWClDPlx86TdZU8RO+GNht+Xd+qF/Rh38Zl+cWayOfdzrGdQjLtnz0d8t9M/bVNv8SlGsx3pf8a4mx5KK5LIENy5/bJ7SZvMaqzutKO4cmYC/AI
 WjcG23YCaby6ov1bPdzYlX7sTA5whFQ0jam83hwoi7gw+1E1QDbS4O6es1tt2DxtWBW9+id10bGUN2B4cKAk42Btb71OZwvTKHn949TCfUrXU/YuuQEqKPq9
 YzKRGRtpaR3qr6oXPHdFjg==
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

