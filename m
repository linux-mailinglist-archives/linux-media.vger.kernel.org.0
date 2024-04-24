Return-Path: <linux-media+bounces-10018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31E8B0948
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2FE21F2377C
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCEA15CD6A;
	Wed, 24 Apr 2024 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwZSZBzB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9DA15B997
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961389; cv=none; b=O1Qna1Fj2S0JhWGsJb2AdpKxpoGYHA4Eixh12ic4j3tFAX4KuPvbKMHGA1ohhDeorNjuS18dNcbuJiSXnHczEBTyJeRwYVpknlRj4S0jv3khuc8Y/cg4X/yXvv2EJddpVSrrC4Z6MWO/QQl3JOHaiP2v0q1nhwlPaTGPBFZ/7iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961389; c=relaxed/simple;
	bh=HWo70uAnzn4Nud/ID2UJzFa0xSOrIPMcp/Kd/BkRAak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bvo7LeDC4mIWw8qXSQ05V81ag/ih/U/y8q2qVFXqnG8dPpnFFjTNxhQGZxPEdMzRDhMP/uch3K+146udxOCfcGi7LGPvF6fzcC10V0aPUAWh+duRs5RTUjRpz2/8G0h2geO8GmYMZq0fE9mfvwzT0Qgul1GKeCxmT5DdWbsq7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwZSZBzB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961388; x=1745497388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HWo70uAnzn4Nud/ID2UJzFa0xSOrIPMcp/Kd/BkRAak=;
  b=KwZSZBzBSDZC2f4yko/6+DVTa4NFlia6a1WrtAfz6wQb3zRQ3PcV02I0
   /AN7VT4nuUqkU18RXJeqQRRa9FC4n2bVsnF2y0EYspgcTe78772Msz5r3
   CWgzPZS4vCBiE8M12HOEJeYpJ6S68Qw4vSV6J9mczUPJ1apaj6qOovqsG
   4BbbErYW5nUyUC2IWpe5Do8OQWcAgtgl8Yel2VT6x8BuXOjqsAabTmCJT
   vlDUn4OxxG6C9b3qfQtNNqf8gleclbxKQ5N93bo9Eifh+bGbxb/acIFLh
   Gj+J5uEXbuvmV8saaXodAF2Qhac3mfBX4UVLuC/zXs+qiZCI5NXZl1fo3
   w==;
X-CSE-ConnectionGUID: g1zXNnhxRNKsUsplzIU3TA==
X-CSE-MsgGUID: nAfslagMTp+vimPW6YOqNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9809695"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9809695"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:23:02 -0700
X-CSE-ConnectionGUID: dsn56hrASzK55kFINPhCMg==
X-CSE-MsgGUID: pkOBKGq4S3KPj6gghSl8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29512879"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:23:00 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4573811FAD8;
	Wed, 24 Apr 2024 15:22:56 +0300 (EEST)
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
Subject: [PATCH 11/14] media: v4l: subdev: Copy argument back to user also for S_ROUTING
Date: Wed, 24 Apr 2024 15:22:34 +0300
Message-Id: <20240424122237.875000-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the user needs to know what went wrong for S_ROUTING, copy array
arguments back to the user.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5e928e2a2beb..0260acef97d2 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3461,11 +3461,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	 * FIXME: subdev IOCTLS are partially handled here and partially in
 	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
 	 * defined here as part of the 'v4l2_ioctls' array. As
-	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
-	 * in case of failure, but it is not defined here as part of the
+	 * VIDIOC_SUBDEV_[GS]_ROUTING needs to return results to applications
+	 * even in case of failure, but it is not defined here as part of the
 	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
 	 */
-	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
+	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
+		always_copy = true;
+
+	if (err < 0 && !always_copy)
 		goto out;
 
 	if (has_array_args) {
-- 
2.39.2


