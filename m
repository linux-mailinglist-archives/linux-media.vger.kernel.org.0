Return-Path: <linux-media+bounces-10138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1208B2AB9
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EC031F21047
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1035D156644;
	Thu, 25 Apr 2024 21:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbRKDtLE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374CE15575F
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080463; cv=none; b=YtKm3aNbuN6fpFB+5cPkS1y2nEWhn6K7INQB1A0gZzGT+QizGjJ64ZCjlZOlj1bW3o5xM3BjnucGqJ1Qiw7uXfXA7tVOvtrYhgEoCCEKelmRqaYLBP1NWD1sZQXRQtgFONx0MNQdWaV9ZyXiEZJrOajuemW2GPD70bcc28SJclg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080463; c=relaxed/simple;
	bh=vtKidzEiteD4Zt3ZEwOL3l5My0ctl6N0bmuqu/Q2EoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SHLRA+9lORMmr9ffCoGD3WDkQAElfyK/K4mV6hn6JbTDxS7miRBRcEssSCoHgjPgXbAgmO7Glcv6IQ9MFy3CiwPn6Uge9JVLHszpK7YnWy7FqwM0cmuPNmg6mnMSnf1rKxqflQ5OXh8CCc9k59CsMQK3YuN4LQ7ytQTarDN17p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbRKDtLE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080462; x=1745616462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vtKidzEiteD4Zt3ZEwOL3l5My0ctl6N0bmuqu/Q2EoA=;
  b=JbRKDtLEIThxa0fUa3rjEGlD/1/J2tT087hJKqr/8ura+hwvTbPZ50AZ
   t9aAR9zEPydqa8cfoguW/TyAkCrMFMQTEwi1boTWoif7LE0/niPhZ1u5+
   I1RaLjSvMzrGw3M3lXkkJo09xPaH0ufCVXUvDNU1ephh0uwYF2/xnXj5x
   x1OZWuPB3kEhYeXv6qkGLw7AKfYGV/tRkAUiuA+UlPWIhS5kM4RhE93ev
   2/6yNx5lLDDLuU3yJ8i7pogSDEIS0tZ1yp/v6rEXC8ZfpnthsxsLVMze6
   uTo2zfvURQf+16c6r4/p+aar5QiyxTMvVGp6CKZ87vS4U/N/2/uwSw6n+
   A==;
X-CSE-ConnectionGUID: 6K31avmVQRWVsm/ohtvl7g==
X-CSE-MsgGUID: RJyuDrmPR4S+J4ac5UuB8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10016747"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10016747"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:41 -0700
X-CSE-ConnectionGUID: 5LM+9sMBTLKpII6qoWEYSA==
X-CSE-MsgGUID: sZpW0xozQsu4M82CGskG8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25620965"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:39 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 50544120919;
	Fri, 26 Apr 2024 00:27:35 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v2 14/14] media: v4l: subdev: Add trivial set_routing support
Date: Fri, 26 Apr 2024 00:27:11 +0300
Message-Id: <20240425212711.928300-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
References: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add trivial S_ROUTING IOCTL support for drivers where routing is static.
Essentially this means returning the same information G_ROUTING call would
have done.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3d1ed8ab5229..8470d6eda9a3 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1013,6 +1013,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				return -EINVAL;
 		}
 
+		/*
+		 * If the driver doesn't support setting routing, just return
+		 * the routing table.
+		 */
+		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
+			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
+			       state->routing.routes,
+			       min(state->routing.num_routes, routing->len_routes) *
+			       sizeof(*state->routing.routes));
+			routing->num_routes = state->routing.num_routes;
+
+			return 0;
+		}
+
 		krouting.num_routes = routing->num_routes;
 		krouting.len_routes = routing->len_routes;
 		krouting.routes = routes;
-- 
2.39.2


