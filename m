Return-Path: <linux-media+bounces-29722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F97A8208D
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D9D17DE95
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 08:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2078825D52E;
	Wed,  9 Apr 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8/D534u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891C25C70A;
	Wed,  9 Apr 2025 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188529; cv=none; b=kkOFivyDjJMCgkE8hTWKF28ujHTHWigNy+Bu88gOQorVgYwkdo6H7ei39t5QjLFU4s2IijsmLjuCJQcSQ1llnoOFyCwF4ORlVeXrglPhfXjCXCwJbVzrvUaO2DN50Ufwr0qmJlkkyrHjQM7+IEvIdYNMv4e5+MHeEbVtvG6/+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188529; c=relaxed/simple;
	bh=IBK/44pCUknUI7340e51FZOISpygq0jQxUAUtPHigxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=opUr9spqlUzGU8Beyiox1+/h9YTHntkZmvhP0d9kKVBc2tPDAqegY5i1IkuMFOUPAvvhP5bOpE3qHBrcByHWdg9DoH8tnYhqOatD3+OGgiuCA7aMhLGNSVuXWzEkkCYnCuh4EAD5kq1v9IHWlyPmsAbgI+ViowK0+OQmKmFLy9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8/D534u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744188528; x=1775724528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IBK/44pCUknUI7340e51FZOISpygq0jQxUAUtPHigxg=;
  b=O8/D534uX3DRWmLh4fuZpTttR0sJzi5w7rekaX5ocophDUnCZlqG1vjr
   EQPWX8tgjNmaGaPaMyamiq5fcGdGYKhzlOYdwTuMC4B6+5tzHo+Hpi/W6
   V+BwT1Ajjr4b8oBL8jj40GLQaK1Cv9Au8FYh83PMovw51hsGbmue4Qdi3
   rJNCsv/AE9H+Jkjt7RfC9Y1cOqJWUKL0af6LUx+qb8tcW7fB2q/vs9lVt
   EvBvxNNB/dkSq7EukiW8MMv3hucxrPSuv3MP+IDLR9rSV59q9G+Un6nea
   Q/ehmVuvuFbJUB3NDXMLKW5+OCCtp9DdUD29L6g8GeuptT78PhqB39TFN
   g==;
X-CSE-ConnectionGUID: bmuq0zTMRJaHJsYcmbpC/w==
X-CSE-MsgGUID: 9i3cziwbQK+2X43Oo/CgeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68132379"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="68132379"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:48:48 -0700
X-CSE-ConnectionGUID: T2x8ijfPQhytSbG6yixSKg==
X-CSE-MsgGUID: R1G6awhDTeGhIuVwuhMskA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="132651111"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 09 Apr 2025 01:48:43 -0700
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
Subject: [PATCH v3 1/2] media: atmel-isi: use devm_kmemdup_array()
Date: Wed,  9 Apr 2025 14:17:37 +0530
Message-Id: <20250409084738.1851463-2-raag.jadav@intel.com>
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
 drivers/media/platform/atmel/atmel-isi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 0d1c39347529..a05a744cbb75 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1072,16 +1072,12 @@ static int isi_formats_init(struct atmel_isi *isi)
 		return -ENXIO;
 
 	isi->num_user_formats = num_fmts;
-	isi->user_formats = devm_kcalloc(isi->dev,
-					 num_fmts, sizeof(struct isi_format *),
-					 GFP_KERNEL);
+	isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
+					       sizeof(*isi_fmts), GFP_KERNEL);
 	if (!isi->user_formats)
 		return -ENOMEM;
 
-	memcpy(isi->user_formats, isi_fmts,
-	       num_fmts * sizeof(struct isi_format *));
 	isi->current_fmt = isi->user_formats[0];
-
 	return 0;
 }
 
-- 
2.34.1


