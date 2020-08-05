Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A3B23CC30
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 18:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgHEQ3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 12:29:06 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:55592 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgHEQ1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:27:35 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id F3DBC3A9C18
        for <linux-media@vger.kernel.org>; Wed,  5 Aug 2020 10:55:14 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B35E2C0006;
        Wed,  5 Aug 2020 10:53:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: [PATCH 2/4] media: docs: Describe targets for sensor properties
Date:   Wed,  5 Aug 2020 12:57:19 +0200
Message-Id: <20200805105721.15445-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805105721.15445-1-jacopo@jmondi.org>
References: <20200805105721.15445-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide a table to describe how the V4L2 selection targets can be used
to access an image sensor pixel array properties.

Reference the table in the sub-device documentation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../userspace-api/media/v4l/dev-subdev.rst    |  4 ++
 .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index c47861dff9b9b..2f7da3832f458 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -467,6 +467,10 @@ desired image resolution. If the sub-device driver supports that, userspace
 can set the analog crop rectangle to select which portion of the pixel array
 to read out.
 
+A description of each of the above mentioned targets when used to access the
+image sensor pixel array properties is provided by
+:ref:`v4l2-selection-targets-image-sensor-table`
+
 
 Types of selection targets
 --------------------------
diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
index 69f500093aa2a..632e6448b784e 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
@@ -76,3 +76,52 @@ of the two interfaces they are used.
 	modified by hardware.
       - Yes
       - No
+
+
+.. _v4l2-selection-targets-image-sensor-table:
+
+********************************************
+Selection Targets For Pixel Array Properties
+********************************************
+
+The V4L2 selection API can be used to retrieve the size and disposition of the
+pixel units that compose and image sensor pixel matrix when applied to a video
+sub-device that represents an image sensor.
+
+A description of the properties associated with each of the sensor pixel array
+areas is provided by the :ref:`v4l2-subdev-pixel-array-properties` section.
+
+.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p(1.4cm)|
+
+.. flat-table:: Selection target definitions
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Target name
+      - id
+      - Definition
+      - Read/Write
+    * - ``V4L2_SEL_TGT_CROP``
+      - 0x0000
+      - The analog crop rectangle. Represents the portion of the active pixel
+        array which is processed to produce images.
+      - RW
+    * - ``V4L2_SEL_TGT_CROP_DEFAULT``
+      - 0x0001
+      - The active pixel array rectangle. It includes only active pixels and
+        excludes other ones such as optical black pixels. Its width and height
+        represent the maximum image resolution an image sensor can produce.
+      - RO
+    * - ``V4L2_SEL_TGT_CROP_BOUNDS``
+      - 0x0002
+      - The readable portion of the physical pixel array matrix. It includes
+        pixels that contains valid image data and calibration pixels such as the
+        optical black ones.
+      - RO
+    * - ``V4L2_SEL_TGT_NATIVE_SIZE``
+      - 0x0003
+      - The physical pixel array size, including readable and not readable
+        pixels. As pixels that cannot be read from application processor are not
+        relevant for calibration purposes, this rectangle is useful to calculate
+        the physical properties of the image sensor.
+      - RO
-- 
2.27.0

