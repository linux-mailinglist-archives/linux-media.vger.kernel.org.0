Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845657C837E
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 12:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbjJMKov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 06:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbjJMKok (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 06:44:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C23D12E
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697193872; x=1728729872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EPFqN35/f/wKI3Gz2wqDPm9Oj5/swgC55frdK8V/d5o=;
  b=J9qBJf1xXNR8QQ1Q0IqgJ4TuUT409ASZxJyXH/MKPAgChbqO82H9KLDQ
   H1rHh+hpbHh4U8txA8NC2Vn1VIJjIwBQngtRKLtTUnbFkkrRXw0kBFxGH
   gR/naGYyssYNSmOWv4CVBC8MazyPTi+IuS9/pKItSkcDhN3yrDuBVmtw2
   HNRSjyS0NuAVh4CfYHoBaqiw1J2/i+CQONW/yPgHoJK7y84ApZGzUydK8
   +LCjlHUA4ksSG5PXi6C6smabF1Ls5hkZHjCnAll3sQxOIO+Qgv720AYSR
   joKjOu/QfyKYA8udTF/2gjXP96oR+esA97P4/tSh3w3RF+8i06tHtphsA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388004010"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="388004010"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="825016432"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="825016432"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:44:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AFD53120A5B;
        Fri, 13 Oct 2023 13:44:25 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [PATCH 1/6] media: v4l: subdev: Store the number of pads in sub-device state
Date:   Fri, 13 Oct 2023 13:44:19 +0300
Message-Id: <20231013104424.404768-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
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

Store the number of pads in the sub-device state. This will be needed to
validate pad when retrieving information for non-stream-aware users.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
 include/media/v4l2-subdev.h           | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d295a4e87b66..52a8043ab556 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1441,6 +1441,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 	else
 		state->lock = &state->_lock;
 
+	state->num_pads = sd->entity.num_pads;
+
 	/* Drivers that support streams do not need the legacy pad config */
 	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
 		state->pads = kvcalloc(sd->entity.num_pads,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c1f90c1223a7..5e5499a2fb0e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -756,6 +756,7 @@ struct v4l2_subdev_krouting {
  *
  * @_lock: default for 'lock'
  * @lock: mutex for the state. May be replaced by the user.
+ * @num_pads: the number of entries in the pads array
  * @pads: &struct v4l2_subdev_pad_config array
  * @routing: routing table for the subdev
  * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_STREAMS)
@@ -768,6 +769,7 @@ struct v4l2_subdev_state {
 	/* lock for the struct v4l2_subdev_state fields */
 	struct mutex _lock;
 	struct mutex *lock;
+	unsigned int num_pads;
 	struct v4l2_subdev_pad_config *pads;
 	struct v4l2_subdev_krouting routing;
 	struct v4l2_subdev_stream_configs stream_configs;
-- 
2.39.2

