Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A13A17AB37B
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbjIVOXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbjIVOXa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA58192
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392604; x=1726928604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qaaq+bVryYz/AHIk8MtaNE52EakomHLhcPEW5WAN4co=;
  b=VrfFNFspEk8VvBx9HH9IW8kYAU5bmEzQpWNYRiBwnvJPIOMV7EgsyDEe
   9WzPmDIwuYKLA6MfWtIB60nKoZPlMWJzlS2paMgO+aDM6LO4MgdPVhy4/
   MS5/u5/M0MfxYrJS1x9L3nsSdmwFJTFdHnAxTvizkPD0MZdQJnTNYe3ic
   YHTU16KTjwmDyOToJADgH0S0Fzu2Cq3fO6s1I7PGuAx7eO226sAYhLvsR
   IYrwEsSJG9MyzHYzeLi5CjUZh4TDilvHB/xKee7myftSfE7jAY5YPiD2o
   VoBGNaE/GrbDNBm22zxLRX47HZBnRMfVbJiSqFx1s9OktXyaphuO5/jN7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360219055"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360219055"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750862666"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750862666"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:21 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DC45B1209A1;
        Fri, 22 Sep 2023 17:23:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 23/23] media: uapi: v4l: subdev: Enable streams API
Date:   Fri, 22 Sep 2023 17:22:39 +0300
Message-Id: <20230922142239.259425-24-sakari.ailus@linux.intel.com>
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

Remove v4l2_subdev_enable_streams_api variable that was used to easily
enable streams API for development, and conditions that use the variable.

This patch enables the streams API for V4L2 sub-device interface which
allows transporting multiple streams on a single MC link.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2b3bfc4bc1e1..65a55b91260c 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -26,15 +26,6 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-/*
- * The Streams API is an experimental feature. To use the Streams API, set
- * 'v4l2_subdev_enable_streams_api' to 1 below.
- */
-
-static bool v4l2_subdev_enable_streams_api;
-#endif
-
 /*
  * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
  * of streams.
@@ -897,9 +888,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!v4l2_subdev_has_op(sd, pad, set_routing))
 			goto do_vidioc_subdev_g_routing;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -950,9 +938,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_routing *routing = arg;
 		struct v4l2_subdev_krouting *krouting;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -980,14 +965,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-		/*
-		 * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
-		 * enabled. Remove this when streams API is no longer
-		 * experimental.
-		 */
-		if (!v4l2_subdev_enable_streams_api)
-			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
-
 		/* Filter out unsupported capabilities */
 		client_cap->capabilities &= V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 
-- 
2.39.2

