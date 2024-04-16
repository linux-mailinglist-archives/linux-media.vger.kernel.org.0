Return-Path: <linux-media+bounces-9569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC038A74E6
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D4D91F22220
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F69113A3E5;
	Tue, 16 Apr 2024 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHf3XdU9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E46313A265
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296031; cv=none; b=qDpBphWSoLQvoHC8M9BmQ3+EbqVGMp9AGAxXmH871htRpHFPPkJkDkfnvkyrNM1mfv+2pd0uvdcQNXWXtvFGM/1gYzH456eHzu5qWRWmbjeVn1//VGrZdZcr5DAJJtFRzlvHYnPkDzsI7cYXLm178tmaCHtGGxG3X6WWU5T2V8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296031; c=relaxed/simple;
	bh=KXeOlzu+r2ZKGIMEbyCz6J1V6vzCFn6TxdBs+xXYoUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g/rulYlEn71isGfWGolacWu+hZYYQTW6LEftCEHOHjuXjHCwQy7OIIKRiHdco3jChEdlwD8srA9GWwIllNak+47JSW8qzHudu2BjYUif9XwsSm+BM3dXiM2QMedBbkcYeWCIdSz0i/3OmpOWk0ZmBg/a8HsYtZhMpN33+W4yfaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHf3XdU9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296031; x=1744832031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KXeOlzu+r2ZKGIMEbyCz6J1V6vzCFn6TxdBs+xXYoUM=;
  b=kHf3XdU9lG0S4MU2enj6EOpEpz+qmuKDhqTkZF78xRhmxiXrvjVr7LNK
   bgqonyR707MeG/EuQvQYyJxfwPgqzMMLhYZFLQFg4VFVrEZrxRdL4ON9s
   7OSyTuRpqby+kbOB+l2NF3YALKjyLhEsPWYlo8P+kdzC7mbPZC9QiKDbl
   BNEtZSKGoQo+f8Y3afrVDUYqKZCtFSx6EznzouYkHWOJnODqCTHVjcnbz
   6w1+53Qi+yo5EvJOqf/S4QU+oweSHN/Uo5kGiSgbWe4oiyLiJL7rhlORC
   bm+5hglQOWHn26KKKK3Ws7u6sO2C2lQdR9CaWrbOuYZ7c/QXUVOTJJdkw
   g==;
X-CSE-ConnectionGUID: v9B0jTLxR5yLv+1AMvroTw==
X-CSE-MsgGUID: uNEBI9CIREechiWo27xUqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906108"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:51 -0700
X-CSE-ConnectionGUID: TDPMRnpLTvmg7Ku8xvSoqg==
X-CSE-MsgGUID: zk5KF4TwRdWfQsU2q3047g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155360"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:48 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6C86B1204F6;
	Tue, 16 Apr 2024 22:33:44 +0300 (EEST)
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
Subject: [PATCH v9 17/46] media: v4l: subdev: Add trivial set_routing support
Date: Tue, 16 Apr 2024 22:32:50 +0300
Message-Id: <20240416193319.778192-18-sakari.ailus@linux.intel.com>
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
index 36b2f78cd551..e68f16a7c041 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -955,6 +955,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
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


