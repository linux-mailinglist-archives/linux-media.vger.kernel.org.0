Return-Path: <linux-media+bounces-24843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D0A13A14
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 13:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC24188916C
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 12:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647011DE4EF;
	Thu, 16 Jan 2025 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBf+WuCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6671DE89A
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031289; cv=none; b=dse+gl8KaUo6auLdqi+l/nE+EgV1gNAOoWP4l4Quji6KDSsQMQqSn8ioPG0IjfeSc1phwpYPBaRrM5GZOq8Jbui37mm1zsFxWQBqHCY8JlxM/0ww4suiCd8aBB6YKmbQEyzDTYktaaD4IQ4CFGsgXWLNQhpiml+olummQzRTwKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031289; c=relaxed/simple;
	bh=UbRAVxIeufsAoLDPiXeWpWLCauvWx3c9RQGf6oIqKPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=asW8YvhXbylZUzFcvkxs6pzOZ9fnAuxGWqtr4QVfI5MhUnZrYaFfxnErF2N08Rp4e6WBHvVULfPdXvbXoVuhcEJep2oh7LaxaicJqw9PwmsxThKg1UvIKG2qXdIdNUz3lU/GCerx/FagRk8c7jZ0RBYlZkdfMrjCEuK7JYz4RMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBf+WuCQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737031288; x=1768567288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UbRAVxIeufsAoLDPiXeWpWLCauvWx3c9RQGf6oIqKPc=;
  b=kBf+WuCQILyousv8k5AJBDEC15A6MDssp7I1GlqOsK4ctX5H5zKRKfQQ
   ynRXz3Pb4zuA8MxJqm26c/3aGBR/f/jFuKjxxLpStOCFTQ9uCeyhAvySx
   zqMryehfRmUNk3p9xeWWUTdoa+Vg7bdwCPe5qttk7wqJn5ueibCDOlLs+
   PntCzVTS78HOYLIvdmXLrZr1sONVjOBt5aZ9eonRhdE4jZtfTodtVfekC
   WxAqXPIJNuzopB/jZwNHzAsMxsuLVNFlEgntzuljw9JR4FCxfLCD71Bv9
   WiovLbMgmH2MYKmGLUtQA39IvryIrO+nwfN/4Qy01573b2SYglQBX8Klc
   w==;
X-CSE-ConnectionGUID: WvkldfwjTVuQT7nTK3e14w==
X-CSE-MsgGUID: Rgy0x/SUSpyG32/nJysQbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37568967"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="37568967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:27 -0800
X-CSE-ConnectionGUID: Yo+Po4SZSKuE5RqpSLvdNQ==
X-CSE-MsgGUID: EJcseG31RSaNDI84IE57yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106025370"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:26 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 43B0E120213;
	Thu, 16 Jan 2025 14:41:23 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 4/4] media: i2c: imx319: Rectify runtime PM handling probe and remove
Date: Thu, 16 Jan 2025 14:41:18 +0200
Message-Id: <20250116124118.42130-5-sakari.ailus@linux.intel.com>
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

Idle the device only after the async sub-device has been successfully
registered. In error handling, set the device's runtime PM status to
suspended only if it has been set to active previously in probe.

Also set the device's runtime PM status to suspended in remove only if it
wasn't so already.

Fixes: 8a89dc62f28c ("media: add imx319 camera sensor driver")
Cc: stable@vger.kernel.org # for >= v6.12
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx319.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index dd1b4ff983dc..701840f4a5cc 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2442,17 +2442,19 @@ static int imx319_probe(struct i2c_client *client)
 	if (full_power)
 		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx319->sd);
 	if (ret < 0)
 		goto error_media_entity_pm;
 
+	pm_runtime_idle(&client->dev);
+
 	return 0;
 
 error_media_entity_pm:
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	if (full_power)
+		pm_runtime_set_suspended(&client->dev);
 	media_entity_cleanup(&imx319->sd.entity);
 
 error_handler_free:
@@ -2474,7 +2476,8 @@ static void imx319_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		pm_runtime_set_suspended(&client->dev);
 
 	mutex_destroy(&imx319->mutex);
 }
-- 
2.39.5


