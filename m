Return-Path: <linux-media+bounces-35251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEEAE020F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7B887AC65B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF5D221277;
	Thu, 19 Jun 2025 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqXdw/er"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129433085D7
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326754; cv=none; b=tuJqtpx6D6lb6i5+pnJ4FgNgMmSakmjL1Qwnya318rBJONaNd+ZDSJHsjkChLu77rAsnZ2AwAjtr/6o5PeVW+SQWXJiBsgLNC14jzlx/cSk6vHsRmhvVoZY7HqyHr5sTS9k3c2xoYhodsfyRGGx+HGA8HYPd2rfK0fPWlweT+nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326754; c=relaxed/simple;
	bh=BbYqJoFgHwK6lo5QGRrrQZ9+MqkTojvmSjePVT6xDJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mtdQ/GYjJda1UV91uLzkWxs6qBLQ25K5Ko29OIwbUyOjIjxQN6OBDFu966byeWDoCJCTXQzJpoFYRlfxuTIzvGIvKD/ChCMfstvHZvQGU3YtjE1nTveK+MtF2FhT1X0+dbNTldO3Ewuy7fXiaB0sZXJamK77UrbdlR5f2VcQzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqXdw/er; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750326753; x=1781862753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BbYqJoFgHwK6lo5QGRrrQZ9+MqkTojvmSjePVT6xDJw=;
  b=VqXdw/erOuhk9seahxucL3QTaIz1vhQ8Fplu9S4Hk3IBqhKCC+d5dYpw
   U04CmL4ZbguUs/zOaZzdCtjjae3i43JtQ5pRd/aOydQhvlnHeD2sHfZws
   AxP88P5eYrlmhihZt7+DxRf49iG4NDk/M+Mij3OkDGbu00f6dCOMvGgJH
   GPfrSkeYDFWrgprbibvGf37ahtFi9/51t0TcG7oz4v1Ej4G3w3W+LEYsG
   iHbLq3adUDk/V/NXBAwUWHMksUEFXe4iQ8CO1ZV4hQ59jcxA2yZXfeDVa
   vCQ+shRXQJqQi/KMa3LmS7htb4T/5frtaGe+b7Dnwg1y4WPnNr+HE8RuN
   A==;
X-CSE-ConnectionGUID: Phgrk1f0T/+xoz6J8+zpSQ==
X-CSE-MsgGUID: Wx07emGNTfGorhcgZSq+ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40185104"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="40185104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:52:32 -0700
X-CSE-ConnectionGUID: IKi3B+csSBC9ZQsivi8vYg==
X-CSE-MsgGUID: zQp5F8yQSdaX0CXTRiL5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150037995"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:52:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 05DA9120323;
	Thu, 19 Jun 2025 12:52:28 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSBwZ-0088SO-32;
	Thu, 19 Jun 2025 12:52:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/3] media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
Date: Thu, 19 Jun 2025 12:52:25 +0300
Message-Id: <20250619095227.1939114-2-sakari.ailus@linux.intel.com>
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
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 90d25329661e..932aedc26049 100644
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


