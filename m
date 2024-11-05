Return-Path: <linux-media+bounces-20830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037D9BC5C0
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 904B61C21360
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 06:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A9C1FF60C;
	Tue,  5 Nov 2024 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5iKukaA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B21FE0F1
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730788828; cv=none; b=Zd10OrKcfRjlpj1I3rWaEmD6lvWZUc2gsXZfa28dBM5fXBv7bsGDlg76oo38lNbrB7vAI7+X9yIwvmN7nZhLVrBOEqfcWslsYuffIVROztATe4GLIiV9bgYvw9P8NV9r2/GWtcqag9lAbZNwA4AvMbw58aPUZmSTZxewVDePtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730788828; c=relaxed/simple;
	bh=QkEHOLtsMg7trEz5M9xw1SIjU/cF0uOHnjMO3xFTDL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oZINR9k67pGw6iplmlfO9JfNWSsPCweFMwo9LNEFEwnyxH+jDTU3vz9FOLaAgNRh0tknXBY7h+bFjjvM4hWQmfgOVt7bgt3QgKpsv5UBwb6erSITl/yz4+ITCILNd7pOvY/mIOqn+iqPoPsSjVf+Wx4mcClqVSrZvnIM9xi7cU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5iKukaA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730788827; x=1762324827;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QkEHOLtsMg7trEz5M9xw1SIjU/cF0uOHnjMO3xFTDL0=;
  b=i5iKukaAT2eLmUtlsdcY67k+51bX623KAQsDDnXzmvJHMcpGkpLc7D/F
   iipZ3uy4u4HsY7spV65a+HSUJHolPGZB+MUfhC5w4WuzHFvH3Fa7GWH4G
   Wu6sCb6HcT9uVJ1gxZvuXJeFhZklJsI6kYoUjAORyKnjAvx7/tmbNQq18
   jzVGbJS6uu/L1qbJsxRPUSUL7l2+01hseG23oI4QViSsBiehf1VzU+bv+
   N4qW2uS2h0ZBPM7PjVsCRVs5E1samdCmrmveHmw5otAM+ViyuBlEmE7Z1
   ROqJoN5LekcDw6g+MG1slOQgM7pZHZs2pDfkeoGVVVrsfJWtmYWWWhHpu
   w==;
X-CSE-ConnectionGUID: 2rkBo4XsROKqLtFVlmJp2g==
X-CSE-MsgGUID: fisCAvdgTwmy2DvOrse3zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30471119"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30471119"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 22:40:25 -0800
X-CSE-ConnectionGUID: C3yplxDcRzmdpIFjWqM1xw==
X-CSE-MsgGUID: Q+aBubb9R/qE2tEQ4kRDcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="121368817"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 22:40:24 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 339C511FA28;
	Tue,  5 Nov 2024 08:40:22 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1t8DEk-0026Cn-0a;
	Tue, 05 Nov 2024 08:40:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/1] media: mc: Rename pad as origin in __media_pipeline_start()
Date: Tue,  5 Nov 2024 08:40:12 +0200
Message-Id: <20241105064012.500501-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the pad field in __media_pipeline_start() to both better describe
what it is and avoid masking it during the loop.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
since v1:

- Also change the argument name in the prototype.

 drivers/media/mc/mc-entity.c | 8 ++++----
 include/media/media-entity.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 96dd0f6ccd0d..0df9fc90cf33 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -768,10 +768,10 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 	return ret;
 }
 
-__must_check int __media_pipeline_start(struct media_pad *pad,
+__must_check int __media_pipeline_start(struct media_pad *origin,
 					struct media_pipeline *pipe)
 {
-	struct media_device *mdev = pad->graph_obj.mdev;
+	struct media_device *mdev = origin->graph_obj.mdev;
 	struct media_pipeline_pad *err_ppad;
 	struct media_pipeline_pad *ppad;
 	int ret;
@@ -782,7 +782,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 	 * If the pad is already part of a pipeline, that pipeline must be the
 	 * same as the pipe given to media_pipeline_start().
 	 */
-	if (WARN_ON(pad->pipe && pad->pipe != pipe))
+	if (WARN_ON(origin->pipe && origin->pipe != pipe))
 		return -EINVAL;
 
 	/*
@@ -799,7 +799,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 	 * with media_pipeline_pad instances for each pad found during graph
 	 * walk.
 	 */
-	ret = media_pipeline_populate(pipe, pad);
+	ret = media_pipeline_populate(pipe, origin);
 	if (ret)
 		return ret;
 
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 0393b23129eb..2fca4556c311 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1143,7 +1143,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
 
 /**
  * media_pipeline_start - Mark a pipeline as streaming
- * @pad: Starting pad
+ * @origin: Starting pad
  * @pipe: Media pipeline to be assigned to all pads in the pipeline.
  *
  * Mark all pads connected to a given pad through enabled links, either
@@ -1155,7 +1155,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph);
  * pipeline pointer must be identical for all nested calls to
  * media_pipeline_start().
  */
-__must_check int media_pipeline_start(struct media_pad *pad,
+__must_check int media_pipeline_start(struct media_pad *origin,
 				      struct media_pipeline *pipe);
 /**
  * __media_pipeline_start - Mark a pipeline as streaming
-- 
2.39.5


