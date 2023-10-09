Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1A77BDAA5
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 14:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346455AbjJIMFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 08:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346308AbjJIMFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 08:05:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E5CA6
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696853136; x=1728389136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SnFvz40nTo1wWnvsvdfGJGtKxDfJKBDQfesPPQsi49I=;
  b=htV4w8i3ZhqHBTpzQCWxLA+D89tuBp1HEYmUvO0BYb5BmHJ1y30I5E8I
   lQqeJrQ5PN/zj70PjdXv3x1RLhnEWa7Zk/pYVilbwVkYAa7+gTeaEZi9z
   aV485rwTeUkB4bUHumaWq9XyvngUg0Db7KcTnQs/Y3UgPUziQ/R0wvFxj
   ds9azugmnh3y8k3EdQ6gAny3bnOr+f+HIt0W3JS6PnP/YoV8/nW7J4yJe
   edbiZb54FabHC8CPsXpAMMJAY7fKQ0556nx3cpLHnlPCa83g01WNuGJVt
   /kIIiBgMF/kamIQStK8HJFUGLi6nLC5mDiruGqKufwMYUJIiID2MDbRNb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2725507"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2725507"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869216199"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869216199"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:32 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6C66611FC2C;
        Mon,  9 Oct 2023 15:05:28 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH 2/4] media: v4l: subdev: Add a helper to tell if a sub-device state is active
Date:   Mon,  9 Oct 2023 15:05:23 +0300
Message-Id: <20231009120525.202957-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009120525.202957-1-sakari.ailus@linux.intel.com>
References: <20231009120525.202957-1-sakari.ailus@linux.intel.com>
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

