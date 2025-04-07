Return-Path: <linux-media+bounces-29513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D8A7DFDB
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03F683B90B7
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2774C18309C;
	Mon,  7 Apr 2025 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Db/xSm3v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7902A926
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033256; cv=none; b=YowPslj7dFpryyJlbY/VYsnJlpaqfB2UciVzdYIZe1km33ZS2UdJwvts0ylVvPx43RzzmNaqOtn3vfxezAgD7Pc8JVJEk8ocla+Wg+Gg/1karPD605nTO8XBtYlV8g602WpYLHg7UIYaxvwCkvEgQyZfhUIeYW3OT0f5OTUEK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033256; c=relaxed/simple;
	bh=kZklM5XBP3shmOYboJ0yjA/kauW9qaJUgjMPHIEjPhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFcUDFsgY84H0qlYsm+VQlo/jhtYpt4o0WpUEvkDWSjwMHv8qJX1Vtv+Jcy+wAGFvVTlN+sR9nxQGgdZc9v96iWHd/3nq2Cni+UUCYPjRYH8ltUE/tfLtwT685tLoFEwono8gbMcJMvF6lU7F1Z6jHCrzMU5FzKsmu/tmA2R55g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Db/xSm3v; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033255; x=1775569255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kZklM5XBP3shmOYboJ0yjA/kauW9qaJUgjMPHIEjPhA=;
  b=Db/xSm3veLLr6ociwBuh4Sj9pSYp+lt+JewR48YjqhCQnoGGR9HtnLl+
   0Du+zyRsQgY23AQsMNxUywzGpmi/a/hZeX4dBRi5jqy8xbdyN1b/v7PlR
   d8AyuJhrKe8u1ZPsiQ7IJVqbZw6N8nzgUUOSkE80jAPud8rtwETvZCckb
   rZH34Erdr32NVfj/cLH5gmtRN/Ofv3T8ljRkR1e9yP0Lvrj5Mu+Y+e5xa
   34LUSVSHb/grSLHFdlAeCkNseFZk9u2Tl1C0GgLS1hkfh08Zdbk7x1UNE
   Wez7pWgjg/cOxjJHfG52/ChSGaRcAXLQX0NW4rkFHX9WFQvYzN3nHrtJ7
   A==;
X-CSE-ConnectionGUID: tmyQB9IIQxOofVEAvu3Ixw==
X-CSE-MsgGUID: wCuvlQIsRgyJRRMPQvch0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45322434"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45322434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:54 -0700
X-CSE-ConnectionGUID: FucYe7fjRwuquiIZRP4seg==
X-CSE-MsgGUID: xcW3vJQRRQ2S53VOcL+OIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127713223"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.153])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:53 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 2/7] media: intel/ipu6: Remove line_align
Date: Mon,  7 Apr 2025 15:40:32 +0200
Message-Id: <20250407134037.808367-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys->line_align value is only used in one place and we can just use
the proper value directly there.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 1 -
 drivers/media/pci/intel/ipu6/ipu6-isys.h       | 4 ----
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index e36a21aa9040..3165904d7ebf 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -241,7 +241,7 @@ static void ipu6_isys_try_fmt_cap(struct ipu6_isys_video *av, u32 type,
 	else
 		*bytesperline = DIV_ROUND_UP(*width * pfmt->bpp, BITS_PER_BYTE);
 
-	*bytesperline = ALIGN(*bytesperline, av->isys->line_align);
+	*bytesperline = ALIGN(*bytesperline, 64);
 
 	/*
 	 * (height + 1) * bytesperline due to a hardware issue: the DMA unit
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 9b7ff5c440de..2267784b86bc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1089,7 +1089,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	INIT_LIST_HEAD(&isys->framebuflist);
 	INIT_LIST_HEAD(&isys->framebuflist_fw);
 
-	isys->line_align = IPU6_ISYS_2600_MEM_LINE_ALIGN;
 	isys->icache_prefetch = 0;
 
 	dev_set_drvdata(&auxdev->dev, isys);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 610b60e69152..f488e782c26e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -29,8 +29,6 @@ struct ipu6_bus_device;
 				 IPU6_ISYS_UNISPART_IRQ_CSI0 |	\
 				 IPU6_ISYS_UNISPART_IRQ_CSI1)
 
-#define IPU6_ISYS_2600_MEM_LINE_ALIGN	64
-
 /*
  * Current message queue configuration. These must be big enough
  * so that they never gets full. Queues are located in system memory
@@ -118,7 +116,6 @@ struct sensor_async_sd {
  * @streams: streams per firmware stream ID
  * @fwcom: fw communication layer private pointer
  *         or optional external library private pointer
- * @line_align: line alignment in memory
  * @phy_termcal_val: the termination calibration value, only used for DWC PHY
  * @need_reset: Isys requires d0i0->i3 transition
  * @ref_count: total number of callers fw open
@@ -140,7 +137,6 @@ struct ipu6_isys {
 	struct ipu6_isys_stream streams[IPU6_ISYS_MAX_STREAMS];
 	int streams_ref_count[IPU6_ISYS_MAX_STREAMS];
 	void *fwcom;
-	unsigned int line_align;
 	u32 phy_termcal_val;
 	bool need_reset;
 	bool icache_prefetch;
-- 
2.34.1


