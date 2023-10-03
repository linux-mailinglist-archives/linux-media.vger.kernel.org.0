Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A907B688A
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjJCMIe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232136AbjJCMId (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CDCA6
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334910; x=1727870910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M5kxrDp/+fX1OAgJYc03JU+o2Vmo5zfugbw5MfAby1s=;
  b=S2lHP/8HdOBj/VclwViKnG82UXTWHhP478hx2XrIJc/cdLFfojKEjlw0
   1DymhqRJlV5jG2j/n0a+U+AHqzEkYaqv1U8qmWh+97o9cIKq2c88VoQjF
   tLXnJ5AkMcfUyA/r0oDxwo//NvrsuORk7a72AIuUZeY1lNQDDzDAqRuLR
   29DqXEYw9f0jt/0TfB+qWBBHE2HBLffGbVUtu5NECS0GY0ajJo8vB/2Fi
   e1+njOTAUpUfWAxyLoxqL6iqBgtWw5d90oKewAuY+OBk/xywJv4+XFrMw
   1PWOQYWfUgepTY7U0qTgEEitDuYXH4EJ6LjcjxTiK9LfzvrnGfC2nyhL3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681529"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681529"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285921"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285921"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:27 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3541C120A56;
        Tue,  3 Oct 2023 15:08:24 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 17/28] media: v4l: subdev: Return routes set using S_ROUTING
Date:   Tue,  3 Oct 2023 15:08:02 +0300
Message-Id: <20231003120813.77726-8-sakari.ailus@linux.intel.com>
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

