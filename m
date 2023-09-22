Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D550D7AB38A
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbjIVOXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234302AbjIVOX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD84119B
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392601; x=1726928601;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QT/s9eg8pZijCywXl/GZyJbeSyHwMc6CstTqzy2WdUc=;
  b=Ej2VEAoXg3S0u8ICwvUHd4DtuwN7oSL4/NVNAgOtj3PhthkEGBEyWjGM
   vWwWCqkfLUuMQFnhGCTWWGrwYIIqsM8Of4Yfqv1xD9dr3VAnHxnIRVNcR
   sJIkRnS5YIs4gEyIUapCuIPV/yMrAtnBHsiUmlWrnJSJlip0kqHT9z1dt
   j07w9IN506rpZP0yUqJjWj0ARaph86cKSAisXe3h1L/b56/9FXdj8ExdJ
   El9tvB46yQqcDkvpk2BxU9WZg5Pz99rkVi0o8U8HU9zjYIt6Hbjx6aE4X
   w2NbwRZNCxpQhEFZpTCJtGehts4RsENysv/XoMmCeqA92q51T70Rjig1+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360219033"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360219033"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750862645"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750862645"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:18 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1188F11FC30;
        Fri, 22 Sep 2023 17:23:14 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 21/23] media: uapi: Allow a larger number of routes than there's room for
Date:   Fri, 22 Sep 2023 17:22:37 +0300
Message-Id: <20230922142239.259425-22-sakari.ailus@linux.intel.com>
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

On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
as there's room. Do not consider it an error if more routes existed.
Simply inform the user there are more routes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst   | 4 ----
 drivers/media/v4l2-core/v4l2-subdev.c                     | 8 ++------
 2 files changed, 2 insertions(+), 10 deletions(-)

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
index 1bcc96cde6da..7871ec8a66d1 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -956,14 +956,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		krouting = &state->routing;
 
-		if (routing->len_routes < krouting->num_routes) {
-			routing->num_routes = krouting->num_routes;
-			return -ENOSPC;
-		}
-
 		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
 		       krouting->routes,
-		       krouting->num_routes * sizeof(*krouting->routes));
+		       min(krouting->num_routes, krouting->len_routes) *
+		       sizeof(*krouting->routes));
 		routing->num_routes = krouting->num_routes;
 
 		return 0;
-- 
2.39.2

