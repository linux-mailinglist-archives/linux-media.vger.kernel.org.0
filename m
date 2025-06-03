Return-Path: <linux-media+bounces-33974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E2ACC16B
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 09:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBC7F16D51C
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 07:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE3027F195;
	Tue,  3 Jun 2025 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnPAelKB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676701FAC54
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936961; cv=none; b=C5WTQMuDzJT7tfXgMZUDzO0zoeX6piNBtXkVF5Y07OrYPZAjrIv3GiUxsDxEgbhLCPEd6Qeccnzfy/1s+9lPLXaB+h9UnGMv3vdtVkvUQE/+Oh/OrMTF4Y1jztcN72D/FkH0wbzGvFLXI8Ya9PgtzKIS1F4GtannNgRFx9auZYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936961; c=relaxed/simple;
	bh=8cPytNECNR6BoNo43k7QxPA45sdSMj8kM5djmnOjMCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KCRdadYXvj7nw4UvKxk2FDUt+VnO6BEVt0WkgcxHwQM2h/ssKfWU2mWSj+q3X53ZDfbMdTdkIZTDWUs9HTQwmDYcXFYmLrI3ouRqt5QfpXk8psQllDGVnvCQEL93saLo8nTZLKzBlPX/EFgAXj33JhAiLEp9sTN07yrCqBI6b/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnPAelKB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748936960; x=1780472960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8cPytNECNR6BoNo43k7QxPA45sdSMj8kM5djmnOjMCE=;
  b=LnPAelKBc08kvRm80jWd4MTEkDKW8/bLZzMgj1BGQUtLzmWFrYISiTAu
   48nhqams+6HF8GF4otI8hTeApcEmsl5T+nMp/OesMnrdZXy5YEpA62rJx
   NUmhLDUubxfFJProFhDTS1aNoG0e52pyjo8CGffJHfxxuyDBtCGnsr7rr
   IOtRCowjbJbGOwRFegcQFjlnaVGvkrLVCm7pGIT1kPrMLg+svAqPVR0Bf
   7Y4G/vEF/AGzLDVVSYL423wYQfVwtNZb+b/U706YiDUyFNcHYF9suoJpv
   jFyjx1LDi6z94eQRtOoAfMoV0vIZNOaLrLA1xAwFu33ojDXOwirmjXxaL
   w==;
X-CSE-ConnectionGUID: rqBSFdn4Qo+AqrR2tf8hxQ==
X-CSE-MsgGUID: LPoWuQTbQeOycUQfaZmYQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50659779"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="50659779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:49:19 -0700
X-CSE-ConnectionGUID: MG0xyFmtS1qJFLZTNkEUfg==
X-CSE-MsgGUID: TRlpIz5bT2GRINtnudUK5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="144671273"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa006.jf.intel.com with ESMTP; 03 Jun 2025 00:49:17 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 2/3] media: staging/ipu7: Use RUNTIME_PM_OPS and SYSTEM_SLEEP_PM_OPS macros
Date: Tue,  3 Jun 2025 15:49:13 +0800
Message-Id: <20250603074914.2494111-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603074914.2494111-1-bingbu.cao@intel.com>
References: <20250603074914.2494111-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macro instead
of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS(), which avoid
build warning without adding __maybe_unsed attributes.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 452f3ad26048..f1ca76d59dc2 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2745,10 +2745,8 @@ static int ipu7_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops ipu7_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(&ipu7_suspend, &ipu7_resume)
-	SET_RUNTIME_PM_OPS(&ipu7_suspend,	/* Same as in suspend flow */
-			   &ipu7_runtime_resume,
-			   NULL)
+	SYSTEM_SLEEP_PM_OPS(&ipu7_suspend, &ipu7_resume)
+	RUNTIME_PM_OPS(&ipu7_suspend, &ipu7_runtime_resume, NULL)
 };
 
 static const struct pci_device_id ipu7_pci_tbl[] = {
-- 
2.34.1


