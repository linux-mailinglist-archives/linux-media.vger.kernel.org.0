Return-Path: <linux-media+bounces-10134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EEA8B2AB5
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B6891C21604
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861A2156242;
	Thu, 25 Apr 2024 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHI1pw9P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D21156223
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080458; cv=none; b=BWc9nXFWGxhVIBKgRKbkGjzJEkTX5CxMwWG4LHDf8ASg1L6He7TpqkgJyPyWElPa/tUYBSP8u7InjtL1A8kt/FFf8OntLTNJRrQFUUFMq2a7cQFW4mHMWwdEi3FObE8k4a1it5sf1xNQ1Denu509AJwX8q8KkE+cNP4pJpYpi4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080458; c=relaxed/simple;
	bh=iKlKjLWVWWEm2fX8ZeF4D+tdTozJyFKOhdNYkVekWfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vx2jC5K0z7kTSDH8P02LCrOimlO4HyIne3UQyvd6UwVjmMF5sEeWmL7IuwUAyfhF3I0RRR0TZqWDJWyKJO/guPT66pQmDCxi40lOS2fIv03imAd7jysFNSeoUgn81m3xvH7BaMfN/6WrqV+INO0SVdW2cMhvsjA3k4Dgl5AM4YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHI1pw9P; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080456; x=1745616456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iKlKjLWVWWEm2fX8ZeF4D+tdTozJyFKOhdNYkVekWfg=;
  b=HHI1pw9PemA3WRiufv8DGp8+rRN+osHAGU3JcadWCla2F7epAMREoNze
   gZ1WU17IoeAu2gVv41Jv7kFG4rvQ/sHgLd3fSOR3pRMTewH+UAfpBxrAH
   hWeSJYvPT2gJ8MOIqj6VS5q+56Uwo7dk3Ysf53mWZ1oYMjb4fQotHIQHq
   72T7lPO3Q12q62hNnUjLbFOM9zrtZHQt/lycZYgZMWrlhGa0VKagdbt/u
   9zFufJ0AZDFSmjzuKsOOniUeYcejyVVmJ1peZZh6jRoTdeVuao1lAhmYg
   CtY4HFFXCpOEUCLn3I/ahUf0QwT13/jXl5ffJUE5blJqEQD37g7Jv5f48
   g==;
X-CSE-ConnectionGUID: c8S5spQ6TAq1wxS+QhGH2g==
X-CSE-MsgGUID: FcTxjbXxT5mDY6cgF0+HJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10016718"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10016718"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:36 -0700
X-CSE-ConnectionGUID: dkEujH2ZTkO2bAPyBEatvQ==
X-CSE-MsgGUID: MuIOaf6uQuW1oXHG/cVRWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25620941"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7E8C111FC19;
	Fri, 26 Apr 2024 00:27:29 +0300 (EEST)
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
Subject: [PATCH v2 10/14] media: v4l: subdev: Add a function to lock two sub-device states, use it
Date: Fri, 26 Apr 2024 00:27:07 +0300
Message-Id: <20240425212711.928300-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
References: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
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


