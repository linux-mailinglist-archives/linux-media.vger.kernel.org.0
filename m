Return-Path: <linux-media+bounces-6952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120F87A37B
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B18E92833F3
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444B217597;
	Wed, 13 Mar 2024 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqZsfvgi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5290215EB0
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314759; cv=none; b=cracjLXJmCshaV7Dm34HNhpOR3ILq/R1OKP0EDlW1nI47SP10xOXnzQaD/oYdT56cv5WQ9IsdEttDE+sbaitFKZWud1jQqBlhlJn/HS7RUVJGAdQ61BajnIZoUa1yeRQnSKHOFfGsUjxXkrkVofFnHKpLmrpO9byabyAFRbPQ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314759; c=relaxed/simple;
	bh=PpRPDUWluOYPJ8jvx/A4nvtUu3YvPppn3hJiDbS4UIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zi8wNv0gfr3BVaRAZNHQUgbkRyIewJcGMu74rO0y1lW3g1s2iq0x41VdjN1i6vZMhItrRYSg0s5Vu0gTnTssSytp/+KxIZgXWTKHh3WcGAA84ClqOyUNXkxJYue9SpYAkpWZvPACs4Iaf4YUzClPkuWErlzv/eEzIUrQJolwLyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqZsfvgi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314758; x=1741850758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PpRPDUWluOYPJ8jvx/A4nvtUu3YvPppn3hJiDbS4UIw=;
  b=EqZsfvgiDcE/XPGqLptFUfpJEMgwd6z0X29gG/BfsFaOijccLC2Y1pmn
   +ckhQI5j9dQ50ouYZYYnSDqTr95jG0ecIo7VaCz9Sg/fb/bdJ5cSQJ1jb
   okvGBivuk4+GvnxNLCHZuLP+fwJBJ+cq0NR4tqaxrn8PkBE20MrrL1TYe
   CODJnuS5dCOtKDoEmLaRnGj2nOAI2NEyyz7cXzgpgd1MZNJ2SVnXHG3kh
   nBfc5gdpZtBzowJxqog/jKpJoitM5IkUOsVufRjfcw9OdTosYUfrVMi+f
   Sm8+5IZpVVjDM3EKFsZTfEqQCNf42DnFHGkipIj3CFmZ8EqxCs/4TykEh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575610"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575610"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816447"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:46 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F32051201C3;
	Wed, 13 Mar 2024 09:25:42 +0200 (EET)
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
Subject: [PATCH v8 17/38] media: v4l: subdev: Add trivial set_routing support
Date: Wed, 13 Mar 2024 09:24:55 +0200
Message-Id: <20240313072516.241106-18-sakari.ailus@linux.intel.com>
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

Add trivial S_ROUTING IOCTL support for drivers where routing is static.
Essentially this means returning the same information G_ROUTING call would
have done.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a6107e440ef0..c8c435df92c8 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -930,6 +930,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(routing->reserved, 0, sizeof(routing->reserved));
 
+		/*
+		 * If the driver doesn't support setting routing, just return
+		 * the routing table here.
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
 		for (i = 0; i < routing->num_routes; ++i) {
 			const struct v4l2_subdev_route *route = &routes[i];
 			const struct media_pad *pads = sd->entity.pads;
-- 
2.39.2


