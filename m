Return-Path: <linux-media+bounces-36539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4FAF13BE
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288C53BDACA
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C34264606;
	Wed,  2 Jul 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWhUFKOY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E8A255F26;
	Wed,  2 Jul 2025 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455299; cv=none; b=E3cyBHM+oVddEgVm0P6LBaafDjJi7j2SnsiFFofmuP8w0tPrckVPnnXqLyVEbhyCgHSMECyf4iSUQOoNQ5azc4CvBD0dRcxumpNge0mFd+otbd7ZrwdnelTGc3LWtF+rd6FLfdPRm6r+wAanITUgJI2zLAUB9Dn2yS8KAiyV9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455299; c=relaxed/simple;
	bh=1TV0LRwm4tjjlJIBEk16join8sXrFYi5VmJg1VzfVVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=gdXt0xxAq2VuUwPhlkR/QEUzILf1F9Yq1YvCRr7wKCtgnakhIAWQ7Fvj28+fq+DSLyjr23uaJxzkKIa2NBuuqRoX2mOJP0d7S9ll47JOCM8jqPzx1zGQUKNYjwWZvZuzbeVD9q5EMoVnaWsAHJ0eZxzvsKeDa5SgCLDkAwCiPW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWhUFKOY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751455298; x=1782991298;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1TV0LRwm4tjjlJIBEk16join8sXrFYi5VmJg1VzfVVQ=;
  b=hWhUFKOYgQNmw4Dd4hc0cz+U8JQFMJ0eV0i3t/MZK9F1NamWvmEJPUIE
   EZXKdso/PbmtXDN95I8cKZjUdn4vR0+cXjHuKYXYUi8GQADPYVOQFYgj5
   IU3O9BoX5tCRtyNKRqZO9ZTY+ozGwzX2jdE2zKCjlyAsiOkh+0PBJKtrb
   0PbuioQOEL2dLYkWLumCvYewgaXXbyiY2ZJ3leu6VOad10o7GGm3CJA58
   JBzvWmM0Lzg0/mTET8lDcqmIdMk+it/xujIw77fIGrAa9ihb4DvNVVvNR
   XbIz4U22iu++x7kiY2tHeh0ulzACBUI7bTzeivDBeVU5UmA3uoBWxWKeP
   A==;
X-CSE-ConnectionGUID: 8l0ejVCIQrSFk7AgBk0G5g==
X-CSE-MsgGUID: xPbuhVzzST+NUdjTqMZi+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53460214"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53460214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:21:37 -0700
X-CSE-ConnectionGUID: FfBaxubCQK+4AXnrF7pytA==
X-CSE-MsgGUID: klyEkbgvQ+mRV2N/VG0aXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="184995657"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:21:33 -0700
Received: from svinhufvud.intel.com (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 8FB9344390;
	Wed,  2 Jul 2025 14:21:30 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hans@jjverkuil.nl,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	bingbu.cao@linux.intel.com,
	dongcheng.yan@linux.intel.com,
	hao.yao@intel.com
Subject: [PATCH v4 1/1] platform/x86: int3472: add hpd pin support
Date: Wed,  2 Jul 2025 14:21:30 +0300
Message-Id: <20250702112130.858536-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dongcheng Yan <dongcheng.yan@intel.com>

Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
being received. On the host side this is wired to a GPIO for polling or
interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
lt6911uxe and lt6911uxc.

The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
here as well.

Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v3:

- Rebase due to commit 53eddae9af0c0b46f9c77a02d23c21c1aa824739
  ("platform/x86: int3472: Move common.h to public includes, symbols to
  INTEL_INT3472"), moving the new GPIO PIN definition from common.h to
  int3472.h.

The intent is to merge this via the media tree, with Ilpo's ack.

 drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
 include/linux/platform_data/x86/int3472.h     | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 4c0aed6e626f..bdfb8a800c54 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -193,6 +193,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
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
@@ -223,6 +227,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
+ * 0x13 Hotplug detect
  *
  * There are some known platform specific quirks where that does not quite
  * hold up; for example where a pin with type 0x01 (Power down) is mapped to
@@ -292,6 +297,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
+	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
 		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 78276a11c48d..1571e9157fa5 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -27,6 +27,7 @@
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
+#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
-- 
2.39.5


