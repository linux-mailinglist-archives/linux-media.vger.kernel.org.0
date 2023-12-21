Return-Path: <linux-media+bounces-2869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCEE81B935
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 15:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E421D1F275D0
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 14:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DC35991A;
	Thu, 21 Dec 2023 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k87a60cv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47C59904
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703167110; x=1734703110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7sQm8GXsfgMjSQlquFKtXNWY4u/EA4nNdj1qVw0vs+M=;
  b=k87a60cvubes8d/O2TvY++p15sqpbZAlsB30b6giVmZ/SXM5ShlyQ0Uk
   HfeJvSBOJlXXBjuA7tOv/ItytTEL8CvECI2EFw2TEejPb0Ijq3tsU2gZB
   VgRzHoT29kvT8xtuqF4AfnqI2cDbMD9OZJdskUlaCJ+ByOfGwFfInzM9R
   XQ8WxnIrJ4EvEkBo7QjZpgeOfjhInBcH+rZe/vxAORn2TiloRYrJdjFAd
   /RDWpGHnwKLFO+91NJXvLEWroU7orXPsnwPngzlYE68vuV6QRHWkbqbBW
   Z5LISzhKRJcZOzHESm6xNcDPrvbpfoC7XcZHnEDtwqE5DsIjOSOG3E0ik
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="460312132"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="460312132"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1108108413"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1108108413"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:58:27 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3BE3120A19;
	Thu, 21 Dec 2023 15:58:24 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH 3/3] media: mc: Drop useless debug print on file handle release
Date: Thu, 21 Dec 2023 15:58:22 +0200
Message-Id: <20231221135822.152448-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
References: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a debug print in media_release(), which is a release callback for a
file handle. Printing a debug message here is simply not necessary.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 680fbb3a9340..9c8fe9335dc1 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -190,7 +190,6 @@ static int media_release(struct inode *inode, struct file *filp)
 	   return value is ignored. */
 	put_device(&devnode->dev);
 
-	pr_debug("%s: Media Release\n", __func__);
 	return 0;
 }
 
-- 
2.39.2


