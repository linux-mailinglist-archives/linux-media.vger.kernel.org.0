Return-Path: <linux-media+bounces-48368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F022CABFE1
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 04:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D6A1301B4B9
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 03:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA84276050;
	Mon,  8 Dec 2025 03:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvFsv6bA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E8E17BA6;
	Mon,  8 Dec 2025 03:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765166131; cv=none; b=brQpwr8vD/UzSPPmA4KnvdlsKymrUjDy78G4rOY5gytNMUSZH1zYy7RnkgLR8UPMBOMwqS4Dlq6FQyQ7U/BwQLbncxkb48zDClYkdl7fc1EcNvu5iFpv/GE81G3WEgmiAoVH42xLa70YObD3cOSeLDU6GvX1bppYQZt921hd2t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765166131; c=relaxed/simple;
	bh=789ZskRgL8ZtBP6mtz2KiV8Gpcmeoht7yM4AXyKVD3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jqBWa50soBYH9EDqiLoW7HrA9ZpuIS7vafYHk7bKHDieb2t3Mh63LiH4qKHA+lb/vBpGzmnDp+l/Mi2Xjk5HCr5PsQS6aJFWnNkVQ9CtXroOQ0Zw6mQicSFlwLycKSkmClZ8BUWs9QXEn06BoDEwCK5UhhXrSH4sXbZUB5t+S7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvFsv6bA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765166130; x=1796702130;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=789ZskRgL8ZtBP6mtz2KiV8Gpcmeoht7yM4AXyKVD3Y=;
  b=WvFsv6bAQTQ5soXtXQdTHHSfyqU9g2wDcog+h6gEupeq00pbPNmA+o4E
   HDQrFpQJpRaurkPNbrCsIUDt5Qi/gO0PZM+SjteGISdEInpIRf/Qe+vwu
   luwhDGsw9CKq+slubooXyXQKft986qmslWSi6jkI4s3SVALKeivSNFpqG
   vYVSyTSqQHYT3O7HHzAuLosHigH6SvNfFzihEOofLawVnmVjbWxY0CnME
   U8AsRZkl2S647NiQPpwzqHGNmrZ0pT9V1wBGflJvbmzdsRgAnDqSwD1s3
   qKopfja8nAQnGHML/oVSwD5pY/+X85bOFX9cXZVrE0oYTqHCE86+kLb3o
   g==;
X-CSE-ConnectionGUID: aLp10J93T162HvPN9t+QoQ==
X-CSE-MsgGUID: Zq5sy9ODTNyMVphtz0xi5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84708773"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="84708773"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 19:55:29 -0800
X-CSE-ConnectionGUID: k77uShjqTa+xgo8lb+B3Gw==
X-CSE-MsgGUID: PY8kX5slQwSWddCRfXYLmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200745441"
Received: from haoyao-desk.bj.intel.com ([10.238.153.154])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 19:55:27 -0800
From: Hao Yao <hao.yao@intel.com>
To: platform-driver-x86@vger.kernel.org,
	johannes.goede@oss.qualcomm.com,
	dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	ilpo.jarvinen@linux.intel.com
Cc: bingbu.cao@intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>
Subject: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Date: Mon,  8 Dec 2025 11:51:14 +0800
Message-ID: <20251208035122.2147678-1-hao.yao@intel.com>
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
index 9e052b164a1a..c834fd59ec0c 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
 	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
 		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
 
+/*
+ * The PCH clock frequency argument to the _DSM method:
+ * PCH_CLK_FREQ_19M2 = 19.2MHz (default)
+ * PCH_CLK_FREQ_24M = 24MHz
+ */
+#define PCH_CLK_FREQ_19M2	1
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
+		dsm_freq_arg = PCH_CLK_FREQ_19M2;
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


