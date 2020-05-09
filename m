Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50A91CBF7A
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 11:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgEIJCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 05:02:04 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:51913 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgEIJCE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 05:02:04 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.homenet.telecomitalia.it (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 22A621C000C;
        Sat,  9 May 2020 09:01:59 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v11 03/13] media: v4l2-ctrl: Document V4L2_CID_CAMERA_ORIENTATION
Date:   Sat,  9 May 2020 11:04:46 +0200
Message-Id: <20200509090456.3496481-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200509090456.3496481-1-jacopo@jmondi.org>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the V4L2_CID_CAMERA_ORIENTATION camera
control. The newly added read-only control reports the camera device
orientation relative to the usage orientation of the system the camera
is installed on.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../media/v4l/ext-ctrls-camera.rst            | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index e39f84d2447f8..5d7fca799f2a8 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -510,6 +510,36 @@ enum v4l2_scene_mode -
     value down. A value of zero stops the motion if one is in progress
     and has no effect otherwise.
 
+``V4L2_CID_CAMERA_ORIENTATION (menu)``
+    This read-only control describes the camera orientation by reporting its
+    mounting position on the device where the camera is installed. The control
+    value is constant and not modifiable by software. This control is
+    particularly meaningful for devices which have a well defined orientation,
+    such as phones, laptops and portable devices since the control is expressed
+    as a position relative to the device's intended usage orientation. For
+    example, a camera installed on the user-facing side of a phone, a tablet or
+    a laptop device is said to be have ``V4L2_CAMERA_ORIENTATION_FRONT``
+    orientation, while a camera installed on the opposite side of the front one
+    is said to be have ``V4L2_CAMERA_ORIENTATION_BACK`` orientation. Camera
+    sensors not directly attached to the device, or attached in a way that
+    allows them to move freely, such as webcams and digital cameras, are said to
+    have the ``V4L2_CAMERA_ORIENTATION_EXTERNAL`` orientation.
+
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_CAMERA_ORIENTATION_FRONT``
+      - The camera is oriented towards the user facing side of the device.
+    * - ``V4L2_CAMERA_ORIENTATION_BACK``
+      - The camera is oriented towards the back facing side of the device.
+    * - ``V4L2_CAMERA_ORIENTATION_EXTERNAL``
+      - The camera is not directly attached to the device and is freely movable.
+
+
+
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
-- 
2.26.1

