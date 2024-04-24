Return-Path: <linux-media+bounces-10020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D724D8B094C
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C52F1F2349D
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF25515D5A2;
	Wed, 24 Apr 2024 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzkQ8cP0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E515B0E2
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961390; cv=none; b=hocEH3kM7DT7vZfCU751XKeTMyTXKDm50nDI59LcAA7zO7HsW4fMY0T2CzjcNNcyH6PxgTiWjBdZsecvxKL50P7/iq0su8HhWcszCJdCYoUN4DaBqDurDXoD0euEOqYrJr7z0HwYBsX7gssMuIjs3/PZ0clAeER12mT2/8RuGYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961390; c=relaxed/simple;
	bh=KY+lx6CRHKbqxwavkV8vK3kxZ6KrOrEF/MbKTPBx2jQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XwrnbBxVlzDvIrI7BsQmW7KpEEWTGcYr/gMnSc3N/DAH4c99Ory+vI2K93X19aoSaDPnwZWmRCZiu8jqB3mhr+3IUnOM9ZrZho4z3xhstiX1Qc0VEmOCxqXqCrt5yJowWbFtC5AgpCvQBTnKTlImcN8db9I0zLYHtSJicf0c1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzkQ8cP0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961389; x=1745497389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KY+lx6CRHKbqxwavkV8vK3kxZ6KrOrEF/MbKTPBx2jQ=;
  b=kzkQ8cP0dJ1U7gJCswHLouHmeC3OTITjl4B5uRpW8Q7EWT3t/Jktqmze
   I4nZifu+4OkHwco8dgO2O69QMjVFZoy3+ufpHaGCWR+YTcTTnT2DR21nX
   G6GDcIhF18d4z8Mr0lbtxirRCRmrbgoz66+Ngz4jaw6fCwZD7EKeQ+E8d
   Rr1pAw/l0IQWEZ+vIbk2pKyaE8rsACe2o+WsF81T5G8tDzQIqsHf2s8/R
   UZoxHBG5hMGVhe958bVZrCA42Jos2qtIT1bhxAun7dTfypX4ilUJo0fGC
   niTrc0mgWb6fxA6PpBtfjG9d+ltnn3lH2M8TB4tMQwMOLqqP/6GMMMZW4
   Q==;
X-CSE-ConnectionGUID: +qv8QP4IR+G4N1D/B9CRaw==
X-CSE-MsgGUID: DTtx95eCQLqnF2vhQue5Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9809729"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9809729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:23:05 -0700
X-CSE-ConnectionGUID: aPSzatClR+ymsHuDP55zXg==
X-CSE-MsgGUID: KvQvav2gTDWI+v/eTAivEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29512929"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:23:03 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71DCE11F855;
	Wed, 24 Apr 2024 15:22:59 +0300 (EEST)
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
Subject: [PATCH 13/14] media: v4l: subdev: Return routes set using S_ROUTING
Date: Wed, 24 Apr 2024 15:22:36 +0300
Message-Id: <20240424122237.875000-14-sakari.ailus@linux.intel.com>
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

Return the routes set using S_ROUTING back to the user. Also reflect this
in documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/vidioc-subdev-g-routing.rst            |  7 ++-----
 drivers/media/v4l2-core/v4l2-subdev.c                | 12 +++++++++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index cbd9370006b6..1cf795480602 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -44,7 +44,8 @@ Drivers report their current routing tables using the
 ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
 with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
 setting or clearing flags of the ``flags`` field of a struct
-:c:type:`v4l2_subdev_route`.
+:c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``, also
+``VIDIOC_SUBDEV_S_ROUTING`` returns the routes back to the user.
 
 All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called.
 This means that the userspace must reconfigure all stream formats and selections
@@ -153,10 +154,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
 appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
-ENOSPC
-   The application provided ``num_routes`` is not big enough to contain
-   all the available routes the subdevice exposes.
-
 EINVAL
    The sink or source pad identifiers reference a non-existing pad or reference
    pads of different types (ie. the sink_pad identifiers refers to a source
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b565f202df67..3d1ed8ab5229 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1017,8 +1017,18 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		krouting.len_routes = routing->len_routes;
 		krouting.routes = routes;
 
-		return v4l2_subdev_call(sd, pad, set_routing, state,
+		rval = v4l2_subdev_call(sd, pad, set_routing, state,
 					routing->which, &krouting);
+		if (rval < 0)
+			return rval;
+
+		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
+		       state->routing.routes,
+		       min(state->routing.num_routes, routing->len_routes) *
+		       sizeof(*state->routing.routes));
+		routing->num_routes = state->routing.num_routes;
+
+		return 0;
 	}
 
 	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
-- 
2.39.2


