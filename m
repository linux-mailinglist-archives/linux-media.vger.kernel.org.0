Return-Path: <linux-media+bounces-10188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6CA8B3352
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A604282DDD
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE7413DDD7;
	Fri, 26 Apr 2024 08:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3aZJFk8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E413DDB1
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121465; cv=none; b=AbJ224kyuu34ba20tH2B5RfV3MswtsqU+OjY4u4UC1Iq05tRoICXfXt9bo0AcgLjcN29wW9WGodEjaBlvWuj3tgneCckGpeJ25AvVdwmBd1QAj5iJBe00HUYxdI1RhQzezPw/8xD8AQiTe7tRVxgbZnY1QyoiBqCPUVM0RAGfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121465; c=relaxed/simple;
	bh=KY+lx6CRHKbqxwavkV8vK3kxZ6KrOrEF/MbKTPBx2jQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gYx4/ZNX2v0wcuQAKL2ek1vyldb0gqSpc8MMgGtZjCDv5/SwkDFfOlV0dxLTtALgR8VTqmYek65jxPz9Gr028FWd9ppbbuXpXouvP0xqFhubLG03pSUPWGvfNma5h4MTHEngleK5jHorqzzprZNLzs5cGG0BkFCjR6PoUgSzrkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3aZJFk8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121463; x=1745657463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KY+lx6CRHKbqxwavkV8vK3kxZ6KrOrEF/MbKTPBx2jQ=;
  b=D3aZJFk82AXsxVGcN2IhTM6yNP6RQvZgd60tOIAhQ9Jzs/jJuGdXZJpK
   zROzZWn4IRzq7mDo5Xexnz0jiLBbpmo/FZ0popstlceCo6vDBO+FJkULV
   xaHqj1wTNCdNDfbia/Bu+PkziMU4gJF6dloo2IV9bA5DEDPEn/fm/ILiW
   cEymt/suw94NwYvh2j+8ZLkhJaxEXi5WVb3F9oLm8sVyrr2rxC2zIS7dt
   AnwUXKMnN4hwp2vPpGSouwf1mqNQpblD46KsLVVq38EydbiDpLZUDnitZ
   Vpvfdp3QmFYZMMarHhGkL/foqfgPctRkx/kp+UHWTk3eGFUIlCX6+vq4J
   A==;
X-CSE-ConnectionGUID: VLUnwySSSa6dL3gGFYOBvg==
X-CSE-MsgGUID: FTT/0lVZRU+/U7bkrrhmKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13637483"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="13637483"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:51:02 -0700
X-CSE-ConnectionGUID: PGCrE9HkQb+9BhXqoQ/zAQ==
X-CSE-MsgGUID: syYb2efBQpyIP+WwMVgCfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30010546"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:51:00 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E57CE1203ED;
	Fri, 26 Apr 2024 11:50:56 +0300 (EEST)
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
Subject: [PATCH v3 13/14] media: v4l: subdev: Return routes set using S_ROUTING
Date: Fri, 26 Apr 2024 11:50:37 +0300
Message-Id: <20240426085038.943733-14-sakari.ailus@linux.intel.com>
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


