Return-Path: <linux-media+bounces-1826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BA580875C
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1928A1F2244E
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4552639AFE;
	Thu,  7 Dec 2023 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkziG30w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C3110C6
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950960; x=1733486960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSgi0tL4yGJi8PQACw5oHV6gS/CCmaQL8XKqtwK70mE=;
  b=bkziG30wAmSEmobou8/eBD513dgInQszoAUpT7JlASNDYuHL4ocDqGeY
   N+xKpYcVLOsPtO5ygKokmOm2JdW/dXVBHgnzZTRSxckziU+eQBSUQX7/1
   JRL0+2hphPp1hvYEbi8d7iqoUYoYUqvZ1Ai3nj2hKa07bK5qaV1s+nnFG
   Bq7JDiTw3c358iJ0HYPhw/V23EMOdMchgV03aBXe90IIcQ75n+8FetVtu
   RlgozmFrM5IbePTzJuvSsuK5oifcZIzElgK5ziqHnfr6HzyjS3TJx8ejr
   gY9stAcXt72iM8LFZqy4yh3KbG4WdlPKpz0BgbBaWVv5aBdfsblbyzahb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373707151"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373707151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19684501"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:17 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 91722120A0C;
	Thu,  7 Dec 2023 14:09:14 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: [PATCH 2/6] media: adv7183: Don't set format in sub-device state
Date: Thu,  7 Dec 2023 14:09:08 +0200
Message-Id: <20231207120912.270716-3-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/adv7183.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index bcb99ba9a272..2a2cace4a153 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -442,8 +442,6 @@ static int adv7183_set_fmt(struct v4l2_subdev *sd,
 	}
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		decoder->fmt = *fmt;
-	else
-		*v4l2_subdev_state_get_format(sd_state, 0) = *fmt;
 	return 0;
 }
 
-- 
2.39.2


