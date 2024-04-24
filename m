Return-Path: <linux-media+bounces-10021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500F8B094D
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70881C21B49
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147EE15D5AD;
	Wed, 24 Apr 2024 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acvYAlh3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D2515CD56
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961390; cv=none; b=fZ4eoJp8PL+OwQrGdEuzuUryLeC6xzcS4XLblfkScoVY2nv0iWo0IoNcjc7SSybYWoTf2Psm4OHBNwKa7CwW0001WFaAxSz2OE8B43bNQXmXPfHOb5mDw56/mhD7/FGVXlkgMaXRtqDIyofkdAipcU5Z2xdyH6rH/SIKqbTbWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961390; c=relaxed/simple;
	bh=vtKidzEiteD4Zt3ZEwOL3l5My0ctl6N0bmuqu/Q2EoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lg/h/ic8Lf6O5PG7CwrgRav++QxnGriLm1+KJh3ocIzrH7T+nHy1YCbJKtpj9BzBiQUqxp4FgLm1d9RydzgJ794r8B0KL3QvzGsNCX4UghQH5SwUoAql/g2VEgS46z4Nt1aTVP9HLeESg7Up1WkzDUxlyQjYfbOxu20nnApxbGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acvYAlh3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961389; x=1745497389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vtKidzEiteD4Zt3ZEwOL3l5My0ctl6N0bmuqu/Q2EoA=;
  b=acvYAlh3yIRZZaC5WGRDaJ46phRYC4aJyjDjSDL41SFniKiW+q+Ay3ob
   OCWlWrYvVbN0YDHkkLOa7GD527/pAm0AwFrO43stqFUMgpGYeJ7PdoHw0
   X85/dVLaz5jU/8bRtl3Lt3sYBrV5EFWj+4RRHItS36lWqTHjdRXUvbP2l
   GxZaBxiN+RgTamczfPtO+mGNICThnLyeaKNPSfIpDpFmaZZxQ4J5CcFUZ
   7V26VadxipmbYqHDwwP9MEL+6GcCwFp+SJXMzCVfRIeOdhLz2BH/gqcNh
   Www6RUf/iMI/0wHbUT7AED3dRv4k6K8Mjza0a4qRTOMP4f0a80BGetUey
   A==;
X-CSE-ConnectionGUID: IMQ0BBmvSpu9Or71GsCn3w==
X-CSE-MsgGUID: tqF9ZiaXTmOuIR56L4wQEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9809740"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9809740"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:23:06 -0700
X-CSE-ConnectionGUID: T3+hvzntRRm7M05D2LZssg==
X-CSE-MsgGUID: mq7TFIWJQ9+oG1VVN79OnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29512945"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:23:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D2E0811FA8A;
	Wed, 24 Apr 2024 15:23:00 +0300 (EEST)
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
Subject: [PATCH 14/14] media: v4l: subdev: Add trivial set_routing support
Date: Wed, 24 Apr 2024 15:22:37 +0300
Message-Id: <20240424122237.875000-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
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


