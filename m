Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729DD1E1F61
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 12:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731866AbgEZKJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 06:09:41 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51973 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731791AbgEZKJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 06:09:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dWWajU9GZDazBdWWfjeMA8; Tue, 26 May 2020 12:09:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590487778; bh=M9dx0G/UoFtlTS1Ydg8Q+14FXcpGbNqdVvgcbXnxSX8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=W/RH9j3ZzOtUBuqsNCTBxHBmRgAwWXNBvzBLiOABssEPuTAmk9MqtwdSBzOho3lCq
         TflPHslCC3GkR9SIX/Vfb0wRrloYnFjxDHzKe7K/e6lNqXUu+UkvBq6DdfXGC8VPxZ
         IHpu60W9mqdcxQd6ovry8T/EjOXnUGadlv3UM0K6gVH/FEq0RiiHoEvkVpDiTWAUJd
         8P9lsX0kBKuOQlrnOnVTWpMCGeQyzIF59KIvxT7xaP1mik0yHLEU1sSGbMyMcMSzMP
         SeLK3z1FNPui7ZBB/40iEY5CA5DpCwZyUOlULJgbIj6gijkMCZVEN1Wh3Ph0K7vXdn
         u6p9Oy9Y4KHLg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 4/5] videodev2.h: add V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag
Date:   Tue, 26 May 2020 12:09:31 +0200
Message-Id: <20200526100932.2626420-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLU/x877oZ8J07T/dy4BRHLYUqkq116F8n0FpMovnMHpisdi1zJQ3oUvpdUQXTpaK7ddcNLpFrYtrjAUFsMq0XIZkCqh0qzkcplwvehL428KoeFtskqo
 R5YvVE3exlhdNlULZT8t44z27KwhjI8KYWuRSfOmW+csQzxJLKuFiQHAF/MweNbOsnwBRdZtqfXMfFmu3Ldc5zoDTq5zYHJENByfUfFwTHrVRKNGAQamEPOk
 dpC2B+661YmzlSvfGfOewE7u6hjMskLVLyFVbD69VAquu3QGc1Pz6UZ173ljWZxvwf/sFP8NUUEmULEVxVf/3dbPFtUFzdnjh3OgAc0vi1o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag to signal that
the coded frame interval can be set separately from the raw frame
interval for stateful encoders.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/vidioc-enum-fmt.rst             | 30 +++++++++++++++----
 .../media/videodev2.h.rst.exceptions          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index a53dd3d7f7e2..05835e04c20b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -167,17 +167,37 @@ the ``mbus_code`` field is handled differently:
       - The hardware decoder for this compressed bytestream format (aka coded
 	format) is capable of parsing a continuous bytestream. Applications do
 	not need to parse the bytestream themselves to find the boundaries
-	between frames/fields. This flag can only be used in combination with
-	the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
+	between frames/fields.
+
+	This flag can only be used in combination with the
+	``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
 	formats only. This flag is valid for stateful decoders only.
     * - ``V4L2_FMT_FLAG_DYN_RESOLUTION``
       - 0x0008
       - Dynamic resolution switching is supported by the device for this
 	compressed bytestream format (aka coded format). It will notify the user
 	via the event ``V4L2_EVENT_SOURCE_CHANGE`` when changes in the video
-	parameters are detected. This flag can only be used in combination
-	with the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
-	compressed formats only. It is also only applies to stateful codecs.
+	parameters are detected.
+
+	This flag can only be used in combination with the
+	``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
+	compressed formats only. This flag is valid for stateful codecs only.
+    * - ``V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL``
+      - 0x0010
+      - The hardware encoder supports setting the ``CAPTURE`` coded frame
+	interval separately from the ``OUTPUT`` raw frame interval.
+	Setting the ``OUTPUT`` raw frame interval with :ref:`VIDIOC_S_PARM <VIDIOC_G_PARM>`
+	also sets the ``CAPTURE`` coded frame interval to the same value.
+	If this flag is set, then the ``CAPTURE`` coded frame interval can be
+	set to a different value afterwards. This is typically used for
+	offline encoding where the ``OUTPUT`` raw frame interval is used as
+	a hint for reserving hardware encoder resources and the ``CAPTURE`` coded
+	frame interval is the actual frame rate embedded in the encoded video
+	stream.
+
+	This flag can only be used in combination with the
+	``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
+        compressed formats only. This flag is valid for stateful encoders only.
 
 
 Return Value
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index a625fb90e3a9..ca05e4e126b2 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -187,6 +187,7 @@ replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
 replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
 replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
 replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
+replace define V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3a1cf1c507f..18781f556ad8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -792,6 +792,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_EMULATED			0x0002
 #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
 #define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
+#define V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL	0x0010
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.25.1

