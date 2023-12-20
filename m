Return-Path: <linux-media+bounces-2784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65447819CFF
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBD4EB22565
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B50E219EF;
	Wed, 20 Dec 2023 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HI98N/Yv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559E208C9
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068652; x=1734604652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4vQ1P4LGqxbJ7uxsk6Jqsh18rVWDSKFSxKOC9Nf9ryM=;
  b=HI98N/YvWPaOa9C+P6JpTbs4iASLPFA0kd0WTBX+TF5c3DBCqF6n9s/M
   GfQ4KQHBbyikDH6wDjm9AqY9ci3LbyG3kgqABfpDMwFe1Np1mrpLIIr/T
   ihjRMJOq14HOEr39vxH+AeXbP0AA17lFvg/CfSJ0GAkgikp22mmK1J5DE
   qtdu6DdeNZo9Bv3G+S1SfDiqbs5Mm3/fdAMrYO5FHLzw55TmR6qWILN2G
   lKh6hpcm8GgLtsVWyIIELoB2clwGRI8rKEOe2be+8dFJ12oqbnuytK8VP
   KyD/Lp+7CxtpX60HblJ5efM3ID/yO5U5Y3Us3s8ufqls0RNCozBglwfKf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174392"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544274"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544274"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:31 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7922D11FC49;
	Wed, 20 Dec 2023 12:37:28 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 23/29] media: vimc: Release resources on media device release
Date: Wed, 20 Dec 2023 12:37:07 +0200
Message-Id: <20231220103713.113386-24-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release all the resources when the media device is related, moving away
form the struct v4l2_device used for that purpose.

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


