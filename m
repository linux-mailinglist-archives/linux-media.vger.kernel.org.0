Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 899BD6CC381
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 16:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbjC1Oyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 10:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbjC1Oya (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 10:54:30 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0DBC15D
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680015269; x=1711551269;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mHHfSv/FKoHsi1GumqSSHU8t+jTzPvKm5l1cvRxFO3c=;
  b=cTSKxPgxOmgN6YeAUZunGLeiELnQXvMsk8bRdBN57wjQSvp9L7IOqIdX
   9Ocr6xtEqovKpSVIZJLCZDiOcwy1smo9H6Sb+obBw2u1vXDynnM6f7zmN
   +48NxSxqWTy/Ah/B0jldBAcwHdXDdtYtZrOXH5d1Gpe51bU7hF7cUxyfS
   zNAyFlWGzm/RwxLilAf0S/sbvokGEdTB99++rZmJGq2zx0e/qfBMSYDi7
   Nu/FlRPisNgcj7sODZg2x7Q5cr5PGDytADTyU+H1+jqte4vvTkIU3hRlr
   yYKGOxMh2SL3ged1r9ubGbeQzgnz0+wnfeddLrohiW2jwxNYTDpXH9Iy7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="342175172"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="342175172"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 07:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="929909925"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="929909925"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 07:52:52 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 80A9A122809;
        Tue, 28 Mar 2023 17:52:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH v2 1/1] Documentation: v4l: Document rotation and orientation for sensor drivers
Date:   Tue, 28 Mar 2023 17:52:48 +0300
Message-Id: <20230328145248.1489994-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

Use speclial double quotes around functions to use non-proportional font for
them.

 Documentation/driver-api/media/camera-sensor.rst      | 11 +++++++++++
 .../userspace-api/media/v4l/ext-ctrls-camera.rst      |  1 +
 2 files changed, 12 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c7d4891bd24e..2618a91b0d85 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -151,3 +151,14 @@ used to obtain device's power state after the power state transition:
 The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
 access the device.
+
+Rotation and orientation
+------------------------
+
+Some systems have been implemented so that the camera sensor has been mounted
+upside down compared to its natural mounting rotation. In such a case, the
+:ref:`V4L2_CID_CAMERA_SENSOR_ROTATION <v4l2-camera-sensor-rotation>` control
+shall indicate the mounting rotation.
+
+Use ``v4l2_fwnode_device_parse()`` to obtain this information and
+``v4l2_ctrl_new_fwnode_properties()`` to generate the appropriate controls.
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

