Return-Path: <linux-media+bounces-40956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8DB33BE9
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81E791884354
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203422DA758;
	Mon, 25 Aug 2025 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6vuTABM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D532D9EC8
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115505; cv=none; b=OwkUUDiK+g/4urnPFx2HQ8VnVdmjMDfVFIVTUxzats2bOLSkUDGsqZhjtNMLGdm/bvgE937IDnWCafJ0kXNByMaAA11E3QYxm8DsrW2R4ZAj6m4EDGPaxp/c0PGzgQJCxJ/5hLIvKjqlJXEv2s9UHhIF5O3VdqO3EQpfMzKGVn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115505; c=relaxed/simple;
	bh=vSniDrlLfaepRZwcB0pZyWh0d7wwdoDuxUp0/dSgOM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3ve1EX7IA+t95cYC8KGl11jcbmRiFCqEruke2zdEjde7HO9o0NamGn0A/AjLdVz44I2XJXT7YQ/nA/vZo/rPL9/ohdloxScTbQqUj7XQgCLBR7hkYASDgjbwPK97PteY9qD7cbOeoDgyoXigXHfG69vulik1posyd/NU0jBpkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6vuTABM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115504; x=1787651504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vSniDrlLfaepRZwcB0pZyWh0d7wwdoDuxUp0/dSgOM8=;
  b=T6vuTABMR3vXuZ9DOHUN33VzpchWQEnBgI6MJurTOkwGCWImADH9Wc18
   cWJADwuTzrcVjhSx+wb3z4vvhN4fPFrxuWXVDTvtRhew7LGsIhDdoapWM
   ja1ORZKVu+s6MFNrrInaoGp2Segg1fcim6IhixtNXXLWIqEongdAm+UwC
   aaBCKcmHcbVxh5XjvNJTfDFZn3f5sBQgH927KNjUgPfJrMh0ZSlhNel+E
   m+8SN+drEp2WruQUeXNVgZnGeDs9ZrcEJpfX5bC2NSaAiopgXUcBaWnlf
   oI0Gq3zGW26khrropzE+akcAlv3O0w24hNTGFnUfibQrwmJE0nX+WGppd
   Q==;
X-CSE-ConnectionGUID: osQRIy+lQPSJKsUEsqIgiw==
X-CSE-MsgGUID: NIS80pwrTBSxhykANxoZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696062"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696062"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:37 -0700
X-CSE-ConnectionGUID: i4ADG3EvQH+yWjPtzqPlZA==
X-CSE-MsgGUID: lJrSq8nqTfGoiGead7BAQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195517"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D918121FE2;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005afc-1zu9;
	Mon, 25 Aug 2025 12:51:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 30/66] media: Documentation: ccs: Document routing
Date: Mon, 25 Aug 2025 12:50:31 +0300
Message-ID: <20250825095107.1332313-31-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document which routes are available for the CCS driver (source) sub-device
and what configuration are possible.

Also update copyright.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/ccs.rst       | 43 ++++++++++++++++++-
 .../media/v4l/metadata-layouts.rst            |  2 +
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index 03015b33d5ab..67c7d2b62ed5 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -111,4 +111,45 @@ than in the centre.
 Shading correction needs to be enabled for luminance correction level to have an
 effect.
 
-**Copyright** |copy| 2020 Intel Corporation
+.. _media-ccs-routes:
+
+Routes
+------
+
+The CCS driver implements one or two :ref:`routes <subdev-routing>` in
+its source sub-device (scaler sub-device if it exists for the device, otherwise
+binner) depending on whether the sensor supports embedded data. (All CCS
+compliant sensors do but the CCS driver supports preceding standards that did
+not require embedded data support, too.)
+
+The first route of the CCS source sub-device is for pixel data (sink pad
+0/stream 0 -> source pad 1/stream 0) and the second one is for embedded data
+(internal sink pad 2/stream 0 -> source pad 1/stream 1).
+
+Embedded data
+~~~~~~~~~~~~~
+
+MIPI CCS supports generation of camera sensor embedded data. The metadata layout
+used for this format on the internal sink pad is :ref:`V4L2_METADATA_LAYOUT_CCS
+<media-metadata-layout-ccs>`.
+
+The bit depth of the CCS pixel data affects how the sensor will output the
+embedded data, adding padding to align with CSI-2 bus :term:`Data Unit` for that
+particular bit depth. This is indicated by the generic metadata format on the
+source pad of the sensor's source sub-device.
+
+Devices supporting embedded data for bit depths greater than or equal to 16 may
+support more dense packing or legacy single metadata byte per data unit, or both
+of these. The supported embedded data formats can be enumerated and configured
+on stream 1 of the source pad (1) of the CCS source sub-device.
+
+The use of the denser packing results in embedded data lines being longer than
+the pixel data in data units since the data units are smaller. In bytes the
+embedded data lines are still not longer than the image data lines.
+
+The embedded data format is determined by the sub-device image data format
+configured on the source sub-device. The embedded data mbus code is only changed
+when the bit depth of the image data changes in the source pad of the source
+sub-device.
+
+**Copyright** |copy| 2020, 2024--2025 Intel Corporation
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index 5f717d54d1ca..a4f7e93e6a29 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -37,3 +37,5 @@ devices that fulfill all three levels above.
 This metadata layout code is only used for "2-byte simplified tagged data
 format" (code ``0xa``) but their use may be extended further in the future, to
 cover other CCS embedded data format codes.
+
+Also see :ref:`CCS driver documentation <media-ccs-routes>`.
-- 
2.47.2


