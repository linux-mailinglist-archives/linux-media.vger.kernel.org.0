Return-Path: <linux-media+bounces-1368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6677FD91A
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C158B282FE5
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93AF30CF3;
	Wed, 29 Nov 2023 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhNXMlqQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1D3AF
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701267429; x=1732803429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+hzlAvZP15+xkly/jgHoiRc47unqpM2G5Hg0gUNNYw=;
  b=IhNXMlqQrNYc/3lIOeEYa7JpO2a10bJJOc92KiM7mAIsXcge8TqhTTyd
   Qmzfumjy5xt02ZqIS8GPR5Ky3DkF5fz/9ajZWngt8DJ2XuMqOJWXE8vFG
   w/FYLForPlX2mPIYRT8HDj7d7lS4uchPCUBbiLe/H9/tW5AXASoEo4xgI
   XrzOERTWGWFbs98Z+Bh126Xw4IaZwSsaoSyDAzUqMUKOgkTZQvoWAZtEU
   nX8ktL26pO6WQU8A+QIp17AevWF3rsecZqg8H5wvw5ii/Mr7qAO8q/QxI
   L4e2rzZunkHqEqLMthdvBt6XQQBVD/7qknXbW4tbNc6yAJ4XnSP8Dis8y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="153861"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="153861"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912868300"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912868300"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:15:50 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1722312019F;
	Wed, 29 Nov 2023 16:15:47 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 1/2] media: vivid: Don't explicitly set bus_info
Date: Wed, 29 Nov 2023 16:15:44 +0200
Message-Id: <20231129141545.87461-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231129141545.87461-1-sakari.ailus@linux.intel.com>
References: <20231129141545.87461-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus_info field in both struct media_device and struct v4l2_capability
is assigned by the framework for platform devices. Do not set it in the
driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 353f035fcd19..fdd070876a6d 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -239,8 +239,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 
 	strscpy(cap->driver, "vivid", sizeof(cap->driver));
 	strscpy(cap->card, "vivid", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s-%03d", VIVID_MODULE_NAME, dev->inst);
 
 	cap->capabilities = dev->vid_cap_caps | dev->vid_out_caps |
 		dev->vbi_cap_caps | dev->vbi_out_caps |
@@ -1762,8 +1760,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 
 	/* Initialize media device */
 	strscpy(dev->mdev.model, VIVID_MODULE_NAME, sizeof(dev->mdev.model));
-	snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info),
-		 "platform:%s-%03d", VIVID_MODULE_NAME, inst);
 	dev->mdev.dev = &pdev->dev;
 	media_device_init(&dev->mdev);
 	dev->mdev.ops = &vivid_media_ops;
-- 
2.39.2


