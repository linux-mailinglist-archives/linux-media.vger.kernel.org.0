Return-Path: <linux-media+bounces-35369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB715AE0C37
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A3703B85E9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439CE28CF74;
	Thu, 19 Jun 2025 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFQCkQvu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7471D7989;
	Thu, 19 Jun 2025 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356012; cv=none; b=KHKxe6cdY4O/6viEt37sNjkeMG3bh29AIMB7zcqBgHEGAPHyi/D2ufrA00QD0KPTbmd0qbGHf9lS5l8LpUOCNnCDJDtUzWlWOT/mBKuTXrTtinod5dlIdLvD4aEocYl5T8D9WDy+VrVWTXFWf9dul4ywPC53oirSQksEpmk0cuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356012; c=relaxed/simple;
	bh=v7X8HdeLIXf1lLXurUdqnhMFgfFuJRcw2Eza4no2QFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JaJ1V1WxpvZAf8lhc4KoElxlA4kvkd/+0e8Isu0zIMnA6ksiCOZO9uKFuae5X0qEruAEYabZf8uWidcpYi+PJdABugAz8Nnw167WZqfrAuU3m+E7h7IbQTSch6KcYJ58Yjdb5VTApBXiVa6J4C/2AJfa8rfD6zAWcb7QVzcuq40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFQCkQvu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356011; x=1781892011;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v7X8HdeLIXf1lLXurUdqnhMFgfFuJRcw2Eza4no2QFk=;
  b=kFQCkQvu0VeRjuam+TtpUbTLxsCh90wXVAWSTDw4nD9NzxMrBfMpSHht
   S75AB4Squ2J4x6cTPFpI4n3PtcYt/MXc9ho5DtekS09tmnZ96z+Yy7OVK
   W7M8aO7gtGu9swGXJwLT+43yBvSm9C3cdElNmgcnf6FgGaLImzX9+HxQp
   XTXLKa1bYsD5lxw6AgN9kvik0UNzf8nZCI4R+6CK/4DLrNdRB0yVHGMwT
   zI7j65SCkGHQSW6HL8n/8Ab5x6Y2fq/PtXRtmqUAstzv5Q0FGnjNIXMLg
   uhX2LkSglcYgAdQMNxmJmDcNl0JfAqubIbIp0JWPu3/jeCMSf/rB59vc2
   A==;
X-CSE-ConnectionGUID: 5BKEFSBeQL2ifdHQhF74ow==
X-CSE-MsgGUID: 1o1StTIGR1uAA48g86jXuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047647"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047647"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:09 -0700
X-CSE-ConnectionGUID: ITMXr5AyST2GOQ2QZabnHA==
X-CSE-MsgGUID: N0KXH/keRMGK9OSaeK9YiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919210"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 10:59:58 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	prabhakar.csengg@gmail.com,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	martink@posteo.de,
	mattwmajewski@gmail.com,
	matthias.fend@emfend.at,
	mchehab@kernel.org,
	mehdi.djait@linux.intel.com,
	michael.riesch@collabora.com,
	naush@raspberrypi.com,
	nicholas@rothemail.net,
	nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com,
	pavel@kernel.org,
	petrcvekcz@gmail.com,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	rmfrfs@gmail.com,
	zhengsq@rock-chips.com,
	slongerbeam@gmail.com,
	sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 00/55] media: Add a helper for obtaining the clock producer
Date: Thu, 19 Jun 2025 19:58:53 +0200
Message-ID: <cover.1750352394.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

Here is my v1 for the new helper v4l2_devm_sensor_clk_get()

Any testing of the patches is GREATLY APPRECIATED! Especially the two
drivers with the special ACPI case:
1) OV8865
2) OV2680


Background
----------

A reference to the clock producer is not available to the kernel
in ACPI-based platforms but the sensor drivers still need them.

devm_clk_get() will return an error and the probe function will fail.


Solution
--------

Introduce a generic helper for v4l2 sensor drivers on both DT- and ACPI-based
platforms.

This helper behaves the same as clk_get_optional() except where there is
no clock producer like in ACPI-based platforms.

For ACPI-based platforms the function will read the "clock-frequency"
ACPI _DSD property and register a fixed frequency clock with the frequency
indicated in the property.


Solution for special ACPI case
------------------------------

This function also handles the special ACPI-based system case where:

1) The clock-frequency _DSD property is present.
2) A reference to the clock producer is present, where the clock is provided
by a camera sensor PMIC driver (e.g. int3472/tps68470.c)

In this case try to set the clock-frequency value to the provided clock.


RFC History
-----------

RFC v4 -> RFC v5:
Suggested by Arnd Bergmann:
	- removed IS_REACHABLE(CONFIG_COMMON_CLK). IS_REACHABLE() is actually
	discouraged [1]. COFIG_COMMON_CLK is a bool, so IS_ENABLED() will be the
	right solution here
Suggested by Hans de Goede:
	- added handling for the special ACPI-based system case, where
	  both a reference to the clock-provider and the _DSD
	  clock-frequency are present.
	- updated the function's kernel-doc and the commit msg
	  to mention this special case.
Link RFC v4: https://lore.kernel.org/linux-media/20250321130329.342236-1-mehdi.djait@linux.intel.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/kbuild/kconfig-language.rst?h=next-20250513&id=700bd25bd4f47a0f4e02e0a25dde05f1a6b16eea

RFC v3 -> RFC v4:
Suggested by Laurent:
	- removed the #ifdef to use IS_REACHABLE(CONFIG_COMMON_CLK)
	- changed to kasprintf() to allocate the clk name when id is NULL and
	  used the __free(kfree) scope-based cleanup helper when
	  defining the variable to hold the allocated name
Link v3: https://lore.kernel.org/linux-media/20250321093814.18159-1-mehdi.djait@linux.intel.com/

RFC v2 -> RFC v3:
- Added #ifdef CONFIG_COMMON_CLK for the ACPI case
Link v2: https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/

RFC v1 -> RFC v2:
Suggested by Sakari:
    - removed clk_name
    - removed the IS_ERR() check
    - improved the kernel-doc comment and commit msg
Link v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com

Mehdi Djait (55):
  media: v4l2-common: Add a helper for obtaining the clock producer
  Documentation: media: camera-sensor: Mention
    v4l2_devm_sensor_clk_get() for obtaining the clock
  media: i2c: ar0521: Use the v4l2 helper for obtaining the clock
  media: i2c: ds90ub913: Use the v4l2 helper for obtaining the clock
  media: i2c: ds90ub960: Use the v4l2 helper for obtaining the clock
  media: i2c: et8ek8: Use the v4l2 helper for obtaining the clock
  media: i2c: gc05a2: Use the v4l2 helper for obtaining the clock
  media: i2c: gc08a3: Use the v4l2 helper for obtaining the clock
  media: i2c: gc2145: Use the v4l2 helper for obtaining the clock
  media: i2c: hi846: Use the v4l2 helper for obtaining the clock
  media: i2c: imx214: Use the v4l2 helper for obtaining the clock
  media: i2c: imx219: Use the v4l2 helper for obtaining the clock
  media: i2c: imx283: Use the v4l2 helper for obtaining the clock
  media: i2c: imx290: Use the v4l2 helper for obtaining the clock
  media: i2c: imx296: Use the v4l2 helper for obtaining the clock
  media: i2c: imx334: Use the v4l2 helper for obtaining the clock
  media: i2c: imx335: Use the v4l2 helper for obtaining the clock
  media: i2c: imx412: Use the v4l2 helper for obtaining the clock
  media: i2c: imx415: Use the v4l2 helper for obtaining the clock
  media: i2c: max2175: Use the v4l2 helper for obtaining the clock
  media: i2c: mt9m001: Use the v4l2 helper for obtaining the clock
  media: i2c: mt9m111: Use the v4l2 helper for obtaining the clock
  media: i2c: mt9m114: Use the v4l2 helper for obtaining the clock
  media: i2c: mt9p031: Use the v4l2 helper for obtaining the clock
  media: i2c: mt9t112: Use the v4l2 helper for obtaining the clock
  media: i2c: mt9v032: Use the v4l2 helper for obtaining the clock
  media: i2c: mt9v111: Use the v4l2 helper for obtaining the clock
  media: i2c: ov02a10: Use the v4l2 helper for obtaining the clock
  media: i2c: ov2659: Use the v4l2 helper for obtaining the clock
  media: i2c: ov2685: Use the v4l2 helper for obtaining the clock
  media: i2c: ov5640: Use the v4l2 helper for obtaining the clock
  media: i2c: ov5645: Use the v4l2 helper for obtaining the clock
  media: i2c: ov5647: Use the v4l2 helper for obtaining the clock
  media: i2c: ov5648: Use the v4l2 helper for obtaining the clock
  media: i2c: ov5695: Use the v4l2 helper for obtaining the clock
  media: i2c: ov64a40: Use the v4l2 helper for obtaining the clock
  media: i2c: ov6650: Use the v4l2 helper for obtaining the clock
  media: i2c: ov7740: Use the v4l2 helper for obtaining the clock
  media: i2c: ov8856: Use the v4l2 helper for obtaining the clock
  media: i2c: ov8858: Use the v4l2 helper for obtaining the clock
  media: i2c: ov8865: Use the v4l2 helper for obtaining the clock
  media: i2c: ov9282: Use the v4l2 helper for obtaining the clock
  media: i2c: ov9640: Use the v4l2 helper for obtaining the clock
  media: i2c: ov9650: Use the v4l2 helper for obtaining the clock
  media: i2c: s5c73m3: Use the v4l2 helper for obtaining the clock
  media: i2c: s5k5baf: Use the v4l2 helper for obtaining the clock
  media: i2c: s5k6a3: Use the v4l2 helper for obtaining the clock
  media: i2c: st-mipid02: Use the v4l2 helper for obtaining the clock
  media: i2c: tc358743: Use the v4l2 helper for obtaining the clock
  media: i2c: tc358746: Use the v4l2 helper for obtaining the clock
  media: i2c: thp7312: Use the v4l2 helper for obtaining the clock
  media: i2c: vd55g1: Use the v4l2 helper for obtaining the clock
  media: i2c: vd56g3: Use the v4l2 helper for obtaining the clock
  media: i2c: vgxy61: Use the v4l2 helper for obtaining the clock
  media: i2c: ov2680: Use the v4l2 helper for obtaining the clock

 .../driver-api/media/camera-sensor.rst        |  3 +-
 drivers/media/i2c/ar0521.c                    |  2 +-
 drivers/media/i2c/ds90ub913.c                 |  2 +-
 drivers/media/i2c/ds90ub960.c                 |  2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  2 +-
 drivers/media/i2c/gc05a2.c                    |  2 +-
 drivers/media/i2c/gc08a3.c                    |  2 +-
 drivers/media/i2c/gc2145.c                    |  2 +-
 drivers/media/i2c/hi846.c                     |  2 +-
 drivers/media/i2c/imx214.c                    |  2 +-
 drivers/media/i2c/imx219.c                    |  2 +-
 drivers/media/i2c/imx283.c                    |  2 +-
 drivers/media/i2c/imx290.c                    |  2 +-
 drivers/media/i2c/imx296.c                    |  2 +-
 drivers/media/i2c/imx334.c                    |  2 +-
 drivers/media/i2c/imx335.c                    |  2 +-
 drivers/media/i2c/imx412.c                    |  2 +-
 drivers/media/i2c/imx415.c                    |  2 +-
 drivers/media/i2c/max2175.c                   |  2 +-
 drivers/media/i2c/mt9m001.c                   |  2 +-
 drivers/media/i2c/mt9m111.c                   |  2 +-
 drivers/media/i2c/mt9m114.c                   |  2 +-
 drivers/media/i2c/mt9p031.c                   |  2 +-
 drivers/media/i2c/mt9t112.c                   |  2 +-
 drivers/media/i2c/mt9v032.c                   |  2 +-
 drivers/media/i2c/mt9v111.c                   |  2 +-
 drivers/media/i2c/ov02a10.c                   |  2 +-
 drivers/media/i2c/ov2659.c                    |  2 +-
 drivers/media/i2c/ov2680.c                    | 27 +++-------
 drivers/media/i2c/ov2685.c                    |  2 +-
 drivers/media/i2c/ov5640.c                    |  2 +-
 drivers/media/i2c/ov5645.c                    |  2 +-
 drivers/media/i2c/ov5647.c                    |  2 +-
 drivers/media/i2c/ov5648.c                    |  2 +-
 drivers/media/i2c/ov5695.c                    |  2 +-
 drivers/media/i2c/ov64a40.c                   |  2 +-
 drivers/media/i2c/ov6650.c                    |  2 +-
 drivers/media/i2c/ov7740.c                    |  2 +-
 drivers/media/i2c/ov8856.c                    |  2 +-
 drivers/media/i2c/ov8858.c                    |  2 +-
 drivers/media/i2c/ov8865.c                    | 32 ++----------
 drivers/media/i2c/ov9282.c                    |  2 +-
 drivers/media/i2c/ov9640.c                    |  2 +-
 drivers/media/i2c/ov9650.c                    |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  2 +-
 drivers/media/i2c/s5k5baf.c                   |  2 +-
 drivers/media/i2c/s5k6a3.c                    |  2 +-
 drivers/media/i2c/st-mipid02.c                |  2 +-
 drivers/media/i2c/tc358743.c                  |  2 +-
 drivers/media/i2c/tc358746.c                  |  2 +-
 drivers/media/i2c/thp7312.c                   |  2 +-
 drivers/media/i2c/vd55g1.c                    |  2 +-
 drivers/media/i2c/vd56g3.c                    |  2 +-
 drivers/media/i2c/vgxy61.c                    |  2 +-
 drivers/media/v4l2-core/v4l2-common.c         | 49 +++++++++++++++++++
 include/media/v4l2-common.h                   | 25 ++++++++++
 56 files changed, 136 insertions(+), 102 deletions(-)


