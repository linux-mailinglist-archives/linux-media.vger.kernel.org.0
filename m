Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5986472D76
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbfGXL1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:27:22 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44657 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727560AbfGXL1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:27:21 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qFQSh3s6JLqASqFQVhNKzF; Wed, 24 Jul 2019 13:27:20 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 02/14] videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
Date:   Wed, 24 Jul 2019 13:27:04 +0200
Message-Id: <20190724112716.30288-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBjt76FtKGUO5uZBVzNSx6GHPXxJpZJiO5jFVmbhI66AAsd3bjuB3m7yyUSlyuNY3mWquAscXT8o65IPb9S8p9cYKRxN16rMvB5hbSu9bPgI7YAkcDWO
 iRRmo6OmXVTNBtKaM52Aif03/fH0YUWxcxl4WIVEjmHeB522/v3FYOlsdoErC+lGLq9qAMxF+DIF8v0+0DxrzMOPTrRExD7SSI0GyxL9tHg9l/2Kd82BtJ4I
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an enum_fmt format flag to specifically tag coded formats where
full bitstream parsing is supported by the device.

Some stateful decoders are capable of fully parsing a bitstream,
but others require that userspace pre-parses the bitstream into
frames or fields (see the corresponding pixelformat descriptions
for details).

If this flag is set, then this pre-parsing step is not required
(but still possible, of course).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
 Documentation/media/videodev2.h.rst.exceptions   | 1 +
 include/uapi/linux/videodev2.h                   | 5 +++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index 822d6730e7d2..4e24e671f32e 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
       - This format is not native to the device but emulated through
 	software (usually libv4l2), where possible try to use a native
 	format instead for better performance.
+    * - ``V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER``
+      - 0x0004
+      - The hardware decoder for this compressed bitstream format (aka coded
+	format) is capable of parsing the bitstream. Applications do not
+	need to parse the bitstream themselves to find the boundaries between
+	frames/fields. This flag can only be used in combination with the
+	``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
+	formats only.
 
 
 Return Value
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 55cbe324b9fc..74fb9f00c12d 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -180,6 +180,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
 # V4L2 format flags
 replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
 replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
+replace define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER fmtdesc-flags
 
 # V4L2 tymecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 2427bc4d8eba..8c5a28666b16 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -774,8 +774,9 @@ struct v4l2_fmtdesc {
 	__u32		    reserved[4];
 };
 
-#define V4L2_FMT_FLAG_COMPRESSED 0x0001
-#define V4L2_FMT_FLAG_EMULATED   0x0002
+#define V4L2_FMT_FLAG_COMPRESSED		0x0001
+#define V4L2_FMT_FLAG_EMULATED			0x0002
+#define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER	0x0004
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.20.1

