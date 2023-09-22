Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F327AB37A
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbjIVOX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbjIVOXZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70227199
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392600; x=1726928600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Hzdo8qjv5TkOgXdrnoxXUvFVwjAzgR+whkFJtevO28=;
  b=JPvpzm3CF1xyYZ2a86NySGvebhIt3teG3OnbF0VKXDfQAVaknuwIRNFe
   lCTLttHTt18Ziu95xynqv4XfLOM8JYs2sFxLcW61aujV9TsN0AtYjdRst
   kmXP1W/M3AM9rcw0MXajDgOjaTQZOc5dOHfP16TtX9H453KhFCJg+F3qW
   Kde27n8kB6JToKU6aB5+Kxj7PUmRsZmKvy6P2oRksCLVriFJPpdnA+uHB
   KGv/j1HtIP0t/4uH6dfYSepEzcodRfgOfsyxJuFkPQmQdf+OgqNpncHMe
   QxX6r0Qbn/TX2BH8S/mNy0yI7mHE+iEhWHVu1DllEl0cak84VMz5mfWfp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360219018"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360219018"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750862629"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750862629"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:16 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 250181209B0;
        Fri, 22 Sep 2023 17:23:12 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 20/23] media: v4l: subdev: Return routes set using S_ROUTING
Date:   Fri, 22 Sep 2023 17:22:36 +0300
Message-Id: <20230922142239.259425-21-sakari.ailus@linux.intel.com>
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
index 2042ad4ef5f1..1bcc96cde6da 100644
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

