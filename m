Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFFBC7B0A50
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjI0QdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbjI0QdB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:33:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9044E92
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832379; x=1727368379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ksPIgIvx7MLM9V1Y4A3HIcSSQO26VJP2cm3CDBzi34o=;
  b=YsLjcAfUSch617ee8XS28gvtS9OnYkPP+mCDoPCcWcUetM986ejkQb8U
   8B+2BSx46s6sdO3V6Wk3eQTZX3WPLeoYddcEwM5yZanm12+Cfjy+mxmPl
   339LURTHeaumtqiGg4lUvrZjzZ9njedut8LDwW6ruaRhgzwqa3LN3BV9i
   I0XAUyjP6DGORz1gq6AYoeBusfaEMR0trdd9SbM4NG0q6vUbf/UEKgI2y
   1XAISkDgXBkjtHZVFQZXTNzqd4ejjGWpPN+vpmpnzRYMUKKAtl4Uq0MoI
   VKg8xT20pMFnTQBMXFclUI4SkUUzgRXx9dacbTYzFsTcFixwFxRP31wUb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381771255"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381771255"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892665765"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892665765"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:31:49 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1189912035C;
        Wed, 27 Sep 2023 19:32:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 11/26] media: Documentation: Document S_ROUTING behaviour
Date:   Wed, 27 Sep 2023 19:31:57 +0300
Message-Id: <20230927163212.402025-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document S_ROUTING behaviour for different devices.

Generally in devices that produce streams the streams are static and some
can be enabled and disabled, whereas in devices that just transport them
or write them to memory, more configurability is allowed. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index fb73a95401c3..83993775237f 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -593,6 +593,27 @@ Any configurations of a stream within a pad, such as format or selections,
 are independent of similar configurations on other streams. This is
 subject to change in the future.
 
+Device types and routing setup
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Different kinds of sub-devices have differing behaviour for route inactivation,
+depending on the hardware. Devices generating the streams may often allow
+enabling and disabling some of these or the configuration is fixed. If these
+routes can be disabled, not declaring these routes (or declaring them without
+``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
+disable the routes while the sub-device driver retain the streams and their
+configuration. The ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
+back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
+flag unset.
+
+Devices transporting the streams almost always have more configurability with
+respect to routing. Typically any route between the sub-device's sink and source
+pads is possible, and multiple routes (usually up to certain limited number) may
+be active simultaneously. For such devices, no routes are created by the driver
+and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
+called on the sub-device. Such newly created routes have the device's default
+configuration for format and selection rectangles.
+
 Configuring streams
 ^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2

