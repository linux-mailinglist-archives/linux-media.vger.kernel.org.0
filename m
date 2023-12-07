Return-Path: <linux-media+bounces-1828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E1B80875E
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020F51F224E1
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EB03BB2D;
	Thu,  7 Dec 2023 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSiCY3ok"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919B610C9
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950961; x=1733486961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jV6z+C3b4RORasxjh4WphkKnfuADGfBIcv/kQUBf6mw=;
  b=BSiCY3okM6tbd/HHCRZe+5AXH5TZQsMLF0K0i33la63A2/AvykUJZIIm
   RzcDMRVvmWYVWMvjcUXC1qrWtCYMwealIGX201K8FDsBXwAcQQKO9Ijof
   OEgGkCuCBx2zq4UcLBqkY/s34BCNanXJ2R08X4yzCY2adjbPaTM3VYLFp
   i8WgAbRyuP47/akTLn0wv3ysKRANjk0uiGcTHheH7tlQUs36yO/UkwMb3
   bA59ch1C+/soAum+icAn7oqXZqvOAFgxEn2FA+6VMdqdziN90AWwI8JlN
   S9R1YE7b8OtiTIiIEwWL2ZI4Wb6zuThw7JLujFI/Nr+TllNd5XBhn3NTk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373707159"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373707159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19684504"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:19 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F1CCA120E08;
	Thu,  7 Dec 2023 14:09:15 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: [PATCH 4/6] media: rj54n1cb0c: Don't set format in sub-device state
Date: Thu,  7 Dec 2023 14:09:10 +0200
Message-Id: <20231207120912.270716-5-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/rj54n1cb0c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index 403185b18f06..a59db10153cd 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1008,10 +1008,8 @@ static int rj54n1_set_fmt(struct v4l2_subdev *sd,
 	v4l_bound_align_image(&mf->width, 112, RJ54N1_MAX_WIDTH, align,
 			      &mf->height, 84, RJ54N1_MAX_HEIGHT, align, 0);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
-	}
 
 	/*
 	 * Verify if the sensor has just been powered on. TODO: replace this
-- 
2.39.2


