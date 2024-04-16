Return-Path: <linux-media+bounces-9597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5EF8A7503
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D37DDB22F83
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1093013C3CD;
	Tue, 16 Apr 2024 19:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHDaDN2T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA813BC36
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296072; cv=none; b=nf0TW3aIxAK3PrbxgN8K56o1QTwz3b5TUXuaqtF5MEFveFr+2VF4eUYmIyrSdHYd+t3JO2etmlHgukif5vTpNuWy3iMedW3jeto/SBaxFW00Mn5l5LCBopWWimlRSvmwWHqbheYaEDFZy28OQ4lkS8lyt2U3NBkob/a0idwep4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296072; c=relaxed/simple;
	bh=RtiIXjSm3LnsKIv11/aDX1eaQ/+xaiDPrTO5lJiACQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FGIvBcX9nOWTqQ98AAAYtXcci8X5iMFvx/D3h040maaXdnyucbKEgAJXehectJ46Gx2EtdQxjKse9ayflS376nSX5/jPakiY/F9CZlEyTXVf9Ax61SBoLWKAiQ3Y1zo+kfsHJfNt3TDnkXqFLZ6DAt7AmDodmyGU1+qaDDUcl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHDaDN2T; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296071; x=1744832071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RtiIXjSm3LnsKIv11/aDX1eaQ/+xaiDPrTO5lJiACQM=;
  b=XHDaDN2TgQNOQa70TQFWYn9KN09MZzHS6cQatldyw0EVFTcDSic6NSEF
   zyz8V5UybERb3B6HDgMu1UYcLGe8gKNfEpolMNc91Vv+PH65g1bVojMyq
   UCjd62Hb3tSS2HlQzOQJYzlVk4qota08AyLx20gXmGBlmCnm8JfuBlByr
   pL8AMWpPhO2LBvIUkoXbNeHb8MAh+0wmjuPN3EjyWQVAhmPrl08xOYGSy
   3WD0gfo2AO5zUr+OAUT5uMC2aHRaT62tALxtAW4cWWPsyxjUus4m7yDOf
   5V4nWRYZVHKyxwh5tK3JWcBmxhW5YcHWdt5+Zd52Ze0B+jwR5HsmyVqhI
   g==;
X-CSE-ConnectionGUID: 9hQTiiCYSdOvLcWuCi5vog==
X-CSE-MsgGUID: FEFpupy7SxOpOcL1JmPFaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929936"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929936"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:31 -0700
X-CSE-ConnectionGUID: Mq9Uw20kQ7e3l7kf0oUseg==
X-CSE-MsgGUID: wxzsVKKXTsqahpnMEkehng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22244799"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 43ECB1204F6;
	Tue, 16 Apr 2024 22:34:25 +0300 (EEST)
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
Subject: [PATCH v9 45/46] media: ccs: Add IMMUTABLE route flag
Date: Tue, 16 Apr 2024 22:33:18 +0300
Message-Id: <20240416193319.778192-46-sakari.ailus@linux.intel.com>
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

Add immutable route flag to the routing table. The embedded data stream is
always there.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 0f68e64a4042..785e5f2dc107 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3345,12 +3345,14 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
 			.sink_pad = CCS_PAD_SINK,
 			.source_pad = CCS_PAD_SRC,
 			.source_stream = CCS_STREAM_PIXEL,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		}, {
 			.sink_pad = CCS_PAD_META,
 			.source_pad = CCS_PAD_SRC,
 			.source_stream = CCS_STREAM_META,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		}
 	};
 	struct v4l2_subdev_krouting routing = {
-- 
2.39.2


