Return-Path: <linux-media+bounces-35631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1BAE4036
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 806BC17C47B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBA92475E8;
	Mon, 23 Jun 2025 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqVnDyIL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2737081F
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681403; cv=none; b=NnSzaHUdr/y3CegsTN9KUSYw/cKdXHksAkM2yKWNNQ8GERKapGkCGZbqcsGfhJ8Jw9CnClXzZPgArCH05PO/ErUnJb6KQm6+1fagpuS0W1ddiDJC1E93rsfUahDBNNBVau/LyJtTYyQsBL0mmRcamfTeVXQIqYBKZMBaEt73rpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681403; c=relaxed/simple;
	bh=6nzIOxdwwY2J5x6hmlHTrKbkBDlDQddf6D9phh2NADQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ID9Ej6ygEY/WN053UIufcyJ/wF+GM01U7w8HpWmktkjrycEKjcfpSllsQtOnA0vzQcSaM/2uY90ZEP1tV8QukRDHFxaRcfHoBZ8IBUByi75dURTE2rbuH6SMNUq+BJh4YjtV2wx5Mc7F1UNtbDmGaDu3ZJsH9gt3eGVYGi/t30M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqVnDyIL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750681402; x=1782217402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6nzIOxdwwY2J5x6hmlHTrKbkBDlDQddf6D9phh2NADQ=;
  b=GqVnDyILcexo2PqTwHe7ocJ/AQoTk4NIYygVf+qWGHostYbzbrzWGT+6
   YqnG5JtOAunoATPV2UsEWeIxvvvIKzcv+LxkQpuU3eCCb7u3qnhph+kOz
   GN7eB4S56XIj34/fN1/0Wn8QqO+OAUmYGqxCT2uP9ZAPSb5TWRYFrnwsm
   TXSg9r4T+ofq3srbM5jQauUsXwhLY7xH7hkKsrV9Jl3GZc+yFEYcaCZXN
   tAuGTLAj5Z/BOqd1GgvrgeGzDNN9Ovc9WOFUa3FsCU3dJzitzAHcgPzrE
   YaXsW5LudvBDYRTUjcAApv7+XHu7axJw0BchKe81MpRnDsLm7eNfWybBQ
   g==;
X-CSE-ConnectionGUID: 5XoUUVI0RcWsicfPJWJmeQ==
X-CSE-MsgGUID: 8pkR2O7lSNCMvuUMCKMUyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52956842"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52956842"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:23:19 -0700
X-CSE-ConnectionGUID: vbhsWhRtSdetGohvp901fA==
X-CSE-MsgGUID: L3ad3sqXQCOL8KfXO3IAyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151055932"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:23:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 581961201FC;
	Mon, 23 Jun 2025 15:23:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTgCh-009qTI-0w;
	Mon, 23 Jun 2025 15:23:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v4 1/3] media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
Date: Mon, 23 Jun 2025 15:23:12 +0300
Message-Id: <20250623122314.2346635-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
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


