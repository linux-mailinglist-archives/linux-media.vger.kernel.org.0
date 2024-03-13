Return-Path: <linux-media+bounces-6967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994487A38A
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99BF2826EA
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3617225AD;
	Wed, 13 Mar 2024 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHJtdIr/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316617585
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314771; cv=none; b=WLtMTHzNxAQvUzMQ8HvWaTJn4HBySs+p2+6e4+mP8Gp/4CIJ/yxft/8Nm+GSuI08zNFo/1bfYLeqz6/fATvmQVU1nCTlLqmk3tSXuZplc0Pm5Mo8PlGuOPmTmqEcV+ee9qZVNpTWFp43nHNH6vKPN7QtqT692qzJqYP2ou7UOpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314771; c=relaxed/simple;
	bh=ymHEoaLfWQRcV33kdtcx8WOX0V7oHsJxr4XWfZAPNk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Id2J2l1HYdOKdQ2yTGpfD+LTWlKWB0q1V96tkF9ZSDAe0rgrLGQeUCNLN7qZIQCEpbukjKceHRobN/GL+wtM8OHojHSxROJfNXbpyIEhb5BngTdJ6O3Oaz/xqyn/SeEPheOCeJp1oEPh6EMEBxNno1xQ/FceN20SemHWZ9LWGVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHJtdIr/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314770; x=1741850770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ymHEoaLfWQRcV33kdtcx8WOX0V7oHsJxr4XWfZAPNk8=;
  b=CHJtdIr/ggTKfgY4S6A2OTNmy+UdbZk4iCsD6+/M/mw8RA8nRHBcghRx
   OckBMEJRrKRJdTY5FzQ07lszj07QCNZCLhPiVTSi0TgTo+1ERcLYZtdZa
   Dj6Lmjv9jM91jYFEN6UkdWweXaNyTEUc9YMhYSj5IpWvfMUlp+xU9uX0F
   L4q6DuUBPyuJ+81vera90h+EXAXpxrZuHk8dZXCK2f6ACYdPapRMPVHzW
   RDQ+Srl4kgxVqVWA5Xy5CK5r1BMNEO88xfL7agw6oD75c5N7s9MyNiKPP
   is/iPxAex4c25p2L1Z9QplGMzKJxYsOSxDquarfxz0deDQQDwOds/lQxP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909312"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542351"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:06 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F0B631201C3;
	Wed, 13 Mar 2024 09:26:02 +0200 (EET)
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
Subject: [PATCH v8 31/38] media: uapi: v4l: subdev: Enable streams API
Date: Wed, 13 Mar 2024 09:25:09 +0200
Message-Id: <20240313072516.241106-32-sakari.ailus@linux.intel.com>
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

Remove v4l2_subdev_enable_streams_api variable that was used to easily
enable streams API for development, and conditions that use the variable.

This patch enables the streams API for V4L2 sub-device interface which
allows transporting multiple streams on a single MC link.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 30 ---------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c8c435df92c8..b3a697df4b66 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -26,15 +26,6 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-/*
- * The Streams API is an experimental feature. To use the Streams API, set
- * 'v4l2_subdev_enable_streams_api' to 1 below.
- */
-
-static bool v4l2_subdev_enable_streams_api;
-#endif
-
 /*
  * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
  * of streams.
@@ -570,13 +561,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 	int rval;
 
-	/*
-	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
-	 * Remove this when the API is no longer experimental.
-	 */
-	if (!v4l2_subdev_enable_streams_api)
-		streams_subdev = false;
-
 	switch (cmd) {
 	case VIDIOC_SUBDEV_QUERYCAP: {
 		struct v4l2_subdev_capability *cap = arg;
@@ -916,9 +900,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_krouting krouting = {};
 		unsigned int i;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -989,9 +970,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_routing *routing = arg;
 		struct v4l2_subdev_krouting *krouting;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -1019,14 +997,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-		/*
-		 * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
-		 * enabled. Remove this when streams API is no longer
-		 * experimental.
-		 */
-		if (!v4l2_subdev_enable_streams_api)
-			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
-
 		/* Filter out unsupported capabilities */
 		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
 					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
-- 
2.39.2


