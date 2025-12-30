Return-Path: <linux-media+bounces-49699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54594CE977D
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45C0330245F6
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CF82DAFAC;
	Tue, 30 Dec 2025 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGYl2FSt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16142C08BA
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091941; cv=none; b=a8jVKYI9GWiAughSOmGHUpQ4M/1hEZ/MDya55xeprARI0RRJIfRh3fkblEiv99oqsZHSbdJClsj+JmA2fs273GprFQNu34knxwsOqBzVyPR605xCkA6Qh/iyjSQg8rusLgx27YAnp5QSuroZxa3HMCOSaqYuZq8QJmcFhtEyryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091941; c=relaxed/simple;
	bh=YH9BZpmrcJNIXuTAvdSELfCQAJIOo0fidg3rJ5qAuwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9x9j6T+Yvm74tPgqZ4cTmhA6H6POYTv1R5OMGUoMYHPuAxDQf7L5t9kbp0VvIi57I2O1s9d3X/cHR7ycxg5wrLau6N4rrJxtCM1yDXtWIink3p1Od6+CDwtUEs2Mx6S09HSjjVRtBM032wzgaqDM4ccRDmPzKHslA3No+8+jQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGYl2FSt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091940; x=1798627940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YH9BZpmrcJNIXuTAvdSELfCQAJIOo0fidg3rJ5qAuwk=;
  b=oGYl2FStfc+GGioRGikQYKYXz77dWxmgFwShZIv4RBqt/AK92LnlJoFc
   Znj4Efk25RBep+8L3Q3TRR8CG0KCYVRf1+zvsSqrzQle6VDlGlXH5xdsR
   plXZNuT1slw4E3r2GsA1iCDUTjzMgt/nz7VuxdPWJg3L9xIf0WK5ejyqD
   PPs1bzHr0AZCeHYG9THoycKzni0tXJ2vCjjTvZlTl0iq96KjmykWONTyo
   J1CdPW7ezfpDEoT75oi3Du73IfxB23EZGhQk6GPOZEpnsFtY+NIcFz46H
   SBrb2+37wnt1ygB+XnuAGjSAv6RBk6fVXaMfHow83oeeW4a5zciaIUVud
   w==;
X-CSE-ConnectionGUID: z++91YFcSwOD4DTFla1QSw==
X-CSE-MsgGUID: vIg28JS3SPuJCsL1e3S1MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148717"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:17 -0800
X-CSE-ConnectionGUID: HP84YY8aQreqhAgp4s8r8g==
X-CSE-MsgGUID: eXJhlFtFQHOe8SE4nFOUHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186895"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 80C07121D9A;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQY9-0upA;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 04/13] media: ipu6: Make symbols static
Date: Tue, 30 Dec 2025 12:52:13 +0200
Message-ID: <20251230105222.3676928-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
References: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
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


