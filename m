Return-Path: <linux-media+bounces-12833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A0901ED7
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D2751F26A86
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5EA78B4E;
	Mon, 10 Jun 2024 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WunF74uw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4A678C7A
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013954; cv=none; b=haehEQUfeNR5iMGRu7HhFFF3DQDJiw8DUCCISGH5mLgtO5ZpskASsgFbtJsQ8zKe9yaEhi33YF3zaSal2xhkQ4j30tqJ/u/3ebTQAtYjWI/13PF+WMHbCB54U4zkeSv7jAveiSk2swyqRMDx1c9kKvzgFp29cC2fa5xa+EtW3ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013954; c=relaxed/simple;
	bh=TKR1odmfIubdY4xEWjZh17liN+dbJy2GC6GvZT/yQT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=He5xdgHQozPWyTgPPVb3P0c2oIi7rh/MhoSZGW23lLd2ztNd3gM1BkZkx6nD2yZkIMNDlKHmEt029sCLpunfRxFAwRcQVA8L+4wgCi7FJJpLNrplDeQNdUGsqTIJBS61U1Nqi6rUcWm7n2n66/NFPq9BR1psSwDIz6tVrP77hdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WunF74uw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013954; x=1749549954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TKR1odmfIubdY4xEWjZh17liN+dbJy2GC6GvZT/yQT8=;
  b=WunF74uw2WMLAaDzEOvEDxWp4goMgPdzzSA9LH045QSfH3e1PSe6iW/J
   Vm54OkxEeO8xq7ZaEmjRpdthfvF0YNirXE25t8B6I+HaMbO/qf1BUwYOo
   yJpb7mukLogQmPJJEMaz06FwoFpJKs236NXkzlS8zma6pWK2NJM8JPBji
   DqHV+FpjJRZA8Mq+g2kc/EmAgXdUfCDAEnr2hgXCiL6//ARP/qvdQJd4x
   iUu2PqAup6WDBFKN+W1I/Sz6aXW4jlI7w6Pnta59gen8TxDG/X97I3j4l
   P9TYLFQPguBwgu96ABDXIduDjPEM7y1c/L6kJcLK3y4S0hQpBwyhYZR+m
   w==;
X-CSE-ConnectionGUID: YhFDgSt9S4u7ga2pY+o9cw==
X-CSE-MsgGUID: Kzsm06BHTxiU04fNQt2baw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819916"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
X-CSE-ConnectionGUID: edNiaai9TFqlQ89EdfDuXQ==
X-CSE-MsgGUID: 57ecsFn3QW2/jQ4x8hYKgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137345"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0D59B120AD4;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eD7-05;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 10/26] media: mc: Clear minor number reservation at unregistration time
Date: Mon, 10 Jun 2024 13:05:14 +0300
Message-Id: <20240610100530.1107771-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clear the media device's minor number reservation at unregister time as
there's no need to keep it reserved for longer. This makes it possible to
reserve the same minor right after unregistration.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 38c472498f9e..f7ecabe469a4 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -49,13 +49,6 @@ static void media_devnode_release(struct device *cd)
 {
 	struct media_devnode *devnode = to_media_devnode(cd);
 
-	mutex_lock(&media_devnode_lock);
-
-	/* Mark device node number as free */
-	clear_bit(devnode->minor, media_devnode_nums);
-
-	mutex_unlock(&media_devnode_lock);
-
 	/* Release media_devnode and perform other cleanups as needed. */
 	if (devnode->release)
 		devnode->release(devnode);
@@ -268,6 +261,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
 
 	cdev_del(&devnode->cdev);
 	device_unregister(&devnode->dev);
+
+	mutex_lock(&media_devnode_lock);
+	clear_bit(devnode->minor, media_devnode_nums);
+	mutex_unlock(&media_devnode_lock);
 }
 
 /*
-- 
2.39.2


