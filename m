Return-Path: <linux-media+bounces-6947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C028687A375
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F181B1C214B0
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3FF1B598;
	Wed, 13 Mar 2024 07:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3jH8jaz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92C179B8
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314756; cv=none; b=M+YVHGlxbmtZ9JegG3WovZnOcClPNOjQS7j4CWL5rHm5UtYX9ahSWuD8KickkyV9XCngQxzOqbeR+BGA7Xbxpb66arHvYQlNr0nZ33L+7dzexIC0J2NgTyhpPlUyDqbzP2llzisj1Cu0hDNNb0QElZ/SPodU1xCuknDifUyzBes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314756; c=relaxed/simple;
	bh=5CEumrArqSn3mQB8bdKjqdG7hHq439rMO0PeqsSMsHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XonhT6WrOHft57prrN+JlZSC9zMaIPMEqnpUvKL0niL9rNCwrGbo9yg/wZZYd3tofO/JmV85dKaFLO0fk1qdXdgNGJYAfjH9jw4ZV/OLglXemkK9ZiMp4EV67RZkyasQd8gku/ZYKKCcMDqWh5uYvofPh/N9Z1G5gpW0WkxmiDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3jH8jaz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314755; x=1741850755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5CEumrArqSn3mQB8bdKjqdG7hHq439rMO0PeqsSMsHo=;
  b=j3jH8jazU/iZGqpi41cfSi6kUW21N/sEDpFAUiMCIktQbjV03GeTQ1qB
   OIJyWPk0Cr2g1JNq78aGw/kJviY3/DbKu+iOQZbYtNQbjf8drt2u6uG2C
   O9hMwrxOG3b8xyGoqjK8yD77B9fq78zWcNiJlJFo/5NO3x+5HrRb/vvkz
   hf69l2laQXIISQt9NTo8WqrsPoGArAr7hlE9oK7h0a5RTTUG9F3xsi91i
   ThdK9JiuvutA1RsyDe9e8XbmWiMD1RR3PyM3Gw9v+T4lr7yl8rwRaOLRZ
   d55AJIqQlXJA8XFtf7cHyjC5qGBtLSU8wP2pSoCtCrbVxmg9ZUVg4EtxN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575577"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816407"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:38 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CBB121206F9;
	Wed, 13 Mar 2024 09:25:34 +0200 (EET)
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
Subject: [PATCH v8 11/38] media: v4l: subdev: Add a function to lock two sub-device states, use it
Date: Wed, 13 Mar 2024 09:24:49 +0200
Message-Id: <20240313072516.241106-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
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
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 +++-----
 include/media/v4l2-subdev.h           | 40 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4c6198c48dd6..6c34df19ea2f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1400,17 +1400,13 @@ int v4l2_subdev_link_validate(struct media_link *link)
 
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


