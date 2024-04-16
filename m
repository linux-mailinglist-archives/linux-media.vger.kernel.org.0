Return-Path: <linux-media+bounces-9568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2C8A74E5
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F35DB1C220D3
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E1413A879;
	Tue, 16 Apr 2024 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvDYAtuP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E513A412
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296030; cv=none; b=q/SXAk7QhYYeh4UPEzU4A4roSbwJN2l4+bpF1cnxapStvcR1wWU/9DBu6Qk6rzgwSc5PTaQMQlP/qe/CgoU8+BVwzZ0PK3aVAS0m4pq0mO7xA0W7NdVk5Xkbn7bs99S5HDHUGF4VW6xR1emzfcRNYH9ZrC6k8Dxbc2Con8rS8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296030; c=relaxed/simple;
	bh=u+wdARH1bMm/ZrpemB1FGjHbI8DgJvIlS8L9ax43vq4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BwQcNJn0kT0qVvkMP3vc/tAnehhA2elh52NJKKIYhc8eokDcw+fdgXzvm3ILi7VLfULrRLcoYDe43rwX8RCE4iyzi3jw10TfChZciFVnppSIyaf4vtHnSscS4q0Yq6vDabxRPji95TjSjksPjwXFE5f8GejMuKmMXbLVn9ZdH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvDYAtuP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296029; x=1744832029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u+wdARH1bMm/ZrpemB1FGjHbI8DgJvIlS8L9ax43vq4=;
  b=hvDYAtuPLtucVK7N7Aq34UiOx/XZcCh+KKxI5J8v+6aRc/JM34FpG67D
   ivya13RaRMt5h+4o1iqI2aQeGwX0Hb8342ujC2PuEgUkha1f7hm7BhXvs
   ygteNcew5R7sAG4EfTc1EPjz8mIMu8LQ61KplbaX2tqnPnE3wSGO3JeN9
   ONBsgDzyuotW+kbOVJNR3AQIiVMDLH3EYTgn4lOo72Yi/U95Lb0lWeJ4Y
   1Al+ELVUH5KT0m8nDdwD+PRXgRGsFwa1RYRzXMU+2nKGDt5rBepPyx79C
   mDmZQA6Ji8aGoSH1riAWVc77hrInUFob/jGDyee9UpkCKG0KZQTeXdzf4
   g==;
X-CSE-ConnectionGUID: FFJmS18FQrqY+7ddKjHuHQ==
X-CSE-MsgGUID: aSJSfnslQX+G2EkFnD18/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906100"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906100"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:49 -0700
X-CSE-ConnectionGUID: 5OIZY8zmRlan1m49ufzWqQ==
X-CSE-MsgGUID: 79c8sAtiTWqQ0y1yAzgwqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155351"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:47 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2414C12056F;
	Tue, 16 Apr 2024 22:33:43 +0300 (EEST)
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
Subject: [PATCH v9 16/46] media: v4l: subdev: Return routes set using S_ROUTING
Date: Tue, 16 Apr 2024 22:32:49 +0300
Message-Id: <20240416193319.778192-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
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
---
 .../media/v4l/vidioc-subdev-g-routing.rst            |  7 ++-----
 drivers/media/v4l2-core/v4l2-subdev.c                | 12 +++++++++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 27eb4c82a0e1..88df7bf80b00 100644
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
@@ -157,10 +158,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
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
index 904378007a79..36b2f78cd551 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -959,8 +959,18 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
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
 
 	case VIDIOC_SUBDEV_G_ROUTING: {
-- 
2.39.2


