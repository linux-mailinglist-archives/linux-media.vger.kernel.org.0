Return-Path: <linux-media+bounces-49141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B2CCF3DA
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C205300A85D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F672F5A29;
	Fri, 19 Dec 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ss5I3ZtY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7322F1FD2
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138317; cv=none; b=qo+AJdnacF5q1wIcBgZ68/X2fH6rSOKprTK4nY2vi7lkaUvUI3wn8sqi7BwFj4JeudNpY6ZVy2Cv+mFkvjCeLiFLBtjDyu7JGAVREMxGjXeloNihOxmqACdlDHp58OexZZGCWpuAQ/8fI7wxBCqnSgxSewE+ZcGyjkmhtwJ52VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138317; c=relaxed/simple;
	bh=YH9BZpmrcJNIXuTAvdSELfCQAJIOo0fidg3rJ5qAuwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDD2ZRFNueKB/2onUo2YEnmdfoX+4nX2OtLJjmv593a3Iz521Ihvx8gz8u2w9OLW0FFVYQcRSVrCJSQfLiT9QxO6JrHftpWz1tFlx9M3uxsg9sitMwO1ILWwSHpJCJL4hi8ySh+gDI31X4sqPkFTErq6rv4Ty7Sd/vIgf3DO6S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ss5I3ZtY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138315; x=1797674315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YH9BZpmrcJNIXuTAvdSELfCQAJIOo0fidg3rJ5qAuwk=;
  b=Ss5I3ZtYQk0tWHS74kMULUgUPBJzNDrnrH99gi/U2+i7zMwMPWzDlOQ6
   qOc4/dklRe5y9KmVWwebL+xFZkZ4N1P/el70JGpZyu1Ul2FDnspMxiF4M
   8PAb74Bp87ca3cGIqwHk0qvfKFEIomPcmsnQrvKKyPZEvx/f1QJc4o2Iz
   ESao+ogwC50cRXbYE4dScDigO4TdVyvYayXmsd/Yog4lLJS5HIrPhD2Tj
   BcRQHuubIf+ujmdG1W3ayZGro33KZP0Q+GDZcYmsKdredvcCB4qIOTOh4
   fn7GNeX7evu/47rgfo+TrTsfleRtHGZCudj2aFbHxd6+beBWrznhPorY1
   A==;
X-CSE-ConnectionGUID: +x9k/tcWQqSQw/Qvew75jQ==
X-CSE-MsgGUID: q45I5peqSf+A1qAiFCvJEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945156"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945156"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:34 -0800
X-CSE-ConnectionGUID: J5csw09QSGinkECLN82iuA==
X-CSE-MsgGUID: sJJl4g8WRDyxPsFnJvDIjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973367"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:33 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 042D2121DA6;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsRc-2rW3;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 04/13] media: ipu6: Make symbols static
Date: Fri, 19 Dec 2025 11:58:20 +0200
Message-ID: <20251219095829.2830843-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
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


