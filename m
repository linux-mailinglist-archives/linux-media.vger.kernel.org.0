Return-Path: <linux-media+bounces-757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D7C7F4175
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1796B20C86
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3462521A11;
	Wed, 22 Nov 2023 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQS75R62"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id A5C399D
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700644894; x=1732180894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qgc0zFCrWOpbv//UwNwruOdvEFMg+Or2TsGVXoF3+p0=;
  b=dQS75R62j/VYyirz/FblHEJoNM/iGYhmS++bBYdDCbVrqt9R67Cy+iVF
   icVSWOAbBbi+oNtYQ8lB+GdAkDBGwlC889g71o1Vu9S4MnLKykEb0JK3+
   I1t2VWwfEBeUNHi7a2Bn7zb19fPS2ixAW7OKi3RC4QX5Iyjf99i6sY+iM
   3nIvyykpp6t2+RCw8dRoG0zHrxLXmiX72QPOtnSj7iT4QXxfJpeFJa89Y
   +5U79QRr55ySoOn21XXwSLnlrHl2dYdd2gUBhZ8IZKNSXQGFU7apiklQd
   stvBYitRvmKzBIfFbU55xmgBHHR//2VKqY6D1Bs8t6wHF90XeoReVLDoT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372193658"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="372193658"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 01:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910729317"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="910729317"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 01:21:32 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 1/4] media: imx355: Enable runtime PM before registering async sub-device
Date: Wed, 22 Nov 2023 17:30:40 +0800
Message-ID: <20231122093043.233148-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122093043.233148-1-bingbu.cao@intel.com>
References: <20231122093043.233148-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

As the sensor device maybe accessible right after its async sub-device is
registered, such as ipu-bridge will try to power up sensor by sensor's client
device's runtime PM from the async notifier callback, if runtime PM is not
enabled, it will fail.

So runtime PM should be ready before its async sub-device is registered
and accessible by others.

Fixes: df0b5c4a7ddd ("media: add imx355 camera sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/imx355.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9c79ae8dc842..059a41b7eefc 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1788,10 +1788,6 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
-	if (ret < 0)
-		goto error_media_entity;
-
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
@@ -1800,9 +1796,15 @@ static int imx355_probe(struct i2c_client *client)
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
+	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
+	if (ret < 0)
+		goto error_media_entity_runtime_pm;
+
 	return 0;
 
-error_media_entity:
+error_media_entity_runtime_pm:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
-- 
2.42.0


