Return-Path: <linux-media+bounces-1369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD547FD91B
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0DF51C209F9
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26833033E;
	Wed, 29 Nov 2023 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjISo2Wy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB58B9
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701267429; x=1732803429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OvxHvUJPgZ+ALjVFjaBg94gLjkeSFSbPJFHcWbKUQr0=;
  b=YjISo2WysJM0oaUOHJvRGIwLGRps5ogGG4CJOFsF6WTKsaDCuOaYNJQe
   fCq+cVdw5waPyxiJSd8U9uv6CNQXau8V458SdK6914FtBl9/r6jif+SVT
   Tm+DB4Wok6HkxbG9mOksyICr8gKVugGhaE8UToBy5wLDHPi+grNr9by87
   7OA+TGrn0IIqhfsJcfHmGrdJ9W7QtD04tn8b7p0Wzvz7TMySjBd236UxO
   /6MYirJsdjgj7J+tVD2MkEWJviEKe2LUAL7ZBQZZJiLbBqraqrrfsReOx
   oc9p/ngVrx6qRBU0pg2la0RW1+rIvUjRT7RgwBVY5DeS27XJ6itUAP33v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="153864"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="153864"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912868324"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912868324"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:15:50 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E0767120945;
	Wed, 29 Nov 2023 16:15:47 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/2] media: vimc: Don't explicitly set bus_info
Date: Wed, 29 Nov 2023 16:15:45 +0200
Message-Id: <20231129141545.87461-3-sakari.ailus@linux.intel.com>
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

The platform device name is already set by V4L2 and MC frameworks for
media device bus_info and V4L2 querycap bus_info fields. Don't do it in
the driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 2 --
 drivers/media/test-drivers/vimc/vimc-core.c    | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index aa944270e716..1e7cc7c980f9 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -57,8 +57,6 @@ static int vimc_capture_querycap(struct file *file, void *priv,
 {
 	strscpy(cap->driver, VIMC_PDEV_NAME, sizeof(cap->driver));
 	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", VIMC_PDEV_NAME);
 
 	return 0;
 }
diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index af127476e920..2a924abd0ebc 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -366,8 +366,6 @@ static int vimc_probe(struct platform_device *pdev)
 	/* Initialize media device */
 	strscpy(vimc->mdev.model, VIMC_MDEV_MODEL_NAME,
 		sizeof(vimc->mdev.model));
-	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
-		 "platform:%s", VIMC_PDEV_NAME);
 	vimc->mdev.dev = &pdev->dev;
 	media_device_init(&vimc->mdev);
 
-- 
2.39.2


