Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5958EE8C
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733110AbfHOOpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:45:03 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40825 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729838AbfHOOpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:45:02 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGzohwQmCDqPeyGzshYZNs; Thu, 15 Aug 2019 16:45:00 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCHv3 01/12] videodev2.h: add V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM
Date:   Thu, 15 Aug 2019 16:44:45 +0200
Message-Id: <20190815144456.54583-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOajmO4q3wgtw9t0QgB5QXsGXI70VVbVGSdSxzj86oBITZhiebp1TAGgCUXVUkmcPPM/7Ia1fkHOy+u8QAPfky4X4Bpb9hbx2AcFztodO45PdTk604Pf
 07SUGa4nWuX9aPB81/l1ya86sPTavOyJVCagf1+VO4wbB4OWggA6VFofW6GWLPIUJCqydLTLwrY+bTuJaqmAwG7nhkX/1hXcJnICmuAxxfZbULKSpZUH28Cb
 EPW271fAvULDHafb2Udsb8S4leasoaHRjcGaJOmCVVPVpsQU31SwyrfM8jf0/OgoT+4iicZW/L5IZ5oYQSd2RhXXNxG+p6epeYCZza0Vhdomwsycbz0vcdym
 pyV3JxZ9oFHYLFjVPlH4/9XF1j7KgAXISsGK363aBveeB3Pbf1THsmHkOp7GCY8etNdRblXk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an enum_fmt format flag to specifically tag coded formats where
full bytestream parsing is supported by the device.

Some stateful decoders are capable of fully parsing a bytestream,
but others require that userspace pre-parses the bytestream into
frames or fields (see the corresponding pixelformat descriptions
for details).

If this flag is set, then this pre-parsing step is not required
(but still possible, of course).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
 Documentation/media/videodev2.h.rst.exceptions   | 1 +
 include/uapi/linux/videodev2.h                   | 5 +++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index 822d6730e7d2..ebc05ce74bdf 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
       - This format is not native to the device but emulated through
 	software (usually libv4l2), where possible try to use a native
 	format instead for better performance.
+    * - ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
+      - 0x0004
+      - The hardware decoder for this compressed bytestream format (aka coded
+	format) is capable of parsing a continuous bytestream. Applications do
+	not need to parse the bytestream themselves to find the boundaries
+	between frames/fields. This flag can only be used in combination with
+	the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
+	formats only. This flag is valid for stateful decoders only.
 
 
 Return Value
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 8e7d3492d248..a0640b6d0f68 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -180,6 +180,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
 # V4L2 format flags
 replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
 replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
+replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 2427bc4d8eba..67077d52c59d 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -774,8 +774,9 @@ struct v4l2_fmtdesc {
 	__u32		    reserved[4];
 };
 
-#define V4L2_FMT_FLAG_COMPRESSED 0x0001
-#define V4L2_FMT_FLAG_EMULATED   0x0002
+#define V4L2_FMT_FLAG_COMPRESSED		0x0001
+#define V4L2_FMT_FLAG_EMULATED			0x0002
+#define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.20.1

