Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA02BC1958
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 22:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbfI2UBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Sep 2019 16:01:24 -0400
Received: from mailoutvs53.siol.net ([185.57.226.244]:54059 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725948AbfI2UBB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Sep 2019 16:01:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 80D195225ED;
        Sun, 29 Sep 2019 22:00:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ksOlhXI3NIxK; Sun, 29 Sep 2019 22:00:57 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 202F452233F;
        Sun, 29 Sep 2019 22:00:57 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 7196F5225ED;
        Sun, 29 Sep 2019 22:00:54 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org
Cc:     gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 2/6] videodev2.h: add V4L2_DEC_CMD_FLUSH
Date:   Sun, 29 Sep 2019 22:00:19 +0200
Message-Id: <20190929200023.215831-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929200023.215831-1-jernej.skrabec@siol.net>
References: <20190929200023.215831-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

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

diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Docume=
ntation/media/uapi/v4l/vidioc-decoder-cmd.rst
index 57f0066f4cff..f1a504836f31 100644
--- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
@@ -208,7 +208,15 @@ introduced in Linux 3.3. They are, however, mandator=
y for stateful mem2mem decod
 	been started yet, the driver will return an ``EPERM`` error code. When
 	the decoder is already running, this command does nothing. No
 	flags are defined for this command.
-
+    * - ``V4L2_DEC_CMD_FLUSH``
+      - 4
+      - Flush any held capture buffers. Only valid for stateless decoder=
s.
+	This command is typically used when the application reached the
+	end of the stream and the last output buffer had the
+	``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
+	dequeueing the capture buffer containing the last decoded frame.
+	So this command can be used to explicitly flush that final decoded
+	frame. This command does nothing if there are no held capture buffers.
=20
 Return Value
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentati=
on/media/videodev2.h.rst.exceptions
index adeb6b7a15cb..a79028e4d929 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -434,6 +434,7 @@ replace define V4L2_DEC_CMD_START decoder-cmds
 replace define V4L2_DEC_CMD_STOP decoder-cmds
 replace define V4L2_DEC_CMD_PAUSE decoder-cmds
 replace define V4L2_DEC_CMD_RESUME decoder-cmds
+replace define V4L2_DEC_CMD_FLUSH decoder-cmds
=20
 replace define V4L2_DEC_CMD_START_MUTE_AUDIO decoder-cmds
 replace define V4L2_DEC_CMD_PAUSE_TO_BLACK decoder-cmds
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
index 4fa9f543742d..91a79e16089c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1978,6 +1978,7 @@ struct v4l2_encoder_cmd {
 #define V4L2_DEC_CMD_STOP        (1)
 #define V4L2_DEC_CMD_PAUSE       (2)
 #define V4L2_DEC_CMD_RESUME      (3)
+#define V4L2_DEC_CMD_FLUSH       (4)
=20
 /* Flags for V4L2_DEC_CMD_START */
 #define V4L2_DEC_CMD_START_MUTE_AUDIO	(1 << 0)
--=20
2.23.0

