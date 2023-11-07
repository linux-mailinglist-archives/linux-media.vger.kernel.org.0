Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6817E46F6
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 18:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbjKGR3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 12:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjKGR3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 12:29:12 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F189C
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699378150; x=1730914150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8uwyTWF2SzF6QDYqC/j4PMimvD1lwXk+NvV62LDWpaM=;
  b=CJ3S5dshIEfaq2DvAeeDSmOD8rWy6SQYQqj2Gu2zk6oGej0KLg2Ep2L/
   fHh6DDQcWVA5OdceQ8w4YQ01t5xJlObUrXlshaMA35ME4RGUhVAcuaZt0
   nV9DoSITh1/FYZIqMdGB+nwVkyknYEPPMQ7CS2628PUnHOucAURFP0F4p
   rYtygt+ch0Vhb8xK+pyXGAmV0CV9wXuutP3QZA4fRF1CXEXYphyYDPvQ2
   XplyXkHgYvDb1SQtjC2lP8W5U/0itMPdZbuP0Pa9Os9u1NVbvuKQFuCJA
   Ip6G0CvNFLdoOc4CZE1gsbA2tei5H7YlarPAzW8IVUhdPIYZ5VXtQm5+6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389368876"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="389368876"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:29:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="853441090"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="853441090"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:29:06 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 91DE31202B6;
        Tue,  7 Nov 2023 19:29:04 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 1/8] media: v4l: subdev: Store the sub-device in the sub-device state
Date:   Tue,  7 Nov 2023 19:28:54 +0200
Message-Id: <20231107172901.1302019-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107172901.1302019-1-sakari.ailus@linux.intel.com>
References: <20231107172901.1302019-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Store the sub-device in the sub-device state. This will be needed in e.g.
validating pad number when retrieving information for non-stream-aware
users. There are expected to be more needs for this in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
 include/media/v4l2-subdev.h           | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d295a4e87b66..ee4fe8f33a41 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1441,6 +1441,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 	else
 		state->lock = &state->_lock;
 
+	state->sd = sd;
+
 	/* Drivers that support streams do not need the legacy pad config */
 	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
 		state->pads = kvcalloc(sd->entity.num_pads,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8a345b5fa39d..46296852cb5b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -749,6 +749,7 @@ struct v4l2_subdev_krouting {
  *
  * @_lock: default for 'lock'
  * @lock: mutex for the state. May be replaced by the user.
+ * @sd: the sub-device which the state is related to
  * @pads: &struct v4l2_subdev_pad_config array
  * @routing: routing table for the subdev
  * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_STREAMS)
@@ -761,6 +762,7 @@ struct v4l2_subdev_state {
 	/* lock for the struct v4l2_subdev_state fields */
 	struct mutex _lock;
 	struct mutex *lock;
+	struct v4l2_subdev *sd;
 	struct v4l2_subdev_pad_config *pads;
 	struct v4l2_subdev_krouting routing;
 	struct v4l2_subdev_stream_configs stream_configs;
-- 
2.39.2

