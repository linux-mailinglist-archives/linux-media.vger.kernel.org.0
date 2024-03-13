Return-Path: <linux-media+bounces-6948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9203287A377
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F342F283408
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F3C168A9;
	Wed, 13 Mar 2024 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcMRic6Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361C719472
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314757; cv=none; b=Qy/KR9lJpMyDuh4udLtaZZ5Ech+2/jJ4Puuw6/liLgapxZ6nqYEebwdhMGNjWJeY32msSjsMZCWyK7/coK3B/jUJt4uxzGvX261+yOM6Y4Sr1BjXgooHNNbbFe54oZ2blWf9sbC84wuJIjd+r7pK/tIwvRjX0ZZY1NFJ3GYxbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314757; c=relaxed/simple;
	bh=C/xeTJ63kA3WjTWp+jncTlpYXGPsZHJT+wccD/TFWX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pvn9OawLe+wP9hC67J/bFteiXJLib6wTXxttKF1NxTFkSlyKGZYAzusD9znzPSY3JDCBD1Ku05iO2u45R/gM599Fvr2WzBu1L9XgDwVM1VWyeiTaRqH6JNBnG3U1E1cZGrR08PrRKgAK43EazZJKnXZzxlVs1trf1CH/LvIFEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcMRic6Q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314756; x=1741850756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C/xeTJ63kA3WjTWp+jncTlpYXGPsZHJT+wccD/TFWX0=;
  b=GcMRic6QJHnDQy2KaEYn9VkBh9tWA6pSShVIrsCQqXz6rMktCVNWVOWJ
   Gwk9G7fk1pHQ9l2kW5AoV+tTDcc/PxSx+Xu2bpaTfdB0pHjQ+2IULyoKd
   zlnb8ZLQrqYlsStsHtnSU4i56ybin/ic7fjZ2o2dSMum0Oy3pdEBO7YTw
   3k1Yc+Rubjq2fenroN/Y6fLpxDt5uIfCN1+XV1W0NtG3ssmsRjTu1Ja8y
   FNxF4/sj5yXcsv6XeM1Bv+SI8mpwPkTSFH0vlKxS0SMaky9gy7nMQgOz1
   RPBl7U94xc8+P1GasOqu7Y4aLbw/MJkSONt+MjBjH4ZO1t6SYbtRwPFRg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575583"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816416"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:40 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 633E71201C3;
	Wed, 13 Mar 2024 09:25:36 +0200 (EET)
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
Subject: [PATCH v8 12/38] media: v4l: subdev: Move G_ROUTING handling below S_ROUTING
Date: Wed, 13 Mar 2024 09:24:50 +0200
Message-Id: <20240313072516.241106-13-sakari.ailus@linux.intel.com>
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

Move G_ROUTING IOCTL handling below that of S_ROUTING. G_ROUTING
implementation will soon needed in handling S_ROUTING as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 54 +++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 6c34df19ea2f..ec8de3f872b9 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -909,33 +909,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
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
@@ -984,6 +957,33 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
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


