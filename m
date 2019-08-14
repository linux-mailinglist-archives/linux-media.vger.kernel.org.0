Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 360078DEC6
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 22:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbfHNU1R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 16:27:17 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45043 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfHNU1Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 16:27:16 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4E018FF808;
        Wed, 14 Aug 2019 20:27:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Date:   Wed, 14 Aug 2019 22:28:12 +0200
Message-Id: <20190814202815.32491-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814202815.32491-1-jacopo@jmondi.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
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
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
index 51c1d5c9eb00..fc0a02eee6d4 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
@@ -510,6 +510,29 @@ enum v4l2_scene_mode -
     value down. A value of zero stops the motion if one is in progress
     and has no effect otherwise.

+``V4L2_CID_LOCATION (integer)``
+    This read-only control describes the camera location by reporting its
+    mounting position on the device where the camera is installed. This
+    control is particularly meaningful for devices which have a well defined
+    orientation, such as phones, laptops and portable devices as the camera
+    location is expressed as a position relative to the device intended
+    usage position. In example, a camera installed on the user-facing side
+    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
+    position.
+
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_LOCATION_FRONT``
+      - The camera device is located on the front side of the device.
+    * - ``V4L2_LOCATION_BACK``
+      - The camera device is located on the back side of the device.
+
+
+
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
--
2.22.0

