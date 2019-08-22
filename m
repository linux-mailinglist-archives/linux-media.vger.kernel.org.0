Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF9349A051
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392172AbfHVTpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:45:19 -0400
Received: from mailoutvs4.siol.net ([185.57.226.195]:56104 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392134AbfHVTpS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:45:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id AD1685249F0;
        Thu, 22 Aug 2019 21:45:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id FoNyg35v9do7; Thu, 22 Aug 2019 21:45:14 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 39C155249EB;
        Thu, 22 Aug 2019 21:45:14 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id B87B25249F0;
        Thu, 22 Aug 2019 21:45:11 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        jernej.skrabec@siol.net, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
        jonas@kwiboo.se
Subject: [PATCH 2/8] videodev2.h: add V4L2_DEC_CMD_FLUSH
Date:   Thu, 22 Aug 2019 21:44:54 +0200
Message-Id: <20190822194500.2071-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190822194500.2071-1-jernej.skrabec@siol.net>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst | 11 ++++++++++-
 Documentation/media/videodev2.h.rst.exceptions      |  1 +
 include/uapi/linux/videodev2.h                      |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Docume=
ntation/media/uapi/v4l/vidioc-decoder-cmd.rst
index 57f0066f4cff..0bffef6058f7 100644
--- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
@@ -208,7 +208,16 @@ introduced in Linux 3.3. They are, however, mandator=
y for stateful mem2mem decod
 	been started yet, the driver will return an ``EPERM`` error code. When
 	the decoder is already running, this command does nothing. No
 	flags are defined for this command.
-
+    * - ``V4L2_DEC_CMD_FLUSH``
+      - 4
+      - Flush any held capture buffers. Only valid for stateless decoder=
s,
+        and only if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` was s=
et.
+	This command is typically used when the application reached the
+	end of the stream and the last output buffer had the
+	``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
+	dequeueing the last capture buffer containing the last decoded frame.
+	So this command can be used to explicitly flush that last decoded
+	frame.
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
2.22.1

