Return-Path: <linux-media+bounces-31933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF3AAD9D3
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 10:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F5F15056E5
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 08:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411851D5CE0;
	Wed,  7 May 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwM8FwGF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3A148830
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605630; cv=none; b=AmP8/tN2B4C4JZ8tCIn9II8VWf/PjaqwIyPKW/CdrYZsAz8nK93egA/gxcSnCLWJ2QRRe1avdmbBKdCs2QVRD1LdWZxHZJyGGX0trgnWxyjcngUJ25KpAdenE6ddttZVgyJ+zz41N0ftQSpwMyLPp8TsxtNg6xIaOONyDA9+kAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605630; c=relaxed/simple;
	bh=H8iCgUrWwC5fBhyXnvyyk8XLgb67mP655ypsSthC9fs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sPJHFiUimkjJiKrVgcDvzxo++DmAhcDk4Ih/CRJqL3HNLOcsFgEz+iBZbUWSIkPk+avqSE3VHzIT5Yyu/f9/x4ZwPPQAEA9bdiXbTJpgB4OpS7iE3x9kMNyBrsWBjFwQmNuz0e42+6hfoRElSe/AbE1lxUZqbfk271/h4wada3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwM8FwGF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746605629; x=1778141629;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H8iCgUrWwC5fBhyXnvyyk8XLgb67mP655ypsSthC9fs=;
  b=CwM8FwGFhIlprO3PivXFphyIJYyvE5Rw/opKb1NirBvC9ye3I1pFEW7R
   B0kxzI39qe+v8gOpO3F/o2a4/jQh6DkHBCu9F0YexhtPakPXPFKJphQQp
   AIb4Is+uJq/ZG+r0WqWzT0MKmxYWWln4kGuuMxdN3fi8FDzrFDdctbQZZ
   OEzsewvYL3wQdqDPIlYQ8HwfEDp4zg+JxfuH96Gg4BlyuPLp4OYb6adRr
   hQfzCetu18aOdUGqvHQTVBYzTVt5br3A/jAA4L2TFNEsdfoaNbrgFtpM/
   zu+2cM7xfRUyICV80Vn21rK0i/RfH/OiIdRZOmUt0UtSkCkBJXvNLEo8Y
   A==;
X-CSE-ConnectionGUID: yvfZBnBcQASffM1VSF7UtA==
X-CSE-MsgGUID: xz7ACmbrQ0+rFKEb3YViVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59718578"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="59718578"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:13:48 -0700
X-CSE-ConnectionGUID: /YwPbvr8SYOJwAw4x3ejUA==
X-CSE-MsgGUID: igieheBOR7uL1uGyNVELKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="141068590"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.193])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:13:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9883611F871;
	Wed,  7 May 2025 11:13:38 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uCZuM-000Dww-1j;
	Wed, 07 May 2025 11:13:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu,               Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH 1/1] media: dt-bindings: Add bindings for camera modules
Date: Wed,  7 May 2025 11:13:38 +0300
Message-Id: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for camera modules to allow telling especially the user space
which module is found in the system. Camera modules do not have a device
node so this is a property for the camera sensor device node. This allows
describing modules that contain a single camera sensor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi all,

Here's the patch to give some advance warning for the camera module
discussion. The good thing is that it's quite short.

The intent indeed is to address the regular use case where we have a
single sensor in a camera module. For cases where we have more, we'll need
something else, not based on individual properties. I believe this is
still the way to go, to address current issues and for a couple of
additional reasons:

- Cameras with more than one sensor tend to be collections of camera
  modules so this is still relevant in most cases.

- It's much simpler to have a single property than begin having new nodes
  in DT. In practice such nodes would be a poor fit for DT generally as
  they have (few or) no functions.

The biggest difficulty is still in module identification. These components
tend to be often ignored and the best we have for a module name in that
case is random-looking string if even that. Besides DT bindings, we need
an additional (git?) tree to describe the modules that have no proper
names but it could be also useful for those that do, for instance to
include information on lens, field of view, IR filter, photos of the
module etc. There is some overlap with what libcamera needs, too.

- Sakari

 .../bindings/media/camera-module.yaml         | 52 +++++++++++++++++++
 .../media/video-interface-devices.yaml        |  3 ++
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/camera-module.yaml

diff --git a/Documentation/devicetree/bindings/media/camera-module.yaml b/Documentation/devicetree/bindings/media/camera-module.yaml
new file mode 100644
index 000000000000..31b898c8c334
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/camera-module.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/camera-module.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Camera modules
+
+maintainers:
+  - Sakari Ailus <sakari.ailus@linux.intel.com>
+
+description: |
+  Camera modules are devices that embed one or more active devices, including
+  Camera Sensors, Voice Coil Motor (VCM) and possibly a flash LED as well as
+  other passive devices such as lenses and Ultra-Violet (UV) filters. While the
+  camera modules themselves have no OF nodes and have generally no module
+  specific functions, it still does matter for the software stack as a whole
+  which module the devices are a part of.
+
+  Two properties are used for this, depending on what is known of the module:
+
+  1. The model of the module is known. In this case the name of the module uses
+  the format "vendor,model[,version]" where "vendor" is the manufacturer of the
+  module and "model" the name of the model. The version part is optional. In
+  such cases the property "camera-module-canonical" will be used. If the vendor
+  is not known, the "gpio" vendor prefix is used.
+
+  2. The model of the module is unknown. In this case, the module has an
+  identifier only, and will be described in detail in the camera module
+  database. The property "camera-module-casual" is used to denote such modules.
+
+  Before including in this binding documentation, all modules shall also be
+  documented in add-URL-here.
+
+  All camera modules listed below shall have the name of the sensor as well as
+  other devices included in the module as DT compatible string mentioned in a
+  comment after the enumeration, separated by a whitespace (" ").
+
+  Always keep the enumeration alphabetically (1) or numerically (2) sorted.
+
+properties:
+  camera-module-canonical:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - "dell,0BF122N3" # onnn,ov01a10
+  camera-module-casual:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 1 # st,vs6555
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index cf7712ad297c..27fa6711367e 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Jacopo Mondi <jacopo@jmondi.org>
   - Sakari Ailus <sakari.ailus@linux.intel.com>
 
+allOf:
+  - $ref: /schemas/media/camera-module.yaml#
+
 properties:
   flash-leds:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.39.5


