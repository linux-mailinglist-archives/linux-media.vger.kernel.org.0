Return-Path: <linux-media+bounces-6888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33987922D
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F6E3B223A1
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B45535F18;
	Tue, 12 Mar 2024 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hktqlkrz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ECF79DA2
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239681; cv=none; b=gMcKdQwatPzZ6j+2NPdgANDdtDgr5FOiFd+0jJpXD0cl2HgTMRDeqR1SVRTzMhic+Iium1Awa5vT1pLaxy0uBYycyoO2ww1O4nIwH2S9xne4HhhBL7JrxPs1HW2+LeifA6UnIozusRuBBCBO0kdj7LC2och3PPSDotplNnxtQVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239681; c=relaxed/simple;
	bh=+rG7vchsA0u3MasKBPPJoNX+GZxQlI7TKYCl1XWjqSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nAmKhmRtX2/S5p+ZWX2WbbSfAdrKc+NG72yD5SFvIZxtZVtFx/CKnpAYkclBOTGqOEYEegZJwqvoVMW02OvjIQJneICzGvYz8+6uN8k0uw06Vc06P4So7sX7zoGyld0hRmbZyJrVo9u/bDDbXiJrf3EhKkIiJ6get0hu9GofSdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hktqlkrz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239681; x=1741775681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+rG7vchsA0u3MasKBPPJoNX+GZxQlI7TKYCl1XWjqSk=;
  b=hktqlkrzhOCRSBfnNpIeulWdcYQ0xFiMcqPQAGZpEphqvbGAzBfBqJ7O
   +8UtiV83iiFW1LSuzIHo0ZgjXp6yijjDekLEoOgjDANvgXz2MR3uVMU4c
   kkwpjxrEkhYU9ZpnM5FM29jksu8XBHCYXKZwvs+KHrzpA+GM8s7Lm1JZ+
   l9JVA9rKLIdIG55AfRJdNQQMJ4yWy46JUROztlcdPP/wHNGJPWlh//8Rf
   xREF2UQeRb/jZ8RY3Hhxmv/PrXV216SEhDF0QGBcDjyv4PsiujTBWRwb2
   z4jiOi4NTuIWd2YJfiWTjb64T4ynNWn/vDhQFKwpeK4bvIsbXgikM+kkw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794328"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794328"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194104"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:39 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E0C3F11F819;
	Tue, 12 Mar 2024 12:34:35 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 19/26] media: vimc: Release resources on media device release
Date: Tue, 12 Mar 2024 12:34:15 +0200
Message-Id: <20240312103422.216484-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
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


