Return-Path: <linux-media+bounces-12840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08939901EDE
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62B9EB25D99
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED377D41D;
	Mon, 10 Jun 2024 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0bM04E6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9CD7C6C1
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013958; cv=none; b=Pr6vy+IKoHlT3ZriSj2+fV9ljC2S7jDF1u0f3y1c+xPQNLG7P77FbB/jdAXKoyKdxUSX1NJnmK4mVUQYaBDcK83RgLgGCDocluTfNgRcX2O0sWziHa+IaTbbIyr2RTO2dgehoOCKlmnxXDXYlTXsD+zD8g6o3Y0OJpOfqHgOcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013958; c=relaxed/simple;
	bh=2tyAai26nLN8u8EDB9NaHtVxjgtk5t5o2YRGgtIePgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dKz3nm/7EFFifMzn0xxB88XnSMXMgrwXYZaHPk/2pD01BRF2GwkhHJS2J9jvuJJASvq/FkNuUKM/CqtZPIq9NoIKQ+XvuDcM52/FDcevYdZGnqURRN5xGdsgEmttzqoN6i+fADWmBXWmWdynI+o0bSWgHS0rEnJw/9s9DPiCVD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0bM04E6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013958; x=1749549958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2tyAai26nLN8u8EDB9NaHtVxjgtk5t5o2YRGgtIePgc=;
  b=O0bM04E63psuDmUeLc/cdD/p7+V0C9ouEXPme45Q2D1nKL93XRzby7xl
   abS1CBIWrk740yQ+6ViCU/2syYskI+ZHIi9CFiqZ2x9DViowltHFspH6g
   RnFDNmpCfcGj543mv4+/yqOLs4Ss9dLIewIkAf10jDbpgYAuHG1j8mTz3
   5xJMTmvglA32g3yKGlbpLs3cIiPUT1GSbS4IZXWrjToBoxte1419qXSBF
   TSKxRdgJc2cVMe4ShJKjdBPNz0/PeD3+jTg0UifaRZbifualBnfu+WiWg
   w0XhRSJ+asnGoymXtxYnWVk8wKiFIMzddsch86acesCJtl0aQxpNsSBPI
   g==;
X-CSE-ConnectionGUID: 3qMorvQ/TMC09oLdR/lnAQ==
X-CSE-MsgGUID: cbRIcqibRTKTGlwFMESqfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819944"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:52 -0700
X-CSE-ConnectionGUID: iWIjujX1QK68wSRZwuBhJg==
X-CSE-MsgGUID: efbTXqu4S5S54N7ei8Xdow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137360"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 31C1A120BC9;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDg-0b;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 17/26] media: omap3isp: Release the isp device struct by media device callback
Date: Mon, 10 Jun 2024 13:05:21 +0300
Message-Id: <20240610100530.1107771-18-sakari.ailus@linux.intel.com>
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

Use the media device release callback to release the isp device's data
structure. This approach has the benefit of not releasing memory which may
still be accessed through open file handles whilst the isp driver is being
unbound.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/ti/omap3isp/isp.c | 25 ++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 1cda23244c7b..b63b750452b1 100644
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
@@ -2002,18 +2017,16 @@ static void isp_remove(struct platform_device *pdev)
 	struct isp_device *isp = platform_get_drvdata(pdev);
 
 	v4l2_async_nf_unregister(&isp->notifier);
-	v4l2_async_nf_cleanup(&isp->notifier);
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


