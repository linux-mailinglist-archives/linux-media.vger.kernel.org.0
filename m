Return-Path: <linux-media+bounces-35241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E48ADFF90
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C4D217F721
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2936F2192F5;
	Thu, 19 Jun 2025 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9/fEnpD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B6426528A
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320960; cv=none; b=SQu5maUazTwmDPdm8x94FCcim0UyuwY6+5p2/q9gl5AI/OUtNQ5w/Et4npyU2Wyd4eaQuXnNX6tLVHzYu4imeRq3ZGxG8mG/SkfngwImkZj8f157lIc8p020IJw/hgvyCBx+h2KThSEn2muxXtBhgOYORJeBdJBTbwiPo1nTTpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320960; c=relaxed/simple;
	bh=5RjquLoGG8C2qJCRRG6cZwIOtJsKr+ixqeCs3qxRW+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MRUaBIEcgzv2FPOAY0BR0hRYykB/NFoimOWkZTM+KkARrQJqg24qfMOA1sUqzH7lPivg9QB8b/u4LZU697tRDDmsfrGd7BVC44zo1l6VMs8YFqyw8DmE2CUEkvV3kD26FvPrtdYzf4jAwuiDKPXZvSlIKDGlv+V3GGaTSiv5P9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9/fEnpD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320959; x=1781856959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5RjquLoGG8C2qJCRRG6cZwIOtJsKr+ixqeCs3qxRW+0=;
  b=M9/fEnpD+yRvmPfDlK/OhtQI62Xrpkf/zdpcPt3lAqVFm0W/NEaRGx/G
   HopvbU2zwCQDZlNZfhAC9hbFYAggvQntlFrO0ZvdOj4huGisrBghxg5My
   biYck1ws4FP62gFlqBjLrOj86/kQWL4YTM+S9nEUYHC3oHGtAIdIK4wgS
   Bj8fucJMu6y23swEV9TMPwubPGQ2if7cOltKam+Nm2uEh2Am7A5xMubN4
   vcV/CcIXpreV6Jj30/ksxV766CwYy+70vfGZQ7k/PaUuWeNML/1/dICgZ
   dOerIW0mHx09NgcPnigkcwili71sIJS1qL4TofYE+Oz1bVGZPEb2rAB4G
   g==;
X-CSE-ConnectionGUID: P7LgEfs7RYSSoa4+5or0TA==
X-CSE-MsgGUID: DL2VtiP/RLeOrsSEkzZtIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716700"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716700"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: shdaqBtESzGParFcqpqIkw==
X-CSE-MsgGUID: mOhijSHPQG6SLcCOqYzIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640666"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A09581208B6;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006dpE-21;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 11/13] media: v4l2-subdev: Introduce v4l2_subdev_find_route()
Date: Thu, 19 Jun 2025 11:15:44 +0300
Message-Id: <20250619081546.1582969-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_subdev_find_route() is like v4l2_subdev_routing_find_opposite_end(),
with the difference that it's more flexible: it can look up only active
routes and can find multiple routes, too.

v4l2_subdev_find_route() is intended to replace
v4l2_subdev_routing_find_opposite_end().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 56 ++++++++++++++++++---------
 include/media/v4l2-subdev.h           | 19 +++++++++
 2 files changed, 56 insertions(+), 19 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c549a462dac7..13d6e96daf3a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1996,34 +1996,52 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
 
-int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
-					  u32 pad, u32 stream, u32 *other_pad,
-					  u32 *other_stream)
+struct v4l2_subdev_route *
+v4l2_subdev_find_route(const struct v4l2_subdev_krouting *routing,
+		       u32 pad, u32 stream, bool active, unsigned int index)
 {
 	unsigned int i;
 
 	for (i = 0; i < routing->num_routes; ++i) {
 		struct v4l2_subdev_route *route = &routing->routes[i];
 
-		if (route->source_pad == pad &&
-		    route->source_stream == stream) {
-			if (other_pad)
-				*other_pad = route->sink_pad;
-			if (other_stream)
-				*other_stream = route->sink_stream;
-			return 0;
-		}
+		if (active && !(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
 
-		if (route->sink_pad == pad && route->sink_stream == stream) {
-			if (other_pad)
-				*other_pad = route->source_pad;
-			if (other_stream)
-				*other_stream = route->source_stream;
-			return 0;
-		}
+		if ((route->source_pad != pad ||
+		     route->source_stream != stream) &&
+		    (route->sink_pad != pad || route->sink_stream != stream))
+			continue;
+
+		if (index--)
+			continue;
+
+		return route;
 	}
 
-	return -EINVAL;
+	return ERR_PTR(-ENOENT);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_find_route);
+
+int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
+					  u32 pad, u32 stream, u32 *other_pad,
+					  u32 *other_stream)
+{
+	struct v4l2_subdev_route *route;
+
+	route = v4l2_subdev_find_route(routing, pad, stream, false, 0);
+	if (IS_ERR(route))
+		return PTR_ERR(route);
+
+	bool is_source = route->source_pad == pad;
+
+	if (other_pad)
+		*other_pad = is_source ? route->sink_pad : route->source_pad;
+	if (other_stream)
+		*other_stream = is_source ?
+			route->sink_stream : route->source_stream;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_routing_find_opposite_end);
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index deab128a4779..9ed8600ba3d4 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1547,6 +1547,23 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 				     const struct v4l2_subdev_krouting *routing,
 				     const struct v4l2_mbus_framefmt *fmt);
 
+/**
+ * v4l2_subdev_find_route() - Find routes from a (pad, stream) pair
+ * @routing: routing used to find the opposite side
+ * @pad: pad id
+ * @stream: stream id
+ * @active: set to true for looking up only active routes
+ * @index: for accessing more than one route from the pad
+ *
+ * Find a route from the routing table where one end has (pad, stream) pair
+ * matching @pad and @stream.
+ *
+ * Returns the route on success or -ENOENT if no matching route is found.
+ */
+struct v4l2_subdev_route *
+v4l2_subdev_find_route(const struct v4l2_subdev_krouting *routing,
+		       u32 pad, u32 stream, bool active, unsigned int index);
+
 /**
  * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
  * @routing: routing used to find the opposite side
@@ -1555,6 +1572,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  * @other_pad: pointer used to return the opposite pad
  * @other_stream: pointer used to return the opposite stream
  *
+ * Prefer v4l2_subdev_find_route() over v4l2_subdev_routing_find_opposite_end().
+ *
  * This function uses the routing table to find the pad + stream which is
  * opposite the given pad + stream.
  *
-- 
2.39.5


