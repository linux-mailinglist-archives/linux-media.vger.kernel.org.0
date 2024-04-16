Return-Path: <linux-media+bounces-9565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F4F8A74E1
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DD281C223CF
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D011613A407;
	Tue, 16 Apr 2024 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2wtN7C/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0932A13A260
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296026; cv=none; b=n1WwGQR3UhVvP3jctX36CbAnhC86qqWswxcqvAulNTE9zf/S7nYUNa0mNgeYVh/xKnVxc9d+GsJY4NJIAtkcpGHgMMJ60cbGalktKFAJ3a+2BW6GFsdmCzkBudfUAaKSbfyFRPyPcSF5gfR77AOueteBnpqKHhazzAaDGi3aGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296026; c=relaxed/simple;
	bh=yUR7MJrrKsVIHrBM51kw446NDDrIK/zEJoZ3+7FbS9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aRaDYNCZuMiBnrjfODiK6LqTOW8SXxrvwkAH2f8emrJ0R2+dlr+o7uDorX46KmpQ6j+DEXxua9icJSOU6CHJG84N7fbQd9hljMi9j0ut270hu0jOG/+vPKpVMgnXTZ2LyHLu9RrssFmMk7FWm2XyyWGE034Dip+TfVIdMm9wRDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2wtN7C/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296025; x=1744832025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yUR7MJrrKsVIHrBM51kw446NDDrIK/zEJoZ3+7FbS9o=;
  b=K2wtN7C/JfS5FeXiRkur5t9YvutZrbCPpjZnXhQndm/MubNMM3YwJdS/
   iGpb44VbzYgC7tZkaSDstGIvs9gHY0JOSR4zZHW6W2GhehtPyppNAksk0
   6Ir2T7VGWZBaM/tpvbQnaOdbsgRnFtDRr6xXQ3m513sZ6t7KZeNfy2v0t
   moUFz9ioeJzcl4ZJqAMc7CSwV5JDWj5y+MM3V68BaIJe/4nID1WXnztXp
   r1vVmh4VwB8ox8WfmgV2BSjZY0uirEDlhNREObPmfGoPGmvq6Gmy3xSMk
   I5PN3JJ7nuQ4M3Ihenn6TGjdVLb2lLalc2PNk/Y2Q3MV2CIBesG2kRVto
   Q==;
X-CSE-ConnectionGUID: /7beXKMrQgKKfnYm4/H61A==
X-CSE-MsgGUID: behJmlu0SdmyVrQkgY7ymQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906080"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:45 -0700
X-CSE-ConnectionGUID: co52UDJSSJ2Mqu/+alci1A==
X-CSE-MsgGUID: 0+zc11yiRjWwo4ONAJpZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155296"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:43 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2EF5A1204F9;
	Tue, 16 Apr 2024 22:33:39 +0300 (EEST)
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
Subject: [PATCH v9 13/46] media: v4l: subdev: Move G_ROUTING handling below S_ROUTING
Date: Tue, 16 Apr 2024 22:32:46 +0300
Message-Id: <20240416193319.778192-14-sakari.ailus@linux.intel.com>
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

Move G_ROUTING IOCTL handling below that of S_ROUTING. G_ROUTING
implementation will soon needed in handling S_ROUTING as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 54 +++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4b1b310b5d68..2ba11e5343f0 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -911,33 +911,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_QUERYSTD:
 		return v4l2_subdev_call(sd, video, querystd, arg);
 
-	case VIDIOC_SUBDEV_G_ROUTING: {
-		struct v4l2_subdev_routing *routing = arg;
-		struct v4l2_subdev_krouting *krouting;
-
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
-		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
-			return -ENOIOCTLCMD;
-
-		memset(routing->reserved, 0, sizeof(routing->reserved));
-
-		krouting = &state->routing;
-
-		if (routing->num_routes < krouting->num_routes) {
-			routing->num_routes = krouting->num_routes;
-			return -ENOSPC;
-		}
-
-		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-		       krouting->routes,
-		       krouting->num_routes * sizeof(*krouting->routes));
-		routing->num_routes = krouting->num_routes;
-
-		return 0;
-	}
-
 	case VIDIOC_SUBDEV_S_ROUTING: {
 		struct v4l2_subdev_routing *routing = arg;
 		struct v4l2_subdev_route *routes =
@@ -986,6 +959,33 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 					routing->which, &krouting);
 	}
 
+	case VIDIOC_SUBDEV_G_ROUTING: {
+		struct v4l2_subdev_routing *routing = arg;
+		struct v4l2_subdev_krouting *krouting;
+
+		if (!v4l2_subdev_enable_streams_api)
+			return -ENOIOCTLCMD;
+
+		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
+			return -ENOIOCTLCMD;
+
+		memset(routing->reserved, 0, sizeof(routing->reserved));
+
+		krouting = &state->routing;
+
+		if (routing->num_routes < krouting->num_routes) {
+			routing->num_routes = krouting->num_routes;
+			return -ENOSPC;
+		}
+
+		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
+		       krouting->routes,
+		       krouting->num_routes * sizeof(*krouting->routes));
+		routing->num_routes = krouting->num_routes;
+
+		return 0;
+	}
+
 	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-- 
2.39.2


