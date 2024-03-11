Return-Path: <linux-media+bounces-6811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD44877FCD
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 13:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D4511F21FFF
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 12:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5713CF7E;
	Mon, 11 Mar 2024 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsbrPKyn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBFF3D0BE
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710159476; cv=none; b=Q86dR+kSsLQjBAecX+vQ5xhNBpcSk01SdLjFV6/M8hb4oxNdwRaumgIa9hPHFvbxyBwxqbb1AS4SQvoR0e8fr4mOaDKfQBmF6ZLPefK0BqkZcrMLYzQ1MdHKfnYKW47aJlp2wxDpQEuZ9HW2Rvwu7EwnEsAv0CP0Zm6In9THiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710159476; c=relaxed/simple;
	bh=Yr0ksm2KARRh8UdYLBdXOsmO9GxfPdpZbHX1EKHJdFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p3VvM/tVWHKJ2t7URHpkwcXvp6tO2QxnvLldP179rrvBasjjYIlwbWhynJzPqH+6wdDxSbhUNBh9GG2yoxnUOWKe4asU/vNCepdAkIM21wb523P9kkqL87p4cLgrNLmrarFKAMXtbye6QQJ/23WPbMz/Jv65QLO4KuQHBXI5jME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsbrPKyn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710159475; x=1741695475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yr0ksm2KARRh8UdYLBdXOsmO9GxfPdpZbHX1EKHJdFs=;
  b=KsbrPKynDN1IR2nAcHa1fg2YnRA8KvyyiuD/HkNX6gPaiizdimRz3/aA
   02/ELrFCzD5SkhbjjjlEi7qwRQlDNA8MZ7xPp1ZdsuRh7WmLxAclLgPpl
   fJRC5B26xCWIfxoBSG8TTdVxXwJ5qnXjOopPW0OSNZAQeWJdllU0IXEBw
   dWbu4+YG49tP0M3mh+fAcwZrjnLGFH6DaRpCoRH14DnHyiouNO1NGSGLl
   kzoE9tih+zn7pASOKzsGIR0ofH4ih6h7AS3qiYPnCggLI1QSMzMumhsOd
   Ni75X6eEV8QWstEgyQ82LjmoUiVZ5Qn/6w2AeAM/wrJvsBzpjwJbcYPlq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4929914"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4929914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11239418"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:17:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3434311FC24;
	Mon, 11 Mar 2024 14:17:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rjebH-005FBE-0f;
	Mon, 11 Mar 2024 14:17:51 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] media: v4l: async: Don't set notifier's V4L2 device if registering fails
Date: Mon, 11 Mar 2024 14:17:40 +0200
Message-Id: <20240311121741.1249976-2-sakari.ailus@linux.intel.com>
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

The V4L2 device used to be set when the notifier was registered but this
has been moved to the notifier initialisation. Don't touch the V4L2 device
if registration fails.

Fixes: b8ec754ae4c5 ("media: v4l: async: Set v4l2_device and subdev in async notifier init")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 6a7dcf43d712..2ff35d5d60f2 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -620,16 +620,10 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 
 int v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 {
-	int ret;
-
 	if (WARN_ON(!notifier->v4l2_dev == !notifier->sd))
 		return -EINVAL;
 
-	ret = __v4l2_async_nf_register(notifier);
-	if (ret)
-		notifier->v4l2_dev = NULL;
-
-	return ret;
+	return __v4l2_async_nf_register(notifier);
 }
 EXPORT_SYMBOL(v4l2_async_nf_register);
 
-- 
2.39.2


