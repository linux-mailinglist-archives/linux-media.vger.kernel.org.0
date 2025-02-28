Return-Path: <linux-media+bounces-27194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B800A4924E
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2B91893BAC
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B32B1D61B9;
	Fri, 28 Feb 2025 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jk5iztb0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E01D5CFA;
	Fri, 28 Feb 2025 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728225; cv=none; b=AYlC0qstNz7e/mL0DZH/jodyNTJTlsTrn2d95igjdRe3WkoQdxcZU/K7VbawKbJI5IApcXwPbsx5mMHE9442PHygrUFnQtd9YrOCf5iAcCnPmx8SQBdtnQhEh//gG6LbtKvKw8N1SHfLAyloRlZIKiNsb4qcNBW6IZlwRapEqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728225; c=relaxed/simple;
	bh=B3xrc/pLQJ5ss49IeFjXDa74Yu0HGjjmnZRSh6JToXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FVk+7/5ezFKTRajcQObz37GNIdGUYX20eH36TgWZ1e08v7lkNRVQM8TW6MNgjHvI27H1bHKSxjTscdYJa4iWhs94rHnC+5ar4t36bUmww3wNt8aeQmGG32+agsDUhEEjEvdt4ii5DLUwWlb05s3c5h9nVZa5x8volqL+2VIDyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jk5iztb0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740728224; x=1772264224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B3xrc/pLQJ5ss49IeFjXDa74Yu0HGjjmnZRSh6JToXk=;
  b=Jk5iztb0sNQs/zv9VPliHLXaeoR1oMvg28K9JUyY+/ewxWhMnXwp6a4o
   l6E2lPkRHZSYJGlc7u6sSbWpSX+cU47MIXhsjoCLksg9yiq907NLUgm+A
   tAh3+lEinrIG7n9+7zToZ4Mq8BcEDJm+InJawyTvsgMoF+Q4w6qC0FfZM
   csOOsslApbz23qR38XBddTtiZTPkWWPXHXfuX01pF7LbmKnr7wmLgJ3ZM
   nlzqyjlRHdETyD7SSn2EhO6ZtJb+u4TDAlso8ZfnkSlcxRR9Kb3GkptOS
   CQX4szJlHNDnc6Ayl0D22KEZanhTDWNnOc4ox8JYtQFe7ihlpSE7NLv81
   w==;
X-CSE-ConnectionGUID: 58XF2kRXTq+3R6BY9APTPg==
X-CSE-MsgGUID: xYfbpercTfmpoOBqyFdhSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45298241"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="45298241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 23:37:03 -0800
X-CSE-ConnectionGUID: 0+0b0zieSpmduUXST7b5Yw==
X-CSE-MsgGUID: hocvvxIlRA2r1MsmobOkrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121388014"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 23:36:59 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: eugen.hristev@linaro.org,
	mchehab@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	andriy.shevchenko@linux.intel.com,
	sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/2] media: stm32-dcmi: use devm_kmemdup_array()
Date: Fri, 28 Feb 2025 13:06:49 +0530
Message-Id: <20250228073649.152157-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228073649.152157-1-raag.jadav@intel.com>
References: <20250228073649.152157-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use devm_kmemdup_array() and while at it, make the size robust
against type changes.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 9b699ee2b1e0..eedc15b30edc 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1682,18 +1682,14 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 		return -ENXIO;
 
 	dcmi->num_of_sd_formats = num_fmts;
-	dcmi->sd_formats = devm_kcalloc(dcmi->dev,
-					num_fmts, sizeof(struct dcmi_format *),
-					GFP_KERNEL);
+	dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
+					      sizeof(sd_fmts[0]), GFP_KERNEL);
 	if (!dcmi->sd_formats) {
 		dev_err(dcmi->dev, "Could not allocate memory\n");
 		return -ENOMEM;
 	}
 
-	memcpy(dcmi->sd_formats, sd_fmts,
-	       num_fmts * sizeof(struct dcmi_format *));
 	dcmi->sd_format = dcmi->sd_formats[0];
-
 	return 0;
 }
 
-- 
2.34.1


