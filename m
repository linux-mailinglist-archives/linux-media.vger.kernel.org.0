Return-Path: <linux-media+bounces-6973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109587A392
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 432031C209EF
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB377199BA;
	Wed, 13 Mar 2024 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0eAwliA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2EB12B6F
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314784; cv=none; b=M+v5PxQIxikvFdfCGPdSIJZb1iKC+zM757P6BB/H982ZEwQqtFGGs12QFNRVdKlIDe4THJ74NF2aJ4q6WW75EsvDJL1ckx4KC3B+ZpJVBiTFjExEMVVESb8YfA9Ad5x0kfhyPuMPz9l9XBZOqUNhJn4A84ZYjVzFhTOUQEQXqqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314784; c=relaxed/simple;
	bh=Krs1C1YbUmriQyxi/uA2CY9l2IQAVswHwr0Bx1bBSyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hcfRwc6H6F8J35tkncrurHypsY3wqyd7CStuw//9Q5Rg0c1rzatY0uYym1o8SwV7x3ifSTWYLYSt1AKppEFalJBVqxbZlHBNzoqOnI/AJDV4MbnXJt1Gp0bS0Ex13BfBGgNJUB7LU2nXEckAbpEDilHcRLUvDpjmTDzI0jjqPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0eAwliA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314782; x=1741850782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Krs1C1YbUmriQyxi/uA2CY9l2IQAVswHwr0Bx1bBSyQ=;
  b=a0eAwliArEZwtIjC/ctzaXw1AEO29LmTFdwZ9bB1H6MFt/DFnXGWUK1T
   y08HWJInglq4W1hNN1k6jRcXFv01oBVpuSLN3KWRchs7Sey4mfDYPbeWU
   J+7z5R8rMDjW8rpQchiRkPiIgiFr4UyJnMbpZqyfCHNxJ+BGfN0T/qZ2m
   ppqFGc/5L5zkPj6tiQnWQgAgBazO6JYvSVc6BAcSibuvXEBXH8d03Xcwz
   KO1oTmA643bxkRQjOf1rh0DwGz+T+eLt+S0RsHIhWBlYGFCtO9q0wTN4N
   3eohYWgvObkL7/4oE8xJNgIwXUjmALtQAeYNemQPznJpkQ9DkJQu4fDjI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909377"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909377"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542416"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:14 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A775311FB94;
	Wed, 13 Mar 2024 09:26:10 +0200 (EET)
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
Subject: [PATCH v8 37/38] media: ccs: Add IMMUTABLE route flag
Date: Wed, 13 Mar 2024 09:25:15 +0200
Message-Id: <20240313072516.241106-38-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 838daab212f2..5205d1ecf8f2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3368,12 +3368,14 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
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


