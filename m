Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6F5D2A7D
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388057AbfJJNL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:11:57 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47521 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388035AbfJJNL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:11:57 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:bc04:8998:8ec1:1871])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IYESijV5zop0AIYEUiU375; Thu, 10 Oct 2019 15:11:55 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 3/8] videodev2.h: add V4L2_DEC_CMD_FLUSH
Date:   Thu, 10 Oct 2019 15:11:47 +0200
Message-Id: <20191010131152.68984-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNehpzSLnwlvZCmgg+1Ed3QLNwLhTgLyDEARzq26bl01ROW8oYfQHHZ8iaPuJ+C4VvD8UsQDPTP2OcGQcAjep1uSm2rhnnnyWj7aCfT41PisMe6yi5zC
 jFpxptS8fR0CFoPZ752VdOautT6W1W6gW5bwyjrecdsx7WAoJs0JFx8GHQMJOgE36du63az8K4GLmhxZAhXu+SLojg38dxgA1AKcCfN049Qg6e3SiqEgoVFy
 mfW4Kn3bkLFsgdQ9tXriP6awJfpdVpqcqNjqzSk4Rfq+rWTP2LVbhR4HhRUlauNXWPfEz43hJbVboKbhBgWzcEzG2N87BOTe7XhaOcKM7cyXnsqI13ZfhFk6
 a5rwVY9uimZ+CRBVTjRFQXu9yiKGiqv04OlCmm20K3PpNLTx6cHfYnEekhjNk+vjnrMeTyNRyEDg3pvWejAVN9NtaOJUa4ykj23/a4+mO7Sfo1Im2vtru818
 BMZ67rVqlJFAV7cYd4S3AN9xYJqGvnHnO72dIkWhZPSBpZyCP8APb3A/1HiJaJ7FlkcyF1wqTiUcyCJz0sZqBnhOb8LCospvuNPEQw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[Adjusted description]
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst | 10 +++++++++-
 Documentation/media/videodev2.h.rst.exceptions      |  1 +
 include/uapi/linux/videodev2.h                      |  1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
index 57f0066f4cff..f1a504836f31 100644
--- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
@@ -208,7 +208,15 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
 	been started yet, the driver will return an ``EPERM`` error code. When
 	the decoder is already running, this command does nothing. No
 	flags are defined for this command.
-
+    * - ``V4L2_DEC_CMD_FLUSH``
+      - 4
+      - Flush any held capture buffers. Only valid for stateless decoders.
+	This command is typically used when the application reached the
+	end of the stream and the last output buffer had the
+	``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
+	dequeueing the capture buffer containing the last decoded frame.
+	So this command can be used to explicitly flush that final decoded
+	frame. This command does nothing if there are no held capture buffers.
 
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
2.23.0

