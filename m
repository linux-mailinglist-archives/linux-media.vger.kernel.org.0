Return-Path: <linux-media+bounces-9564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048758A74E2
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B2DBB21A84
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1F213A402;
	Tue, 16 Apr 2024 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHyBw438"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3FC13A3ED
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296026; cv=none; b=lyDQmhUubVatVTnIVT0Bs62YCYmD33GrCV0rHOhYkbUORaC7PRAgg18o1wXF+/m2REk6X1vCF1cHmMPP5VkD4Y2TdS6MnFu/l0ynSAXm7wMV66x9yxHFPUgKmMv/jW4mET96I107Tf6Qeo8YogED/4iE/PKIG1pHOofTsc/cxGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296026; c=relaxed/simple;
	bh=x1q2jYT7l6M/yyygGuOEuPh9b460A8OkfyHWmdoji1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pVHBJ+GmWAM6losg07UXfYLguQXOAt/RuFfaaf+s3472I/g+TUSUjI3M5ENFjnwFNe+WC3MhEMPesSO5UOoSo4Bbxlb4nUamLS6ycybn+IMATTi2bD3y8sMRCtIVwst6OuqRbhP9Kz1OBPAmhgHpXb19GNmjYlvLawgWdWtzhK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHyBw438; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296024; x=1744832024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1q2jYT7l6M/yyygGuOEuPh9b460A8OkfyHWmdoji1o=;
  b=VHyBw438+V+2I1bsutdD8lo1utuESOaNTg/DaJIdezV6uwG7yU+jz5WM
   c8t9mkFeHxPrug2Fh9p3r5PpriQMoyrtsoa3bNEWu+KMp6x2vkfdqgEPs
   nfFB+UaViChzMWjTdGV9iHmxMEL4IP6vqN+dTQoJu5ymHd5AWLaD967X0
   p3SrosSxrOxmRJR46ZDWxi+vhLghixdXeTRvzB5YgWnXl1s9/+P8wFAii
   TTBPNhIMiPI9rt9hh07HjKD2Lh13eOTvpMplXec2XwCo+oj4EuUKMKEhQ
   Y5CulnLQP79Z0ukMPZWGv9tfRAZpSFDuinb4ZQRV4tEKd8nvRZKVmdeyc
   w==;
X-CSE-ConnectionGUID: uVHOcIAGRYCrCNM2hm/tPg==
X-CSE-MsgGUID: lelZGV1oQ6aoxm3fO2elzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906075"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:44 -0700
X-CSE-ConnectionGUID: zxdqdfvES3yZVIXMUEtmEA==
X-CSE-MsgGUID: ofbD8i5kQuyBnsNhUUUApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155292"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3A871204F6;
	Tue, 16 Apr 2024 22:33:37 +0300 (EEST)
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
Subject: [PATCH v9 12/46] media: v4l: subdev: Add a function to lock two sub-device states, use it
Date: Tue, 16 Apr 2024 22:32:45 +0300
Message-Id: <20240416193319.778192-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
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
index 45836f0a2b0a..4b1b310b5d68 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1402,17 +1402,13 @@ int v4l2_subdev_link_validate(struct media_link *link)
 
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
index a9e6b8146279..9cce48365975 100644
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


