Return-Path: <linux-media+bounces-766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDD7F41CA
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 929491C20999
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46A13C69A;
	Wed, 22 Nov 2023 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1T3sU/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7859F9D
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700645830; x=1732181830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nUFcSPDdOISKbhFucci8LorcbxgTdzHDInzWCZURffM=;
  b=R1T3sU/D/P4CZqEqQN1/iT7yqolDUCEEOHhrj9dA6Ob8Gk7zJKwuP9xU
   4EP0hp7VMDWPtA+jnbkW0MJd1Visuc+LGyXhF8euPl+N9PYHEmeDRr7Fr
   Yw/sRGiFPbNCn3v20YjlHvRECASNRbAqtwjbfTdcnOwTjCNPQbIQw1SfL
   V6DPVhnOjUUrXBaYNX6FLkdJE4nyF64hp20/xdJZszSIMzKbeTJXprpTi
   O+qf4aCHk3X96mUBulEQEZx78nlsoY98Ps5hg3oqYK63gRjejN+HZ0OoD
   rHq5LrdDUtXCmunsLpfLz5i7Oj4ORSnAnzYaM4gMRCgjj/NStS9Dt0pat
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="377049468"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="377049468"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 01:37:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857662430"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="857662430"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2023 01:37:08 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v4 4/4] media: ov9734: Enable runtime PM before registering async sub-device
Date: Wed, 22 Nov 2023 17:46:09 +0800
Message-ID: <20231122094609.292304-5-bingbu.cao@intel.com>
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

Fixes: d3f863a63fe4 ("media: i2c: Add ov9734 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov9734.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index b6244772bc59..b36fc0fedad4 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -939,6 +939,7 @@ static void ov9734_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	mutex_destroy(&ov9734->mutex);
 }
 
@@ -984,13 +985,6 @@ static int ov9734_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
-	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
-			ret);
-		goto probe_error_media_entity_cleanup;
-	}
-
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
@@ -999,9 +993,18 @@ static int ov9734_probe(struct i2c_client *client)
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
+	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+			ret);
+		goto probe_error_media_entity_cleanup_pm;
+	}
+
 	return 0;
 
-probe_error_media_entity_cleanup:
+probe_error_media_entity_cleanup_pm:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	media_entity_cleanup(&ov9734->sd.entity);
 
 probe_error_v4l2_ctrl_handler_free:
-- 
2.42.0


