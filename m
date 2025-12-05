Return-Path: <linux-media+bounces-48312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30BCA70E9
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 11:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACFFB322B931
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69262FF675;
	Fri,  5 Dec 2025 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+qZFeQz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5392288525;
	Fri,  5 Dec 2025 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928549; cv=none; b=a+NGHYMq7XXVrGFXFr5hospWipQQ5RPcBZSY4Hhe8nZsy9Qj/9qd25rU0fATgHfCjtWJzFt7lUlFDgnh/1qkh8wdkzLrTbguI7+DRYwCwAgEEbhWIx8ivRvHBR/3mqEQ1kf/i5ZSrK5E0jt1Gunkb4SDvLNNh52gTvQqQWkM1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928549; c=relaxed/simple;
	bh=0C0NEZURzWaAyTLao/6+JHtiXOYQlFM1EqnBZEfHW9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4+lb7KL+T87LN1I8q3G+mNzG2YhrhSNz0VwFoOYnE2yWi7oENtG58DUuchAo6HQ/pMEU38VXJDTAy8lxHuqhc/ycgkKDNGsPvKjTiYkqJkGKNCOSoPJD9tinKAoCbhYyaUmF2aE6Rviaa0SIS0WsoMVMUH+QR/N3nsdbSUSQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+qZFeQz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764928544; x=1796464544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0C0NEZURzWaAyTLao/6+JHtiXOYQlFM1EqnBZEfHW9g=;
  b=C+qZFeQzVvmY1m8rRBY7N3jj41WFsHpj6LCeoKJm/KHzfcZPZEatj1FO
   EMtanAEQ2/6j1/onj3Rns4ADnnIaZsBLXPMZyqkNJ2eXy9Viyja4hrJAa
   oO1wvkXv/iPPYz99fqH7gS/fflDnJSjgKxmjBZj9JArh5DZDQfzgpqtv6
   88tpik82cycyVdIiYHX2fxUhK410O3ucq++74tP4+gCkwP+h8z8SgBuW7
   /ZpGCUkbEkW6Ot8p7uxSBRZ9c3Ei+V7qDbcQaiu2xgzMp7+D4G0QTka51
   eN72bdnI+G+KnpMgNvlJ7DYblCpMFMS0rGImBd8xbnlp/qNNVSvYAwZxe
   Q==;
X-CSE-ConnectionGUID: HXGOQEjLS++adLqdP0wR4w==
X-CSE-MsgGUID: c3H6/3UsQOah6s8w6Do5Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70579915"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="70579915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:55:34 -0800
X-CSE-ConnectionGUID: O+qxGtscSjWdRZ+27ncrpQ==
X-CSE-MsgGUID: /N4MfqS1Qga8rWlbvxlq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195689408"
Received: from haoyao-desk.bj.intel.com ([10.238.153.154])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:55:32 -0800
From: Hao Yao <hao.yao@intel.com>
To: platform-driver-x86@vger.kernel.org,
	hdegoede@redhat.com,
	dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	ilpo.jarvinen@linux.intel.com
Cc: bingbu.cao@intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>
Subject: [PATCH] platform/x86: int3472: Use actual clock frequency for DSM method
Date: Fri,  5 Dec 2025 17:51:17 +0800
Message-ID: <20251205095525.1264971-1-hao.yao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The third argument (args[2]) to the _DSM method was hardcoded to 1,
which corresponds to 19.2MHz. However, this argument should reflect
the actual clock frequency from the sensor's ACPI data.

According to the DSM specification:
- 1 = 19.2MHz
- 3 = 24MHz

Read the frequency from clk->frequency and set the DSM argument
accordingly, with 19.2MHz as the default for unsupported frequencies.

This ensures the sensor receives the correct clock frequency as
specified in its ACPI configuration.

Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 9e052b164a1a..0502876284ee 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
 	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
 		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
 
+/*
+ * The PCH clock frequency argument to the _DSM method:
+ * PCH_CLK_FREQ_19M = 19.2MHz (default)
+ * PCH_CLK_FREQ_24M = 24MHz
+ */
+#define PCH_CLK_FREQ_19M	1
+#define PCH_CLK_FREQ_24M	3
+
 static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
 {
 	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
 	union acpi_object args[3];
 	union acpi_object argv4;
+	u32 dsm_freq_arg;
 
 	if (clk->ena_gpio) {
 		gpiod_set_value_cansleep(clk->ena_gpio, enable);
 		return;
 	}
 
+	switch (clk->frequency) {
+	case 24000000:
+		dsm_freq_arg = PCH_CLK_FREQ_24M;
+		break;
+	case 19200000:
+	default:
+		dsm_freq_arg = PCH_CLK_FREQ_19M;
+		break;
+	}
+
 	args[0].integer.type = ACPI_TYPE_INTEGER;
 	args[0].integer.value = clk->imgclk_index;
 	args[1].integer.type = ACPI_TYPE_INTEGER;
 	args[1].integer.value = enable;
 	args[2].integer.type = ACPI_TYPE_INTEGER;
-	args[2].integer.value = 1;
+	args[2].integer.value = dsm_freq_arg;
 
 	argv4.type = ACPI_TYPE_PACKAGE;
 	argv4.package.count = 3;
-- 
2.43.0


