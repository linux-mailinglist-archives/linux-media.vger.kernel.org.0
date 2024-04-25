Return-Path: <linux-media+bounces-10137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E128B2AB8
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789E21C216CB
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04B5156641;
	Thu, 25 Apr 2024 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTYpOkKz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D815575F
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080461; cv=none; b=qrzyD4MP9nO4SzMNjVaiuRtAJZKuultn7lLvOHReO/+Yf1K8qBcINuyZtYU0p/2pG7WlhTdoCeA4wSt0nwFZYSp6gi3wcRgvdswuBeeb22ijMxHP7aQ/HUfsfnsqOsHSMqWnGWm2Zmg6wo3KyrmWQgelbuh3rt6CuZyA/3MWRmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080461; c=relaxed/simple;
	bh=KY+lx6CRHKbqxwavkV8vK3kxZ6KrOrEF/MbKTPBx2jQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GdAqkEickG8AuaGk+Emm7YGA10+RoCq+nfRn9085cJl1dgGtLIuX9PMvqDJATONLJNyIz+LEDSN9ba3NNMVAPLVUuYEVTW7NqIHfI2qrXAtvDGSJ+S9z4P5H1lv8jzQEgLtjqBxrAZ3R/rBbLKHcrrcCNL90Z6LGJJ3zLTyGgMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTYpOkKz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080460; x=1745616460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KY+lx6CRHKbqxwavkV8vK3kxZ6KrOrEF/MbKTPBx2jQ=;
  b=KTYpOkKznLaqq2EiJN2zQWaqWLXx5Kki6PFuNAA5uLtRHUzN43SSxdIr
   szGsAuM/aolnifDQpmrXyhAue+ZXxnPlhNOkefSKndO6ptZ2IDe2s9ddm
   Nj1MaS7eWZViYl8ivMwY5SRye5dGJb0/Y0f7LuLGMMqiuPzfp6D3ueJ8A
   7C/4nwNN3djzc4I9jQv1zALt2B0hZdn95bX1tjaNlz+6AwL5sb5G3/glI
   Lij0SUmVFwrfpvZcV2HpH7d7/l7V4DhimdGrzT+gwiMqp5G3uzAxgPfif
   PI7iIwm+wHBheGErVW9Q23w96gPJzMoQfZLfHntocl6R9YiZlytuu0r4g
   g==;
X-CSE-ConnectionGUID: qblvplIBQzGfRxYzfn5iWg==
X-CSE-MsgGUID: nx9V/8MkRweIy9k5Qk2hQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10016740"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10016740"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:40 -0700
X-CSE-ConnectionGUID: MjNlEdQVQxOg8Oa4NViOow==
X-CSE-MsgGUID: 4RxTkAuUTwi7GVyrYg3auw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25620957"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EEEE4120768;
	Fri, 26 Apr 2024 00:27:33 +0300 (EEST)
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
Subject: [PATCH v2 13/14] media: v4l: subdev: Return routes set using S_ROUTING
Date: Fri, 26 Apr 2024 00:27:10 +0300
Message-Id: <20240425212711.928300-14-sakari.ailus@linux.intel.com>
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


