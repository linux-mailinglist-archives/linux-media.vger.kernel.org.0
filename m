Return-Path: <linux-media+bounces-12841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A045F901EDF
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38DED280D79
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DA175813;
	Mon, 10 Jun 2024 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSbV51Qq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CD7CF16
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013959; cv=none; b=VNvhXjOFSkQaapC2ijmuwAWWWSUoFdW361AHXnFCabIPelWlCzyCl1KqiYqh8afDXOuwy7WbRn6lVBk01U68UyL2viZsQAQBj5iJCC0a4z7Y8GXpWyzXgXvul9CqUpmiV6gC0bKcS8pn+wwkpI2BzQi7uqpsmvLX6BJL+DOD3zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013959; c=relaxed/simple;
	bh=+rG7vchsA0u3MasKBPPJoNX+GZxQlI7TKYCl1XWjqSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nB3lex/MhCGsSsTBcykbzHeG5snqKkUYkiCCtJ0BRn6QSOuApgR3lPo0d0dzyC2tU8pUr74jdYpJw+Nur45mpIO8WY/J6sbplrk8s3HbBj7fgCzXgvWrlMbUomIpkYGF8rAysz2jbQUDxtvDV0h3V54awD0YhlUBM7iq2Enhtks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSbV51Qq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013958; x=1749549958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+rG7vchsA0u3MasKBPPJoNX+GZxQlI7TKYCl1XWjqSk=;
  b=NSbV51Qq8lNs30XmsCFkp+WVTXPLr30OAiWeDuieaOrsQ4FHqZDCCq8d
   tIvHI0royZ6Lur6hHuGwKp3REYyCzFthDiIUUTiZqexvG1uxW0uEWFpKY
   a0INQy02xNkE2GaAyNc9rWNzTEE7Lryv1ovjTlqlGhThx0xFacylWB4B0
   qx/X1clOGb1QREp5tPk+SgfqQ7cxXvGIxgSGIv1iH4wjRurIXY+s19q2f
   B27+d/ZhZbCyEWP+KBY8NvWYJLQ09ChEbCZ2Eygn9gXlwjtjSzBEI7lIf
   fzV92hEnOOeOo3MOetn9cVNSr//Gv8K8CJvmTYXQLG4tug1bbJF/GeRIc
   Q==;
X-CSE-ConnectionGUID: 0Gs7KIDyRQauh+c8sQy0vA==
X-CSE-MsgGUID: nh9UCBDERPCu77XcSESTOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819938"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819938"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:52 -0700
X-CSE-ConnectionGUID: VPT1G7l/TQmJcCWPUhnvZA==
X-CSE-MsgGUID: wmEsBFFrQFCzZeUFtbND+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137358"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3DE25120BD7;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDq-0j;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 19/26] media: vimc: Release resources on media device release
Date: Mon, 10 Jun 2024 13:05:23 +0300
Message-Id: <20240610100530.1107771-20-sakari.ailus@linux.intel.com>
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

Release all the resources when the media device is released, moving away
from the struct v4l2_device used for that purpose. This is done to
exemplify the use of the media device's release callback.

Switch to container_of_const(), too, while we're changing the code anyway.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/test-drivers/vimc/vimc-core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index af127476e920..3e59f8c256c7 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -264,13 +264,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
 	return 0;
 }
 
-static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
+static void vimc_mdev_release(struct media_device *mdev)
 {
 	struct vimc_device *vimc =
-		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
+		container_of_const(mdev, struct vimc_device, mdev);
 
 	vimc_release_subdevs(vimc);
-	media_device_cleanup(&vimc->mdev);
 	kfree(vimc->ent_devs);
 	kfree(vimc);
 }
@@ -336,6 +335,10 @@ static int vimc_register_devices(struct vimc_device *vimc)
 	return ret;
 }
 
+static const struct media_device_ops vimc_mdev_ops = {
+	.release = vimc_mdev_release,
+};
+
 static int vimc_probe(struct platform_device *pdev)
 {
 	const struct font_desc *font = find_font("VGA8x16");
@@ -369,12 +372,12 @@ static int vimc_probe(struct platform_device *pdev)
 	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
 		 "platform:%s", VIMC_PDEV_NAME);
 	vimc->mdev.dev = &pdev->dev;
+	vimc->mdev.ops = &vimc_mdev_ops;
 	media_device_init(&vimc->mdev);
 
 	ret = vimc_register_devices(vimc);
 	if (ret) {
-		media_device_cleanup(&vimc->mdev);
-		kfree(vimc);
+		media_device_put(&vimc->mdev);
 		return ret;
 	}
 	/*
@@ -382,7 +385,6 @@ static int vimc_probe(struct platform_device *pdev)
 	 * if the registration fails, we release directly from probe
 	 */
 
-	vimc->v4l2_dev.release = vimc_v4l2_dev_release;
 	platform_set_drvdata(pdev, vimc);
 	return 0;
 }
@@ -397,6 +399,7 @@ static void vimc_remove(struct platform_device *pdev)
 	media_device_unregister(&vimc->mdev);
 	v4l2_device_unregister(&vimc->v4l2_dev);
 	v4l2_device_put(&vimc->v4l2_dev);
+	media_device_put(&vimc->mdev);
 }
 
 static void vimc_dev_release(struct device *dev)
-- 
2.39.2


