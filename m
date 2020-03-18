Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 565D518A409
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 21:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgCRUr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 16:47:56 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50729 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgCRUrz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 16:47:55 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5269120005;
        Wed, 18 Mar 2020 20:47:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org
Subject: [PATCH v7 02/11] media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_LOCATION
Date:   Wed, 18 Mar 2020 21:50:25 +0100
Message-Id: <20200318205034.949531-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318205034.949531-1-jacopo@jmondi.org>
References: <20200318205034.949531-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
control. The newly added read-only control reports the camera device
mounting position.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
index 51c1d5c9eb00..b151c016256c 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
@@ -510,6 +510,38 @@ enum v4l2_scene_mode -
     value down. A value of zero stops the motion if one is in progress
     and has no effect otherwise.
 
+``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
+    This read-only control describes the camera sensor location by reporting
+    its mounting position on the device where the camera is installed. The
+    control value is constant and not modifiable by software. This control is
+    particularly meaningful for devices which have a well defined orientation,
+    such as phones, laptops and portable devices since the camera location is
+    expressed as a position relative to the device's intended usage orientation.
+    For example, a camera sensor installed on the user-facing side of a phone,
+    a tablet or a laptop device is said to be installed in the
+    ``V4L2_LOCATION_FRONT`` location while camera sensors installed on the side
+    opposite the front one are said to be installed in the
+    ``V4L2_LOCATION_BACK`` location. Camera sensors not directly attached to
+    the device or attached in a way that allows them to move freely, such as
+    webcams and digital cameras, are said to have the ``V4L2_LOCATION_EXTERNAL``
+    location.
+
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_LOCATION_FRONT``
+      - The camera sensor is located on the front side of the device.
+    * - ``V4L2_LOCATION_BACK``
+      - The camera sensor is located on the back side of the device.
+    * - ``V4L2_LOCATION_EXTERNAL``
+      - The camera sensor is not directly attached to the device and is
+        freely movable.
+
+
+
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
-- 
2.25.1

