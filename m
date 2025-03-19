Return-Path: <linux-media+bounces-28484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A215A68C79
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 13:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711C617EE6D
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D99255E33;
	Wed, 19 Mar 2025 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcmKm5nT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EA7254AEF
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386269; cv=none; b=ry+kps5jMhT7MlnMEC9pSd94iZhUFzif2DRFZSyTD3sxJQWgUloPscLfPLTRbLTSw2OC3OZPPygkf37AUzpQeHX7AiU7HhFmM6K3SyOD5jpX6Y0oPvwTehiExHOTksYW0krrc11rAbpe9m0pIHs9O4Xn26RtW5BtKwzYJI0SjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386269; c=relaxed/simple;
	bh=Hf6EDwWa5P8EU7y22uz2o+RNtpuBXNtLi04CeKOcOHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A5crY+5GOWJpK9+xBT4uWxq+yLEeQyVEueq7b62jlN3m5J0Y0F0jjNruu7B1p++4NO75yjnqWqGlqMtQbp+TR347Xt7KppBGoVbbzhZS1NYcbGUTyVNDtqkwxFuSqm3RnTyG353Wi1DiqvB1WpZ/XbSPwFP1Nx886srUPNhagE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcmKm5nT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742386268; x=1773922268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hf6EDwWa5P8EU7y22uz2o+RNtpuBXNtLi04CeKOcOHU=;
  b=OcmKm5nTErChMAZgk5FsIaSmiF3Bafe/NW4ySCtyw8RMOgXg2LCECJ69
   T4tZ0D8RSXS5TxSdXNvMsx2wTLz6Q25xhr2yk72cn8efPF1bzAjwqpC5d
   vNZ3rzyjzddY3C9A+A5hDnUXFUh3Fqz1I9/XjshiDMJb/2xUMqaTyhjXG
   mrKPBKzEsHZq62gcfjRdJ9w8/c4pyBcmOX68kLMP8bRnbsoI+1ZBinAC7
   8zHluiLn34p3lE8klm9L/zbesemSQfML146/rWpg4WKGAU/X6TYfbdJNd
   W81KgesQiawmaO7JCbPdYw8Ih7KFuAPI7VdGeT+jLCl5biN7tNEprxMTh
   w==;
X-CSE-ConnectionGUID: 8JKn7tAQRAimyJMbM1DsHg==
X-CSE-MsgGUID: PgfbUncgSma7z5ymVYCNLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53785897"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="53785897"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:11:08 -0700
X-CSE-ConnectionGUID: DnEG+5dNTuqdruwBvFijRA==
X-CSE-MsgGUID: FV7zuIekTOu0aoLjdxcBdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123086752"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.118])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:11:07 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 5/5] media: intel/ipu6: Remove unused dev field from ipu6_isys_queue
Date: Wed, 19 Mar 2025 13:10:44 +0100
Message-Id: <20250319121044.113705-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
References: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With current code base dev is only written but never read. Remove it
as redundant.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 1 -
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 55d45d2d8768..a9127b1c4d45 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -841,7 +841,6 @@ int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
 	if (ret)
 		return ret;
 
-	aq->dev = &adev->auxdev.dev;
 	aq->vbq.dev = &adev->isp->pdev->dev;
 	spin_lock_init(&aq->lock);
 	INIT_LIST_HEAD(&aq->active);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index 1a277b0fb4b5..b865428a0fce 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -20,7 +20,6 @@ struct ipu6_isys_stream;
 struct ipu6_isys_queue {
 	struct vb2_queue vbq;
 	struct list_head node;
-	struct device *dev;
 	/*
 	 * @lock: serialise access to queued and pre_streamon_queued
 	 */
-- 
2.34.1


