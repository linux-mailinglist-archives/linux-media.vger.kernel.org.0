Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F097E215F
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbjKFM0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjKFM0H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:07 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF36F3
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273564; x=1730809564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Up4k2RsAnhdACOT8eAPX+yaLxXuhNOxu09EUwUqnDg4=;
  b=Zzm8zrHCRVi4bJgf3ui4iIeFvFxKIajGao+AEOY54x2G0C5ENLVT/e9z
   ULAs9nYU7TI+86GcRFz4NPCrfN0MNJABs6VWjwW/VHPHsMuHMAlYs5qT+
   kc/LnWH03MCUHWwXCqDe0yoIR77LHjncM+/4R6AZq22ZSy0FvMxmpqjTS
   nqnacDnddda7gL+oOd4OLgOGD4/LB8b/ojero49BVFBGOBLzCUjV2/FA2
   qplDzMYyiT4EIWWr/8+eyBMfTe1uCNDL3KZD+/Qy1nL8ea1y4HFuIvqO8
   WTyoxRb5P3V76f/tXYEy8jumesUaaO1+k04G5rHrQVUNvZXNeoi+XTpsn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455747270"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="455747270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797291615"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797291615"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:01 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 94BAA11FBBC;
        Mon,  6 Nov 2023 14:25:57 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 12/31] media: v4l: subdev: Move G_ROUTING handling below S_ROUTING
Date:   Mon,  6 Nov 2023 14:25:20 +0200
Message-Id: <20231106122539.1268265-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
index cbc4d68f01c1..776117d73fd9 100644
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

