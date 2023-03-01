Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C55CD6A6B9A
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjCALTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjCALTG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:19:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5937E1C596
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:19:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1C50CB8100E
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5151EC433EF;
        Wed,  1 Mar 2023 11:19:01 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 9/9] Documentation: userspace-api: media: drop clipping, destructive overlays
Date:   Wed,  1 Mar 2023 12:18:50 +0100
Message-Id: <20230301111850.607515-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
References: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support for clipping for overlays has been removed, update the
documentation.

Support for destructive overlay support has been removed as well,
also update the documentation for this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/dev-overlay.rst   | 10 +++-
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst | 52 ++++++-------------
 2 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-overlay.rst b/Documentation/userspace-api/media/v4l/dev-overlay.rst
index 4f4b23b95b9b..d52977120b41 100644
--- a/Documentation/userspace-api/media/v4l/dev-overlay.rst
+++ b/Documentation/userspace-api/media/v4l/dev-overlay.rst
@@ -67,6 +67,7 @@ ioctls must be supported by all video overlay devices.
 Setup
 =====
 
+*Note: support for this has been removed.*
 Before overlay can commence applications must program the driver with
 frame buffer parameters, namely the address and size of the frame buffer
 and the image format, for example RGB 5:6:5. The
@@ -92,11 +93,13 @@ A driver may support any (or none) of five clipping/blending methods:
 1. Chroma-keying displays the overlaid image only where pixels in the
    primary graphics surface assume a certain color.
 
-2. A bitmap can be specified where each bit corresponds to a pixel in
+2. *Note: support for this has been removed.*
+   A bitmap can be specified where each bit corresponds to a pixel in
    the overlaid image. When the bit is set, the corresponding video
    pixel is displayed, otherwise a pixel of the graphics surface.
 
-3. A list of clipping rectangles can be specified. In these regions *no*
+3. *Note: support for this has been removed.*
+   A list of clipping rectangles can be specified. In these regions *no*
    video is displayed, so the graphics surface can be seen here.
 
 4. The framebuffer has an alpha channel that can be used to clip or
@@ -185,6 +188,7 @@ struct v4l2_window
     be 0xRRGGBB on a little endian, 0xBBGGRR on a big endian host.
 
 ``struct v4l2_clip * clips``
+    *Note: support for this has been removed.*
     When chroma-keying has *not* been negotiated and
     :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>` indicated this capability,
     applications can set this field to point to an array of clipping
@@ -201,6 +205,7 @@ struct v4l2_window
     are undefined.
 
 ``__u32 clipcount``
+    *Note: support for this has been removed.*
     When the application set the ``clips`` field, this field must
     contain the number of clipping rectangles in the list. When clip
     lists are not supported the driver ignores this field, its contents
@@ -208,6 +213,7 @@ struct v4l2_window
     supported but no clipping is desired this field must be set to zero.
 
 ``void * bitmap``
+    *Note: support for this has been removed.*
     When chroma-keying has *not* been negotiated and
     :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>` indicated this capability,
     applications can set this field to point to a clipping bit mask.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
index b6cc1a823207..b651e53643dd 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
@@ -49,6 +49,9 @@ of a graphics card. A non-destructive overlay blends video images into a
 VGA signal or graphics into a video signal. *Video Output Overlays* are
 always non-destructive.
 
+Destructive overlay support has been removed: with modern GPUs and CPUs
+this is no longer needed, and it was always a very dangerous feature.
+
 To get the current parameters applications call the :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`
 ioctl with a pointer to a struct :c:type:`v4l2_framebuffer`
 structure. The driver fills all fields of the structure or returns an
@@ -63,18 +66,12 @@ this structure, the driver prepares for the overlay and returns the
 framebuffer parameters as :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>` does, or it returns an error
 code.
 
-To set the parameters for a *non-destructive Video Overlay*,
+To set the parameters for a *Video Capture Overlay*
 applications must initialize the ``flags`` field, the ``fmt``
 substructure, and call :ref:`VIDIOC_S_FBUF <VIDIOC_G_FBUF>`. Again the driver prepares for
 the overlay and returns the framebuffer parameters as :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`
 does, or it returns an error code.
 
-For a *destructive Video Overlay* applications must additionally provide
-a ``base`` address. Setting up a DMA to a random memory location can
-jeopardize the system security, its stability or even damage the
-hardware, therefore only the superuser can set the parameters for a
-destructive video overlay.
-
 .. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{6.6cm}|
 
 .. c:type:: v4l2_framebuffer
@@ -100,17 +97,14 @@ destructive video overlay.
       - ``base``
       -
       - Physical base address of the framebuffer, that is the address of
-	the pixel in the top left corner of the framebuffer. [#f1]_
-    * -
-      -
-      -
-      - This field is irrelevant to *non-destructive Video Overlays*. For
-	*destructive Video Overlays* applications must provide a base
-	address. The driver may accept only base addresses which are a
-	multiple of two, four or eight bytes. For *Video Output Overlays*
-	the driver must return a valid base address, so applications can
+	the pixel in the top left corner of the framebuffer.
+	For :ref:`VIDIOC_S_FBUF <VIDIOC_G_FBUF>` this field is no longer supported
+	and the kernel will always set this to NULL.
+	For *Video Output Overlays*
+	the driver will return a valid base address, so applications can
 	find the corresponding Linux framebuffer device (see
-	:ref:`osd`).
+	:ref:`osd`). For *Video Capture Overlays* this field will always be
+	NULL.
     * - struct
       - ``fmt``
       -
@@ -136,8 +130,7 @@ destructive video overlay.
     * -
       -
       -
-      - For *destructive Video Overlays* applications must initialize this
-	field. For *Video Output Overlays* the driver must return a valid
+      - For *Video Output Overlays* the driver must return a valid
 	format.
     * -
       -
@@ -165,13 +158,6 @@ destructive video overlay.
 
 	This field is irrelevant to *non-destructive Video Overlays*.
 
-	For *destructive Video Overlays* both applications and drivers can
-	set this field to request padding bytes at the end of each line.
-	Drivers however may ignore the requested value, returning
-	``width`` times bytes-per-pixel or a larger value required by the
-	hardware. That implies applications can just set this field to
-	zero to get a reasonable default.
-
 	For *Video Output Overlays* the driver must return a valid value.
 
 	Video hardware may access padding bytes, therefore they must
@@ -190,9 +176,8 @@ destructive video overlay.
     * -
       - __u32
       - ``sizeimage``
-      - This field is irrelevant to *non-destructive Video Overlays*. For
-	*destructive Video Overlays* applications must initialize this
-	field. For *Video Output Overlays* the driver must return a valid
+      - This field is irrelevant to *non-destructive Video Overlays*.
+	For *Video Output Overlays* the driver must return a valid
 	format.
 
 	Together with ``base`` it defines the framebuffer memory
@@ -232,9 +217,11 @@ destructive video overlay.
     * - ``V4L2_FBUF_CAP_LIST_CLIPPING``
       - 0x0004
       - The device supports clipping using a list of clip rectangles.
+        Note that this is no longer supported.
     * - ``V4L2_FBUF_CAP_BITMAP_CLIPPING``
       - 0x0008
       - The device supports clipping using a bit mask.
+        Note that this is no longer supported.
     * - ``V4L2_FBUF_CAP_LOCAL_ALPHA``
       - 0x0010
       - The device supports clipping/blending using the alpha channel of
@@ -342,10 +329,3 @@ EPERM
 
 EINVAL
     The :ref:`VIDIOC_S_FBUF <VIDIOC_G_FBUF>` parameters are unsuitable.
-
-.. [#f1]
-   A physical base address may not suit all platforms. GK notes in
-   theory we should pass something like PCI device + memory region +
-   offset instead. If you encounter problems please discuss on the
-   linux-media mailing list:
-   `https://linuxtv.org/lists.php <https://linuxtv.org/lists.php>`__.
-- 
2.39.1

