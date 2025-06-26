Return-Path: <linux-media+bounces-35960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B32AE9EE1
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB31A189D672
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983A82E54BB;
	Thu, 26 Jun 2025 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n92wpJ7Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09082E5437
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944909; cv=none; b=hcO4VIAHUbcO4Pu7FW0iqzu0pxVk6J2leqjqTEnzDdfbCfCQ3Tek/hvO21sZvxykSMoh5ng/WHJb+sokAVQrPSEcVANfzUsVKSWKgfLr0aVDAwjkNfv8NwEx220LvhsvwQ+jrOIFE8FhrJI7ZVz5xcpRS5yzgRamQl8/muK3QPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944909; c=relaxed/simple;
	bh=P2q9rx+vJThKDAJ1r2EhNGorbt9q2KPodpy2TYQWork=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TThcduEK9xhleyLKbUWnywZTMoGYkZXBrsh6l8L68FAZurKppYlFE6ke/D04vJHv5ib5KODoZCCz0B9N9fascU8gOwzG3Uj5XHVkghsbUNSmhj+YFBiNj8SjzyIKWM8mOhhPECe8VFRopmgPgwzP3ITb4uXFeUYoIUMjMU7xkls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n92wpJ7Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944907; x=1782480907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P2q9rx+vJThKDAJ1r2EhNGorbt9q2KPodpy2TYQWork=;
  b=n92wpJ7YJfuMEkV8cGDtX9iGJS9qmRqg7LYxLkqwdDQUpQtdNaqQFqOS
   82TVasYs01MoWwAMJckw5GsV0q10vZ747shO8sJniqMtuArSf5ByFUn7r
   muHm2XF0eQc0vG6SJs8tMeaIgrkUCCtobKRUYBJfDQQAG1tX2br2NxAdP
   dnJAhnK+tUM27eZ2hnZTqopwrgEflHrrPZOJ4M5c75P7fT/Y9DpkiqPep
   qrlhG+nDJVOTHDjfqxQqG1zOPdl44Tz1+a/kMEN//B3cAxw6JKms9lVki
   WO0TmsHCtRSLA+gqithEVrmxfL9u5GM+n3Wi+f69Inl/PHtwZEb4TLASR
   A==;
X-CSE-ConnectionGUID: x7/TC5WfTq615HwEfC4kaQ==
X-CSE-MsgGUID: 2X815eeSRU+BWpWNqmL4hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921198"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921198"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:07 -0700
X-CSE-ConnectionGUID: mjPnq1KMRPCAHt8UGsP2GQ==
X-CSE-MsgGUID: xiMe8u3MTcWwva6O3FVdHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049305"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:00 -0700
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
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 02/48] Documentation: media: camera-sensor: Mention v4l2_devm_sensor_clk_get() for obtaining the clock
Date: Thu, 26 Jun 2025 15:33:53 +0200
Message-ID: <095af35c322e523aba8ea8f70157077f4196feb5.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the new v4l2 helper devm_v4l2_sensor_clk_get() to Documentation. the
helper works on both DT- and ACPI-based platforms to retrieve a
reference to the clock producer from firmware.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 .../driver-api/media/camera-sensor.rst        | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c290833165e6..94bd1dae82d5 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -29,21 +29,31 @@ used in the system. Using another frequency may cause harmful effects
 elsewhere. Therefore only the pre-determined frequencies are configurable by the
 user.
 
+The external clock frequency shall be retrieved by obtaining the external clock
+using the ``devm_v4l2_sensor_clk_get()`` helper function, and then getting its
+frequency with ``clk_get_rate()``. Usage of the helper function guarantees
+correct behaviour regardless of whether the sensor is integrated in a DT-based
+or ACPI-based system.
+
 ACPI
 ~~~~
 
-Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
-can rely on this frequency being used.
+ACPI-based systems typically don't register the sensor external clock with the
+kernel, but specify the external clock frequency in the ``clock-frequency``
+_DSD property. The ``devm_v4l2_sensor_clk_get()`` helper creates and returns a
+fixed clock set at that rate.
 
 Devicetree
 ~~~~~~~~~~
 
-The preferred way to achieve this is using ``assigned-clocks``,
-``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See the
-`clock device tree bindings
+Devicetree-based systems declare the sensor external clock in the device tree
+and reference it from the sensor node. The preferred way to select the external
+clock frequency is to use the ``assigned-clocks``, ``assigned-clock-parents``
+and ``assigned-clock-rates`` properties in the sensor node to set the clock
+rate. See the `clock device tree bindings
 <https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml>`_
-for more information. The driver then gets the frequency using
-``clk_get_rate()``.
+for more information. The ``devm_v4l2_sensor_clk_get()`` helper retrieves and
+returns that clock.
 
 This approach has the drawback that there's no guarantee that the frequency
 hasn't been modified directly or indirectly by another driver, or supported by
-- 
2.49.0


