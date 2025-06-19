Return-Path: <linux-media+bounces-35252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA8AE0210
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970AF3BA99B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7B622129F;
	Thu, 19 Jun 2025 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwjL4U9E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC43022126F
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326756; cv=none; b=dnXeUTvdt3ACp/1qfurPX0eHNhP7+Kehf2acZQu6kEIapxq0SOEHQkZ0gfdUi9lNlg0gYjhi3NJaeDm+v/vy7tOyEzBV1BVywPXR39GxRdHHEqSUFQK2CXX0L7Q8Ju1Bpqjs9l56QNvJ2dSsFWSvrg3FUl0CsNn5QuQ+RZZSaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326756; c=relaxed/simple;
	bh=dBUAd/+oDNgUgOU4j2WzC9BuIxqL7/cJR52PTJVUSWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gcOB+gDPIjl00+z7kofmiyKu9Yx6AwIuKzGm+Bdt/zaxnjlJ7Tdjd4/QaDzOqR+Md7Lr5jwBNTZIjYvpoxCpCFa47/HXOOFKQsMF3GUwKGFx+HdgGg/pFcVMNx4Y8g18qLTADFLPv31SMMmDV7FmmPfZUEcz7GKRwW/Ek5G+LMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwjL4U9E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750326755; x=1781862755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBUAd/+oDNgUgOU4j2WzC9BuIxqL7/cJR52PTJVUSWE=;
  b=NwjL4U9Ecdv4cedePkgObns+62qweRpUddB7yWig4oMc8bUsaDhMUIHT
   K3gxW5z4+AK3E2gYxYQaKLo2OIk7NyzXqIHOK/n9uGMtxdkBRvCLWfD66
   67IvMOu2AvB4aI9dNz0g7Lp2XR/UC+0IiPza7cmNKkx/D0lBz/3fkf58b
   3BhuwFhpdDly1lm9PBS7j2ekSR7JAPR55AsWS1qyNCIYHzX553eoRbQCZ
   Lp/H9d8VZQ8+Z22z24hFd6745MLwifoQZvZmN2O3+rWwxOg0ZnthchDdv
   VifEcjctOIADgD27PsWm99Kj/LOb0nmYijjLoYuGXbDB6a+JC255OcxiK
   g==;
X-CSE-ConnectionGUID: B0T9iURmSvylW6pcikmSqA==
X-CSE-MsgGUID: k7WPRFKNSdet9fX3IezPyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40185108"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="40185108"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:52:32 -0700
X-CSE-ConnectionGUID: vC/1X/19RnOWKiI3hJF/8g==
X-CSE-MsgGUID: Ft8QI+78Q2+gxnZbveGq7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150037996"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:52:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 05DC9120339;
	Thu, 19 Jun 2025 12:52:28 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSBwZ-0088SS-39;
	Thu, 19 Jun 2025 12:52:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in v4l2_ctrl_handler_free()
Date: Thu, 19 Jun 2025 12:52:26 +0300
Message-Id: <20250619095227.1939114-3-sakari.ailus@linux.intel.com>
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

v4l2_ctrl_handler_free() used to return void but changing this to int,
returning the handler's error code, enables the drivers to simply return
the handler's error in this common error handling pattern:

	if (handler->error)
		return v4l2_ctrl_handler_free(handler);

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 6 ++++--
 include/media/v4l2-ctrls.h                | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 932aedc26049..eb008a2e829c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1631,14 +1631,14 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
 EXPORT_SYMBOL(v4l2_ctrl_handler_init_class);
 
 /* Free all controls and control refs */
-void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
+int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 {
 	struct v4l2_ctrl_ref *ref, *next_ref;
 	struct v4l2_ctrl *ctrl, *next_ctrl;
 	struct v4l2_subscribed_event *sev, *next_sev;
 
 	if (hdl == NULL || hdl->buckets == NULL)
-		return;
+		return hdl->error;
 
 	v4l2_ctrl_handler_free_request(hdl);
 
@@ -1663,6 +1663,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	hdl->cached = NULL;
 	mutex_unlock(hdl->lock);
 	mutex_destroy(&hdl->_lock);
+
+	return hdl->error;
 }
 EXPORT_SYMBOL(v4l2_ctrl_handler_free);
 
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 3a87096e064f..9e1693ecc283 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -579,8 +579,10 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
  * @hdl:	The control handler.
  *
  * Does nothing if @hdl == NULL.
+ *
+ * Returns the handler's error field.
  */
-void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
+int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
 
 /**
  * v4l2_ctrl_lock() - Helper function to lock the handler
-- 
2.39.5


