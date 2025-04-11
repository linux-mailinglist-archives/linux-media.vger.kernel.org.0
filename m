Return-Path: <linux-media+bounces-30008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448DA8566C
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 10:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E340B1899E22
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 08:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E86296142;
	Fri, 11 Apr 2025 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQ5/rFns"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A641290BBB;
	Fri, 11 Apr 2025 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359857; cv=none; b=iOH5tkqHkT9QjhnlwN4Fn2VRBXcu7NCUag6xeEEVWiMLvR51j+T+7RzBFFWA2/KDcEawhcWyyAvGMPZ2aq/qw41zc/E434OYCDQNRlQREc7prES7J2i+fkK+qrwKVvc9bzKuUk4lqT+iGSbvsehf2eR7DEiXcDdCT5Gx6ihwzuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359857; c=relaxed/simple;
	bh=g3WW/mto5MB7fP0Ge+vEvn6XEOVlZ2iYfecMEQhWjcs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LYzNOijNjtBEFjNtcg+VSVxDUjbtBNAlFVau00O8hrftZB2RWu9A8aW37VWBtnv4xxTIKz/kiVPgYOX3NPBeFWZKujObkwyqXTiBCbH6tGpn6l1SoHev/Be0SQ+dqOJELUfVXM0b6MOzA/Z6ujSLtsX4YJ5HPclFM237kV+6VU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQ5/rFns; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744359856; x=1775895856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g3WW/mto5MB7fP0Ge+vEvn6XEOVlZ2iYfecMEQhWjcs=;
  b=LQ5/rFnsqQsX4RfMd2jLLwCoGM6zEXfR5KoqkP5fa+A5CziRQmfIqBhJ
   o22OZ48AvrlUjtAWuEqcpVj4LBOt/7fHGIdE09c4klCP5mOtRjJxF5knc
   ah6p9eivfFr6ikkcYct/YV/cIvxrScMSW4K909g3NhnKGh95ExcfK87sy
   2xTK7ltmCF+uUw+867CxPT9dbeZeBmFI3DwHpFiRjReCVdvZg0WeA4S7Z
   sLce7kaf2WE2KW7yclMw6tTjlkbrK6FpS/f8jjtA18bd6E+qLknpRlz7f
   Pyjz2Uf8aVFlnoUcpv6y92aEnmDJDrYUNI/VcmJD7iBY6930rO/ExEDls
   g==;
X-CSE-ConnectionGUID: MK22dGo7Q0SSidBXuKtK+Q==
X-CSE-MsgGUID: 1dyuIMr9RFOxiO/IONcrlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45615354"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45615354"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 01:24:15 -0700
X-CSE-ConnectionGUID: 6NNvXjggTKSPOfQtZlK95A==
X-CSE-MsgGUID: +f1pDs6UQQ6gAcP3FcjCVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="133238867"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 01:24:11 -0700
From: Dongcheng Yan <dongcheng.yan@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org,
	dongcheng.yan@linux.intel.com,
	hao.yao@intel.com
Subject: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
Date: Fri, 11 Apr 2025 16:23:56 +0800
Message-Id: <20250411082357.392713-1-dongcheng.yan@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
being received. On the host side this is wired to a GPIO for polling or
interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
lt6911uxe and lt6911uxc.

The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
here as well.

Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
---
 drivers/platform/x86/intel/int3472/common.h   | 1 +
 drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 145dec66df64..db4cd3720e24 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -22,6 +22,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 30ff8f3ea1f5..28d41b1b3809 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -186,6 +186,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
 		*con_id = "privacy-led";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
+		*con_id = "hpd";
+		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;
+		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 		*con_id = "power-enable";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -212,6 +216,7 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
+ * 0x13 Hotplug detect
  *
  * There are some known platform specific quirks where that does not quite
  * hold up; for example where a pin with type 0x01 (Power down) is mapped to
@@ -281,6 +286,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
+	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
 		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";

base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
-- 
2.34.1


