Return-Path: <linux-media+bounces-6974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8FF87A393
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AABF7282910
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AE71A701;
	Wed, 13 Mar 2024 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XR2dsr8O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7435019477
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314785; cv=none; b=S049KQEkMJqoFdajqd2wgXcEw4Uo0Z/6Yg0O/k+i8Jz2/uP3eAmEfadmg1NQNlxuMqifQ+CoLvCocrbd/vlW29pf4SygAvoYZgVsSB62GfNiqOQKob08yAlsfbkfC2ajkWow31qxnHZSBjFaEFOmeXwP4WS0l+1ifplZuJdl+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314785; c=relaxed/simple;
	bh=P6qvoZ0Y6Z4ZChn3tr6PuZ7xHbRgmMQCiGtYOSXcaHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kReKTlfYHL/qzLVwtqqz8WNT86q/MilQEl06L9VOZ+cmlVaGsNNbzRPf0ET61IMjsoC8IFylV/DhtpZpZpk6/F2DM92ZEHoFqhT6B7h1npHGY0b5IqQ6w9zDtVwgq2REWVsaqscyvYbSQwmSSxMKqpBNZnI4ctGaPcLXbBcQS/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XR2dsr8O; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314784; x=1741850784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P6qvoZ0Y6Z4ZChn3tr6PuZ7xHbRgmMQCiGtYOSXcaHE=;
  b=XR2dsr8OkJKdp2Aj+1lRkA4XuqdoO18I8Vd9uUSJSgU4JKh1z3ZWcJ7x
   y64xUbsvBENfeBnIjVuNUviC9Qr10+xRqNtnPZBH6Zd8+FDc66xAYzDm1
   b+x/SPctVS/7l6pIUvH+xhvKufivep+XVzmvMX575/eHSdoJFx5Zfr/il
   YUfesbPFsMcXMOvRqUuw58KMl969auf/ffl6wE/WPDjBvXRRykjK8CtBv
   q4/M/8eO3KKaDqqPQ64OqIi7upNR5V9gSFzrcFZg5zzfC5Rfnm3VSRJ/+
   HjXSzuZuwdRDyg5d6GN0tPoRY3jBWcUp4589yjDJud0TvpImtXHS9OHep
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909383"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542428"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:16 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5546E1204F6;
	Wed, 13 Mar 2024 09:26:12 +0200 (EET)
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
Subject: [PATCH v8 38/38] media: ov2740: Add IMMUTABLE route flag
Date: Wed, 13 Mar 2024 09:25:16 +0200
Message-Id: <20240313072516.241106-39-sakari.ailus@linux.intel.com>
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

Add immutable route flag to the routing table.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 7488b2535071..3e2585eb6ec9 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1150,12 +1150,14 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 			.sink_pad = OV2740_PAD_PIXEL,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_PIXEL,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		}, {
 			.sink_pad = OV2740_PAD_META,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_META,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
-- 
2.39.2


