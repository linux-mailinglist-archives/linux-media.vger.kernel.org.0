Return-Path: <linux-media+bounces-12966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACF904276
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 19:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD9DC1F26589
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 17:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8931A4F5F9;
	Tue, 11 Jun 2024 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWxr0+Mf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871F43AD5;
	Tue, 11 Jun 2024 17:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718127257; cv=none; b=CoSPrEGIy6gqi7mp1bbO2PZS/0Tz+jGxpBKrdnDM7rtFiytKwTJqTfUxo6XiSC3JWKy9q/ECUkPw3bjiXjHXubwEPbk4gtenFA5/pez4v8rADUFCDFN3gGHuwiwJibh7s2Q6yqDBcEYQaIT7ck8AU0i/8zlJMa21ocN082RUwgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718127257; c=relaxed/simple;
	bh=IGWRkyXrapW7OPOE9BiYZCSGgeR9F5qaCexXoS2vqgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BROvmCZ3qIDsW6r7Q7DymJvWaFQoOI7mXAGHRJ3B5XqhVWwzjJuyYeDD/7jwNDMN42go4trT9NvqLH/Vb7ZcrLNf94AGoP2LGbBogXhJa69Zh3HGOn5gnsoJuBHN6RLQ1go2ZTzAOwfOj9Rzq3FZ5jFT25B+lF1R0yFeQHKAoBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWxr0+Mf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718127255; x=1749663255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IGWRkyXrapW7OPOE9BiYZCSGgeR9F5qaCexXoS2vqgY=;
  b=IWxr0+MfehaHIxuOjWMe69fO9ZqzV4rzujSkl9SUglZbvqjTsp8NY4wU
   SHUFwZafOFLtFkVLRyQCZcD19M/ocwPIMI10z90noim+kYzh2EO2Xe2++
   8YBSgtjyHOZDFt6u+FO43SdNfR57rtB+UWbR1Zd/u9AN6bDNKL4KvzDA0
   5jcufOhjel+O2/DpkmT62wYA7yptTySWyD9J8q4aUQclj938AugOnuqBS
   ysP82TPD5ihUyfvGm71dHvWDy59By9fz9reOqMVWlIXr4IdYeeduOKJiN
   uksP9mxTU3NJ3wozjZQowPri2CeaSKOknECCsNEoB9CizaSLwRhYnsYM1
   Q==;
X-CSE-ConnectionGUID: kGs3ls+oThWhMWdnkYiAXw==
X-CSE-MsgGUID: d0Rr2RmqTsG2cVjyV3EouQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18685823"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="18685823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 10:34:14 -0700
X-CSE-ConnectionGUID: DNfh+BcqTou8u9tShGZuKQ==
X-CSE-MsgGUID: Zb35i7RcREybUQmYmRkGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="39486007"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 10:34:13 -0700
From: Tony Luck <tony.luck@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v6 05/49 RESEND] media: atomisp: Switch to new Intel CPU model defines
Date: Tue, 11 Jun 2024 10:34:06 -0700
Message-ID: <20240611173406.352874-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New CPU #defines encode vendor and family as well as model.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Acked-by: Hans de Goede <hdegoede@redhat.com>
---

Mauro, Hans, Greg: Which one of you owns this one. Can you take
a look please. Let me know if changes are needed.

 .../atomisp/include/linux/atomisp_platform.h  | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 0e3f6fb78483..fdeb247036b0 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -18,7 +18,7 @@
 #ifndef ATOMISP_PLATFORM_H_
 #define ATOMISP_PLATFORM_H_
 
-#include <asm/intel-family.h>
+#include <asm/cpu_device_id.h>
 #include <asm/processor.h>
 
 #include <linux/i2c.h>
@@ -178,22 +178,17 @@ void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
 int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str);
 
 /* API from old platform_camera.h, new CPUID implementation */
-#define __IS_SOC(x) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
-		     boot_cpu_data.x86 == 6 &&                       \
-		     boot_cpu_data.x86_model == (x))
-#define __IS_SOCS(x,y) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
-		        boot_cpu_data.x86 == 6 &&                       \
-		        (boot_cpu_data.x86_model == (x) || \
-		         boot_cpu_data.x86_model == (y)))
-
-#define IS_MFLD	__IS_SOC(INTEL_FAM6_ATOM_SALTWELL_MID)
-#define IS_BYT	__IS_SOC(INTEL_FAM6_ATOM_SILVERMONT)
-#define IS_CHT	__IS_SOC(INTEL_FAM6_ATOM_AIRMONT)
-#define IS_MRFD	__IS_SOC(INTEL_FAM6_ATOM_SILVERMONT_MID)
-#define IS_MOFD	__IS_SOC(INTEL_FAM6_ATOM_AIRMONT_MID)
+#define __IS_SOC(x) (boot_cpu_data.x86_vfm == x)
+#define __IS_SOCS(x, y) (boot_cpu_data.x86_vfm == x || boot_cpu_data.x86_vfm == y)
+
+#define IS_MFLD	__IS_SOC(INTEL_ATOM_SALTWELL_MID)
+#define IS_BYT	__IS_SOC(INTEL_ATOM_SILVERMONT)
+#define IS_CHT	__IS_SOC(INTEL_ATOM_AIRMONT)
+#define IS_MRFD	__IS_SOC(INTEL_ATOM_SILVERMONT_MID)
+#define IS_MOFD	__IS_SOC(INTEL_ATOM_AIRMONT_MID)
 
 /* Both CHT and MOFD come with ISP2401 */
-#define IS_ISP2401 __IS_SOCS(INTEL_FAM6_ATOM_AIRMONT, \
-			     INTEL_FAM6_ATOM_AIRMONT_MID)
+#define IS_ISP2401 __IS_SOCS(INTEL_ATOM_AIRMONT, \
+			     INTEL_ATOM_AIRMONT_MID)
 
 #endif /* ATOMISP_PLATFORM_H_ */
-- 
2.45.0


