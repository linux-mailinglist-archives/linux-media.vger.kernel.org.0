Return-Path: <linux-media+bounces-31046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 760C8A9C4AC
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A5D4C4E08
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35FB23C8AA;
	Fri, 25 Apr 2025 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9t6afqT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C1223BD04;
	Fri, 25 Apr 2025 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575674; cv=none; b=V8Fzl0nFp8ITDfYjdvw8d6LJfgMMPduRif+P62iDe9EzMkVWYZdU7ZU/bcoiEaYLYTOBi6n53Xgqpot9Ix1NkyvfWeCJfQh2OnqPtVpzvcu78IWdVC2tuymFxJUEBOaIRoTrX8GR6EQV8QD3zgkyE6wLzW0VZaNAnmpR48aezAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575674; c=relaxed/simple;
	bh=pgecTmA2OmbNmIV5eD1rIXYY2BfQLE0mpXVqLlAgEPg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GaHf2dnuq7rJUWICdPnYqmHNhezGrYWHUHeuUvHfed7AGHMZqBiy6CGvJgHqeEen1ZEZWYuDvNkPkl4coFmMDx0YIDRfSEGh52wvqhNOCVjZpMOfn6/9r5ihofI7KeawESPU9TkWVsdmGof0Z51PHCIJkAABlb+1mcSUffhYMPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9t6afqT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745575672; x=1777111672;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pgecTmA2OmbNmIV5eD1rIXYY2BfQLE0mpXVqLlAgEPg=;
  b=Q9t6afqTUhZjFGvvHfMX/wa0OLzBwOyPeBaJizWOVgdVXdo1zecD5E6j
   6sjiKxiRL3Qq5sZcFJHxT1XmNicR7cEf0fg21a1T1SFtHf4KxjxuhHCVs
   TcLip9FcpDTFZU8lm/Vjq/h3lz5kghPrg2t5zwSMk4t9m68mKty+NNXd3
   lUqLzElf6wO0zNMT9v2cFvO5P2iUU7wOOn1Zx5JQoIRJBNVAbaMPfuoKf
   tqzf74Prqu5sWEVLaVyactBWjrFp8GhpQxRmQ08UcgCgVysdGxnIhNhEK
   BZLGp52EcrPQbnJVn/2OgVlPEgnXRblIn4ImaAlhEu4BQtwYk2QQylQvE
   w==;
X-CSE-ConnectionGUID: VP2A88dzRaKqo321hfwoDQ==
X-CSE-MsgGUID: oEwT3UjDRe+d2ZdFi5WgPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46353283"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46353283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:07:51 -0700
X-CSE-ConnectionGUID: Zl5t5IzOTzaweeHdKB5o/g==
X-CSE-MsgGUID: tb8Od3EdQWOPVlzDEg8muA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133848657"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:07:48 -0700
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
Subject: [PATCH v2 1/2] platform/x86: int3472: add hpd pin support
Date: Fri, 25 Apr 2025 18:07:38 +0800
Message-Id: <20250425100739.3099535-1-dongcheng.yan@intel.com>
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
index 30ff8f3ea1f5..26215d1b63a2 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -186,6 +186,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
 		*con_id = "privacy-led";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
+		*con_id = "hpd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
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


