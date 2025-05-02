Return-Path: <linux-media+bounces-31623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854EAAA7655
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0F64C7D68
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E265C79D2;
	Fri,  2 May 2025 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiHJ8NwD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8967819004A
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200701; cv=none; b=czOM3y4iGGZgl5Cdp0n+PDKQwvQQg19elyo4EF1zdi+ldt9E8UwI1e9fby/HNIonHQSe+ATpONrzIRg+vN6wjaG0l4IwRVGjy9LjO1VQS4Ct/61xH9GJGeEIPTQdz0pPvmSdmWvLH3hWoDs6TKL4uaDYV5HqvchyPZTY59JgWSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200701; c=relaxed/simple;
	bh=H8ECYKskylgxEYcdWQEFj2niyiSEn3nWH+xmEdIf+Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XvVCcCSAXAIHDDLoFUd7jqA2hnDf099K/NuHg73QKA3Wifz7dOmwwBjCIcMqvPgVaH+dY4c8IcHk3ZVXOex5oQtFfBEPyRM1KlWVopqkpCU5OMb2ZToQf7FCwflqK/8FPCI69kpRnKaZEKf5qwh1dGSE8bLNNHe4MM77bxK8Ce4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiHJ8NwD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746200700; x=1777736700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H8ECYKskylgxEYcdWQEFj2niyiSEn3nWH+xmEdIf+Vg=;
  b=iiHJ8NwDnJ3gdKMGzjLpWjfRa5zmpJdJCD1C6rgSGB0Qqq5opWuzNVb/
   bSXPNFBzUVkuJ0A36LDOrIWh6jzv7buSo+EFpSvQd9iccvCWgQZCwSBQQ
   B/IY9LxZzkzykNlVaPQ2sW4yO5+LW7ntIOzcX4GP6XtFqGZsDQPx8P4BV
   rcWlZcF7BRpb1Q87NyCF/1aTjqICqNghCDtDRcdF5vEzdTknaFKnleC/L
   4kPi1ehQ5egLLBQ66cEDL68vGOq7dpu/FyHjH6yQN7vZk4QMBqEOOIh5y
   UHZnssSdSNVJhFXiTbGqNABlr6wfrIH8LvN0lgUamWG5hBctED2zt5C6p
   Q==;
X-CSE-ConnectionGUID: MCYf0Pl3SpOV9WAVE20U3g==
X-CSE-MsgGUID: f/5E2iEgSridB2rB74gPwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="50540748"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="50540748"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:44:59 -0700
X-CSE-ConnectionGUID: ucFGZoIERw2ZndxKIiX/ug==
X-CSE-MsgGUID: i0YozFE8SVG6ybyIbBAT/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135178513"
Received: from csteflea-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.252.84])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:44:57 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 2/5] media: intel/ipu6: Remove line_align
Date: Fri,  2 May 2025 17:44:43 +0200
Message-Id: <20250502154446.88965-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
References: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
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
index 46b76cdae408..44b88b546f68 100644
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
index 4d2ca6aae328..8286dea681fb 100644
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


