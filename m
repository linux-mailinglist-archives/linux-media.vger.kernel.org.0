Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2AB572D77
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfGXL1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:27:23 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51671 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727562AbfGXL1W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:27:22 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qFQSh3s6JLqASqFQWhNKzL; Wed, 24 Jul 2019 13:27:20 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH 03/14] videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Wed, 24 Jul 2019 13:27:05 +0200
Message-Id: <20190724112716.30288-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBjt76FtKGUO5uZBVzNSx6GHPXxJpZJiO5jFVmbhI66AAsd3bjuB3m7yyUSlyuNY3mWquAscXT8o65IPb9S8p9cYKRxN16rMvB5hbSu9bPgI7YAkcDWO
 iRRmo6OmXVTNBlPpuzvF+qHWs1xHchk6/cug7RUTIVEQ8SsPHqLDcNRayME7HhwdCmC+NSb2uHD8p/6pw0lrdPF/bFBGlnqNhoahEkWlC7ebn/3OIPntF52k
 ttdB9R5Pv4VxjxrFnqUL9VkPTSG30Xxzc5iO271sqYmgBieyVAU53PABr54WQrKH
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add an enum_fmt format flag to specifically tag coded formats where
dynamic resolution switching is supported by the device.

This is useful for some codec drivers that can support dynamic
resolution switching for one or more of their listed coded formats. It
allows userspace to know whether it should extract the video parameters
itself, or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE
when such changes are detected.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[hverkuil-cisco@xs4all.nl: added flag to videodev2.h.rst.exceptions]
[hverkuil-cisco@xs4all.nl: updated commit text: 'one or more' instead of 'all']
Acked-by: Tomasz Figa <tfiga@chromium.org>
---
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
 Documentation/media/videodev2.h.rst.exceptions   | 1 +
 include/uapi/linux/videodev2.h                   | 1 +
 3 files changed, 10 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index 4e24e671f32e..05454780cb21 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -135,6 +135,14 @@ one until ``EINVAL`` is returned.
 	frames/fields. This flag can only be used in combination with the
 	``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
 	formats only.
+    * - ``V4L2_FMT_FLAG_DYN_RESOLUTION``
+      - 0x0008
+      - Dynamic resolution switching is supported by the device for this
+	compressed bitstream format (aka coded format). It will notify the user
+	via the event ``V4L2_EVENT_SOURCE_CHANGE`` when changes in the video
+	parameters are detected. This flag can only be used in combination
+	with the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
+	compressed formats only.
 
 
 Return Value
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 74fb9f00c12d..0a9a1b386443 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -181,6 +181,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
 replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
 replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
 replace define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER fmtdesc-flags
+replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
 
 # V4L2 tymecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 8c5a28666b16..ed572b05bd25 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -777,6 +777,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_COMPRESSED		0x0001
 #define V4L2_FMT_FLAG_EMULATED			0x0002
 #define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER	0x0004
+#define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.20.1

