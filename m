Return-Path: <linux-media+bounces-35566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADBCAE35AD
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 549D93AD3E0
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 06:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D6B1E130F;
	Mon, 23 Jun 2025 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfECPA/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61E1C3F0C
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660082; cv=none; b=goU44o2/6MVw+Hnh8YeRhbTDFGhucSbBjuIgbx8p1s8qkAvFD4KbT7WIDA/vCI9KK7hSHaN/3zan+WobaylKfY4Am5xhM9R+MYr4fIJvXr8kVAokFrOHScYzbamatpf0AlCAHZFxL+ro2wn/FMbS51aerZy+YSPeDfxDN4S/yJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660082; c=relaxed/simple;
	bh=19MOp+0T6DnC4YiVBbWyhCKPqaowkxGSoc8d6Boin5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c+AcIi4FdUwZG13T/nFL4FE2zYxf2UrnOBLrlNuNpU9S6oVtUdTJ29mExMvdlOZzSiHhPNvYtiNErz1a0RFQnz/1vrym2ZR5w9FExrpNXZuTtEQ0uxfssbhyh/+FJA5tPJkAyYeoE9XyU3HKsOs6WXkSpgsVlrWQsdOjgtq4fk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfECPA/D; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750660082; x=1782196082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=19MOp+0T6DnC4YiVBbWyhCKPqaowkxGSoc8d6Boin5M=;
  b=FfECPA/DvjKTIYjmXB2odlJPBtYnxN1wpnQ8pbNHE0RnX+NEkB6/C113
   XEQaWj2BSDBr1lTWCZfXkihHXha1ardvQhesY2Z2Dghv33DLghJkLmKpz
   DpRs7P3s1HkrYJ7xsOlF2o66NdibqvhXTPUtG6UISBIAboYL736Ix69vu
   7q+4oFZ3ICIyuq3FalKAImFNbUPMKTfiq81X7eGircWGMoskCwV+kkcUr
   XlEUJg6dZ4Z48NwyvMKFVKzSi5wq6nUbZhe+Meg4xgjBWL4blnZyaFvS+
   MGRN1GrdVOZpsbytmJbjkRU5PcutmD2vZqr7KlyUZUtJNuBsAZTqSCxY5
   g==;
X-CSE-ConnectionGUID: Y1kLknBPQgaEXd0g/vWD/A==
X-CSE-MsgGUID: sCZbdN11QnmMNcgXmzob+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52985210"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52985210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:27:59 -0700
X-CSE-ConnectionGUID: HuTTkH5TSYWsXc9NNOckCw==
X-CSE-MsgGUID: 9RW/tUM0TX+wg9Oa3t8jRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="175106227"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:27:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E6D0E1204C3;
	Mon, 23 Jun 2025 09:27:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTaeo-009ZoV-2v;
	Mon, 23 Jun 2025 09:27:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 2/3] media: v4l2-ctrls: Return the handler's error in v4l2_ctrl_handler_free()
Date: Mon, 23 Jun 2025 09:27:53 +0300
Message-Id: <20250623062754.2282598-3-sakari.ailus@linux.intel.com>
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
index d28596c720d8..11cedab0dc31 100644
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
+	if (hdl == NULL)
+		return 0;
+
+	if (hdl->buckets == NULL)
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


