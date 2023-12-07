Return-Path: <linux-media+bounces-1830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E287C808760
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF761F221C3
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3676039AF0;
	Thu,  7 Dec 2023 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ki84539p"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F5E10CB
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950962; x=1733486962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oclJQL5S3ifmXzvonTJkPWlCo8AL9JfcC4eF+0nK2cU=;
  b=ki84539pMby0Xfc3VZggoVEwaNJ9DwNCiCPeB49NSxpX4c+9vCg3eIOP
   xi+86ZOeO41tEG2AZk6Np2hoFJp4kSB81oG53tKu8Aj5sxE9KxApwq/7k
   VAMd+krQt0x72reDx/K/JmW2jyMF9PwYE/JlcNdntA7m/+40DEY8Wq/Bt
   rHF4WUDRulkPrJjd1xz28iKKtR3mlhfmwPLiOa5V0Vfd//L6xi23XTiTL
   pAZr9FiBtRN67OCXpl8x1Scn/yqzzJ7VEKmDf+Mv+QYFGHNqHwCxjojpA
   G1Aycp7dPg2NhGCHbbpyVsF0SnihYuhTgZj21k7SeBiEpAmDESUE+9Q4f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373707163"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373707163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19684505"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:20 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AE59D120EE4;
	Thu,  7 Dec 2023 14:09:16 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: [PATCH 5/6] media: tw9910: Don't set format in sub-device state
Date: Thu,  7 Dec 2023 14:09:11 +0200
Message-Id: <20231207120912.270716-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207120912.270716-1-sakari.ailus@linux.intel.com>
References: <20231207120912.270716-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the purpose of setting old non-pad based sub-device try format as a
basis for VIDIOC_TRY_FMT implementation, there is no need to set the
format in the sub-device state. Drop the assignment to the state, which
would result in a NULL pointer dereference.

Fixes: fd17e3a9a788 ("media: i2c: Use accessors for pad config 'try_*' fields")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/tw9910.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 7c331a7f12d4..905af98c7d53 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -829,8 +829,6 @@ static int tw9910_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return tw9910_s_fmt(sd, mf);
 
-	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
-
 	return 0;
 }
 
-- 
2.39.2


