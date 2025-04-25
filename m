Return-Path: <linux-media+bounces-31051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66EA9C607
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487659A3A4E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD26258CF7;
	Fri, 25 Apr 2025 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAnqGwdz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8D258CD0;
	Fri, 25 Apr 2025 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577825; cv=none; b=dQCUdklkc8i7FXREC3xvIsA0rsh1EsvwPGhSTn9K8c6t2bjEHwEf68ssT0kjInYBqqZ1tW3REoNmB3L1iXTFRpIHMgN+RN4Rt5gd42Xx7axt9H59OyoSchli/KSzKV3xK8l1Pd+HaCUsYrOPsN1NJQdVK/R+yyS1LDFyygPyVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577825; c=relaxed/simple;
	bh=9j/wZiHV5GzB0EfuonP75IoTOMcnn5LfyjX7W37NjdI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NuCPAS/5DqIHUXiX/qfAjhiz0yV7NnzL0a4PjOO1GrtrEOZKezc/u/8AysrMCRcPwvVUrGRnFV+fzWFnf1YDnupT5yk8u5OYkoZiVLlr1CIgD91Q3+TZ1ix3k1b5us8K4h9/pTHZu4jRCduLA/mrlsbedORRJzthGLsgK+74qM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAnqGwdz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745577823; x=1777113823;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9j/wZiHV5GzB0EfuonP75IoTOMcnn5LfyjX7W37NjdI=;
  b=XAnqGwdzQU0RnPw/1DN90a5SxA+6zDLPUCC9+FK0yAOB/kk/2+PshS/+
   HnhAyJQtYtNBEDjcPG7OBmxxCwrMv/7/DmAxoLFI5lrXDYuaPEs9yYlQ8
   CBpdFHpMGwYZCE/wJZSN1yTma1XI/IG60muhigH4WXLBjVg0/MF4RpvG4
   chBo6iYLdG6tI/LO2VsMBbNPLUOkCPOd5G1jWKErMj0RBk5Wd/2aAyL6C
   JNOfTM+8x3M9LDF6RCcSaOEXUND9PanYvuqSQzC3Sjeg0TxlnOpDq9bOn
   GXMyGaib0oZj+avzL8uktd318Y2wDsv5th2NdpBXF4j8FIHEGoye1l1TB
   Q==;
X-CSE-ConnectionGUID: HLPZdsUzR8KSomo4xBZtJw==
X-CSE-MsgGUID: m5n3ygvUR0G8Bz6dIhkwgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47147111"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47147111"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:43:43 -0700
X-CSE-ConnectionGUID: UvTASx3WQpmTJjbrrS9Jdg==
X-CSE-MsgGUID: a4PZVrw0SYaZakpCKUX1DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132617973"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:43:40 -0700
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
Subject: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
Date: Fri, 25 Apr 2025 18:43:30 +0800
Message-Id: <20250425104331.3165876-1-dongcheng.yan@intel.com>
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
index 51b818e62a25..4593d567caf4 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -23,6 +23,7 @@
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
+#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 394975f55d64..efa3bc7af193 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "privacy-led";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
+		*con_id = "hpd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -221,6 +225,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
+ * 0x13 Hotplug detect
  *
  * There are some known platform specific quirks where that does not quite
  * hold up; for example where a pin with type 0x01 (Power down) is mapped to
@@ -290,6 +295,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
+	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
 		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";

base-commit: 4d1e8c8f11c611db5828e4bae7292bc295eea8ef
-- 
2.34.1


