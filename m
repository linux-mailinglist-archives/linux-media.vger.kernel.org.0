Return-Path: <linux-media+bounces-49719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D7CE9BF1
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F2D4302BD21
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD19217F2E;
	Tue, 30 Dec 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TV1mCJA6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFE6213254
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100213; cv=none; b=Hy0ZCAGJtpbT5hEBWLtiYpgRl6jbMlkqfVj4bHfEtgvGbkqoCRwiME+DiS3Lmqn1fEnJDhEjyPRTrQ5e1cBF7wQoOwk91KjUO3ZgfSpy1RdJ4UHNdEghjjtSmRvGFCHOFSt08CwIrBXCUEDYiwr1soeXThrs5+I05q7ACbz8O0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100213; c=relaxed/simple;
	bh=YH9BZpmrcJNIXuTAvdSELfCQAJIOo0fidg3rJ5qAuwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIGojNHkiFv7V9WZGnYBHZhZcBJ6bSlXcnIRaAphucIn0J05ovR9eHCqzTUFAIJaNpWor7pcmRhin1poyUPzhN0/0fxYd8p9tooXiaW3W89nvHB+iEtEVWau6Vu0VpXu+2sOv4XknsbPd59X2sh4QRNSwTvB42lZxK5325qKz2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TV1mCJA6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100211; x=1798636211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YH9BZpmrcJNIXuTAvdSELfCQAJIOo0fidg3rJ5qAuwk=;
  b=TV1mCJA6JOfziLIylODdYkRUbv1SXRzhQL+j0psyxPBHdwWzXgTkgl1h
   8UvLVTN9lblDVuW80K6Z7MmesS8dx3la3zRe5ztcXhQiqNOeF+SUlQ96x
   swy+RkrMEuAJNE1CSgjLz0DQLdJ3vsk4Y2yJJbGuE62ZFF0N0eBCMGIX2
   fsgABeMnStodZq6QSJDw7FfZS3IRRfrAzDLtnxO7uUTzvQYygzBPGMDor
   j+HHkAncL3bB9v2dNvd/dIPHZnUhh+WmOg0u3MQnKw1oiI0gUP0Sl2j9s
   0W+qlwupvf6p8ewr0+e0y72gRRzh63lPHK1HtgbiFdVMNSODpF8AaYb7F
   Q==;
X-CSE-ConnectionGUID: p3YUiyqsQRGkmpCL+h3t0A==
X-CSE-MsgGUID: QwZK9DJxQcmN/BcSR65xWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79808038"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79808038"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:08 -0800
X-CSE-ConnectionGUID: UwZvnmKATwyniW/hWeIiZw==
X-CSE-MsgGUID: Wgl9sjA4Tj6BXLlsyCb2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="224710702"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:06 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 952CE121D9A;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jbz-1Fy5;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 04/13] media: ipu6: Make symbols static
Date: Tue, 30 Dec 2025 15:10:04 +0200
Message-ID: <20251230131013.75338-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
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
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 4855eeb24980..1b527d9156e2 100644
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


