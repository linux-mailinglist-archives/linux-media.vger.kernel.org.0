Return-Path: <linux-media+bounces-3403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE449828612
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CB441F24865
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C5A38DEC;
	Tue,  9 Jan 2024 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXOq60b7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B382D7AD
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704803519; x=1736339519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J5BITxkehF9nXalLYMq/PnKKMBzKdQv7yPlnZ1VvTw4=;
  b=aXOq60b7rKJ/WvS5hy2K25OPxaOBUUgmX8di2bf0YjTRl9ov2Wa047WB
   Qx6cZB901s83kuS/JpXRRz8PoJ8D0wHk3G5exy88DTlkR5hWngX6N9CkK
   CWWEzH/EAGq5Q9jt86kwj35L+xSYamchR/UZAiqufG/nVZ8YkOYYiv+Fs
   9D/4dK8zwdVLqye37IhKqkyUDpUSfV0ehWFnkCYRHXKwv+pKqwybKx8ge
   ICf7RZscwR6pdrs2vga2y7IQa3bQTGRm1fvFbsmxBYAxCy5UAnHZ5+mBB
   wVch++L7rtBUUr6ygSD9Eyc82KRirYdv4a5MGcnyOTDzZoQ6YDHEO7Gzo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="397884332"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="397884332"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="785227098"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="785227098"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:31:56 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BBF1111FACB;
	Tue,  9 Jan 2024 14:31:53 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 2/3] media: v4l2-mc: Add debug prints for v4l2_fwnode_create_links_for_pad()
Date: Tue,  9 Jan 2024 14:31:50 +0200
Message-Id: <20240109123151.106054-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109123151.106054-1-sakari.ailus@linux.intel.com>
References: <20240109123151.106054-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 52d349e72b8c..4bb91359e3a9 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -337,12 +337,18 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
 						      endpoint,
 						      MEDIA_PAD_FL_SOURCE);
-		if (src_idx < 0)
+		if (src_idx < 0) {
+			dev_dbg(src_sd->dev, "no source pad found for %pfw\n",
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
+				"sink pad index mismatch or error (is %d, expected %u)\n",
+				sink_idx, sink->index);
 			continue;
+		}
 
 		/*
 		 * the source endpoint corresponds to one of its source pads,
@@ -367,8 +377,13 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 		src = &src_sd->entity.pads[src_idx];
 
 		/* skip if link already exists */
-		if (media_entity_find_link(src, sink))
+		if (media_entity_find_link(src, sink)) {
+			dev_dbg(src_sd->dev,
+				"link %s:%d -> %s:%d already exists\n",
+				src_sd->entity.name, src_idx,
+				sink->entity->name, sink_idx);
 			continue;
+		}
 
 		dev_dbg(src_sd->dev, "creating link %s:%d -> %s:%d\n",
 			src_sd->entity.name, src_idx,
-- 
2.39.2


