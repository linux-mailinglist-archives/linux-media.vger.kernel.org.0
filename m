Return-Path: <linux-media+bounces-1676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D9A8056CC
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 15:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259501F21600
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B00665EAA;
	Tue,  5 Dec 2023 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AJ8+p5C9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FD9183
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 06:08:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 834D8EEE;
	Tue,  5 Dec 2023 15:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701785247;
	bh=xxaJX4+7zmHB04A0VlFE/icGXvSrE3VkuNkkJvSKxgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AJ8+p5C9j0Wo86soHlR6JxuXZFcLVt6DUOPymD1EWm/a6lxMWeR2YECqqgQ0qtEOQ
	 svmSL56dbljeRK/wQh38BRiHXe1nxYkW8tb4qJfxI9fGwf1VRgCsZV0P/sqFPcbLih
	 LMH273gAx5x8iwWasPfk/Zf+zGeTx8w2RhaXYGVE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 4/7] media: docs: uAPI: Clarify error documentation for invalid 'which' value
Date: Tue,  5 Dec 2023 16:08:07 +0200
Message-ID: <20231205140810.22368-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
References: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Invalid values for the 'which' field of structures passed to multiple
subdev ioctls result in an EINVAL error being returned. The
documentation of the corresponding ioctls indicates this with sentences
such as the following:

    the ``which`` field references a non-existing format

This is confusing. Clarify the documentation.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-crop.rst       | 7 +++----
 .../userspace-api/media/v4l/vidioc-subdev-g-fmt.rst        | 5 ++---
 .../media/v4l/vidioc-subdev-g-frame-interval.rst           | 7 +++----
 .../userspace-api/media/v4l/vidioc-subdev-g-selection.rst  | 7 +++----
 4 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
index 1d267f7e7991..92d933631fda 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
@@ -118,10 +118,9 @@ EBUSY
     ``VIDIOC_SUBDEV_S_CROP``
 
 EINVAL
-    The struct :c:type:`v4l2_subdev_crop` ``pad``
-    references a non-existing pad, the ``which`` field references a
-    non-existing format, or cropping is not supported on the given
-    subdev pad.
+    The struct :c:type:`v4l2_subdev_crop` ``pad`` references a non-existing pad,
+    the ``which`` field has an unsupported value, or cropping is not supported
+    on the given subdev pad.
 
 EPERM
     The ``VIDIOC_SUBDEV_S_CROP`` ioctl has been called on a read-only subdevice
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
index ed253a1e44b7..4a2b4e4f0152 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
@@ -140,9 +140,8 @@ EBUSY
     fix the problem first. Only returned by ``VIDIOC_SUBDEV_S_FMT``
 
 EINVAL
-    The struct :c:type:`v4l2_subdev_format`
-    ``pad`` references a non-existing pad, or the ``which`` field
-    references a non-existing format.
+    The struct :c:type:`v4l2_subdev_format` ``pad`` references a non-existing
+    pad, or the ``which`` field has an unsupported value.
 
 EPERM
     The ``VIDIOC_SUBDEV_S_FMT`` ioctl has been called on a read-only subdevice
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
index 41e0e2c8ecc3..c8022809ac35 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
@@ -117,10 +117,9 @@ EBUSY
     ``VIDIOC_SUBDEV_S_FRAME_INTERVAL``
 
 EINVAL
-    The struct
-    :c:type:`v4l2_subdev_frame_interval`
-    ``pad`` references a non-existing pad, the ``which`` field references a
-    non-existing frame interval, or the pad doesn't support frame intervals.
+    The struct :c:type:`v4l2_subdev_frame_interval` ``pad`` references a
+    non-existing pad, the ``which`` field has an unsupported value, or the pad
+    doesn't support frame intervals.
 
 EPERM
     The ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` ioctl has been called on a read-only
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
index 6b629c19168c..19e6c3e9c06d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
@@ -116,10 +116,9 @@ EBUSY
     ``VIDIOC_SUBDEV_S_SELECTION``
 
 EINVAL
-    The struct :c:type:`v4l2_subdev_selection`
-    ``pad`` references a non-existing pad, the ``which`` field
-    references a non-existing format, or the selection target is not
-    supported on the given subdev pad.
+    The struct :c:type:`v4l2_subdev_selection` ``pad`` references a
+    non-existing pad, the ``which`` field has an unsupported value, or the
+    selection target is not supported on the given subdev pad.
 
 EPERM
     The ``VIDIOC_SUBDEV_S_SELECTION`` ioctl has been called on a read-only
-- 
Regards,

Laurent Pinchart


