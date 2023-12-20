Return-Path: <linux-media+bounces-2780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BBE819CFB
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22C431C2277A
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E25C21A04;
	Wed, 20 Dec 2023 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Im1EPPMx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837772136E
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068650; x=1734604650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bNPcGQWQiPdDPUXvLZG+GLaS8C7SWTIVIHJbLUbtkHo=;
  b=Im1EPPMx40+tk/2aHVMgPHuLMQiA9cuwiO2oTSJAANMbyLmGh3jHelE6
   cdqoQCgb3X/WvXEHgPnratqmIncfDsJjq8ooQTzr378nAg8LktMK+pwZ2
   0EG1jU5ee2NzRs6akUfXCfgyTXOtmPT7579hwD0lCUBaKSJRtMHdkJa/a
   n2cJi4P77kzDD88kjGjVn8Chf60iR0r+j7YIeLkkMZi4oFHV5CaLij6Iw
   8bdXm3gdK44w7DBN1swY9Mt0OC3GaxR1cFUtn1maF33HKM7tItyWcZAyw
   ER1ZACurUGYEBIxr0/Orz1AlgQqfCUHXT0Uds7xrg/JHs6YB1GOSVNwYI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174372"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174372"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544270"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544270"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:28 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3185E120706;
	Wed, 20 Dec 2023 12:37:26 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 19/29] media: omap3isp: Release the isp device struct by media device callback
Date: Wed, 20 Dec 2023 12:37:03 +0200
Message-Id: <20231220103713.113386-20-sakari.ailus@linux.intel.com>
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

Use the media device release callback to release the isp device's data
structure. This approach has the benefit of not releasing memory which may
still be accessed through open file handles whilst the isp driver is being
unbound.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/ti/omap3isp/isp.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 1cda23244c7b..ef6a781d6da1 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -649,8 +649,11 @@ static irqreturn_t isp_isr(int irq, void *_isp)
 	return IRQ_HANDLED;
 }
 
+static void isp_release(struct media_device *mdev);
+
 static const struct media_device_ops isp_media_ops = {
 	.link_notify = v4l2_pipeline_link_notify,
+	.release = isp_release,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1607,7 +1610,6 @@ static void isp_unregister_entities(struct isp_device *isp)
 	omap3isp_stat_unregister_entities(&isp->isp_hist);
 
 	v4l2_device_unregister(&isp->v4l2_dev);
-	media_device_cleanup(&isp->media_dev);
 }
 
 static int isp_link_entity(
@@ -1955,6 +1957,19 @@ static void isp_detach_iommu(struct isp_device *isp)
 #endif
 }
 
+static void isp_release(struct media_device *mdev)
+{
+	struct isp_device *isp =
+		container_of(mdev, struct isp_device, media_dev);
+
+	isp_cleanup_modules(isp);
+
+	media_entity_enum_cleanup(&isp->crashed);
+	v4l2_async_nf_cleanup(&isp->notifier);
+
+	kfree(isp);
+}
+
 static int isp_attach_iommu(struct isp_device *isp)
 {
 #ifdef CONFIG_ARM_DMA_USE_IOMMU
@@ -2004,16 +2019,15 @@ static void isp_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
 	isp_unregister_entities(isp);
-	isp_cleanup_modules(isp);
+
 	isp_xclk_cleanup(isp);
 
 	__omap3isp_get(isp, false);
 	isp_detach_iommu(isp);
 	__omap3isp_put(isp, false);
 
-	media_entity_enum_cleanup(&isp->crashed);
-
-	kfree(isp);
+	/* May release isp immediately */
+	media_device_put(&isp->media_dev);
 }
 
 enum isp_of_phy {
-- 
2.39.2


