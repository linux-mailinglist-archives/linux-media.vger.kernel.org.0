Return-Path: <linux-media+bounces-24845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4365A13A17
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 13:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 742903A6B39
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 12:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325161DE8AC;
	Thu, 16 Jan 2025 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jzc6DCbg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E4B1DE8A9
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031290; cv=none; b=qokJiDCGe2SkQ1kkYY5mYoMcxTjHeUgW8cpK1evVJnFNXh364AG23eg2ihh0+99sYnjDl8FRJjShwK4lq7liPX2Vg+ooQvIZnhjYNphpZPdnQ0Kgr7cFVLS3Lueh4GDP0TqD4xhxHjJ9blL1gMFUa/v2m4rxotLRKR9qJO4oPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031290; c=relaxed/simple;
	bh=xpBx5fSJ9IexIqS53IHh3F6bjd8mBgGP14xcwQZCg+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ooZwylG4xf+zr3ZprTMAHGdTbbhU62k1cBau6DGE3PnHYc+GK5uj4OAtLDfgNrVNSOYrffEzLjn/x0LdhduiWogsu/kn3J0LaItj71Arb/wbOCtI7l7Z9TkHZz8uw53jXaRPfcgRs/G4zjh+TkLbH5i1iXiTKOcSODU2KdBZpNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jzc6DCbg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737031289; x=1768567289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xpBx5fSJ9IexIqS53IHh3F6bjd8mBgGP14xcwQZCg+8=;
  b=Jzc6DCbgEzWfjL9Rh1hyn6TQmYyJ4iqnxj2/Xge+L8squQCjKyHtd6hm
   UIFP/3vhQHAIwc2Ae+2v+G6+7r+2wsddwZstKjdiG+8ZYQaE2ULwg1HtK
   T9qh3z9DoS0DfzsACD79PtzhBWA3HJ9jnTW3ue16HoYkv5UYujR8nIFWG
   eGCWFynx3HZ4AJT6Db2s1HF429aHKJZNzaIFVuGa7H6WWz86gkyWnRYs0
   MEKOjFUUQ8/T541s34QwasAYoGpuvmQgoOP4EEkYwOn21lWJIEyc8sCQF
   EeQwZaf3/JSPAM3Gofayencn0FO/0nWPaW2f804mstS5IzSTDhcqkKKKI
   w==;
X-CSE-ConnectionGUID: 4IrRXuWiQpGAg5JpyhmTlg==
X-CSE-MsgGUID: FBraL8cOQ1ykZmwB2AmuMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37568964"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="37568964"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:26 -0800
X-CSE-ConnectionGUID: Py07bSGnQFGTDN+2eQgDBQ==
X-CSE-MsgGUID: Puoqv3HLTCmm2sH4WtvZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106025368"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:25 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 498D31201CA;
	Thu, 16 Jan 2025 14:41:22 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 3/4] media: i2c: imx219: Rectify runtime PM handling in probe and remove
Date: Thu, 16 Jan 2025 14:41:17 +0200
Message-Id: <20250116124118.42130-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116124118.42130-1-sakari.ailus@linux.intel.com>
References: <20250116124118.42130-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the device's runtime PM status and enable runtime PM before
registering the async sub-device. This is needed to avoid the case where
the device is runtime PM resumed while runtime PM has not been enabled
yet.

Also set the device's runtime PM status to suspended in remove only if it
wasn't so already.

Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
Cc: stable@vger.kernel.org # for >= v6.6
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2d54cea113e1..c6c30109225c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1178,6 +1178,9 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_media_entity;
 	}
 
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret,
@@ -1185,15 +1188,14 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	/* Enable runtime PM and turn off the device */
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
 	pm_runtime_idle(dev);
 
 	return 0;
 
 error_subdev_cleanup:
 	v4l2_subdev_cleanup(&imx219->sd);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
 
 error_media_entity:
 	media_entity_cleanup(&imx219->sd.entity);
@@ -1218,9 +1220,10 @@ static void imx219_remove(struct i2c_client *client)
 	imx219_free_controls(imx219);
 
 	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
+	if (!pm_runtime_status_suspended(&client->dev)) {
 		imx219_power_off(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static const struct of_device_id imx219_dt_ids[] = {
-- 
2.39.5


