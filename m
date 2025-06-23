Return-Path: <linux-media+bounces-35565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8BAE35AC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60301188F883
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 06:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80471DC9BB;
	Mon, 23 Jun 2025 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDxN0Xkg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D7320F
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660081; cv=none; b=l/0I+o5MZ8Tv2cGY/Zarh5z7x9fe9iWsm63Tx/k95DVRrN6vMS5McRUQcKeTO6DOy+Q9hoBFuhaQwJE+ef+bJL5PedbOsQ48fksYlJ0cvzKhm/5vRv1JPfda50EshlfH68Zp82ZmiDEQgRWQ1Sc+0/ETN9D2iIOklIM5nqtkR0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660081; c=relaxed/simple;
	bh=6nzIOxdwwY2J5x6hmlHTrKbkBDlDQddf6D9phh2NADQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GzbpV2nYpBLxCEcbIyV2z3iymE/O70cqonO7bDjde3uV9qjC0/Y7E2T9NAIliUMxS6OEXH4TpQIxKHJNgCPfFOMqTMmUgq7WK4mxL43uRiCDc0NnUbHXyzKnp7CKoSZjW3lZc9dpIWQnBA6VMs5+/q4/aq7cJ8RGff06wXsEjAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDxN0Xkg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750660079; x=1782196079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6nzIOxdwwY2J5x6hmlHTrKbkBDlDQddf6D9phh2NADQ=;
  b=iDxN0XkgmXdHN858dswaL88tFcDkH7hjrl7WTV8JIlkNex9cF3k0Z64W
   CZFnKrP9cl0jxSuuxw9xlsxcml0sfR0dozbvRTk3aT+2TVOrSCTUTF22x
   1np+EpbY2ALx1bQu93xWGtyoaqovbXP+IK2hd3g3TChUoEAOwySf8vmwx
   +E+6iA0wIu60DgPgxy2862iTwf67q9fZ2DotohG0nv6iNwgcBHMTiwhZB
   VHPHyvbCcPD3C1ff+TO6BW6HfuyADEFn3yYIJQfHDcpI7hSmLHtVWtH40
   BM1pb3uFDyBsZajb1UUMAwRq27N5CZAfh7OCOnqByxfYx1Do9z8cDUDuA
   g==;
X-CSE-ConnectionGUID: r7b2E2JyQ+aDYBSDra7pbA==
X-CSE-MsgGUID: QZuglQQETXmU2ldCPVuDww==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52985208"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52985208"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:27:59 -0700
X-CSE-ConnectionGUID: c9JY0dagRpKmTbG9fLMNjg==
X-CSE-MsgGUID: Jif4+uTuTZidKjHrbnYLhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="175106228"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:27:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E52161201F7;
	Mon, 23 Jun 2025 09:27:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTaeo-009ZoR-2p;
	Mon, 23 Jun 2025 09:27:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 1/3] media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
Date: Mon, 23 Jun 2025 09:27:52 +0300
Message-Id: <20250623062754.2282598-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623062754.2282598-1-sakari.ailus@linux.intel.com>
References: <20250623062754.2282598-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's a common pattern in drivers to free the control handler's resources
and then return the handler's error code on drivers' error handling paths.
Alas, the v4l2_ctrl_handler_free() function also zeroes the error field,
effectively indicating successful return to the caller.

There's no apparent need to touch the error field while releasing the
control handler's resources and cleaning up stale pointers. Not touching
the handler's error field is a more certain way to address this problem
than changing all the users, in which case the pattern would be likely to
re-emerge in new drivers.

Do just that, don't touch the control handler's error field in
v4l2_ctrl_handler_free().

Fixes: 0996517cf8ea ("V4L/DVB: v4l2: Add new control handling framework")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index b45809a82f9a..d28596c720d8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1661,7 +1661,6 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	kvfree(hdl->buckets);
 	hdl->buckets = NULL;
 	hdl->cached = NULL;
-	hdl->error = 0;
 	mutex_unlock(hdl->lock);
 	mutex_destroy(&hdl->_lock);
 }
-- 
2.39.5


