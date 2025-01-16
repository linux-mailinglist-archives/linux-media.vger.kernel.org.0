Return-Path: <linux-media+bounces-24844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1C2A13A16
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 13:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C6CE1888793
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 12:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B66E1DE8BD;
	Thu, 16 Jan 2025 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVzDJu7N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018E21DE4E1
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031290; cv=none; b=ILR6naFm1gaiGfBUfXjF6is58OkE1yh9+6/+grCqN7RNsdsDMZ+fpVDMffmX6ZBVNusBAFQWgGodM9f090m62C936IGvsKhM40dNicLTTnJ+8wS6k3z58pvuRnQ3cA38WrRKEKHR/uZgWIi0fWo6RX1AUfiFb5rNyAnDKq6pbgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031290; c=relaxed/simple;
	bh=T408lo0PAwEiTusx9M7uaspBUOdgasZd8/JWT9eE690=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JLfUuUsC/ESpaPitxN9rm1tAKE9UEwR8bvNFeOE77YFQU8xxGZCnnPsPliCPwqLAHyMa4CoSM/NWr/1Wwff7UoFz4fs6pdPJS/OxHA5wro63AaYhn2VSt2p6Mo55NhVcLQryI4YgjN5GJP07iS8OWpOo4sg0yOnVyb4eZFOKBQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVzDJu7N; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737031289; x=1768567289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T408lo0PAwEiTusx9M7uaspBUOdgasZd8/JWT9eE690=;
  b=jVzDJu7NJqtaz6IHwChxz0Fz2jAUTl7kwDvavvSVaDrqgOxJHjYbnzEm
   tn9gFv9HAL5eRFcGb8nog+M5CvA7nnrvY1UKjq8rG+7WSv38NLyFPF+Sa
   QxfnhN5btsbgbJeHDohPJtc3M1Vrmq9H9tNNdW/TzqS9FlkjRK6uVoqCL
   wC3dQ7DrAdv9j+EbSxUIr67DNRJ1N2zSEd7y6/HFLHlRSFndDH+sEeKmF
   HIYc2FSWAvyuhB70uA2GPZg/hOxvNwhvLdU1mjAFsi28giHxWYJ5EXt7g
   16SPiRgs7bybOe9IDY6gf//HABrdqoLFh6YWVVkZDbhcz+iEd+zq8wDg8
   Q==;
X-CSE-ConnectionGUID: rf1hdCmTRYWPAPur5rnvTQ==
X-CSE-MsgGUID: 06pWlIkSRz2aNr0n7CZ3xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37568956"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="37568956"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:24 -0800
X-CSE-ConnectionGUID: yEkiIc6xS22PNIr2zbpUKw==
X-CSE-MsgGUID: 3ZJZbGo2SXy6CKvjn57QIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106025357"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:23 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6C72511F964;
	Thu, 16 Jan 2025 14:41:20 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 1/4] media: i2c: ccs: Set the device's runtime PM status correctly in remove
Date: Thu, 16 Jan 2025 14:41:15 +0200
Message-Id: <20250116124118.42130-2-sakari.ailus@linux.intel.com>
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

Set the device's runtime PM status to suspended in device removal only if
it wasn't suspended already.

Fixes: 9447082ae666 ("[media] smiapp: Implement power-on and power-off sequences without runtime PM")
Cc: stable@vger.kernel.org # for >= v5.15
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 2cdab2f3d9dc..45b317216aba 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3595,9 +3595,10 @@ static void ccs_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(subdev);
 
 	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
+	if (!pm_runtime_status_suspended(&client->dev)) {
 		ccs_power_off(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	for (i = 0; i < sensor->ssds_used; i++)
 		v4l2_device_unregister_subdev(&sensor->ssds[i].sd);
-- 
2.39.5


