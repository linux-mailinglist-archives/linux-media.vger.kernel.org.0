Return-Path: <linux-media+bounces-29721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93433A82087
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63827175651
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 08:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B182325C713;
	Wed,  9 Apr 2025 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iw76TdHG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D525A338;
	Wed,  9 Apr 2025 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188527; cv=none; b=miJQh3KRlRpOcmAPGQNTrAoxxRpl8DTwwLfVgyss5PPn+JSIy3MA2AE4xIubsNSccJVx4SxKPEbRSgN0DWCfLk1WsMkNjlWcMqPeym+eTNDS1p2LNomECddMQOAyMHec15q7AyaoT84rE6/a53BQt+vkNMfLCohYFWuAj4WnfqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188527; c=relaxed/simple;
	bh=yQihmqRrmt7RL3GT0J3jyJr6q5ytJs4FwS8DEgyTgAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Me9hFbuQFixIQaUHbCfveYc/NwS1nZ4PmThiVTYOWdSVyL/sbKP7xV9mlex0ynAvcWpvpBXc4W+cVoPAxciTYfOXWCM0RyAWq8LkiWHYGitOHldJKgcZysydIelKPcQJoDBKEmKVs0BM3I8QeX2iCPXgItIJz/ZW8QVA+bhJQxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iw76TdHG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744188526; x=1775724526;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yQihmqRrmt7RL3GT0J3jyJr6q5ytJs4FwS8DEgyTgAo=;
  b=Iw76TdHGft1AxGmqfvRYu4NSyoK3Fc8Q5esUaPxulMNgcCRNKeHAcuOO
   QiQtwfCcAcpBftAuVomphdexAuu/W2f49EdqC4wefQ5+H+0DJHEFOJxKL
   sTxH409QxELbI7l4vKBzAYjdZDVxJB024ZJt0yTS2Tycs+gyMPGCdtwuk
   m1bgrfdNOfPnN++9H3gedahsrhN+O+kzNaRH+Dgwk91p0Tp50yRCPBeaI
   ePUHQ/0xGydQ5wiv7E4jxaG7YJBZrqTXDBEsIQo/s/8rbbtezGAGW6j7J
   +NCYYoaoVmix/63FTgDriAX221ecbfwC48JKJWG4QoLf0yvtSHwf3bRIL
   w==;
X-CSE-ConnectionGUID: DbMq50YrR7y73Qc1dkVbvA==
X-CSE-MsgGUID: waFrY2McQYSQ45kWI+uRJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68132361"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="68132361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:48:44 -0700
X-CSE-ConnectionGUID: 38t7iB7FTJmPy3lrc1M3yA==
X-CSE-MsgGUID: Lt6ZZWaCQ0yA1xhCN23/Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="132651104"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 09 Apr 2025 01:48:39 -0700
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
Subject: [PATCH v3 0/2] Convert media drivers to use devm_kmemdup_array()
Date: Wed,  9 Apr 2025 14:17:36 +0530
Message-Id: <20250409084738.1851463-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts media drivers to use the newly introduced[1]
devm_kmemdup_array() helper.

[1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com

v2: Split patch series per subsystem
v3: Use *array instead of array[0] (Sakari)

Raag Jadav (2):
  media: atmel-isi: use devm_kmemdup_array()
  media: stm32-dcmi: use devm_kmemdup_array()

 drivers/media/platform/atmel/atmel-isi.c     | 8 ++------
 drivers/media/platform/st/stm32/stm32-dcmi.c | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.34.1


