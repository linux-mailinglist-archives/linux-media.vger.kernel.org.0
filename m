Return-Path: <linux-media+bounces-3223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5849B825017
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0674C286EFD
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 08:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8016224CA;
	Fri,  5 Jan 2024 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLgJAwWk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2200219FF
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704443894; x=1735979894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nX/PQF2hgBlPJcxGsYQXT3HHTW7tHLAaloJk9J1JhsE=;
  b=GLgJAwWk4ujpIU+Pe2ctdLkJBW/rLOI9mgPzjOKfQYZ8Gg7XneDDxW3w
   9SiLs1WyUK9GSAD2USVrT6uwCmRtzp2P92Rp4jpPS7LJwnnEqINsGsphm
   t9BkV3XV/Gt9NFcQncvetz1GIazeHtDEMXgJTeBUd/lJWvd2leb2FgR/P
   aDGSiZ0WXAHq/RWK5L+flKA81wrtpLRgxzteY2M7h3KQ1grgu+8ozb12A
   cPEv1/PwltOBm9nsLHzIAsbtYnbes/npfx1XFmiFZnCb6F8pl22k52y3T
   j8Ob1kUWUpy9kCiN2VEHy/sPFaLNHOV6pXNhJwZDO2RG4Q74BKMIh+lSf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4834106"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4834106"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:38:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="953888658"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="953888658"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:38:03 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5E9E71202B6;
	Fri,  5 Jan 2024 10:38:00 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v2 2/3] media: v4l2-mc: Add debug prints for v4l2_fwnode_create_links_for_pad()
Date: Fri,  5 Jan 2024 10:37:56 +0200
Message-Id: <20240105083757.197846-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
References: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
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
---
 drivers/media/v4l2-core/v4l2-mc.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 52d349e72b8c..e394f3e505d8 100644
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


