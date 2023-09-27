Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834747B0A6D
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbjI0Qfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjI0Qfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:35:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893CDDE
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832539; x=1727368539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M5kxrDp/+fX1OAgJYc03JU+o2Vmo5zfugbw5MfAby1s=;
  b=A9YtNpeBj1qKe+TnGPCV3T5KfrgNg7jk/zhHJnp/lE7sCgIc2m8Y9x4m
   OV/uzVJ6O0K1pZOElsTd15WpGKSRKReS+xMHRgMEQpXzBf9p9HkKRG8iL
   jLir7paG3bcXmO8hbgQGHSKStkvHbUBd1bMCNGiVX6OQhlhBxhQCsXU3+
   0C3kOZOWoCO+LkHBCI0d2hG4sm8XHTOnKIU/JGxjrD4Luj/Jh+IfmlpL5
   YsIrCTahzixoloL6tHeC28UPzcl3zrOUy0EZ0EzjxHJKMo9yE3aJK3DDl
   vI5YSCA0UivaI2JdpZl0oDUdd2ytCOy9Cwt9zoyLblU8gCfcOsKsGnje5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448363152"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="448363152"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="872955315"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="872955315"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:15 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 363BB12035C;
        Wed, 27 Sep 2023 19:33:10 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 17/26] media: v4l: subdev: Return routes set using S_ROUTING
Date:   Wed, 27 Sep 2023 19:32:03 +0300
Message-Id: <20230927163212.402025-18-sakari.ailus@linux.intel.com>
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

Return the routes set using S_ROUTING back to the user. Also reflect this
in documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++--
 drivers/media/v4l2-core/v4l2-subdev.c                        | 5 ++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 9a9765ddc316..ced53ea5f23c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -43,8 +43,9 @@ The routing configuration determines the flows of data inside an entity.
 Drivers report their current routing tables using the
 ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
 with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
-setting or clearing flags of the  ``flags`` field of a
-struct :c:type:`v4l2_subdev_route`.
+setting or clearing flags of the ``flags`` field of a struct
+:c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``, also
+``VIDIOC_SUBDEV_S_ROUTING`` returns the routes back to the user.
 
 All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is
 called. This means that the userspace must reconfigure all streams after calling
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index bd1e8205913c..9a34e13dfd96 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -935,9 +935,12 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		krouting.len_routes = routing->len_routes;
 		krouting.routes = routes;
 
-		return v4l2_subdev_call(sd, pad, set_routing, state,
+		rval = v4l2_subdev_call(sd, pad, set_routing, state,
 					routing->which, &krouting);
+		if (rval < 0)
+			return rval;
 	}
+		fallthrough;
 
 	case VIDIOC_SUBDEV_G_ROUTING: {
 		struct v4l2_subdev_routing *routing = arg;
-- 
2.39.2

