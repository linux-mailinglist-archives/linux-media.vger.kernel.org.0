Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA0CD3C5E
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfJKJcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:32:50 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42383 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727628AbfJKJct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:32:49 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IrHxixmWhjZ8vIrHziRKjM; Fri, 11 Oct 2019 11:32:47 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 3/6] videodev2.h: add V4L2_DEC_CMD_FLUSH
Date:   Fri, 11 Oct 2019 11:32:42 +0200
Message-Id: <20191011093245.33366-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
References: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFv/7qNpfmVbnIJ/xmr9gUdIdi33yDJQ9mfG03ySrqcndY7GpTCgB697IjgR55ob4jHfPPDO4c9aONuhGHEiQ7rnoWv/4S4l8pcVM924VrlxEGQ+L3dy
 qnbf4xhH17soiy8VW29pfyad9zvbR0J3fbb9jtxuoQdRYonjlnmay+mx33L/H3gv5xCmWj5c4h1k4573ZkekDZQULtoS7VQNtKSBgz1Y8kBFL1TwKGpnhcKp
 qrD/+tv6l7eGCbcWccPRazY8E0Z1G0fDQGoz8ceqpe+X4PGFzQW5kq+jQENteQ5t8aD+Hh5FS48J8uqhZPn4UZRC39pwhhnRKJD5GZbIZDVpotH09LbNChU1
 XozPKJEMUwAgF5o4FFLY8P03axec5Ca1cZMI+y+pAoSASJ8bOZqKiwCmj6E7LwhuGsE0ffageiKKJw03UoYy5LrE8yOLERAtYQKvZc6CRBBOwFsmLmoMm9n0
 RyAK3P2F3ejX2cfHM6BiaNDKs0tfsDQPrWEwNzdGVH+uQhEysr344PtoCQ8WX8B0cBYbm21P0mSUTyyzqC1sPwX90+oUXa6eOyUOUQ==
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
index b58e381bdf7b..c23e5ef30c78 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -435,6 +435,7 @@ replace define V4L2_DEC_CMD_START decoder-cmds
 replace define V4L2_DEC_CMD_STOP decoder-cmds
 replace define V4L2_DEC_CMD_PAUSE decoder-cmds
 replace define V4L2_DEC_CMD_RESUME decoder-cmds
+replace define V4L2_DEC_CMD_FLUSH decoder-cmds
 
 replace define V4L2_DEC_CMD_START_MUTE_AUDIO decoder-cmds
 replace define V4L2_DEC_CMD_PAUSE_TO_BLACK decoder-cmds
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9f4e66affac4..d969842bbfe2 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1984,6 +1984,7 @@ struct v4l2_encoder_cmd {
 #define V4L2_DEC_CMD_STOP        (1)
 #define V4L2_DEC_CMD_PAUSE       (2)
 #define V4L2_DEC_CMD_RESUME      (3)
+#define V4L2_DEC_CMD_FLUSH       (4)
 
 /* Flags for V4L2_DEC_CMD_START */
 #define V4L2_DEC_CMD_START_MUTE_AUDIO	(1 << 0)
-- 
2.23.0

