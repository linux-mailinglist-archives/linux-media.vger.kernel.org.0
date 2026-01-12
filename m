Return-Path: <linux-media+bounces-50406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A43D11B29
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27723304A8CB
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D1D27A122;
	Mon, 12 Jan 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UM33K4xV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9CF212554
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211997; cv=none; b=dSO3cOev/lr5JHkX5WFxrGkaVtbpZQrPJ8NyZhdjnhm0y/Afn8iwRm8K8vuB0BUXQqEwv/yfDYgjLn6O7IgTUp4w5voH2BK0kTJpi5KTgp6vJmLTDrBR6AfwDq0s9qGim+vv7iR2sy2eimPeDMuxsbm2YZk/tPmHzbZld2sF4VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211997; c=relaxed/simple;
	bh=z2OaGl7rSV1SIJGcdcuF+VJKVXWY6LrfNyhFcHPrWhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgiEJxScEdeZjyxF6qJt6NuciX+st7uBODNYOA6LOmIYsvCQ9mrtpvL5EVTjJbxpgDyFbcndqouCRE7zXl8QKJEWI71UWtUNB80FoSUaGo0AHDli1ksGO7eP8ceCXnHVGlD4wj404fK79Pkq4CaJdyOj/uLOgNY6kK9edEGRibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UM33K4xV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768211996; x=1799747996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z2OaGl7rSV1SIJGcdcuF+VJKVXWY6LrfNyhFcHPrWhw=;
  b=UM33K4xVmCkt4/+WleAlJpube1d4U+UomFgAwVLWHlT9C1SO0xfqOSjf
   AexIAonzdqPSAJDVfCCyJd2WjxhVA00/6aAFK52zpPXq2U5fTfSsipDOm
   UjiUNOtqcb2u6A40unvsWgM/pZZ57jLd16psz7sQ05zUeBfLWmsNgCd25
   sn4dLjAOQ99wVzKduKSncsraJ+7zvX/JngBv+1Rm5xVGwvfX8+iko2I5T
   wVm3xcPYgL/tnEJx5iuKL2e4Ot7kWSpvfzYFfg9aBW9G+aRBiybAK2bPM
   EwSexTay+fLiUWT4FTpaC+C65pJbpkM2WVVXdM/s9syCOksko5iZ+vfeZ
   w==;
X-CSE-ConnectionGUID: RK/2KW36RVCzOi8e89cVGg==
X-CSE-MsgGUID: kOJAd46mRn+DgYlveq2i7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218774"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218774"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:54 -0800
X-CSE-ConnectionGUID: GrDWqBxOSj2AzyUSSsfkrw==
X-CSE-MsgGUID: Ei88FoGQTcqvH1CLHGk5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743090"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:52 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 26522121EB4;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiD-0000000011A-4BZW;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 02/23] media: i2c: ov01a10: Fix reported pixel-rate value
Date: Mon, 12 Jan 2026 11:59:28 +0200
Message-ID: <20260112095949.3851-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

CSI lanes are double-clocked so with a single lane at 400MHZ the resulting
pixel-rate for 10-bits pixels is 400 MHz * 2 / 10 = 80 MHz, not 40 MHz.

This also matches with the observed frame-rate of 60 fps with the default
vblank setting: 80000000 / (1488 * 896) = 60.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index e5df01f97978..0b1a1ecfffd0 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -16,7 +16,7 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV01A10_LINK_FREQ_400MHZ	400000000ULL
-#define OV01A10_SCLK			40000000LL
+#define OV01A10_SCLK			80000000LL
 #define OV01A10_DATA_LANES		1
 
 #define OV01A10_REG_CHIP_ID		0x300a
-- 
2.47.3


