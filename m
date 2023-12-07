Return-Path: <linux-media+bounces-1829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C35FC80875F
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECDF11C21F9F
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC63D39AEF;
	Thu,  7 Dec 2023 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihIBirnW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D5410D0
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950962; x=1733486962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DXBEbzyL7p6PpuTnXRJbCmBTKP+z+AGNkitoxS6Bwtc=;
  b=ihIBirnWT6CpKhxNzrry6aAJ3LiHKmUTHm39tb2tshXmkEHXB7ogukkd
   W/xd+6tavNf1EZUMoKP5fUXYjKAB3BkbDDD1vz7PBqqxes1dYnrv6nYVH
   11rgu02IMY8+0NWvWZ/L0tGk1zPwP/+O8K9p9ZQBEDnmy4pGoFZ9AIwEA
   7sjnZUrbzxrckfdbN+Jn+msqbfeT4eHIRrGKpxKEEkGFmf1O+g7Dvquk0
   DZSCOILC0EzzwAqW8A0F6eNLWytJwL7Q5CQKpw0DPELruQd1nRKnVSJ9R
   HHGegZKEI2Vmua3KyDOISj4AWSw/asYrH3kXdg8VVBk484Imz1PlrEREe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373707167"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373707167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19684506"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:20 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 685D8120F14;
	Thu,  7 Dec 2023 14:09:17 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: [PATCH 6/6] media: ov9640: Don't set format in sub-device state
Date: Thu,  7 Dec 2023 14:09:12 +0200
Message-Id: <20231207120912.270716-7-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ov9640.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index b0c171fe75bc..e9a52a8a9dc0 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -547,8 +547,6 @@ static int ov9640_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ov9640_s_fmt(sd, mf);
 
-	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
-
 	return 0;
 }
 
-- 
2.39.2


