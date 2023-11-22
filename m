Return-Path: <linux-media+bounces-758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728F7F4176
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C695D1C20937
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3547D1D523;
	Wed, 22 Nov 2023 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dITogRhL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 632FB9E
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700644896; x=1732180896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=79zhsmHbC9L3HZltzeo7ojFHA8HLIlDMuLcMtCwD4ZI=;
  b=dITogRhL4fmXm2z7aDQwp91UCrk5feuAXLfPehT8ZaiesHQCTXhlMsUH
   45ExMLP/STHALSsHOg7UBF8jLzJZg8y7k34WvPBs9+kECx4XUDvzPXi2k
   Y3SkNMLKVrl4XO1FncqW0tQe5BnNxXdqxyqIAzCnF5FTsbvWjHCa+AG7R
   IXkCEW6VkHAVfqIeP7D7fBXYSAKrbF7rozqojqnrmYD6cssGDosPJFWIq
   kLTstVvNPDQuopK9o+z7O6nQ5MFbb85LN8Qkdu2yxB/kQ1Gga4HXqxta1
   YXUW6VE0oaAxHXgqWrsMvTaZdsehzFe8Su+6+BQVoXGVoHo1ygUuxBBnO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372193662"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="372193662"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 01:21:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910729322"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="910729322"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 01:21:34 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 2/4] media: ov01a10: Enable runtime PM before registering async sub-device
Date: Wed, 22 Nov 2023 17:30:41 +0800
Message-ID: <20231122093043.233148-3-bingbu.cao@intel.com>
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

It also sets the runtime PM status to active as the sensor was turned
on by i2c-core.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov01a10.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 2b9e1b3a3bf4..9afe9bf50334 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -907,6 +907,7 @@ static void ov01a10_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 }
 
 static int ov01a10_probe(struct i2c_client *client)
@@ -953,17 +954,26 @@ static int ov01a10_probe(struct i2c_client *client)
 		goto err_media_entity_cleanup;
 	}
 
+	/*
+	 * Device is already turned on by i2c-core with ACPI domain PM.
+	 * Enable runtime PM and turn off the device.
+	 */
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
 	ret = v4l2_async_register_subdev_sensor(&ov01a10->sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		goto err_media_entity_cleanup;
+		goto err_pm_disable;
 	}
 
-	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
-
 	return 0;
 
+err_pm_disable:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(&client->dev);
+
 err_media_entity_cleanup:
 	media_entity_cleanup(&ov01a10->sd.entity);
 
-- 
2.42.0


