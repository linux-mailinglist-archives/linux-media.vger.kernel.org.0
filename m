Return-Path: <linux-media+bounces-35254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24FAE0212
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5B743BABFA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F8B221721;
	Thu, 19 Jun 2025 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCStcC0u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465AC22126F
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326758; cv=none; b=XayPWyk1x4UUN8GWnn0RTQmpp+S48Xp+WcEXIDIXtAI71d/A8zoD3qe81Du0uo3sjPh1W1G5d1nqmQO1KVSsli4LnRztJcu8xoRIeal+Nkr9g0qz5ByHngIBLlQR4AS1L8BqMaEGVJIcRs3pBhc9PovGYYwY2koGpXECB41THjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326758; c=relaxed/simple;
	bh=uryOSe7HKvD5C8t469HD/bwc/mBEUP3hKo2te01qZqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mF89iDcWG3NuDx2DAby0naUxXwyrGDdciK2P6IZNfCobD6uG20XnmhP9jAYpm1Ftlr6uInDquy5H+dpg8/P/kDMpVy8TwJMwayXjd/pfgdPpmSfTM0H07A7gC9RXWKT+mXbvKqSv+UFK7x0qLsyFSYUsRj4ASqriqMYR65Exh+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCStcC0u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750326757; x=1781862757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uryOSe7HKvD5C8t469HD/bwc/mBEUP3hKo2te01qZqQ=;
  b=lCStcC0utNWMcCq6yiZMkvBWalAjNkFDBd4JZzMUllsoSW9vwpLzz+uq
   cUbM5y+Hrmtekao+SOW/PfJZDgl9FHPyQIPBNhmlvuyso3hWx2E2vSAKw
   ESP8tbmQ/8lq7/3VD+nNKBozQUmPNiLiAWlvRpg425Mk4+aBMLMxs9iKD
   jGP5wgJjLFOlbxsFMLwdfDTdHPKMsHztSabU/BBFDnluqCS9ysAaK333i
   DKlNd+52hFUKI3qA9zrdEMAii1dMInAkfeMcy6t52q4iMnCzpx/8UptA0
   x2KSakWFBcrkaS+MBjFwuvIbKuX1GNI5+IAi7UPUZsm6qycYJ73Nb8+ga
   w==;
X-CSE-ConnectionGUID: 5D5Lp2fYTtWhoDBTzc1WUQ==
X-CSE-MsgGUID: 2bIj8swGQnOsk89S1KomJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40185111"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="40185111"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:52:32 -0700
X-CSE-ConnectionGUID: 5vH5qL/zTUSPevUehjWpXw==
X-CSE-MsgGUID: ofvoHPmQSXuXTO+6WjxgQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150037997"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:52:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0698F1203A5;
	Thu, 19 Jun 2025 12:52:28 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSBwa-0088SW-00;
	Thu, 19 Jun 2025 12:52:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 3/3] media: Documentation: Document new v4l2_ctrl_handler_free() behaviour
Date: Thu, 19 Jun 2025 12:52:27 +0300
Message-Id: <20250619095227.1939114-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619095227.1939114-1-sakari.ailus@linux.intel.com>
References: <20250619095227.1939114-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_ctrl_handler_free() no longer resets the handler's error code.
Document it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/v4l2-controls.rst | 9 +++------
 include/media/v4l2-ctrls.h                       | 3 ++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
index b2e91804829b..fc04907589ab 100644
--- a/Documentation/driver-api/media/v4l2-controls.rst
+++ b/Documentation/driver-api/media/v4l2-controls.rst
@@ -110,6 +110,7 @@ For sub-device drivers:
 
 	v4l2_ctrl_handler_free(&foo->ctrl_handler);
 
+:c:func:`v4l2_ctrl_handler_free` does not touch the handler's ``error`` field.
 
 2) Add controls:
 
@@ -191,12 +192,8 @@ These functions are typically called right after the
 			V4L2_CID_TEST_PATTERN, ARRAY_SIZE(test_pattern) - 1, 0,
 			0, test_pattern);
 	...
-	if (foo->ctrl_handler.error) {
-		int err = foo->ctrl_handler.error;
-
-		v4l2_ctrl_handler_free(&foo->ctrl_handler);
-		return err;
-	}
+	if (foo->ctrl_handler.error)
+		return v4l2_ctrl_handler_free(&foo->ctrl_handler);
 
 The :c:func:`v4l2_ctrl_new_std` function returns the v4l2_ctrl pointer to
 the new control, but if you do not need to access the pointer outside the
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 9e1693ecc283..ecd72528a4c5 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -578,7 +578,8 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
  * the control list.
  * @hdl:	The control handler.
  *
- * Does nothing if @hdl == NULL.
+ * Does nothing if @hdl == NULL. Does not reset the handler's error code in any
+ * case.
  *
  * Returns the handler's error field.
  */
-- 
2.39.5


