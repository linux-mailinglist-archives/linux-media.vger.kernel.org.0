Return-Path: <linux-media+bounces-7103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E687C936
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 08:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67D131F21C35
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 07:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6A614016;
	Fri, 15 Mar 2024 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuOeH1RQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BB1F9DA
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 07:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710487891; cv=none; b=CsLUSaXn+BFkhghIpCzTa+XFzdvMiyWIMOjMUflQ3o7dEJB2pm8uc+vy66JRpHlRn6ST5gAtymVPTA+XBjA+Pn7FJ4gZQy3VcXJPCy3T9EJroQVZ2FJJIYkViP3EHyC/9kYc5GK1cZofjHnY1SmhDxm1wE7HGXjHN56lfeoplbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710487891; c=relaxed/simple;
	bh=V7LnSHvZoRYlpxOd9mdgipVCw+c52TeccJLIs0QVbRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ieu2VAgFzJ/65eU58bsrlrU6fI8aj3cqkKIVyylXuusOHgnFSU4a6TG+2odhbbW0pnWAh/BqKPiWFhfRx3VoYhTyiqOWCcOglZ4LGrV7MAYU6RFwuBEjsrdnrkz2/BFt7YkGxbiuJLkpl9KgGAwH+KRu9Slah32kzPma0d0ZhCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuOeH1RQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710487889; x=1742023889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V7LnSHvZoRYlpxOd9mdgipVCw+c52TeccJLIs0QVbRY=;
  b=TuOeH1RQ4CfZymr6dgonz7F5r8CiUyZYDUtIScC+RGXdTIO4kMcJ+3KJ
   iXRQldaseNjtLvKFC+IS6XHQOs0WKbNNALa4EcDVTIuleAOvk4A+HYjlC
   M3tGE/w/WlCgrmYGmEiLNw8e2cwQoRwDa9hM3LYWs3KBZp6UrO47K7Sy2
   wGis/89OtZPAnUIB0wO4kMKAw0r9EbdsDFWohZGKVLQ2qsyN6Xuh94W4z
   ZzmJRPOnMWKRDCCd47rKd/EB27+RJS5Xn0xSaGG3n8O9Ckm15i9Rsux0V
   3fqgxyHZafKNPmL/SfnerNanReb5VH65yGrzv7EvnDvoaQlpYD3EwaiV1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5945691"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5945691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 00:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12499680"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 00:31:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6969911F819;
	Fri, 15 Mar 2024 09:31:25 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl
Subject: [PATCH 1/2] media: v4l: Set sub-device's owner field to the caller's module
Date: Fri, 15 Mar 2024 09:31:24 +0200
Message-Id: <20240315073125.275501-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315072935.275458-1-sakari.ailus@linux.intel.com>
References: <20240315072935.275458-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set a sub-device's owner field to the caller's module, provided as an
argument to the function. v4l2_device_register_subdev() becomes a macro
passing THIS_MODULE to the __v4l2_device_register_subdev() function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c  |  2 +-
 drivers/media/v4l2-core/v4l2-device.c | 12 +++++++-----
 drivers/media/v4l2-core/v4l2-i2c.c    |  2 +-
 drivers/media/v4l2-core/v4l2-spi.c    |  2 +-
 include/media/v4l2-device.h           |  7 +++++--
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 3b43d6285dfe..372a22d8b4d5 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -341,7 +341,7 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	int ret;
 
 	if (list_empty(&sd->asc_list)) {
-		ret = v4l2_device_register_subdev(v4l2_dev, sd);
+		ret = __v4l2_device_register_subdev(v4l2_dev, sd, sd->owner);
 		if (ret < 0)
 			return ret;
 		registered = true;
diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index d2e58ae91f9b..5e537454f5cd 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -108,8 +108,8 @@ void v4l2_device_unregister(struct v4l2_device *v4l2_dev)
 }
 EXPORT_SYMBOL_GPL(v4l2_device_unregister);
 
-int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
-				struct v4l2_subdev *sd)
+int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
+				  struct v4l2_subdev *sd, struct module *module)
 {
 	int err;
 
@@ -125,9 +125,9 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 	 * try_module_get() such sub-device owners.
 	 */
 	sd->owner_v4l2_dev = v4l2_dev->dev && v4l2_dev->dev->driver &&
-		sd->owner == v4l2_dev->dev->driver->owner;
+		module == v4l2_dev->dev->driver->owner;
 
-	if (!sd->owner_v4l2_dev && !try_module_get(sd->owner))
+	if (!sd->owner_v4l2_dev && !try_module_get(module))
 		return -ENODEV;
 
 	sd->v4l2_dev = v4l2_dev;
@@ -152,6 +152,8 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 			goto error_unregister;
 	}
 
+	sd->owner = module;
+
 	spin_lock(&v4l2_dev->lock);
 	list_add_tail(&sd->list, &v4l2_dev->subdevs);
 	spin_unlock(&v4l2_dev->lock);
@@ -168,7 +170,7 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 	sd->v4l2_dev = NULL;
 	return err;
 }
-EXPORT_SYMBOL_GPL(v4l2_device_register_subdev);
+EXPORT_SYMBOL_GPL(__v4l2_device_register_subdev);
 
 static void v4l2_subdev_release(struct v4l2_subdev *sd)
 {
diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
index b4acca75644b..586c46544255 100644
--- a/drivers/media/v4l2-core/v4l2-i2c.c
+++ b/drivers/media/v4l2-core/v4l2-i2c.c
@@ -100,7 +100,7 @@ struct v4l2_subdev
 	 * Register with the v4l2_device which increases the module's
 	 * use count as well.
 	 */
-	if (v4l2_device_register_subdev(v4l2_dev, sd))
+	if (__v4l2_device_register_subdev(v4l2_dev, sd, sd->owner))
 		sd = NULL;
 	/* Decrease the module use count to match the first try_module_get. */
 	module_put(client->dev.driver->owner);
diff --git a/drivers/media/v4l2-core/v4l2-spi.c b/drivers/media/v4l2-core/v4l2-spi.c
index eadecdff7349..fe3cd3505a35 100644
--- a/drivers/media/v4l2-core/v4l2-spi.c
+++ b/drivers/media/v4l2-core/v4l2-spi.c
@@ -59,7 +59,7 @@ struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
 	 * Register with the v4l2_device which increases the module's
 	 * use count as well.
 	 */
-	if (v4l2_device_register_subdev(v4l2_dev, sd))
+	if (__v4l2_device_register_subdev(v4l2_dev, sd, sd->owner))
 		sd = NULL;
 
 	/* Decrease the module use count to match the first try_module_get. */
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index f6f111fae33c..dd897a362f36 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -156,8 +156,11 @@ void v4l2_device_unregister(struct v4l2_device *v4l2_dev);
  * An error is returned if the module is no longer loaded on any attempts
  * to register it.
  */
-int __must_check v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
-					     struct v4l2_subdev *sd);
+#define v4l2_device_register_subdev(v4l2_dev, sd) \
+	__v4l2_device_register_subdev(v4l2_dev, sd, THIS_MODULE)
+int __must_check __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
+					       struct v4l2_subdev *sd,
+					       struct module *module);
 
 /**
  * v4l2_device_unregister_subdev - Unregisters a subdev with a v4l2 device.
-- 
2.39.2


