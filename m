Return-Path: <linux-media+bounces-35230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6C0ADFF84
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2C077ADAD0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C94A21931E;
	Thu, 19 Jun 2025 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgcAxUkc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E073085D7
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320952; cv=none; b=H7QhJz9ifKK/W0uCTK5NbEpid0hwJlPml8dw24cw2RIx/Ktw02II+fvKM9hUbS7SDjgluqpOoIJxno8kh6QUftlmEtu64q8tuwvuBEh2miyOBe/perfVcbsvqyYlqOloJ8VnozCgePQUdCh3rDX2PbnkSxwCYIf3IDgkEgxmkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320952; c=relaxed/simple;
	bh=KA3pwPqblSGzlWx487R0OnW0uMnLYmZnkMqSDxOE7fM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=leEvhO9mJAth7M6FEvs2xo5oXuil06maMStFVfrzVkHwPxwD43Fm0q1zhsY2Y2yoaMKf+eeVKJAmgvuE5lUCPAUj+HRlj/gvr1U9aUel3AQ3yCC2RYDnR3630IpBV23SgKMUV/41peZc54zgJIvr6DOuoXeRwPY7/oLHo5MQDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgcAxUkc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320951; x=1781856951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KA3pwPqblSGzlWx487R0OnW0uMnLYmZnkMqSDxOE7fM=;
  b=mgcAxUkcF/ZbOAtgonVlSTglq7H9JKDwsdqtxhDyvhXJjRg8EXTlIzPC
   CFagu0m9qaRaY8nnIV+F1jxc52o7ucrrH2xTbjKvWUKsdmRSn9cRytVQG
   EBjT2Y3wtezJ4DM8sgaZUWmWpG0CjbsPh7b2BN8hRFEF79Exp1NOBSbNi
   Ajs+p4FBL0UfAFSMw6wUREPwhDXVtYlNIus8rARzjSOsxr7lbufp4iUOj
   LKSp6EcnTAIRlYGQWdk7byWB/MSDNvO0xBjm+9m22jMuOX5QbS3PNFNdY
   EYvYHZSD3kz2UTzvFQPqvswplNHtDIlvMSlX5YP2NaTxJECmvR1X6suhb
   Q==;
X-CSE-ConnectionGUID: d/o/M5+KR9SB80lz8H/VxA==
X-CSE-MsgGUID: 0sPZYQVET468kwlxkjOlzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716669"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716669"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:50 -0700
X-CSE-ConnectionGUID: 6iYKS9sRRxCu6++6BcjdlA==
X-CSE-MsgGUID: BusN+Xt4SC+FUr2pZiSbgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640615"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8C8511203D2;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006doc-1k;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 04/13] media: v4l2-subdev: Add a helper to figure out the pad streaming state
Date: Thu, 19 Jun 2025 11:15:37 +0300
Message-Id: <20250619081546.1582969-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper, v4l2_subdev_state_streams_enabled(), to tell which streams
are enabled on a pad. This is useful to e.g. figure out in a driver
whether a hardware configuration change is necessary to enable a given
stream.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 17 +++++++++++++++++
 include/media/v4l2-subdev.h           |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a3074f469b15..60b8febd3339 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2453,6 +2453,23 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_disable_streams);
 
+u64 v4l2_subdev_state_streams_enabled(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state, u32 pad)
+{
+	u64 streams_mask = 0;
+
+	for (unsigned int i = 0; i < state->stream_configs.num_configs; i++) {
+		struct v4l2_subdev_stream_config *cfg =
+			&state->stream_configs.configs[i];
+
+		if (cfg->pad == pad && cfg->enabled)
+			streams_mask |= BIT_ULL(cfg->stream);
+	}
+
+	return streams_mask;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_streams_enabled);
+
 int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 {
 	struct v4l2_subdev_state *state;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 57f2bcb4eb16..deab128a4779 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1731,6 +1731,9 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 				u64 streams_mask);
 
+u64 v4l2_subdev_state_streams_enabled(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state, u32 pad);
+
 /**
  * v4l2_subdev_s_stream_helper() - Helper to implement the subdev s_stream
  *	operation using enable_streams and disable_streams
-- 
2.39.5


