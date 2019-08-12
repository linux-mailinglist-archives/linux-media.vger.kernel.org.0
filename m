Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB5489C47
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbfHLLFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:05:22 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43745 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727980AbfHLLFU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:05:20 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x88XhQAyTur8Tx88bhi10y; Mon, 12 Aug 2019 13:05:18 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 02/12] videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Mon, 12 Aug 2019 13:05:03 +0200
Message-Id: <20190812110513.23774-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDRv5jbgUAiVk0jpFvYjwj97C4WdO/qhGKfS4rRlt1tQ00u/EadhKZypAT5d3IIVBop0Yes7I9V+7rYquh9uyqTLdHIqtDOFtB4Ax1x4n1ITUOo/4ZMf
 FTQ6GjZ7emIzhqZPAxLLEx02QTUVLyjtzgRUkR8nle4EUewS/Si7eSxh7ItEyP9279Qofv3k7LS42HlBz1yjEFa1pxG/IK/8H3zD4TeuwPwktrxRLBkSLuwb
 +CqII/Y2dvA6UkZ8nusabdWMQH9ll1L0AatwykHRaC1oJWWmOxHP2QQ8xkIdUcTj
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
index ebc05ce74bdf..719f1ed64f7d 100644
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
+	compressed formats only.
 
 
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

