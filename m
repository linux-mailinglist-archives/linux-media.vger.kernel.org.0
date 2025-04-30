Return-Path: <linux-media+bounces-31441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A4AA4A5A
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04B531C02B4A
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93862254859;
	Wed, 30 Apr 2025 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abRfBZsg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17597253F32
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014047; cv=none; b=ggPzcv6kMSya2P38O3TKleLnWWtVYC7ThpY3ZICj/O6kU43P9uOC4/ul+DgsbmvaN+VGlI1CeY3JKQg0fZzBPi9Dti7gLlnU2QJbovBr0fmrC5IqjMKgxpPO1Q9hMvvkjm6JGOJDAA6xnHvVVWiRT7ZnPBKCgwrsRb5JDMMdeAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014047; c=relaxed/simple;
	bh=H8ECYKskylgxEYcdWQEFj2niyiSEn3nWH+xmEdIf+Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tOyuXHYrPP9u2hzpmf0gT47CDv/0ywJg/BLorvELUFd7Z9s1E3DuxdZ1OEDTlWvElEiseYp3RBF8W0D6VYqfmUGCfqVKG+5Vx98pe54YXXRCGGIZnFD9G1mMI74TK6uhZhoLw7EIMv3cFnQB/0ICu8TnudMxTXV1FEQVllk6v0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abRfBZsg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746014045; x=1777550045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H8ECYKskylgxEYcdWQEFj2niyiSEn3nWH+xmEdIf+Vg=;
  b=abRfBZsgjVXCAkJLDV68xBXrPMbLnT7nQrCc/fgeC3ckSl7857Hr7Ldj
   v7oPoeNHoCokdcVMbLWYp6aT2ui4qhXGviml0Ixv37BkunySTr+X078Kv
   ggqL2VNOGy2ry4kjtrH6jy625Qf2mp/F0QvchPY18u/N4ADQ7HxsPHxiQ
   /yeDVYXLdKSwK+H0OR8IRy5x+9TfZYdxypIy5UwAWiL7Cuszwg24SgfBZ
   XPPIU5XCHUlY6MYQp9A8YPGBvd4HZ2X6+p2TiL1yBI2KgKxO9EpNTvUHG
   MYS7xURay781XLMzrXsnQ9bdusRYzbs6eriMum4EfPeuyCG7GxtcZV/GG
   A==;
X-CSE-ConnectionGUID: rbc3jUK6QyG3N6iQkCcsVQ==
X-CSE-MsgGUID: 7oJJq03KTaWJO+/aZzcX+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58302629"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58302629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:54:04 -0700
X-CSE-ConnectionGUID: BOPYmeYqQ36Ay9/tSFjqVw==
X-CSE-MsgGUID: 8+CMVTiIQNyjXDp4AA1hDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="165193774"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:54:03 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 2/5] media: intel/ipu6: Remove line_align
Date: Wed, 30 Apr 2025 13:53:47 +0200
Message-Id: <20250430115350.506460-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
References: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
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


