Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A677E6D7964
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 12:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbjDEKQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 06:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjDEKQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 06:16:52 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976CD1737
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680689811; x=1712225811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QcwzbVKc4uMhiB0wlbnEeE/vaoEyAfHC+3XMRiDuwAg=;
  b=HpuhxBUntsGMMcced22xVkaPyH6PfMLnkNs9xW4D4jwfpeSYYshVSp76
   Muv1iue7YDYfXqBc7rMjFeC+nH/1A46ddEbX5QoYBi+Xm4++xxVxAJAF/
   OI9GBiLUkhLlkvEVXlWkjEnGfhkNt58NyO5mR4nj4oYjv5NGrwdY6hxWf
   +fGQtMXTEZG0nQW8h0d/YYyi0y7tivdcFNAYcxas7p3ooJOo8pwLrs3nH
   MzAwkgXZ1juQ7aub5YGXsbarAKlKZQ8rgCO3eOy4W8S20rhQG4dxMxFab
   MrWjETqfDPAwVVAs8eHR/ET4LIffzamlvEnEQF7dGEu0cDGZnQbUgbJL+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322795241"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="322795241"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 03:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="719260079"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="719260079"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 03:16:50 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 903E41218A3;
        Wed,  5 Apr 2023 13:16:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 1/1] Documentation: v4l: Document rotation and orientation for sensor drivers
Date:   Wed,  5 Apr 2023 13:16:46 +0300
Message-Id: <20230405101646.1804044-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how rotation and orientation should be taken into account in
writing camera sensor drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Simplify language (Laurent's suggestion) and add note on flipping
  controls (Jacopo).

- Improve the last paragraph, say this is about rotation and orientation.

 Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++++
 .../userspace-api/media/v4l/ext-ctrls-camera.rst |  1 +
 2 files changed, 17 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c7d4891bd24e..61caa7901c51 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -151,3 +151,19 @@ used to obtain device's power state after the power state transition:
 The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
 access the device.
+
+Rotation and orientation
+------------------------
+
+Some systems have the camera sensor mounted upside down compared to its natural
+mounting rotation. In such cases, drivers shall expose the information to
+userspace with the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
+<v4l2-camera-sensor-rotation>` control.
+
+Sensor drivers that have any vertical or horizontal flips embedded in the
+register programming sequences shall initialize the V4L2_CID_HFLIP and
+V4L2_CID_VFLIP controls with the values programmed by the register sequences.
+
+Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
+information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
+register the appropriate controls.
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index daa4f40869f8..29fe22da52a2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -536,6 +536,7 @@ enum v4l2_scene_mode -
       - The camera is not directly attached to the device and is freely movable.
 
 
+.. _v4l2-camera-sensor-rotation:
 
 ``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
     This read-only control describes the rotation correction in degrees in the
-- 
2.30.2

