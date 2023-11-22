Return-Path: <linux-media+bounces-763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 238197F41C7
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3217281886
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3F73C69A;
	Wed, 22 Nov 2023 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dk7EfNbR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id C8599BD
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700645822; x=1732181822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FmpnxsGSXBaRUfG/aXink5h+G8GNyejHyms9JT/4Bj8=;
  b=Dk7EfNbRk8TBgiUGpjFMlEOhLKSNDi04YT4hveY5eVCeFJ9MBHSwH7To
   wkjvZIXVt2WeEX1nhQPQs4XHg7jlHVlr+oitdK2YIStZjyv4ypo96Yq0Q
   h5L5qSoWv2dcqsa2kZqaOLNrcPqHdnrd1rug3O6S+FVryKTwM2srQb5Of
   LNwXCogazUU9Qoow5VcPvz/148FPkOOvK8aWCYm3O1e4gHMA63FeCZMq+
   gzSJNFD5MVb4zEubXsqrQD3UxtYfi0jYJKweQwuDeJh+ZhbtV8cGyYjw+
   gGJRB2N7dYKk12rX4Yvq+/zTaX2xTpdnJZOqdtc0fJRBq+TFUP9JXZaYj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="377049447"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="377049447"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 01:37:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857662414"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="857662414"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2023 01:36:59 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v4 1/4] media: imx355: Enable runtime PM before registering async sub-device
Date: Wed, 22 Nov 2023 17:46:06 +0800
Message-ID: <20231122094609.292304-2-bingbu.cao@intel.com>
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


