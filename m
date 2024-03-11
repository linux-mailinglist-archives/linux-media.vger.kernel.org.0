Return-Path: <linux-media+bounces-6812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED4877FCE
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 13:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DB531F22147
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 12:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE393EA9B;
	Mon, 11 Mar 2024 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgricwHS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F133D3BBF7
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710159479; cv=none; b=Rpw3cACr7dr9U9Ik8M2KTDLf5hFLX98KvcD8Iwqs8SXE82ytPY+7eFgF/5A4o07756ErsNkHt/JIua2lMdS6ukQxUu7WUCZmXMtYgVc51wdx9qkshOgWkbhwFWCYaXvKZyabKXEkhJKy/5OcyKzWeNClA3077X1zRwSCY8EGB/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710159479; c=relaxed/simple;
	bh=a2lHQAJJDKnUHqUq8InTqh4Vy8nT/QZjr0FLyvI2Hqk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kz4TAPtjJ5XF2FUKEwd3Xilwp/Et86QHgH4xWriTMR/B3mvGd3enl61pzmjUXaOnMquFAp0NgUnMry1QPR9Lzf6TqSzmBpvTJt+AV/cVNUdwHnIUzWWbssgbGFK7tUhpk5d2R3wT7kBNsa0u6p+22O9oV2Voi2fKhMOM1yfq0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgricwHS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710159477; x=1741695477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a2lHQAJJDKnUHqUq8InTqh4Vy8nT/QZjr0FLyvI2Hqk=;
  b=WgricwHSBV6Wwrp3FsWRWekY6wl4KUeMvl4qZMa5+hSXdE+KbMUTjq5w
   1b8ZAEAz8k7sLMhEfebWvHFNCMQA2MqRvg9rvNHtr3qk6nAyAtjNeONbO
   KxtJmU+EQN2NvdXp1Kk+6qHaQ68NcTW6TdmhvXZd7YKsNRFC2UkJ72n4J
   yV3MOE6+lghRs1YcapZGi/XjKumZ1rqvEIgkVE7XLy76up0fP2Givxx2J
   yaNW0GkyvCPqoyoAE/QhtI9XHVHuHUBdqbE2I8yth9qnp+YvaJQScp1Er
   9lCzIZm7pbEZNJgYniVwcU+iwze/QCASHj+J8Lb/imb4LRHvudzclCXca
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4929917"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4929917"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11239419"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:17:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 36F731201F7;
	Mon, 11 Mar 2024 14:17:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rjebH-005FBJ-0h;
	Mon, 11 Mar 2024 14:17:51 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] media: v4l: async: Properly check for a notifier initialised or registered
Date: Mon, 11 Mar 2024 14:17:41 +0200
Message-Id: <20240311121741.1249976-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311121741.1249976-1-sakari.ailus@linux.intel.com>
References: <20240311121741.1249976-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properly check that a notifier was never initialised or register. This can
now be done by looking at the entry in the notifier list, not the V4L2
device or sub-device that are set in the initialiser now.

Fixes: b8ec754ae4c5 ("media: v4l: async: Set v4l2_device and subdev in async notifier init")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2ff35d5d60f2..3b43d6285dfe 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -630,12 +630,14 @@ EXPORT_SYMBOL(v4l2_async_nf_register);
 static void
 __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 {
-	if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
+	/* Return here if the notifier is never initialised or registered. */
+	if (!notifier->notifier_entry.next ||
+	    list_empty(&notifier->notifier_entry))
 		return;
 
 	v4l2_async_nf_unbind_all_subdevs(notifier);
 
-	list_del(&notifier->notifier_entry);
+	list_del_init(&notifier->notifier_entry);
 }
 
 void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
-- 
2.39.2


