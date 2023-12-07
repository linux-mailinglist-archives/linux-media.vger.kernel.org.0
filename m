Return-Path: <linux-media+bounces-1825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DA80875B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E11B28338A
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0632539AF6;
	Thu,  7 Dec 2023 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d10+2Tc5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA93D7E
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950959; x=1733486959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2C8T7FBa/G498XnHJNybLAu50UpyDAXmJBvFJLW5I08=;
  b=d10+2Tc5SIXVp5qLQ30mbo62yajnidjW768bArPcJp0k51HoPn6P2LMq
   sd+txtI/bUw8qENB7+/AiJyHk8yHvYrnl3ydmIpDG5EG4/0v6Yc81przd
   +T9tBPfrfjELA6bKUZyM+8gOMT0CLFkc9SA8KFNIBZ/pAe/fU04xAylXw
   uPjdei25XI7rpaDnhSRIBCL2vYLgT/p4r31SjssdLA/Ib+c38GJSkWH5o
   qHCEab5YI3fYjZMarXZfO/mub+TkBQ8IXD6Kwji6HVGI1Lod8Ao70yHC0
   vyLhiEe70Ri/bhxSoXz/OfwVkONtf0oAFgnxG30fHGp9eOpBOxAuwhW69
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373707147"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373707147"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19684500"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:17 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A977711FB5E;
	Thu,  7 Dec 2023 14:09:13 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: [PATCH 1/6] media: saa6752hs: Don't set format in sub-device state
Date: Thu,  7 Dec 2023 14:09:07 +0200
Message-Id: <20231207120912.270716-2-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/saa6752hs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index 51b62a97946a..897eaa669b86 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -594,10 +594,8 @@ static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
 	f->field = V4L2_FIELD_INTERLACED;
 	f->colorspace = V4L2_COLORSPACE_SMPTE170M;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_state_get_format(sd_state, 0) = *f;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
-	}
 
 	/*
 	  FIXME: translate and round width/height into EMPRESS
-- 
2.39.2


