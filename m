Return-Path: <linux-media+bounces-35958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3AAAE9EDE
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67D51888340
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C3928B3F1;
	Thu, 26 Jun 2025 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W02dudOY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABAC267F59
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944895; cv=none; b=lnNYLFvJE/5F6pczX870PvousggwcswAiXLkDFPmrk95YpVMFnLYV/tJEcQtcDxZqGjV1Nbjvx+PXh8iaavmhras6Hb3HHddHwzHl5rcXpWyKToOOlqVeZoh0GgxEOBh6MWO/7s10c31eb/HIoH3D3RMN8ePsVx+nX+++NHri1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944895; c=relaxed/simple;
	bh=uYsQCsUHHyARE67gBihibX09h0boWlJk0Rho9C3ar7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G/oIwT5gmZm5BrgdBB3G9mFQlSo7AlgqT21m8N7Qc5zHy7UoRcJfyS5DjKjMVrAIuE17p0l/FC1aUf0JrS4QUy3OMeh4+BmsrVRS81Jxws7k9Ymuxq/0/x6bpldX/G3/vR5D6w2B75xZnxWZrQYcxyjP3kZ2KfHRqne8LYRgRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W02dudOY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944895; x=1782480895;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uYsQCsUHHyARE67gBihibX09h0boWlJk0Rho9C3ar7Q=;
  b=W02dudOYrKgRyQG1jlVciRrjdlgAyBrFku7mYgA6a2T+Pk3+jT8K3IMK
   TCkHGbH39y+7aIpmIjL1xMBKG0KAFWfV2Av1Ht4ss49IoNnB7i8gonRxk
   E34ulBjDLttsbf1OYaK3IEzketp6fILo8/y0iBoN1HUPVxatBDsXe6Fq2
   8KelzF0dgjr0qaFLhGjOabYQKJsW7VMbv1MB+DR8beEtl/WQmsE9C14+B
   RrEzONg0ZR5ib5Ij6hPr70NxfdU+cHHn75u2VVUYuXdq/ZQMrh/wiXzCr
   fJtWcVIQxLcfs7qKTDHT6f+6FBuC04N/6nRYvWiIsVw8UL73+MLnQwD1M
   w==;
X-CSE-ConnectionGUID: S301aBeSSkGlR1++9yfEFA==
X-CSE-MsgGUID: UYOEl/4VRkGflcSPjYf5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921141"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921141"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:34:54 -0700
X-CSE-ConnectionGUID: W2PLHMvVTm20WjU6NWr8lg==
X-CSE-MsgGUID: xEokDFNFTv+Fh9/Ikn4iRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049248"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:34:47 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
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
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org
Subject: [PATCH v2 00/48] media: Add a helper for obtaining the clock producer
Date: Thu, 26 Jun 2025 15:33:51 +0200
Message-ID: <cover.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello everyone,

Here is my v2 for the new helper v4l2_devm_sensor_clk_get()

I took this opportunity to make all the drivers that I touched with this
series return dev_err_probe() when the helper fails: the complete list
is below in the HISTORY. I noticed some odd drivers:

drivers/media/i2c/s5k5baf.c -> always returns -EPROBE_DEFER if getting the clock fails

drivers/media/i2c/mt9t112.c -> this drivers seems to be implementing
	the behaviour of devm_clk_get_optional() while using devm_clk_get():
	remove it from the list of changed drivers ?


drivers/media/i2c/ov8856.c -> getting the clock, setting the rate,
getting the optional gpio and the regulator_bulk is only when the fwnode
is NOT acpi.

Any testing of the patches is GREATLY APPRECIATED!

Especially the two drivers with the special ACPI case:
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

History
-------

v1 -> v2:
- Added a check to !of_node instead of acpi_node as !of_node will cover
both acpi nodes and software nodes (currently used by AMD camera setup)

Changed the following drivers to use dev_err_probe() when the helper
fails:
	s5k6a3.c
	s5c73m3/s5c73m3-core.c

	mt9m001.c
	mt9m111.c
	mt9p031.c
	mt9m114.c
	mt9v032.c
	mt9v111.c

	ov2659.c
	ov2685.c
	ov5640.c
	ov5647.c
	ov5648.c
	ov5695.c
	ov6650.c
	ov7740.c
	ov9282.c
	ov9640.c
	ov9650.c

	imx412.c
	imx335.c

	hi846.c
	et8ek8/et8ek8_driver.c
	ar0521.c

Suggested by Laurent:
	- changed clk_get_optional() to devm_clk_get() in the commit msg
	  and kernel-doc of the helper function
	- improved the kernel-doc of the function
	- added forward declaration of struct clk in include/media/v4l2-common.h
	- changed the Documentation in the [PATCH 02/48]
	- dropped the comment in ov2680.c
	- removed the following drivers that are not camera sensors:
		ds90ub913: Video Serializer
		ds90ub960: Video Deserializer
		st-mipid02: CSI-2 to PARALLEL bridge
		tc358743: HDMI to CSI-2 bridge
		tc358746: PARALLEL to CSI-2 bridge
		thp7312: External Camera ISP

Suggested by Sakari:
	- added the handling for when devm_clk_get_optional() returns
	  -EPROBE_DEFER
	- added handling for when devm_clk_get_optional() returns
	  -EINVAL. The helper will return -EPROBE_DEFER signaling that
	  some software components are still needed before the sensor
	  driver can get probed (e.g. int3472 or the AMD ISP)

Suggested by Michael Riesch:
	- made the imx415 clock name NULL

Link v1: https://lore.kernel.org/linux-media/cover.1750352394.git.mehdi.djait@linux.intel.com/

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

Mehdi Djait (48):
  media: v4l2-common: Add a helper for obtaining the clock producer
  Documentation: media: camera-sensor: Mention
    v4l2_devm_sensor_clk_get() for obtaining the clock
  media: i2c: ar0521: Use the v4l2 helper for obtaining the clock
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
  media: i2c: vd55g1: Use the v4l2 helper for obtaining the clock
  media: i2c: vd56g3: Use the v4l2 helper for obtaining the clock
  media: i2c: vgxy61: Use the v4l2 helper for obtaining the clock
  media: i2c: ov2680: Use the v4l2 helper for obtaining the clock

 .../driver-api/media/camera-sensor.rst        | 24 ++++++---
 drivers/media/i2c/ar0521.c                    |  9 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  9 ++--
 drivers/media/i2c/gc05a2.c                    |  2 +-
 drivers/media/i2c/gc08a3.c                    |  2 +-
 drivers/media/i2c/gc2145.c                    |  2 +-
 drivers/media/i2c/hi846.c                     | 11 ++--
 drivers/media/i2c/imx214.c                    |  2 +-
 drivers/media/i2c/imx219.c                    |  2 +-
 drivers/media/i2c/imx283.c                    |  5 +-
 drivers/media/i2c/imx290.c                    |  2 +-
 drivers/media/i2c/imx296.c                    |  2 +-
 drivers/media/i2c/imx334.c                    |  2 +-
 drivers/media/i2c/imx335.c                    |  9 ++--
 drivers/media/i2c/imx412.c                    |  9 ++--
 drivers/media/i2c/imx415.c                    |  2 +-
 drivers/media/i2c/mt9m001.c                   |  5 +-
 drivers/media/i2c/mt9m111.c                   |  5 +-
 drivers/media/i2c/mt9m114.c                   |  6 +--
 drivers/media/i2c/mt9p031.c                   |  5 +-
 drivers/media/i2c/mt9t112.c                   | 11 ++--
 drivers/media/i2c/mt9v032.c                   |  5 +-
 drivers/media/i2c/mt9v111.c                   |  5 +-
 drivers/media/i2c/ov02a10.c                   |  2 +-
 drivers/media/i2c/ov2659.c                    |  5 +-
 drivers/media/i2c/ov2680.c                    | 29 +----------
 drivers/media/i2c/ov2685.c                    | 10 ++--
 drivers/media/i2c/ov5640.c                    |  9 ++--
 drivers/media/i2c/ov5645.c                    |  2 +-
 drivers/media/i2c/ov5647.c                    |  9 ++--
 drivers/media/i2c/ov5648.c                    |  6 +--
 drivers/media/i2c/ov5695.c                    | 10 ++--
 drivers/media/i2c/ov64a40.c                   |  2 +-
 drivers/media/i2c/ov6650.c                    | 10 ++--
 drivers/media/i2c/ov7740.c                    | 11 ++--
 drivers/media/i2c/ov8856.c                    | 10 ++--
 drivers/media/i2c/ov8858.c                    |  2 +-
 drivers/media/i2c/ov8865.c                    | 36 ++-----------
 drivers/media/i2c/ov9282.c                    |  9 ++--
 drivers/media/i2c/ov9640.c                    |  5 +-
 drivers/media/i2c/ov9650.c                    |  5 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  6 ++-
 drivers/media/i2c/s5k5baf.c                   |  2 +-
 drivers/media/i2c/s5k6a3.c                    |  5 +-
 drivers/media/i2c/vd55g1.c                    |  2 +-
 drivers/media/i2c/vd56g3.c                    |  2 +-
 drivers/media/i2c/vgxy61.c                    | 10 ++--
 drivers/media/v4l2-core/v4l2-common.c         | 52 +++++++++++++++++++
 include/media/v4l2-common.h                   | 27 ++++++++++
 49 files changed, 223 insertions(+), 191 deletions(-)

-- 
2.49.0


