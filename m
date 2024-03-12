Return-Path: <linux-media+bounces-6886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD88887922B
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 976BB282762
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E23358ADB;
	Tue, 12 Mar 2024 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTKV9n+n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8060979B76
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239681; cv=none; b=jHz7Wzd1V/SK0CqBW85SO3UTT0aVoof9mN1fQKD7fkHQDp5VjV+zGkv/au3F8aoD9bwy59ql0wDf9eNitVZP5EJ1tmso7Xljka6lrCkgQXcCdzrxx80pbcH2IhRDqKhKiky7pUSo/iWwJkWz21ebG8cdHQxuu+5Z2/v6gLCUJtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239681; c=relaxed/simple;
	bh=bNPcGQWQiPdDPUXvLZG+GLaS8C7SWTIVIHJbLUbtkHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LdlRte56yXMJ3ZtxWJ9omFAgihO9bRxfwLXC33U0NOJt39pnN20YzHX8JfIgCs/nQ7+IEUjgoqUV6ZhAehQ9uA6QUfx58GdPdrog0BlWJ7OlthWIToFDJQrDOKlu43UqxqTTvL05M8d6lUPufFTlCndj5QZQ5bItE7cDl9Njuoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTKV9n+n; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239680; x=1741775680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bNPcGQWQiPdDPUXvLZG+GLaS8C7SWTIVIHJbLUbtkHo=;
  b=jTKV9n+nr5OGGBH6reTmPhljfYl9K1eWGJUSY15XNfQ3V9Pdnc5ozUmm
   9pCo754aKDWYs+5cm0htRdtbFezUTK+MdOdw3lxCV0TU6r+wVvcJA53Cr
   sAP4VRNzPKhQNKatgZUUSFZwahmQHtSeH3M2ZitqV6xuMbL87IzwE0cKn
   minIAosG5RBtBn7MQFuKqf2eJ/OPUIk9EMNfhRLHQpLgsaR9uj1Nnn6pP
   NGnyw5xnPEkHBzM4Eglof5s/ITVuPo0wJ/UN+R/z9VmV4trf/ygXxQkoM
   qPFxpI0ISM9ctGpdUyklwJN4C9fehps6pBcOZneP2pzhNi/UqYNoW3hrA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794322"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794322"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194099"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B9F111201F7;
	Tue, 12 Mar 2024 12:34:34 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 17/26] media: omap3isp: Release the isp device struct by media device callback
Date: Tue, 12 Mar 2024 12:34:13 +0200
Message-Id: <20240312103422.216484-18-sakari.ailus@linux.intel.com>
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


