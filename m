Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D91D4903C6
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 16:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfHPORJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 10:17:09 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50555 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbfHPORI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 10:17:08 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EA7BDFF807;
        Fri, 16 Aug 2019 14:17:03 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/6] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Date:   Fri, 16 Aug 2019 16:18:18 +0200
Message-Id: <20190816141822.7582-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816141822.7582-1-jacopo@jmondi.org>
References: <20190816141822.7582-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the V4L2_CID_LOCATION camera control. The newly
added read-only control reports the camera device mounting position.

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
2.22.0

