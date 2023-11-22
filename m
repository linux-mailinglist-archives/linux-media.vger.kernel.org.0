Return-Path: <linux-media+bounces-764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E47F41C8
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98B8A28187D
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483F454BC3;
	Wed, 22 Nov 2023 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IR4rhbyb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BA783
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700645825; x=1732181825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XRS24Ja4VnKO3GJU+BM08/bUa46FNU+0BqJpOoQxSAc=;
  b=IR4rhbyb8TZ+SHY254iIp8JfNs5W++9qAed73uctXPvXoc8vCwFPjgUr
   fETAye8DqnNojtJSeyFOa9vzNMD3mNgvahix8GN2zU1OX1P+O3/n1jF1V
   dUTuEi6SELw8kNg4JNnJp5Lggt6qJOq+9WnrdVlZ/otHZMaOnYFjmXj9o
   +VJymEumcnurKVIsJh49F3vFPg3ANok+a//bo7jEr3b1pRvK7E2fP+9i9
   wU8zDN2KcU2H2U/JJbWqQpfOBseD0bbVJakWrxiRP6mYp7SPfXI6jjkeF
   pDI57VYUFUI9+Ua1ipDpMUdub6NForD/dyUd+CKscxLx7JC2QNWls01XZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="377049455"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="377049455"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 01:37:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857662421"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="857662421"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2023 01:37:02 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v4 2/4] media: ov01a10: Enable runtime PM before registering async sub-device
Date: Wed, 22 Nov 2023 17:46:07 +0800
Message-ID: <20231122094609.292304-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122094609.292304-1-bingbu.cao@intel.com>
References: <20231122094609.292304-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

As the sensor device maybe accessible right after its async sub-device is
registered, such as ipu-bridge will try to power up sensor by sensor's
client device's runtime PM from the async notifier callback, if runtime PM
is not enabled, it will fail.

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


