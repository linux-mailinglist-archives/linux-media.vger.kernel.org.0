Return-Path: <linux-media+bounces-12826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA3901ECF
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3079A1F2668A
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2040E77F2F;
	Mon, 10 Jun 2024 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icb3FSLw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD60770F4
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013950; cv=none; b=Y6n9P5exBIwW9EO4W1acBBbptxRfxYRGfietRns+mBoBTHqLaw0ThIpnxrfBGTsC4V/BYpYG2WMaBrc1qoY+WG30EeTO8JWiut+VIgfb1t42fm/Kp2TE6+ZyJS9+FlP9TcxoFY9cLvlgW8Wy9IV8gjy/I4kWn5lKF0SIfau5xS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013950; c=relaxed/simple;
	bh=BCV4Q0jxmi4NLkGyKEPc+e1Rh62tXpkYRWDOjDRVNUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oLwXMWz88aQjsCfsztt5kYRSzZRMGZtgs1Ru42MTx04PDZsUmP3Xj3j7lVWaduo9SX6NTl5Pyyfmcoa2Uab+J258RH23wEN9/bzwZ3G65MbFyfU4STyjYOT/eRrjLZ7K0/R52kbAShoZHixPMoYi5Ri8Whv5fMMxOhuOmGqGdqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icb3FSLw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013950; x=1749549950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BCV4Q0jxmi4NLkGyKEPc+e1Rh62tXpkYRWDOjDRVNUE=;
  b=icb3FSLw/osKuxAeQlG100XD2H9AjNHOPx/Uu36JAwmmz5S6Ml5cgU5P
   mlsTYmXpc/CPlGIZWJlRlofKMmyJpgFPu+CYQlaacH17/SnBNs4q9SN48
   gsUWmUk49fpXfjsmQST7v8ExUeFMghtnHJi2TACn0YufdvIsqSgAzgqlj
   O1N7P0mSAI2yyIr5quA0wHe45xfln0L0ElsEMvML8b66WXpxymH0MV9JO
   idE8GnkG/KjzkSQX8mbALMLwybKyc1nnkZXmaO5DPwobE1ZIRnJWmP9Bd
   CdqyXpfuKutpLuxsovt0O/gdWa4Z8XVoLXniSzE4y75ikhQcQyPzqHfDW
   A==;
X-CSE-ConnectionGUID: jfgGeiKtRM60t7GwdgO+Lg==
X-CSE-MsgGUID: FAbOiHO8T3O+RtgDYvSE0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819893"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:49 -0700
X-CSE-ConnectionGUID: kCqaEt1nTLiRy3ksETWNvA==
X-CSE-MsgGUID: TFKCdhFiQQqM65pOe1YsvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137341"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E6EA312073B;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCn-30;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 06/26] media: mc: Drop nop release callback
Date: Mon, 10 Jun 2024 13:05:10 +0300
Message-Id: <20240610100530.1107771-7-sakari.ailus@linux.intel.com>
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

The release callback is only used to print a debug message. Drop it. (It
will be re-introduced later in a different form.)

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/mc/mc-device.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index d4553a3705f5..c0ea08a8fc31 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -566,11 +566,6 @@ static DEVICE_ATTR_RO(model);
  * Registration/unregistration
  */
 
-static void media_device_release(struct media_devnode *devnode)
-{
-	dev_dbg(devnode->parent, "Media device released\n");
-}
-
 static void __media_device_unregister_entity(struct media_entity *entity)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
@@ -718,7 +713,6 @@ int __must_check __media_device_register(struct media_device *mdev,
 	/* Register the device node. */
 	mdev->devnode.fops = &media_device_fops;
 	mdev->devnode.parent = mdev->dev;
-	mdev->devnode.release = media_device_release;
 
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
-- 
2.39.2


