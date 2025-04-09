Return-Path: <linux-media+bounces-29723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F385A8208F
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4429461547
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 08:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862C125D556;
	Wed,  9 Apr 2025 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0sfjtiN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0725D540;
	Wed,  9 Apr 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188533; cv=none; b=tdxe/G/BNmdaAR4fGnLod4+ykykPb9vMPWHzaqnPylTA26tRObiS7aLMxGJnQVpU3mqimrVb5O2qcuao9LCcbvf1A1DYSSWY0KaEaqr9R3/XQ1m6YyuAMrevxnJm3yzwZgLe0bUR7F70Xxy70fDYZrLR+tcUA9uAJLzcqzGK5VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188533; c=relaxed/simple;
	bh=FPAejTZfx3pIFkrSptuE3yJ70O3m3wZWj/538sY1Ruc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hDJ2dWUw2t1hQDAZOqf6/kDew5urSUiNZsK5PaNhcCOnlCXZ1qU7GIclt/aMpk8MJBekUotFk/G7HL2hMABAwHTy3b3sPO2z0nqlX+kDVCnTDgtQrYd8jCflAL5c+pe4L0plqW6ROz1F4zgL2yXbduY54gvJKEWUUEGhLKEZO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0sfjtiN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744188532; x=1775724532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FPAejTZfx3pIFkrSptuE3yJ70O3m3wZWj/538sY1Ruc=;
  b=K0sfjtiN2nR7nsOVf+9eBmjj3+Ty38W17ot9EFVTFwP5mMMl5UKKAYe+
   9Q9qeVSYrjgIx0jaBozbZ/YDADVKsRwTyehbjm9zGejp9rK8zHVXi8e7+
   FkJhFveqbfPUskf4h3FNif/ral2sSzWPwBC6yudYcuAY8XPrr6/wTZGs6
   SqaXo96Zj3wLO7iXDRajHPC80mjMp8kvgrGouGVxkxLG2Ut6P2CGcFabJ
   Fgh+MJ75imwBmNaDfCJ/m/Aa621Vx76L5TueeTTtkba+ZFxaPvozxOIgI
   0236211Ct3G/9+HTqm1yppYRfMm7PsLwYVaHaVpz0v9EU1x9/J8CKdPwc
   Q==;
X-CSE-ConnectionGUID: ZwDq+J16RFCpk6njg5Mxmg==
X-CSE-MsgGUID: DJTQkwg8S56OjoXlf2f56A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68132398"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="68132398"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:48:51 -0700
X-CSE-ConnectionGUID: ggd2NUjXSi6pFmS+/eXNOg==
X-CSE-MsgGUID: oqOvmpilThW/HtyvRo6DwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="132651117"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 09 Apr 2025 01:48:47 -0700
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
Subject: [PATCH v3 2/2] media: stm32-dcmi: use devm_kmemdup_array()
Date: Wed,  9 Apr 2025 14:17:38 +0530
Message-Id: <20250409084738.1851463-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409084738.1851463-1-raag.jadav@intel.com>
References: <20250409084738.1851463-1-raag.jadav@intel.com>
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
index 9b699ee2b1e0..ba77062357eb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1682,18 +1682,14 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 		return -ENXIO;
 
 	dcmi->num_of_sd_formats = num_fmts;
-	dcmi->sd_formats = devm_kcalloc(dcmi->dev,
-					num_fmts, sizeof(struct dcmi_format *),
-					GFP_KERNEL);
+	dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
+					      sizeof(*sd_fmts), GFP_KERNEL);
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


