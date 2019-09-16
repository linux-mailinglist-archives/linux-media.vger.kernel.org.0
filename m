Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661C0B37BA
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 12:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732059AbfIPKEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 06:04:38 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39815 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730643AbfIPKEh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 06:04:37 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9ns1iUw5J8SjN9ns2iWvYp; Mon, 16 Sep 2019 12:04:35 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv2 1/2] v4l: Add macros for printing V4L fourcc values
Date:   Mon, 16 Sep 2019 12:04:32 +0200
Message-Id: <20190916100433.24367-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGmgH9ieCyUZoHYFPdCogTq9MxB91DM7Nidj0AS8dV5zdS6z6AMk/CKpemCrBqBcz/C4PjFCY7Hr5TtUb+B+KJB6HCHwub/+WkLTMIiBoDuwZSZrTmi1
 nDH35Wyqfw14+yo9qO24AemtHvwZ5KtwEaviUlesm2GKSvqcoVsaa2bAgRw+s6xc+p5QLD7WSL4MV54eFOC+LO+MJfCL+SciFbkIQUyjNnJftjX4izCFKJY9
 rQrcw/+4KmifSe9pV9lMf/cBFk527c75VDlBE/dBF3Qi3qttEYbNmng6yDveT4KTAkz5uxMdzavHSI8XNPY5LP9PlndxsfZhL/wFMQZJ/tvnVumUa3STVINH
 tIa6sAWPEm+CbMxHYeH+Xlo2qDYKcg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Add two macros that facilitate printing V4L fourcc values with printf
family of functions. v4l2_fourcc_conv provides the printf conversion
specifier for printing formats and v4l2_fourcc_args provides the actual
arguments for that conversion specifier.

These macros are useful in both user and kernel code whenever you want
to report a pixelformat, therefore put them into videodev2.h.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[hverkuil-cisco@xs4all.nl: rename v4l2_fourcc_to_conv to v4l2_fourcc_args]
[hverkuil-cisco@xs4all.nl: add () around ? : expression]
[hverkuil-cisco@xs4all.nl: add comment about fourcc reuse]
[hverkuil-cisco@xs4all.nl: update Documentation/media/videodev2.h.rst.exceptions]
---
 .../media/videodev2.h.rst.exceptions          |  2 ++
 include/uapi/linux/videodev2.h                | 27 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index adeb6b7a15cb..35eb513d82a6 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -508,6 +508,8 @@ ignore define VIDEO_MAX_FRAME
 ignore define VIDEO_MAX_PLANES
 ignore define v4l2_fourcc
 ignore define v4l2_fourcc_be
+ignore define v4l2_fourcc_conv
+ignore define v4l2_fourcc_args
 ignore define V4L2_FIELD_HAS_TOP
 ignore define V4L2_FIELD_HAS_BOTTOM
 ignore define V4L2_FIELD_HAS_BOTH
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..aa8acbdc88c9 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -82,6 +82,33 @@
 	((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
 #define v4l2_fourcc_be(a, b, c, d)	(v4l2_fourcc(a, b, c, d) | (1U << 31))
 
+/**
+ * v4l2_fourcc_conv - Printf fourcc conversion specifiers for V4L2 formats
+ *
+ * Use as part of the format string. The values are obtained using
+ * @v4l2_fourcc_args macro.
+ *
+ * Example ("format" is the V4L2 pixelformat in __u32):
+ *
+ * printf("V4L2 format is: " v4l2_fourcc_conv "\n", v4l2_fourcc_args(format);
+ */
+#define v4l2_fourcc_conv "%c%c%c%c%s"
+
+/**
+ * v4l2_fourcc_args - Arguments for V4L2 fourcc format conversion
+ *
+ * @fourcc: V4L2 pixelformat, as in __u32
+ *
+ * Yields to a comma-separated list of arguments for printf that matches with
+ * conversion specifiers provided by @v4l2_fourcc_conv.
+ *
+ * Note that v4l2_fourcc_args reuses fourcc, so this can't be an expression
+ * with side-effects.
+ */
+#define v4l2_fourcc_args(fourcc)					\
+	(fourcc) & 0x7f, ((fourcc) >> 8) & 0x7f, ((fourcc) >> 16) & 0x7f, \
+	((fourcc) >> 24) & 0x7f, ((fourcc) & (1 << 31) ? "-BE" : "")
+
 /*
  *	E N U M S
  */
-- 
2.20.1

