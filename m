Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9116E7B6886
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbjJCMI1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbjJCMI1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2A0A9
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334904; x=1727870904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hFROCNkmsn1XKTVWSYkM1LA3nbVxvI0qIVVkLgkbOLY=;
  b=Hq3AS3CtECGSk7/7jJhNUKAPi4p8/WXDuKUdGPC8NoKWpKHcBWXxt/+W
   X9Ty7BXCSkF/k+KN26X7KcryVF/AHEG5612kuE+D13r3lgjjM+nG/Mkua
   0Z8xMoeVWCggNhuNKVvmq+cxpjITbLvAdJN+etIbERrDJ4DoMq+2SQWKR
   ibR4jYu2jvDrYaF1vPJ52dI315ofrLl+KzhMPq/Ni+IaRvY6G/dZV5pJM
   ahNvXIP6Ya2CH6iuv2OOAuKD1KDKRxHgNbq82eMPXBaxiESPGYHeIFLHd
   sremQvtTvDW9d1KVxCUx7Mi3g9ixEwjv+vRDkbkmwLgC2nPkRDCizEQnj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681504"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681504"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285906"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285906"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:21 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id F0BB3120A57;
        Tue,  3 Oct 2023 15:08:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 13/28] media: v4l: subdev: Add a function to lock two sub-device states, use it
Date:   Tue,  3 Oct 2023 15:07:58 +0300
Message-Id: <20231003120813.77726-4-sakari.ailus@linux.intel.com>
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

Add two new functions, v4l2_subdev_lock_states() and
v4l2_subdev_unclock_states(), to acquire and release the state of two
sub-devices. They differ from calling v4l2_subdev_{un,}lock_state() so
that if the two states share the same lock, the lock is acquired only
once.

Also use the new functions in v4l2_subdev_link_validate().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 +++-----
 include/media/v4l2-subdev.h           | 40 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 854f9d4db923..df9a1ae65410 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1377,17 +1377,13 @@ int v4l2_subdev_link_validate(struct media_link *link)
 
 	states_locked = sink_state && source_state;
 
-	if (states_locked) {
-		v4l2_subdev_lock_state(sink_state);
-		v4l2_subdev_lock_state(source_state);
-	}
+	if (states_locked)
+		v4l2_subdev_lock_states(sink_state, source_state);
 
 	ret = v4l2_subdev_link_validate_locked(link, states_locked);
 
-	if (states_locked) {
-		v4l2_subdev_unlock_state(sink_state);
-		v4l2_subdev_unlock_state(source_state);
-	}
+	if (states_locked)
+		v4l2_subdev_unlock_states(sink_state, source_state);
 
 	return ret;
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 7c34243ffed9..e49e8af2fb52 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1418,6 +1418,46 @@ static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
 	mutex_unlock(state->lock);
 }
 
+/**
+ * v4l2_subdev_lock_states - Lock two sub-device states
+ * @state1: One subdevice state
+ * @state2: The other subdevice state
+ *
+ * Locks the state of two sub-devices.
+ *
+ * The states must be unlocked with v4l2_subdev_unlock_states() after use.
+ *
+ * This differs from calling v4l2_subdev_lock_state() on both states so that if
+ * the states share the same lock, the lock is acquired only once (so no
+ * deadlock occurs). Note that it must be ensured the locks must always be
+ * acquired in the same order.
+ */
+static inline void v4l2_subdev_lock_states(struct v4l2_subdev_state *state1,
+					   struct v4l2_subdev_state *state2)
+{
+	mutex_lock(state1->lock);
+	if (state1->lock != state2->lock)
+		mutex_lock(state2->lock);
+}
+
+/**
+ * v4l2_subdev_unlock_states() - Unlock two sub-device states
+ * @state1: One subdevice state
+ * @state2: The other subdevice state
+ *
+ * Unlocks the state of two sub-devices.
+ *
+ * This differs from calling v4l2_subdev_unlock_state() on both states so that if
+ * the states share the same lock, the lock is released only once.
+ */
+static inline void v4l2_subdev_unlock_states(struct v4l2_subdev_state *state1,
+					     struct v4l2_subdev_state *state2)
+{
+	mutex_unlock(state1->lock);
+	if (state1->lock != state2->lock)
+		mutex_unlock(state2->lock);
+}
+
 /**
  * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
  *					     is unlocked and returns it
-- 
2.39.2

