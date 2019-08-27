Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFEF9E3E0
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 11:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbfH0JWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 05:22:32 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50885 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfH0JWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 05:22:31 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 69D5D1C0003;
        Tue, 27 Aug 2019 09:22:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v2 02/10] media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_LOCATION
Date:   Tue, 27 Aug 2019 11:23:28 +0200
Message-Id: <20190827092339.8858-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190827092339.8858-1-jacopo@jmondi.org>
References: <20190827092339.8858-1-jacopo@jmondi.org>
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
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
index 51c1d5c9eb00..ecf151f3f0f4 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
@@ -510,6 +510,40 @@ enum v4l2_scene_mode -
     value down. A value of zero stops the motion if one is in progress
     and has no effect otherwise.
 
+``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
+    This read-only control describes the camera sensor location by
+    reporting its mounting position on the device where the camera is
+    installed. The control value is constant and not modifiable by software
+    and its value is retrieved from the firmware interface by parsing the
+    'location' property. This control is particularly meaningful for
+    devices which have a well defined orientation, such as phones, laptops
+    and portable devices as the camera location is expressed as a position
+    relative to the device intended usage orientation. In example, a camera
+    sensor installed on the user-facing side of a phone, a tablet or a
+    laptop device is said to be installed in the ``V4L2_LOCATION_FRONT``
+    location while camera sensors installed on the side opposed to the
+    front one are said to be installed in the ``V4L2_LOCATION_BACK``
+    location. Camera sensors connected to the device by extension cables
+    which are freely movable regardless of the device orientation, such as
+    webcams and digital cameras, are said to be have
+    ``V4L2_LOCATION_EXTERNAL`` location.
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
+      - The camera sensor is connected by extension cables to the device and
+        it's freely movable.
+
+
+
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
-- 
2.23.0

