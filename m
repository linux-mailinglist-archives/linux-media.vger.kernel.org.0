Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06FA7AB378
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbjIVOXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234271AbjIVOXL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CBE192
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392585; x=1726928585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ksPIgIvx7MLM9V1Y4A3HIcSSQO26VJP2cm3CDBzi34o=;
  b=DfY8yBZEnOpFXMCaDZBvufpPm5TzyCFE9aU67zORG/E+9g2rbvZ3bLqX
   XIorWJB6rOisKRXteVSyiA7rLtAn/C2XqaenWHP8vBg0vyIczhtR5Seza
   3nQHerLgbz3p2ehpAcPPVaqZDJAPccEyIrkLOWw//BfKm4l88FCnbsTRz
   iTtbSjPy+4zjrNYyHClY3jlPC+0KRiPYqrIRAEAQwBqRkHumoKRmeNs0A
   ZFZh6fBNVrrlf7VmNa/XtE677xXYuaSBms6PaEoaLFCW00tG3LycQtf+Q
   PQ9dtyTWOlv3yEl5j+zIuXyscHAIWjoS391QdmyzHKnEtyYwNuPlDENj2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360218930"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360218930"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741112455"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741112455"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:00 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BC4B7120810;
        Fri, 22 Sep 2023 17:22:56 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 11/23] media: Documentation: Document S_ROUTING behaviour
Date:   Fri, 22 Sep 2023 17:22:27 +0300
Message-Id: <20230922142239.259425-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

