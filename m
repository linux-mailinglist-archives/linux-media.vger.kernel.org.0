Return-Path: <linux-media+bounces-10185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA488B334E
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17DE01C21C06
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D63B13DB88;
	Fri, 26 Apr 2024 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHCTvy7D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E6713C9A0
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121459; cv=none; b=tO4udToEzNu2JOzsxqQAV7KMGOzxIpz91WJwpEkGDqT0NiXAR6i94zv4UvMqqiHN0Krm99A5dfGGXj4ZtNjAX4sh/3KJDhZH5LBvvYXIDnG2WDMtuY48Rj96d03+17DnfkNmSACPbv0tqnDwjpWdnSDPlylR1zq8VXwDl08O+J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121459; c=relaxed/simple;
	bh=iKlKjLWVWWEm2fX8ZeF4D+tdTozJyFKOhdNYkVekWfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aTfq4Dfn0YL4YDmEj8TC5tRmOEFpo5dLmNTrP05V6q0QF0RcIYWVekAcTulFbM8nkKWCRuq6LK3t4q25zVxA7NQ65qxQvLQ35vFkcQql7UM8gCHDjlAKNvczuzeB9yvjUq2szVKydAWdQnS5Iao+9IQ7cVGMFJpkKuCZZcd2OgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHCTvy7D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121459; x=1745657459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iKlKjLWVWWEm2fX8ZeF4D+tdTozJyFKOhdNYkVekWfg=;
  b=HHCTvy7D/nrb8bp1pcWCmZNK31PqJ5/bJqlho9IOikCHvsRIwJfW5C3C
   fGnDNwMCK3k7EzhYMyJixVjNk0WQuNlxXmQAFGt5UWRhJSVBSI1m2J3GV
   UCYXS2UpsdYT7lewuHTE5nKoXjPwX2EomWmVI8XE6QkybAFM161Sg5ML1
   Sb8PmQzorvdmXB+Hav+/J56cwp2i5L4JE9EWYSwftusl75EJN1BBjTq7v
   ibmCgIbI9b15/TPeQHB/51aUziTeO/GSu5vDBqsZA7W0tE+BBvTuGaHb6
   zDNFM4RWdaNK0mtZmQJgrzljMBwQs9spc8zryHX9pgQO2iLf7FLnhq8Fv
   g==;
X-CSE-ConnectionGUID: YojXfvZjQ7+Tc+FTiYJGjQ==
X-CSE-MsgGUID: IITorpZRRIK/YcDCVBcumQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683835"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683835"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:58 -0700
X-CSE-ConnectionGUID: vx2lGcdMQH6zggx+cCfxdQ==
X-CSE-MsgGUID: m3e1Mq2PQcejQm4go4m5og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598536"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:55 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7B67211F855;
	Fri, 26 Apr 2024 11:50:52 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 10/14] media: v4l: subdev: Add a function to lock two sub-device states, use it
Date: Fri, 26 Apr 2024 11:50:34 +0300
Message-Id: <20240426085038.943733-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two new functions, v4l2_subdev_lock_states() and
v4l2_subdev_unclock_states(), to acquire and release the state of two
sub-devices. They differ from calling v4l2_subdev_{un,}lock_state() so
that if the two states share the same lock, the lock is acquired only
once.

Also use the new functions in v4l2_subdev_link_validate().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 +++-----
 include/media/v4l2-subdev.h           | 40 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2d67ec54569a..779583447eac 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1437,17 +1437,13 @@ int v4l2_subdev_link_validate(struct media_link *link)
 
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
index 1af16b16f0bf..e22c50ce7e05 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1724,6 +1724,46 @@ static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
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
+ * deadlock occurs). The caller is responsible for ensuring the locks will
+ * always be acquired in the same order.
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
+ * This differs from calling v4l2_subdev_unlock_state() on both states so that
+ * if the states share the same lock, the lock is released only once.
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


