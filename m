Return-Path: <linux-media+bounces-10189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF3B8B3353
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B046B225EE
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A740A13D500;
	Fri, 26 Apr 2024 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZ5Ko/GS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9E13DDC1
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121466; cv=none; b=A4Lzq+TNbdOtr/FpEjs9GklKoebxw4vrdG2O++d762gw6VHmNLvtPv3+QEeZ3PleNTg5dYHgFCCiQp5BwsbaoZLcSCfk4EKJlDkmrU0M5d49kWaWZXwG5pRRvxrLXw/jNVsww4MJupLtvCIKLsK9VeEBB2b34oCT8a2y8QZm85w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121466; c=relaxed/simple;
	bh=vtKidzEiteD4Zt3ZEwOL3l5My0ctl6N0bmuqu/Q2EoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WYgIB/rZz8N0Ppw1SFR1rWL//uGggD39dxzXeu/PtU26SgkLfN1cbFjbIxSZFTezihoCamSZcQGgWEjW82x5Lrd/QwffctpyN9MG3b0ZLLJQl6bNtI2GBSnMv5aCl99b85iocTh5rVsj5VDbxaqNDUbuS+6NgtySHlub3JbQRRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZ5Ko/GS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121464; x=1745657464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vtKidzEiteD4Zt3ZEwOL3l5My0ctl6N0bmuqu/Q2EoA=;
  b=PZ5Ko/GSQAaUzbD2DcmO3mkBrXXcU74heDu4W/33i6dxrfAHXPYOsJcv
   z9xqtbVabP/KT9pKeQpB+3Sy6mSiMJieToNAVLG5I+n56kbdQ0gDNmXYs
   +aVUtyAY3Utp82cw3MwuoaOfVLsT26stKwbnL/HBeT8c9RBHD+hEjbbwL
   HowN5Da2n2rMOqy90uKoE0yE7DXsrqZjvevnGmDthJW/QDL/kKvZs9T9K
   mwA0HgnEskbGz6JiiL2ezFKdR937tfAGIcpGiEgoWCyOyWWMweeomGhw5
   BkEQ5FiqDaeX0bA7TbKTloLX2MyIa3SI/RF+jw+54KYdhTZYqoyaAAGYo
   g==;
X-CSE-ConnectionGUID: bqDqP7/8RAGH7f6aZo9NOQ==
X-CSE-MsgGUID: ksNt+M29SLie0rsWcVBzpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683854"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683854"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:51:04 -0700
X-CSE-ConnectionGUID: InZ9BpngRwq9uvkkJhAGWw==
X-CSE-MsgGUID: UCLSivM8QG2ueoRuQ0B8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598553"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:51:01 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 318F912067F;
	Fri, 26 Apr 2024 11:50:58 +0300 (EEST)
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
Subject: [PATCH v3 14/14] media: v4l: subdev: Add trivial set_routing support
Date: Fri, 26 Apr 2024 11:50:38 +0300
Message-Id: <20240426085038.943733-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
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


