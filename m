Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA8B7BDAA4
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 14:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346452AbjJIMFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 08:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346445AbjJIMFf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 08:05:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3208B4
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696853135; x=1728389135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rr8eaXcYtci4MIUnxgJplu+CGOcDsdx0Ws3VZvKbuS8=;
  b=nTmKhkDoug47uUo9ZUCw9t9CKTUnqAKEjweF/++EE13SRTyFNvY/Li3U
   WHqcfXVpD6TlMY9OpYkVPurRaTU7Ppz+XtTjpABVDPValAY28NeR8Sd3S
   WeRNhPQBCrKels57xMTwNMNzNZ93HVfEFJQkcr8UZbdSPHviiG4S3av0b
   OnvUpLxJWyTIATzQqNwa0YnWr1NzpzIk5DSqiSE4bi2B9xnnW9XZHhW5Y
   z9eEBdrmQQjv+/HVQ0p2KORzVmjxkT5nmO30jU7NU7X/tTzGQdJjA93y2
   bsCPLcgM3RnM3QZeZB9171IC+WxTLYMURzLmXPmhc5ZRkJcQzMiNsyDbG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2725500"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2725500"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869216196"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869216196"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:31 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 62A1D11F9E8;
        Mon,  9 Oct 2023 15:05:27 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH 1/4] media: v4l: subdev: Set sub-device active state earlier
Date:   Mon,  9 Oct 2023 15:05:22 +0300
Message-Id: <20231009120525.202957-2-sakari.ailus@linux.intel.com>
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

Set sub-device active state earlier in order to have it available to the
sub-device driver when driver's init_cfg operation is called.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++++-----
 include/media/v4l2-subdev.h           |  3 ++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d295a4e87b66..cd590951c393 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -53,7 +53,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 	struct v4l2_subdev_state *state;
 	static struct lock_class_key key;
 
-	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
+	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key, false);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -1426,7 +1426,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_has_pad_interdep);
 
 struct v4l2_subdev_state *
 __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
-			  struct lock_class_key *lock_key)
+			  struct lock_class_key *lock_key, bool active)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -1451,6 +1451,9 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 		}
 	}
 
+	if (active)
+		sd->active_state = state;
+
 	/*
 	 * There can be no race at this point, but we lock the state anyway to
 	 * satisfy lockdep checks.
@@ -1470,6 +1473,9 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 
 	kfree(state);
 
+	if (active)
+		sd->active_state = NULL;
+
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_state_alloc);
@@ -1493,12 +1499,10 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
 {
 	struct v4l2_subdev_state *state;
 
-	state = __v4l2_subdev_state_alloc(sd, name, key);
+	state = __v4l2_subdev_state_alloc(sd, name, key, true);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
-	sd->active_state = state;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c1f90c1223a7..ea05b70389b3 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1346,7 +1346,8 @@ bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
  */
 struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
 						    const char *lock_name,
-						    struct lock_class_key *key);
+						    struct lock_class_key *key,
+						    bool active);
 
 /**
  * __v4l2_subdev_state_free - free a v4l2_subdev_state
-- 
2.39.2

