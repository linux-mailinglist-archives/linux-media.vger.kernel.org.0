Return-Path: <linux-media+bounces-35632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F309FAE3FD5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FD8C7A4928
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F6624293F;
	Mon, 23 Jun 2025 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYu/VeHn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4081D2472AD
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681404; cv=none; b=k/y97NWssyJlhuErwBbAzteEIdXUooeeGIeVJ0okDhbMW0T5zUPsUlMfv/fSCJMdIeap1bxbF38HAW2UPoySQ/BRxRAURhAQU8q6SdxBOY9cm6nilZ8PEeGRgSeWQSSZvben9zloviDkiCbG8ZsFBA1ZLN+IzpnAe43QWFkFEm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681404; c=relaxed/simple;
	bh=8FKWMfpeqKKyAtrQUcFxlL/FA/nEZbqX8dJkrTiyLLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ua1nc85xVNoH0i0LIvOlpVWFu+Sbr+KjZPVhf1LdtIp/gpDNFwu4+F7ZBZDpRo/T9jxiBfK5g8jVruhb/0dqjoiwVaSDS3lQ3r8v3pKjc9o1C+JKOEEDSx3yKNsraHaTDYe21SP+lsn9Duw65PTghqxFDEQ4IjK1R9V8s/mW1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYu/VeHn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750681402; x=1782217402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8FKWMfpeqKKyAtrQUcFxlL/FA/nEZbqX8dJkrTiyLLc=;
  b=FYu/VeHnh1T/R4JmaQGSk1j21e3u9g3UnQNamzud1YYn656ynLduU/zd
   QKHUZ8PGn2PQPros//v2TNg2iyleDIymXHa7AfocrsivlVqxcd8WrowAw
   XhCdJ+vlCFLrxGziVYis1JnC/jBlxt65YqIg1O4qYIkLP4D+p4jC0o07I
   GDcAT/rgeyYcrE1Zg3QZkesxtb3qUchEJvb3VwUM8kieA2kiQmvVvhRhL
   BkhQN4cy9Dp3/BLlkxlKy+ZRBwpU05uHEuZOFydHiFRvP8N4rGiKUS6QK
   3u4CCHxZMco6fv0bsz9vuRy1brEOAGud4ocOwYo1rrmjnduQIB3rZ6IOw
   A==;
X-CSE-ConnectionGUID: F5J5qH0XQ/2kAJL3hlBY5A==
X-CSE-MsgGUID: O/7UNiuER5itPu4vJ5shHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52956844"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52956844"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:23:19 -0700
X-CSE-ConnectionGUID: +iTpOiIXQhy/l3JT3pGiSA==
X-CSE-MsgGUID: VpYJC+ajQoWz8Jzy+Q2uMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151055933"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:23:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 58B14120202;
	Mon, 23 Jun 2025 15:23:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTgCh-009qTM-14;
	Mon, 23 Jun 2025 15:23:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v4 2/3] media: v4l2-ctrls: Return the handler's error in v4l2_ctrl_handler_free()
Date: Mon, 23 Jun 2025 15:23:13 +0300
Message-Id: <20250623122314.2346635-3-sakari.ailus@linux.intel.com>
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

v4l2_ctrl_handler_free() used to return void but changing this to int,
returning the handler's error code, enables the drivers to simply return
the handler's error in this common error handling pattern:

	if (handler->error)
		return v4l2_ctrl_handler_free(handler);

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 11 ++++++++---
 include/media/v4l2-ctrls.h                |  4 +++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index d28596c720d8..98b960775e87 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1631,14 +1631,17 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
 EXPORT_SYMBOL(v4l2_ctrl_handler_init_class);
 
 /* Free all controls and control refs */
-void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
+int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 {
 	struct v4l2_ctrl_ref *ref, *next_ref;
 	struct v4l2_ctrl *ctrl, *next_ctrl;
 	struct v4l2_subscribed_event *sev, *next_sev;
 
-	if (hdl == NULL || hdl->buckets == NULL)
-		return;
+	if (!hdl)
+		return 0;
+
+	if (!hdl->buckets)
+		return hdl->error;
 
 	v4l2_ctrl_handler_free_request(hdl);
 
@@ -1663,6 +1666,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	hdl->cached = NULL;
 	mutex_unlock(hdl->lock);
 	mutex_destroy(&hdl->_lock);
+
+	return hdl->error;
 }
 EXPORT_SYMBOL(v4l2_ctrl_handler_free);
 
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 3a87096e064f..c32c46286441 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -579,8 +579,10 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
  * @hdl:	The control handler.
  *
  * Does nothing if @hdl == NULL.
+ *
+ * Return: @hdl's error field or 0 if @hdl is NULL.
  */
-void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
+int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
 
 /**
  * v4l2_ctrl_lock() - Helper function to lock the handler
-- 
2.39.5


