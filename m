Return-Path: <linux-media+bounces-24839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB12A13959
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 12:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5716A3A4D19
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 11:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B96D1DE3DE;
	Thu, 16 Jan 2025 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAtsZxvX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478ED1DE2B3
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737028038; cv=none; b=p/dDcaXXQmjdT0oZS0BNaHM4HpekVEmSzaCr4ob2PgjtmeMe4J/ZaMauy1Jm6KGsye4iqx2pFr2/eyJG2lBJaggZmp3KQTFdRHeHqRotplVYqMBLCJrRhRpiTCMUpD2b9VLcGk5XWqFdBqrclSNS0sxpE6wA00zB8DAfeav1MjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737028038; c=relaxed/simple;
	bh=t2hk7IhKErYlvwJTOCl621uRqsUM5wenkGrm3Ccicxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gY5NjhIccDWityXXsVdGOZlx8Eb427PU8aCeE3qH8nYUTu/hlrXjVbMFta8jUhPsoookkoq9sz7+1XGg7OFoIg0rZglHbEQFsQcwNs3cleHUtOjPuc2n8pA4gZzxM+m4T8UOksyWlXU41Mjc+p8GK93t3RpnryPpCgCw8Bw9kAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAtsZxvX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737028037; x=1768564037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t2hk7IhKErYlvwJTOCl621uRqsUM5wenkGrm3Ccicxg=;
  b=iAtsZxvXBUlfCxjAfeFCXGhEvsdW0nYwNEAcHhsvkyTeeLjUzVPzASBW
   06ISLzTY7qHPgv/NDDg/BXHeK2Qh1m5FHvl/p2qwaE43pOTw+RY+rIL1H
   n9AnuK1wyRUw514bsGGKxN1A5CcETObwGp5SZcOl+Qh07tifoAp0PK/ll
   qNyaOm+qjmK+8HE8yJYw+PsBonHKLNkyD6Oo9W+bE8Mye46+7yy8glFUR
   Nh4eDQFQhp8MjCHOyt7GTMqXZffiWxLUG2xjsU6Ll1AX/of1QeZuctw7e
   lKSkcQAe9RFr9TYWd1Mg2uOMG9ReqDDa9RC5Mb4U/fDt1FPRLj3KVafFV
   A==;
X-CSE-ConnectionGUID: OPacN5sOTgiaRCkaVqf/2A==
X-CSE-MsgGUID: 5vBZpGMvQV2hSouAY3hE8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36686960"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36686960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:47:14 -0800
X-CSE-ConnectionGUID: kIsjMT19TcacKRF7NEqa2g==
X-CSE-MsgGUID: mh43X75sR+WkQYH32ogrcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="136313634"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:47:13 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2283811FA93;
	Thu, 16 Jan 2025 13:47:10 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tYOL8-000HYb-0M;
	Thu, 16 Jan 2025 13:47:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH 2/2] media: i2c: imx214: Rectify probe error handling related to runtime PM
Date: Thu, 16 Jan 2025 13:47:00 +0200
Message-Id: <20250116114700.67468-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
References: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were multiple issues in the driver's probe function related to
error handling:

- Device's PM runtime status wasn't reverted to suspended on some errors
  in probe.

- Runtime PM was left enabled for the device on some probe errors.

- Device was left powered on if a probe failure happened or when it
  was removed when it was powered on.

- An extra pm_runtime_set_suspended() was issued in driver's remove function
  when the device was suspended.

Fix these bugs.

Fixes: 436190596241 ("media: imx214: Add imx214 camera sensor driver")
Cc: stable@vger.kernel.org # for >= v6.12
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx214.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 10b6ad66d126..6a393e18267f 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1075,10 +1075,6 @@ static int imx214_probe(struct i2c_client *client)
 	 */
 	imx214_power_on(imx214->dev);
 
-	pm_runtime_set_active(imx214->dev);
-	pm_runtime_enable(imx214->dev);
-	pm_runtime_idle(imx214->dev);
-
 	ret = imx214_ctrls_init(imx214);
 	if (ret < 0)
 		goto error_power_off;
@@ -1099,21 +1095,30 @@ static int imx214_probe(struct i2c_client *client)
 
 	imx214_entity_init_state(&imx214->sd, NULL);
 
+	pm_runtime_set_active(imx214->dev);
+	pm_runtime_enable(imx214->dev);
+
 	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
 	if (ret < 0) {
 		dev_err(dev, "could not register v4l2 device\n");
 		goto free_entity;
 	}
 
+	pm_runtime_idle(imx214->dev);
+
 	return 0;
 
 free_entity:
+	pm_runtime_disable(imx214->dev);
+	pm_runtime_set_suspended(&client->dev);
 	media_entity_cleanup(&imx214->sd.entity);
+
 free_ctrl:
 	mutex_destroy(&imx214->mutex);
 	v4l2_ctrl_handler_free(&imx214->ctrls);
+
 error_power_off:
-	pm_runtime_disable(imx214->dev);
+	imx214_power_off(imx214->dev);
 
 	return ret;
 }
@@ -1126,11 +1131,12 @@ static void imx214_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(&imx214->sd);
 	media_entity_cleanup(&imx214->sd.entity);
 	v4l2_ctrl_handler_free(&imx214->ctrls);
-
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
-
 	mutex_destroy(&imx214->mutex);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		imx214_power_off(imx214->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static const struct of_device_id imx214_of_match[] = {
-- 
2.39.5


