Return-Path: <linux-media+bounces-6953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F5C87A37C
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810AC1F222DA
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E501CD00;
	Wed, 13 Mar 2024 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7NP1KUT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0C1B965
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314760; cv=none; b=IKEgq/uStkmvoGt3gvam0oq6GtFNiozSjfK1tzp4VG+NnoOCwu5vyNGdaYCikbFSEmAqBUv5yWBTS4ko3S3in0h5hwzwvbktxwn9DsP3f7SM/SNQ7qh+ap79jtvdbfZZO4s7WMsyhjRdmlNkSDgO6oLsBoJCnBDZfRy5QqwJgVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314760; c=relaxed/simple;
	bh=sdD8HgpMjXXdvgqgk4cOGZdtUpHb9Foa4imG8muURoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZiqPxhgSK74Bqb0H6Xr3yTYB7yAhE4zVB0beFTfASZ1ToHABRfpFB6wlrihNZku47tSwXMjkW+0Wosmc8kSJQRcH22pLXVkFiTl0LGhT63YQDHOojlNo+7iIOVritCdFJHiEpmMSb4s/3ZciOkoVSVcIfKctF4D84rwXuBx7cfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7NP1KUT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314759; x=1741850759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sdD8HgpMjXXdvgqgk4cOGZdtUpHb9Foa4imG8muURoI=;
  b=G7NP1KUT4cMhVbWIcuVYkz/gXI2lRsw1lQSJIRd1CBYMQwfAY37RlwgY
   LhGeuYGddUWt2RI1APgvWPdQakjL/5m2Avya/PhYXHDXKO3jmEUxYJfsE
   OfoOicl+1ZTrbYE2/2hInoGBieHn+7XlQIWspQSg34FqUP22LY8pbnKMZ
   a0nxWMWxo+hDZgR9Irhy/kwyVz8/D/NEyk3Ku60bKE3GSlMRgjlhqJc2b
   CNADXdf1swW/5aYTw4WN2oJwwAZNIgkmaTsjjQOykzfrgFjpmagEOeUn0
   Y4blZ8jPq7AIlZEeYeR+m1i0UISxvKyqUv+Ni6lr0HsG1UFuklEZmJHt4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575605"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575605"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816439"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:45 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 979401204F6;
	Wed, 13 Mar 2024 09:25:41 +0200 (EET)
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
Subject: [PATCH v8 16/38] media: v4l: subdev: Allow a larger number of routes than there's room for
Date: Wed, 13 Mar 2024 09:24:54 +0200
Message-Id: <20240313072516.241106-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
as there's room. Do not consider it an error if more routes existed.
Simply inform the user there are more routes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/vidioc-subdev-g-routing.rst              |  4 ----
 drivers/media/v4l2-core/v4l2-subdev.c                  | 10 +++-------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 6eb6a59570dc..08b8d17cef3f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -147,10 +147,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
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
index a357ce318192..a6107e440ef0 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -964,7 +964,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
 		       state->routing.routes,
-		       state->routing.num_routes *
+		       min(state->routing.num_routes, routing->len_routes)  *
 		       sizeof(*state->routing.routes));
 		routing->num_routes = state->routing.num_routes;
 
@@ -985,14 +985,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		krouting = &state->routing;
 
-		if (routing->len_routes < krouting->num_routes) {
-			routing->num_routes = krouting->num_routes;
-			return -ENOSPC;
-		}
-
 		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
 		       krouting->routes,
-		       krouting->num_routes * sizeof(*krouting->routes));
+		       min(krouting->num_routes, routing->len_routes) *
+		       sizeof(*krouting->routes));
 		routing->num_routes = krouting->num_routes;
 
 		return 0;
-- 
2.39.2


