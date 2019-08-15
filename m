Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E48408EE8E
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733114AbfHOOpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:45:03 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44285 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731705AbfHOOpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:45:03 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGzohwQmCDqPeyGzshYZO4; Thu, 15 Aug 2019 16:45:01 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 02/12] videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Thu, 15 Aug 2019 16:44:46 +0200
Message-Id: <20190815144456.54583-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFme2n57nAKbPhAyrj7hQg0HSZEodKdCQ9T7onUMIgK2Iln5OZAksLz2HRZ0gIq0/fixp2yLuIqFbDirsCL7E5a9jwlvPaHIRmOCHmZQudYhVbJcepuH
 CRZ4whejOJQg6egcDun9ni9ycewgXgb7F0pKt9U1hQjcQGf7tT60IFJw4BKP4l6i2hT45+dViFUsgIAUBOTZpSMmLqRIypJiSJ202hdULTh1B9+7m1UtOYZO
 gxGXms6dBRQn2bUjBOaWm3OKDjjI58n89XRdAJt2kmARE2lFH+nF+0OOGSitzQjBWekkC38Ma6NIi9vsQN8/t+K9BF/IdGMMTXIWUGd4k+2QhThFNdW6fAtg
 fBu4JqAoocZHZxoSJbibZqKws9n4yKRPACOqXT9dJq+VEjHjp+NCQeYKvsAn3M/ezyw9/rCIrB6bTESkcWVeNaAlhj5w7g==
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
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
 Documentation/media/videodev2.h.rst.exceptions   | 1 +
 include/uapi/linux/videodev2.h                   | 1 +
 3 files changed, 10 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index ebc05ce74bdf..399ef1062bac 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -135,6 +135,14 @@ one until ``EINVAL`` is returned.
 	between frames/fields. This flag can only be used in combination with
 	the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
 	formats only. This flag is valid for stateful decoders only.
+    * - ``V4L2_FMT_FLAG_DYN_RESOLUTION``
+      - 0x0008
+      - Dynamic resolution switching is supported by the device for this
+	compressed bytestream format (aka coded format). It will notify the user
+	via the event ``V4L2_EVENT_SOURCE_CHANGE`` when changes in the video
+	parameters are detected. This flag can only be used in combination
+	with the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
+	compressed formats only. It is also only applies to stateful codecs.
 
 
 Return Value
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index a0640b6d0f68..adeb6b7a15cb 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -181,6 +181,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
 replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
 replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
 replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
+replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 67077d52c59d..530638dffd93 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -777,6 +777,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_COMPRESSED		0x0001
 #define V4L2_FMT_FLAG_EMULATED			0x0002
 #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
+#define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.20.1

