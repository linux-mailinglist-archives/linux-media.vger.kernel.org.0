Return-Path: <linux-media+bounces-1827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9228180875D
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C20528389D
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2804739AEB;
	Thu,  7 Dec 2023 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQQBA3/R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81875D5C
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950960; x=1733486960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d9HAych0ihFgbCxGHHERge9Ht4w92bpaGWnQZ7SHAxs=;
  b=ZQQBA3/Rt8N6otyRIUNbVAOIjWwkjgGynPchMRRC3hs6oQbZ7Obs0vLV
   tEsnWzOXkJPz+U//j0wWrcgDJdh8jSTXRcADsOYEAwTWt/6D+8n4/UQ6Q
   MxQfKBnrR+l/iVFvusAM32n042HNzB7yG6jM3VcM4Vtp4NMGhRc3NR3Zr
   rOJbQZtzSzQlpXFGgpVBUMUiydG5XLjUp+p9uTs3TWpBo7NADeFQfx0qE
   lnHMgWvKYmnV3dJA6t0KBnnLZCHRPMBiqDTKG3aBVpJZgan8FrxCDsk4U
   YWhnFuFqE/jxlgW/16ZbYYDCNl/8sXrAsJkNI+8oSOhTogm7hARb6W08b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373707155"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373707155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19684502"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:18 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 440EE120ADB;
	Thu,  7 Dec 2023 14:09:15 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: [PATCH 3/6] media: mt9t112: Don't set format in sub-device state
Date: Thu,  7 Dec 2023 14:09:09 +0200
Message-Id: <20231207120912.270716-4-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/mt9t112.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index 2e2d9853c089..fb1588c57cc8 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -982,7 +982,6 @@ static int mt9t112_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return mt9t112_s_fmt(sd, mf);
-	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
 
 	return 0;
 }
-- 
2.39.2


