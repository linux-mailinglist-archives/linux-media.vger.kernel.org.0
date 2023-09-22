Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 092107AB160
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 13:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbjIVL5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 07:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233812AbjIVL5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 07:57:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AB2100
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 04:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695383861; x=1726919861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KkACzm6rCRlzxaVRUFccKHvp1nDFcGBzYlanlUmyCVE=;
  b=aG5F0eXybboKh6TI0g5O9Bfp6W/M1Hh1ZUpq29PTjR4UqMdqnfyLv86h
   f5t53w4ZmlriclGuE9NjRCxw300Q5CKeghTc1MBhK+kFUXhZpoKiUEiXX
   3Q5SC9zJN2DWWHISOFAz7UsHYcfeuGnujlMZ31kWQ+hWGME0cUWEjRnGt
   2O9rAHfJS/Qm6VXeg+KptykMC53xEqNKsiK1MW5GWv751U5HoiRlmwnWC
   fPbto5LBeRc4OJWjLcp/da0rwoFFwHRnJCQwoWzTZpgj3OeaY7ed48NGg
   zU0hFjMW+T9/dFepI5ELW74QgN2HAg7diZk0N25wq0TRHxXsyck9+fB2r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383558564"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383558564"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837714634"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="837714634"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5E22A120810;
        Fri, 22 Sep 2023 14:57:32 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v4 01/12] media: Documentation: Align numbered list, make it a proper ReST
Date:   Fri, 22 Sep 2023 14:57:19 +0300
Message-Id: <20230922115730.251779-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
References: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Align lines for numbered list so that Sphinx produces an uniform output
for all list entries. Also indent paragraphs of such list entries for
consistency.

Also use ReST numbered list syntax for the entries.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 49 +++++++++----------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index a4f1df7093e8..43988516acdd 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -579,20 +579,19 @@ is started.
 
 There are three steps in configuring the streams:
 
-1) Set up links. Connect the pads between sub-devices using the :ref:`Media
-Controller API <media_controller>`
+1. Set up links. Connect the pads between sub-devices using the
+   :ref:`Media Controller API <media_controller>`
 
-2) Streams. Streams are declared and their routing is configured by
-setting the routing table for the sub-device using
-:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
-setting the routing table will reset formats and selections in the
-sub-device to default values.
+2. Streams. Streams are declared and their routing is configured by setting the
+   routing table for the sub-device using :ref:`VIDIOC_SUBDEV_S_ROUTING
+   <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that setting the routing table will
+   reset formats and selections in the sub-device to default values.
 
-3) Configure formats and selections. Formats and selections of each stream
-are configured separately as documented for plain sub-devices in
-:ref:`format-propagation`. The stream ID is set to the same stream ID
-associated with either sink or source pads of routes configured using the
-:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
+3. Configure formats and selections. Formats and selections of each stream are
+   configured separately as documented for plain sub-devices in
+   :ref:`format-propagation`. The stream ID is set to the same stream ID
+   associated with either sink or source pads of routes configured using the
+   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
 
 Multiplexed streams setup example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
@@ -618,11 +617,11 @@ modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
 
 To configure this pipeline, the userspace must take the following steps:
 
-1) Set up media links between entities: connect the sensors to the bridge,
-bridge to the receiver, and the receiver to the DMA engines. This step does
-not differ from normal non-multiplexed media controller setup.
+1. Set up media links between entities: connect the sensors to the bridge,
+   bridge to the receiver, and the receiver to the DMA engines. This step does
+   not differ from normal non-multiplexed media controller setup.
 
-2) Configure routing
+2. Configure routing
 
 .. flat-table:: Bridge routing table
     :header-rows:  1
@@ -656,14 +655,14 @@ not differ from normal non-multiplexed media controller setup.
       - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - Pixel data stream from Sensor B
 
-3) Configure formats and selections
+3. Configure formats and selections
 
-After configuring routing, the next step is configuring the formats and
-selections for the streams. This is similar to performing this step without
-streams, with just one exception: the ``stream`` field needs to be assigned
-to the value of the stream ID.
+   After configuring routing, the next step is configuring the formats and
+   selections for the streams. This is similar to performing this step without
+   streams, with just one exception: the ``stream`` field needs to be assigned
+   to the value of the stream ID.
 
-A common way to accomplish this is to start from the sensors and propagate the
-configurations along the stream towards the receiver,
-using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
-stream endpoint in each sub-device.
+   A common way to accomplish this is to start from the sensors and propagate
+   the configurations along the stream towards the receiver, using
+   :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
+   stream endpoint in each sub-device.
-- 
2.39.2

