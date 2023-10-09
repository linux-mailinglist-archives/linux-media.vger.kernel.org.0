Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93C97BEE17
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 00:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378763AbjJIWJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 18:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbjJIWJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 18:09:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9D3B6
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 15:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696889352; x=1728425352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SnFvz40nTo1wWnvsvdfGJGtKxDfJKBDQfesPPQsi49I=;
  b=CpHRGPmMWCoGyG2FLMv5BVhF0tVt7+rSR4sC6dVncoATbdEYlInQod8k
   LZATdOHeba/fsqN6vHQPcFoLv6CQTqJTPyY2uUQ7SkJi7lYh1Cx9ZdN3v
   QKyWO4mUnqs26tBFylZl/h76SusIGf8S4xxO7VyiCmbNlafMbBmYcWdRB
   dk0bC6YE+AN1LcmuOAZVwxTNV5naE/EehJfZyCuTDLhvJ1j8h6bLG55zf
   nyO8zrbJhvEbvCv3oXpM858iEZYSGk5TQjRS6YIW5LXzGG3C3LcoyRI58
   RoHJCudN7iDBVjDtMh5U7G5XfVmks9tuQ6qwSyQP6nrOotpf2ZCAeyiak
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388123380"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="388123380"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782647386"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="782647386"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:10 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2C3C5120797;
        Tue, 10 Oct 2023 01:09:08 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 2/4] media: v4l: subdev: Add a helper to tell if a sub-device state is active
Date:   Tue, 10 Oct 2023 01:09:04 +0300
Message-Id: <20231009220906.221303-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
References: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
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

Add a helper called v4l2_subdev_state_whence() to return enum
v4l2_subdev_format_whence to tell whether a state the driver is dealing with
it active or not.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index ea05b70389b3..ff211b0f07ff 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1645,6 +1645,14 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
 				    u32 pad0, u32 pad1, u64 *streams);
 
+static inline enum v4l2_subdev_format_whence
+v4l2_subdev_state_whence(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state)
+{
+	return sd->active_state == state ?
+		V4L2_SUBDEV_FORMAT_ACTIVE : V4L2_SUBDEV_FORMAT_TRY;
+}
+
 /**
  * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
  *
-- 
2.39.2

