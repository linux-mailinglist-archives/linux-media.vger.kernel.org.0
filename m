Return-Path: <linux-media+bounces-2364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A29811572
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 16:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DA2CB21268
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABF430CFD;
	Wed, 13 Dec 2023 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WSt5J8er"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3268B0
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 07:00:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 752B6BD1;
	Wed, 13 Dec 2023 15:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702479566;
	bh=eS3k+4MnPnp+SbGYcNIWwXIR4/XUKN+aIsudG5SSp8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WSt5J8erstU6QRqOUGWSlTRQrWUC1AW7gGJ9WYWTbsFaUyJaK8KxWf/tUtYQUJpDi
	 3YS1Gg2Qaksz/QLO7kyVvJIBRuFjf5zhhbkLGCW+GCscUcoFiD/kv1U0fk1mznJXmK
	 cqO60NI4jIpvKk/pOY5B4NUM3vc3LFgzhMe5T5x8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v6 6/8] media: docs: uAPI: Expand error documentation for invalid 'which' value
Date: Wed, 13 Dec 2023 17:00:08 +0200
Message-ID: <20231213150010.25593-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
References: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple subdev ioctls that take a 'which' field do not document the
error returned when the field has an invalid value. Expand the
documentation to fix this.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/vidioc-subdev-enum-frame-interval.rst      | 9 ++++-----
 .../media/v4l/vidioc-subdev-enum-frame-size.rst          | 7 +++----
 .../media/v4l/vidioc-subdev-enum-mbus-code.rst           | 7 +++----
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst  | 5 +++--
 4 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
index 8def4c05d3da..c935bacc3bc2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
@@ -107,8 +107,7 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 EINVAL
-    The struct
-    :c:type:`v4l2_subdev_frame_interval_enum`
-    ``pad`` references a non-existing pad, one of the ``code``,
-    ``width`` or ``height`` fields are invalid for the given pad or the
-    ``index`` field is out of bounds.
+    The struct :c:type:`v4l2_subdev_frame_interval_enum` ``pad`` references a
+    non-existing pad, the ``which`` field has an unsupported value, one of the
+    ``code``, ``width`` or ``height`` fields are invalid for the given pad, or
+    the ``index`` field is out of bounds.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
index e3ae84df5486..65f0cfeca973 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
@@ -126,7 +126,6 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 EINVAL
-    The struct
-    :c:type:`v4l2_subdev_frame_size_enum`
-    ``pad`` references a non-existing pad, the ``code`` is invalid for
-    the given pad or the ``index`` field is out of bounds.
+    The struct :c:type:`v4l2_subdev_frame_size_enum` ``pad`` references a
+    non-existing pad, the ``which`` field has an unsupported value, the ``code``
+    is invalid for the given pad, or the ``index`` field is out of bounds.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
index 4ad7dec27e25..3050966b199f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
@@ -158,7 +158,6 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 EINVAL
-    The struct
-    :c:type:`v4l2_subdev_mbus_code_enum`
-    ``pad`` references a non-existing pad, or the ``index`` field is out
-    of bounds.
+    The struct :c:type:`v4l2_subdev_mbus_code_enum` ``pad`` references a
+    non-existing pad, the ``which`` field has an unsupported value, or the
+    ``index`` field is out of bounds.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 72677a280cd6..791c1e628d5c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -140,8 +140,9 @@ ENOSPC
    all the available routes the subdevice exposes.
 
 EINVAL
-   The sink or source pad identifiers reference a non-existing pad, or reference
-   pads of different types (ie. the sink_pad identifiers refers to a source pad).
+   The sink or source pad identifiers reference a non-existing pad or reference
+   pads of different types (ie. the sink_pad identifiers refers to a source
+   pad), or the ``which`` field has an unsupported value.
 
 E2BIG
    The application provided ``num_routes`` for ``VIDIOC_SUBDEV_S_ROUTING`` is
-- 
Regards,

Laurent Pinchart


