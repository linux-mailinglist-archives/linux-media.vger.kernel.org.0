Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A1423CD2C
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 19:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgHERWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 13:22:21 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:45280 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbgHERVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 13:21:11 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id B53AF3A3D82
        for <linux-media@vger.kernel.org>; Wed,  5 Aug 2020 10:55:13 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2273FC000C;
        Wed,  5 Aug 2020 10:53:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: [PATCH 1/4] media: docs: Describe pixel array properties
Date:   Wed,  5 Aug 2020 12:57:18 +0200
Message-Id: <20200805105721.15445-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805105721.15445-1-jacopo@jmondi.org>
References: <20200805105721.15445-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 selection API are also used to access the pixel array
properties of an image sensor, such as the size and position of active
pixels and the cropped area of the pixel matrix used to produce images.

Currently no clear definition of the different areas that compose an
image sensor pixel array matrix is provided in the specification, and
the actual meaning of each selection target when applied to an image
sensor was not provided.

Provide in the sub-device documentation the definition of the pixel
matrix properties and the selection target associated to each of them.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 134d2fb909fa4..c47861dff9b9b 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -386,6 +386,87 @@ requests on all selection targets, unless specifically told otherwise.
 ``V4L2_SEL_FLAG_GE`` and ``V4L2_SEL_FLAG_LE`` flags may be used to round
 the image size either up or down. :ref:`v4l2-selection-flags`
 
+.. _v4l2-subdev-pixel-array-properties:
+
+Selection targets for image sensors properties
+----------------------------------------------
+
+The V4L2 selection API can be used on sub-devices that represent an image
+sensor to retrieve the sensor's pixel array matrix properties by using the
+:ref:`selection <VIDIOC_SUBDEV_G_SELECTION>` ioctls.
+
+Sub-device drivers for image sensor usually register a single source pad, but in
+the case they expose more, the pixel array properties can be accessed from
+any of them.
+
+The ``V4L2_SEL_TGT_NATIVE``, ``V4L2_SEL_TGT_CROP_BOUNDS``,
+``V4L2_SEL_TGT_CROP_DEFAULT`` and ``V4L2_TGT_CROP`` targets are used to retrieve
+the immutable properties of the several different areas that compose the sensor
+pixel array matrix. Each area describes a rectangle of logically adjacent pixel
+units. The logical disposition of pixels is defined by the sensor read-out
+starting point and direction, and may differ from the physical disposition of
+the pixel units in the pixel array matrix.
+
+Each pixel matrix portion is contained in a larger rectangle, with the most
+largest being the one that describes the pixel matrix physical size. This
+defines a hierarchical positional system, where each rectangle is defined
+relatively to the largest available one among the ones exposed by the
+sub-device driver. Each selection target and the associated pixel array portion
+it represents are below presented in order from the largest to the smallest one.
+
+Pixel array physical size
+^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The image sensor chip is composed by a number of physical pixels, not all of
+them readable by the application processor. Invalid or unreadable lines might
+not be transmitted on the data bus at all, or in case on CSI-2 capable sensors
+they might be tagged with an invalid data type (DT) so that the receiver
+automatically discard them. The size of the whole pixel matrix area is
+retrieved using the V4L2_SEL_TGT_NATIVE target, which has its top-left corner
+defined as position (0, 0). All the other selection targets are defined
+relatively to this, larger, rectangle. The rectangle returned by
+V4L2_SEL_TGT_NATIVE describes an immutable property of the image sensor, it
+does not change at run-time and cannot be modified from userspace.
+
+Pixel array readable area
+^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The V4L2_SEL_TGT_CROP_BOUNDS targets returns size and position of the readable
+area of the pixel array matrix, including pixels with valid image data and pixel
+used for calibration purposes, such as optical black pixels. It is not unlikely
+that valid pixels and optical black pixels are surrounded by non-readable rows
+and columns of pixels. Those does not concur in the definition of the
+V4L2_SEL_TGT_CROP_BOUNDS rectangle. The rectangle returned by
+V4L2_SEL_TGT_CROP_BOUNDS describes an immutable property of the image sensor, it
+does not change at run-time and cannot be modified from userspace.
+
+Pixel array active area
+^^^^^^^^^^^^^^^^^^^^^^^
+
+The portion of the pixel array which contains valid image data is defined as the
+active area of the pixel matrix. The active pixel array is is accessed by mean
+of the V4L2_SEL_TGT_CROP_DEFAULT target, and is contained in the larger
+V4L2_SEL_TGT_CROP_BOUNDS rectangle. It represents the largest possible frame
+resolution the sensor can produce and defines the dimension of the full
+field-of-view. The rectangle returned by V4L2_SEL_TGT_CROP_BOUNDS describes an
+immutable property of the image sensor, it does not change at run-time and
+cannot be modified from userspace.
+
+Analog crop rectangle
+^^^^^^^^^^^^^^^^^^^^^
+
+The sensor driver might decide, in order to adjust the image resolution to best
+match the one requested by applications, to only process a part of the active
+pixel array matrix. The selected area is read-out and processed by the image
+sensor on-board ISP in order to produce images of the desired size and
+resolution while possible maintaing the largest possible field-of-view. The
+cropped portion of the pixel array which is used to produce images is returned
+by the V4L2_SEL_TGT_CROP target and represent the only information that can
+change at runtime as it depends on the currently configured sensor mode and
+desired image resolution. If the sub-device driver supports that, userspace
+can set the analog crop rectangle to select which portion of the pixel array
+to read out.
+
 
 Types of selection targets
 --------------------------
-- 
2.27.0

