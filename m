Return-Path: <linux-media+bounces-2868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D481B934
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 15:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21216B28B3C
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 14:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5B25990E;
	Thu, 21 Dec 2023 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwIkxcYr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8AB59900
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703167109; x=1734703109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sdk6AALaqYk7oRXoYdYEK9cQ0HfRJFpR8mZylE7WZBI=;
  b=YwIkxcYrQ+aLs/RxdyCxujwNmQshQCgN7WFxkXMif2UqCOYrol8DH833
   iZ9qAvGlK6TCdVI13219S7ke4GB8bBJAtkV8UlZ59dcwbtgy2usOyA9II
   PbGmrU/YOAvfV/ENo83/gjNE+q1Ksnt/N2nbFJwLuy9mosJs7WGnd6FPa
   +sexDgy37/nqJzEjchMyrvvGPCjGm7tpDHWjedHUb5yWuGHS1Zeg3BVFk
   urYwTfoq9SCpVMDfkPDxs588AvL8PyrBjvWLNnZmMYAmHMbVx5fJ5a5X8
   WNd20NkIaz70w05uA0nDMbHCP5oCu4fMTKqvON9qsZyVL+7ZxNDtxFuEm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="460312129"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="460312129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1108108408"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1108108408"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:58:26 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3256712068E;
	Thu, 21 Dec 2023 15:58:24 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH 2/3] media: v4l2-mc: Add debug prints for v4l2_fwnode_create_links_for_pad()
Date: Thu, 21 Dec 2023 15:58:21 +0200
Message-Id: <20231221135822.152448-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
References: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add relevant debug prints for v4l2_fwnode_create_links_for_pad(). This
should help debugging when things go wrong.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/v4l2-core/v4l2-mc.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 52d349e72b8c..b1a6246580ec 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -337,12 +337,18 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
 						      endpoint,
 						      MEDIA_PAD_FL_SOURCE);
-		if (src_idx < 0)
+		if (src_idx < 0) {
+			dev_dbg(src_sd->dev, "no pad found for %pfw\n",
+				endpoint);
 			continue;
+		}
 
 		remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
-		if (!remote_ep)
+		if (!remote_ep) {
+			dev_dbg(src_sd->dev, "no remote ep found for %pfw\n",
+				endpoint);
 			continue;
+		}
 
 		/*
 		 * ask the sink to verify it owns the remote endpoint,
@@ -353,8 +359,12 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 						       MEDIA_PAD_FL_SINK);
 		fwnode_handle_put(remote_ep);
 
-		if (sink_idx < 0 || sink_idx != sink->index)
+		if (sink_idx < 0 || sink_idx != sink->index) {
+			dev_dbg(src_sd->dev,
+				"sink pad index mismatch or error (was %d, expected %u)\n",
+				sink_idx, sink->index);
 			continue;
+		}
 
 		/*
 		 * the source endpoint corresponds to one of its source pads,
@@ -367,8 +377,11 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 		src = &src_sd->entity.pads[src_idx];
 
 		/* skip if link already exists */
-		if (media_entity_find_link(src, sink))
+		if (media_entity_find_link(src, sink)) {
+			dev_dbg(src_sd->dev, "link from %pfw to %pfw exists\n",
+				endpoint, remote_ep);
 			continue;
+		}
 
 		dev_dbg(src_sd->dev, "creating link %s:%d -> %s:%d\n",
 			src_sd->entity.name, src_idx,
-- 
2.39.2


