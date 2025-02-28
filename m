Return-Path: <linux-media+bounces-27192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8012CA4924A
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE013B5ED0
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117951C7B62;
	Fri, 28 Feb 2025 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9h6sT/j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1FF18CC15;
	Fri, 28 Feb 2025 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728217; cv=none; b=ePdL9kW2u/4MjyhFrmNZWEnnJnERMUIiLIquudNDlLDCQW8Gl31Glg/L4nt/VynrMhDKdhaMlSzvChx4Ml5TuNA+D/IzFda60QfbqGI/49fPqmupHO8bmGHPWgyjWv0Oc0FHRT+mX8H/HNfnaCyEyPFmXikKChIH5T3MJyF/s24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728217; c=relaxed/simple;
	bh=SKDxRfW4k5frbtoeLf8E5TyWPlD3BLWp7GWd3rnMaBg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MVt7AqLfJentWJEz+BrysnAFDCnck3+hm9j0nXUl1ZaD8Kv1xb216Wr1h7vx9BBI34ZrvcQV/mw+qDQkXmKYMR6acNnzy9AR04pG52J496OOgHhKxzOTp9w1awSHaQl7/yrebpOvLswcMAzqS8yJVF+Fg0Lo1aUxmaPtxciPqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9h6sT/j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740728216; x=1772264216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SKDxRfW4k5frbtoeLf8E5TyWPlD3BLWp7GWd3rnMaBg=;
  b=e9h6sT/jWqm/bJZqIjWK2ejZVRJp2e/Z3gTtZTG2+WEt9jlwma/Eqdsl
   TEUu+HxeZTVwVlv2c5++hL3ZQ7U8uKEHYr0z1ijcsIFeM3GE4tuTWV/kP
   lnxz9y4zBbuoyQPFQhsb6oLX2OK8fc0s009E3vUIRbwxwn5pr98snuplb
   Y0hl2PrMIDtN+ButDkrQtoKigR8dBPcs2e+5Jdk7IZYmoixBokrW2DcUJ
   Z0/KfVB55TrNnmJucT46Xlz5S9ZZMH4zZ5FEE/rtVELCz0PjwK1NFWoQK
   d+qfgfdJWsBG/igErLlqhKB/FrTyc8R5uWDYFhQKVMJAyfWSY1OcrtHJx
   A==;
X-CSE-ConnectionGUID: ZIM4aXoRTQ+bSUA3F50PJw==
X-CSE-MsgGUID: xHQLoFI5TByuilCkyu7Mng==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45298195"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="45298195"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 23:36:55 -0800
X-CSE-ConnectionGUID: u81yDhLpQ9yGYbfPOkE23Q==
X-CSE-MsgGUID: EuhLdn5CTBq2/YdRUv3c4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121387972"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 23:36:51 -0800
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
Subject: [PATCH v2 0/2] Convert media drivers to use devm_kmemdup_array()
Date: Fri, 28 Feb 2025 13:06:47 +0530
Message-Id: <20250228073649.152157-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts media drivers to use the newly introduced[1]
devm_kmemdup_array() helper. This depends on changes available on
immutable tag[2].

[1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com
[2] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com

v2: Split patch series per subsystem

Raag Jadav (2):
  media: atmel-isi: use devm_kmemdup_array()
  media: stm32-dcmi: use devm_kmemdup_array()

 drivers/media/platform/atmel/atmel-isi.c     | 8 ++------
 drivers/media/platform/st/stm32/stm32-dcmi.c | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)


base-commit: b8c38ccb2ca52b9a38cfeb9f89abab5d6e713221
-- 
2.34.1


