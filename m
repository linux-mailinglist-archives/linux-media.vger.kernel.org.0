Return-Path: <linux-media+bounces-12076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 035FF8D186F
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 348D81C24781
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D9616B743;
	Tue, 28 May 2024 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwOSw5f+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F6016B728
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716891752; cv=none; b=TNs83H/lWtymy5FHPVscPaUuWyTLbijPHOIgFmIxKs+MXUnk6VQNV8hDl4hzB8hS6P7QtkEA8kotaKIoRq7f4OPftRdVI2zZzpwW/6x2LFTpAlkAYiVFXuAGTcHEpWy0yW9LDxtP5wV9UnqH9Aon4u0vlEw9RDjy1hOPdF8AMMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716891752; c=relaxed/simple;
	bh=yl1hu6SXg1qo56iHiBu5N/donSZ/myknQ/bp6Ym8xRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aKYdBlhMIXJWVZWr+61leGPxUrHOTBCw8lAGPcgPkrblWytdiOvCbHCKdrpcLLlSBM+Pwnt9uUIdHRpB7lDMbpufbGRrIcmGZpirQkTfXbgYQuIIYVMMqnxVzedMI5q5nvg+bRxNvfDY45Omno4QC5NIgDcS8ad7SYgvnMXSbUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwOSw5f+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716891751; x=1748427751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yl1hu6SXg1qo56iHiBu5N/donSZ/myknQ/bp6Ym8xRY=;
  b=LwOSw5f+SAuq559AKDv8UyGTbOK5t+n+q7XL2OhWSOxlWz1ZUCyVYKPh
   npETYbX/kjvVNCgm3YIVH0oYUi/zx41E3HOCQFF80gr+IUVnXAIUTlGv6
   oifaDdGhzkebkYKKLzej3JFtFTznFY1LD2qsf/eo4gfp+qqc86ng1MhSP
   /buNw9fm57jGKCj2xmIhZE5NdGlgdHn4C078jd8Z7dTMu0Ss4SGRx0ova
   Xv1nu/hevYCqNm7eOO8uFINHLegpABVfWdGEzBOTyE6it/zh2+1Xu3YHe
   J2fJsXMDEbS2lkoS0T0TQhtp3/VToagnS2tZ8MjqZIsgxhiam6Q67tlDx
   Q==;
X-CSE-ConnectionGUID: ChQOz/8vRPC21gtP6X5fUQ==
X-CSE-MsgGUID: IS/VCrfQTu6sAUNaSEOUBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17061057"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="17061057"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 03:22:28 -0700
X-CSE-ConnectionGUID: aFFP3vqiS9KBOAZ+EH93VQ==
X-CSE-MsgGUID: jjPJZ+QtRnSIO4vSJ35T/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="35525097"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 03:22:26 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D5BB211FB89;
	Tue, 28 May 2024 13:22:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sBtyJ-00CCXz-2j;
	Tue, 28 May 2024 13:22:23 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: wentong.wu@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 2/2] media: mei: csi: Warn less verbosely of a missing device fwnode
Date: Tue, 28 May 2024 13:22:13 +0300
Message-Id: <20240528102213.2908148-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528102213.2908148-1-sakari.ailus@linux.intel.com>
References: <20240528102213.2908148-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for having device fwnode was meant to be a sanity check but this
also happens if the ACPI DSDT has graph port nodes on sensor device(s) but
not on the IVSC device. Use a more meaningful warning message to tell
about this.

Fixes: 33116eb12c6b ("media: ivsc: csi: Use IPU bridge")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 53151d016188..f04a89584334 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -680,8 +680,10 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 	put_device(&ipu->dev);
 	if (ret < 0)
 		return ret;
-	if (WARN_ON(!dev_fwnode(dev)))
+	if (!dev_fwnode(dev)) {
+		dev_err(dev, "mei-csi probed without device fwnode!\n");
 		return -ENXIO;
+	}
 
 	csi = devm_kzalloc(dev, sizeof(struct mei_csi), GFP_KERNEL);
 	if (!csi)
-- 
2.39.2


