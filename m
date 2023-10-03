Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAAE57B6887
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjJCMIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbjJCMI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5B7A9
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334906; x=1727870906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=35JYVf8F5uxK3Q/i4iuOMCiky5gw/qs2pQ50bIhjrXU=;
  b=DxEcSdpyJQj5U+1FtOSd785ogkE7iPZbfzWWZPzVC1Gb/5v7Ib4JFfO9
   yy1yehNnHDQObBmV0w0kQ1TtunDR1VEhx+HI/gn73cheK1jXYIIkU6Bik
   L2V7fSCWKCG4GG3XAt2+rSR0GkhewaFTewS7NuBj6hBs3xPBOvBxeIvWN
   U7MxI/0kV7lpTIkQ5xT6i9IDB/kRISKSi6M4V0xtoDorj1ogQpDvCpNQI
   gVIoI8f0I+VwKPIgsdvRV1ci0vYnyQuYsU41Yb7isMgZqPRLsIuJZe9jW
   aCLwwJhbvUz9BG/NvQTyt9ryCZVEvEXwhP3tO3Ep0KS6XtgU7Ig+ahpKH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681513"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681513"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285910"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285910"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:23 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6815C120A58;
        Tue,  3 Oct 2023 15:08:19 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 14/28] media: v4l: subdev: Move G_ROUTING handling below S_ROUTING
Date:   Tue,  3 Oct 2023 15:07:59 +0300
Message-Id: <20231003120813.77726-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move G_ROUTING IOCTL handling below that of S_ROUTING. G_ROUTING
implementation will soon needed in handling S_ROUTING as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 54 +++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index df9a1ae65410..614ff0031831 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -887,33 +887,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_QUERYSTD:
 		return v4l2_subdev_call(sd, video, querystd, arg);
 
-	case VIDIOC_SUBDEV_G_ROUTING: {
-		struct v4l2_subdev_routing *routing = arg;
-		struct v4l2_subdev_krouting *krouting;
-
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
-		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
-			return -ENOIOCTLCMD;
-
-		memset(routing->reserved, 0, sizeof(routing->reserved));
-
-		krouting = &state->routing;
-
-		if (routing->num_routes < krouting->num_routes) {
-			routing->num_routes = krouting->num_routes;
-			return -ENOSPC;
-		}
-
-		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-		       krouting->routes,
-		       krouting->num_routes * sizeof(*krouting->routes));
-		routing->num_routes = krouting->num_routes;
-
-		return 0;
-	}
-
 	case VIDIOC_SUBDEV_S_ROUTING: {
 		struct v4l2_subdev_routing *routing = arg;
 		struct v4l2_subdev_route *routes =
@@ -962,6 +935,33 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 					routing->which, &krouting);
 	}
 
+	case VIDIOC_SUBDEV_G_ROUTING: {
+		struct v4l2_subdev_routing *routing = arg;
+		struct v4l2_subdev_krouting *krouting;
+
+		if (!v4l2_subdev_enable_streams_api)
+			return -ENOIOCTLCMD;
+
+		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+			return -ENOIOCTLCMD;
+
+		memset(routing->reserved, 0, sizeof(routing->reserved));
+
+		krouting = &state->routing;
+
+		if (routing->num_routes < krouting->num_routes) {
+			routing->num_routes = krouting->num_routes;
+			return -ENOSPC;
+		}
+
+		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
+		       krouting->routes,
+		       krouting->num_routes * sizeof(*krouting->routes));
+		routing->num_routes = krouting->num_routes;
+
+		return 0;
+	}
+
 	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-- 
2.39.2

