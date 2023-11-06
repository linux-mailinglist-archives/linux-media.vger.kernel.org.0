Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482AE7E2163
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbjKFM0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbjKFM0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:12 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97AFDB
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273569; x=1730809569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dV2mPW9fQtLqrNqNQekkIPZPkwFo/o+15rmn6x4gJvI=;
  b=OZ17C4H1wT1L/3iwyqTaAr++L2QV7Mw9LRtx8Rro0AzezCOYpCtbpkQ0
   5SiGiP55+ANw/8FW+Dqfw0ztEzItcfCO3gpWvecRDQI8DCWqwxSZ4L+s0
   PiI/qqHc49teDmEtgDS4DCLghMQr5a10/S1sB+8JK360kVu7hjys079Ps
   ede7P+ILSpMAVCodApvf71lUM/RXNR725xgs+R5zEPQHpWXK6yDanR/qL
   rS08JHSBFUdNA04rqIs22iAzofReOKah2nmFU3kc/hSHQqp9zTVWBEp69
   0FXXrYq8k4YcbfQCa0iggbEvZxWMUfqYXm/FBTbjdQ+k08vxqRghEUoqI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455747294"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="455747294"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797291637"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797291637"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:06 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 24FE811FB8D;
        Mon,  6 Nov 2023 14:26:03 +0200 (EET)
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
Subject: [PATCH v7 16/31] media: v4l: subdev: Allow a larger number of routes than there's room for
Date:   Mon,  6 Nov 2023 14:25:24 +0200
Message-Id: <20231106122539.1268265-17-sakari.ailus@linux.intel.com>
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

On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
as there's room. Do not consider it an error if more routes existed.
Simply inform the user there are more routes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/vidioc-subdev-g-routing.rst              |  4 ----
 drivers/media/v4l2-core/v4l2-subdev.c                  | 10 +++-------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index ced53ea5f23c..99d3c15fd759 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -145,10 +145,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
 appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
-ENOSPC
-   The application provided ``num_routes`` is not big enough to contain
-   all the available routes the subdevice exposes.
-
 EINVAL
    The sink or source pad identifiers reference a non-existing pad, or reference
    pads of different types (ie. the sink_pad identifiers refers to a source pad).
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 69ac963d9998..5e527938a3cc 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -942,7 +942,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
 		       state->routing.routes,
-		       state->routing.num_routes *
+		       min(state->routing.num_routes, routing->len_routes)  *
 		       sizeof(*state->routing.routes));
 		routing->num_routes = state->routing.num_routes;
 
@@ -963,14 +963,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		krouting = &state->routing;
 
-		if (routing->len_routes < krouting->num_routes) {
-			routing->num_routes = krouting->num_routes;
-			return -ENOSPC;
-		}
-
 		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
 		       krouting->routes,
-		       krouting->num_routes * sizeof(*krouting->routes));
+		       min(krouting->num_routes, routing->len_routes) *
+		       sizeof(*krouting->routes));
 		routing->num_routes = krouting->num_routes;
 
 		return 0;
-- 
2.39.2

