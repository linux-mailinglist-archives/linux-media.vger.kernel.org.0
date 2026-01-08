Return-Path: <linux-media+bounces-50194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C5D01ECA
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5141D315C9C6
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F403587AB;
	Thu,  8 Jan 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbUkq73z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66972DB7A9
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860234; cv=none; b=PjVPN9TuwbkA6rxDpqNQmGtp5cK7zEhd9J5MuZIy32Im7x6qHgSxd+WztLTm53DXLYIVmhR8VzTUQAE/ThFjKX9wewH8lhNId8NpJKW4qA+oGgJrYZ4YWsn4pj5lTyUvu+k238HSY4skT7YAa+X7IgIipC5+xYFeXR9SAdYqYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860234; c=relaxed/simple;
	bh=A3Qzcm6np1ThNeUjpD/ZMxlNpk4zbxq32gokifHWAlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+BWXS6YqIdqvjXAHyXC85LTFswjsCUZ/M1Pg6wBauRQQTxpCx4TDeaEVqxVVI1fFniMD+LTzmt6dGHQMq/7Nb7Ri/7RwzrXGWoWbRZJLL5CwfG4UQ6S0gJ8r9Bhygt0WEj/PguM0Zp+l4VaXJwWKfhcicb5rI2CDPW8DMW++7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbUkq73z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860230; x=1799396230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A3Qzcm6np1ThNeUjpD/ZMxlNpk4zbxq32gokifHWAlg=;
  b=SbUkq73zTInIWR1VhsBWmCUCjsuUiFYn4HGKO1cgQoXiiPhMwYy3shc9
   3GEhMRO7g34D1vjyJ5966KkVnoCX75vETIlaN1nlbruse5bI+np/SYq9o
   R1QAKw6f0Q1lHvMY2S1i6pNBv+5Z2wUUquuAycbb8oXvDbw6ci0O9PlgA
   VQvJqY+B9Rzp42sJygmOWHvHpenr/hccu9fK73oz1CIKmV2LnV1/5NO6J
   J1UqcvcdaVT0phriOpMbLaEYByos3mCOevbY8deOtY418ajqVLM8dEVeR
   vDv5l6xPUBYNi2LLZKeVeBWmCEYYWSft7nQlioDKSj3U/VPTj2kAbhdhO
   g==;
X-CSE-ConnectionGUID: i45Oj6m3Q5+F0LAnc+RSLA==
X-CSE-MsgGUID: zpQon0UfRr24YYUOWKM9Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869917"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869917"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:02 -0800
X-CSE-ConnectionGUID: YbJHSMFxQB62Om/qO8xJMA==
X-CSE-MsgGUID: Qvymby1uRXy8NFTXbo+PWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842944"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6A942121D96;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSJ-0YVb;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 04/14] media: ipu6: Make symbols static
Date: Thu,  8 Jan 2026 10:17:01 +0200
Message-ID: <20260108081712.543704-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make isys_setup_hw and isys_isr static as they're only used in a single
file.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index ef01dcb635fa..5a8becff65ae 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -269,7 +269,7 @@ static int isys_register_video_devices(struct ipu6_isys *isys)
 	return ret;
 }
 
-void isys_setup_hw(struct ipu6_isys *isys)
+static void isys_setup_hw(struct ipu6_isys *isys)
 {
 	void __iomem *base = isys->pdata->base;
 	const u8 *thd = isys->pdata->ipdata->hw_variant.cdc_fifo_threshold;
@@ -341,7 +341,7 @@ static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 	}
 }
 
-irqreturn_t isys_isr(struct ipu6_bus_device *adev)
+static irqreturn_t isys_isr(struct ipu6_bus_device *adev)
 {
 	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
 	void __iomem *base = isys->pdata->base;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 0e2c8b71edfc..7fb8cb820912 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -181,8 +181,6 @@ void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
 
 extern const struct v4l2_ioctl_ops ipu6_isys_ioctl_ops;
 
-void isys_setup_hw(struct ipu6_isys *isys);
-irqreturn_t isys_isr(struct ipu6_bus_device *adev);
 void update_watermark_setting(struct ipu6_isys *isys);
 
 int ipu6_isys_mcd_phy_set_power(struct ipu6_isys *isys,
-- 
2.47.3


