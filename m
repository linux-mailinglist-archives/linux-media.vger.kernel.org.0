Return-Path: <linux-media+bounces-10135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D368B2AB6
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83E3E1C2138C
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206BB156253;
	Thu, 25 Apr 2024 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVhFzsJg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CB156230
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080459; cv=none; b=kQPYmZG38ozVlmWTTuLCkn1d3qR7jYb+C9LDZLi0K3f6GeH+vxNJdh3Xp/2Oo+xpbQ+zGW/nuvR3gL1okayImt9Yr7txKV8S4NwGhHMBYkwvwx5IIGY5U1IkVPaH+yopCg9YfCd/e/TcPNkLJ8PfRRtvcRKiJwIi2GbBZ4Rl7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080459; c=relaxed/simple;
	bh=HWo70uAnzn4Nud/ID2UJzFa0xSOrIPMcp/Kd/BkRAak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XgeOMnz8vpRFa6EVMWUn5/yeJVVKAsz35CCSwZJSjuIyQJ5xuGpHwKu57Z/vh/NZKvHdWOhMHvvnOKC9L9En2jZ9tDupEk/3qFw2xun5NZEo/QRAZ/AnjE54bHC1xtpi7eZ9wHfBgAVlFN77wZmQovl4c+m0L8Hoy9Pi+cn/ssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVhFzsJg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080458; x=1745616458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HWo70uAnzn4Nud/ID2UJzFa0xSOrIPMcp/Kd/BkRAak=;
  b=GVhFzsJgP1uHrQc5XLnZkCzHluKb45TBxV417PGiTJNa82lsYVLaLa6B
   8+WvLuMmJtqYDCXP+Wx4dumKC7ukOF0sQnixksn4AP4P6U1TSALzUU5uO
   AobMFEYGvaVhH7HAuda3DBP6MJFKRajHQrRa4W+MsTbXBsH4uZRdX85+s
   gMmS1zm4YKHG7n/5v5CG3/sEPOIkgCeqUBczatqpiCNCORlE47Sbc+UB9
   /SoiyA3o1697BV3f5CNDaz/snJX0jXWb54jVZiIVyff3SR76LqTahYvMC
   sB9GP7uUZ9VFwLhb5CG7V5oLSlDPjvhVEsCYd+DrokLp0CB4KNpW2DUxd
   A==;
X-CSE-ConnectionGUID: 53VDwTZfQOqnlMGQRmzn5w==
X-CSE-MsgGUID: lZ2sOGFXRE6X6ZBFNmeCrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10016725"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10016725"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:36 -0700
X-CSE-ConnectionGUID: Js+H0WbeQ8qLyZH3U5dQlg==
X-CSE-MsgGUID: 2ifP6HfhRmi84kymgSLOSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25620945"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:34 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E2BD312027E;
	Fri, 26 Apr 2024 00:27:30 +0300 (EEST)
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
Subject: [PATCH v2 11/14] media: v4l: subdev: Copy argument back to user also for S_ROUTING
Date: Fri, 26 Apr 2024 00:27:08 +0300
Message-Id: <20240425212711.928300-12-sakari.ailus@linux.intel.com>
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

As the user needs to know what went wrong for S_ROUTING, copy array
arguments back to the user.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5e928e2a2beb..0260acef97d2 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3461,11 +3461,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	 * FIXME: subdev IOCTLS are partially handled here and partially in
 	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
 	 * defined here as part of the 'v4l2_ioctls' array. As
-	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
-	 * in case of failure, but it is not defined here as part of the
+	 * VIDIOC_SUBDEV_[GS]_ROUTING needs to return results to applications
+	 * even in case of failure, but it is not defined here as part of the
 	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
 	 */
-	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
+	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
+		always_copy = true;
+
+	if (err < 0 && !always_copy)
 		goto out;
 
 	if (has_array_args) {
-- 
2.39.2


