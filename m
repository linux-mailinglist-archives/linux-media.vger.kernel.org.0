Return-Path: <linux-media+bounces-35292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0DAE04E0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BE3E3A8E81
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8548A255F39;
	Thu, 19 Jun 2025 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auv+Twh4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7E2561AF
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334350; cv=none; b=O4+M2KGiiMKBua7OQOYsKmcqIu043Gt1T+3Znz3Mq4RuLnrb2TQ5S2+LtC49jO4l0UQ4jB5yllPlodUPh0ddsfzPWl/5/rEKGsKcD1Al+1f5tT5SPgRIdXxRAjcMA6fktFJc2v84qEiIRSNnNR+KsAd7fS96AMVlJ3Z9LyjqX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334350; c=relaxed/simple;
	bh=lOBN5MVrhQWR15mGZWTphVXcnt8llTQ+wvPLHi/JVIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=txBu7OrJrkVBZ0uyFhVy7JSVXNJq/XCV/uWbyfaGVH3H7fHT/7xGpFw7JOFszg2ut/9YIsOcDZ2B0BXqeuO1lfPOq/Dnd3h/XAYobmDUUNSfM95kcCFGWkub1a7mRLmREqLN+ng5qHm+KCOk44P23VdCGTiaSTmB88BN/Yd7lmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auv+Twh4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334349; x=1781870349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lOBN5MVrhQWR15mGZWTphVXcnt8llTQ+wvPLHi/JVIQ=;
  b=auv+Twh4fZzyM9qmtrEQLbyg/hW2Rn83GwDuArsE4wHcJ4h240Sg7Lig
   6mwDyUmiQr9ab0iRtWrSx2l7vWWrpyjUOH43y2L7rsSM7jix6byQmmWRz
   cpQHoX79Z0KMSP/B52MzzrEpchKkWj+ekiF47DQBck9Z3EWj3bS4EJJWk
   t1cYw/gfPa4G89doa8ZsTEwkd7p4RLxltYsiUrX3OpbgmO17RV5dvLOHy
   byHllhTCYUCtICPqnX6tIrEjzcyCk9zqjgAKWJd0M17x8d1Ybpn9wf6Cm
   d6wZK8RJkQB7sOtS18MgvTz3wpe/xkL0RV59Z++dTuC9YjuCZhVuTB/gr
   w==;
X-CSE-ConnectionGUID: /SQ8TtLQRgmnDYVcwTaeYw==
X-CSE-MsgGUID: qvtxtzt/SQWHQX3MDt5EXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386432"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386432"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:04 -0700
X-CSE-ConnectionGUID: iJl1QguwRzOs8+7Zfxirdg==
X-CSE-MsgGUID: aEn1zqudQLaTj50omWB5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908299"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F29E212157D;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AJV-36;
	Thu, 19 Jun 2025 14:58:36 +0300
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
Subject: [PATCH v10 24/64] media: uapi: ccs: Add metadata layout for MIPI CCS embedded data
Date: Thu, 19 Jun 2025 14:57:56 +0300
Message-Id: <20250619115836.1946016-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new metadata layout (V4L2_METADATA_LAYOUT_CCS) for MIPI CCS embedded
data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/meta-formats.rst  |  1 +
 .../media/v4l/metadata-layouts.rst            | 39 +++++++++++++++++++
 .../media/v4l/subdev-formats.rst              |  5 +++
 include/uapi/linux/v4l2-controls.h            |  1 +
 4 files changed, 46 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index bb6876cfc271..c9b908d5fbea 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
+    metadata-layouts
     metafmt-intel-ipu3
     metafmt-pisp-be
     metafmt-pisp-fe
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
new file mode 100644
index 000000000000..5f717d54d1ca
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+
+.. _media_metadata_layouts:
+
+Metadata Layouts
+----------------
+
+The :ref:`metadata layout control <image_source_control_metadata_layout>`
+specifies the on-bus layout of the metadata on pads with a :ref:`generic
+metadata mbus code <media-bus-format-generic-meta>` independently of the bit
+depth.
+
+.. _media-metadata-layout-ccs:
+
+MIPI CCS Embedded Data Layout (``V4L2_METADATA_LAYOUT_CCS``)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
+metadata layout for sensor embedded data, identified by
+``V4L2_CID_METADATA_LAYOUT`` control value ``V4L2_METADATA_LAYOUT_CCS``, which
+is used to store the register configuration used for capturing a given
+frame. The layout itself is defined in the CCS specification.
+
+The CCS embedded data format (code ``0xa``) definition includes three levels:
+
+1. Padding within CSI-2 bus :term:`Data Unit` as documented in the MIPI CCS
+   specification.
+
+2. The tagged data format as documented in the MIPI CCS specification.
+
+3. Register addresses and register documentation as documented in the MIPI CCS
+   specification.
+
+The ``V4L2_METADATA_LAYOUT_CCS`` metadata layout value shall be used only by
+devices that fulfill all three levels above.
+
+This metadata layout code is only used for "2-byte simplified tagged data
+format" (code ``0xa``) but their use may be extended further in the future, to
+cover other CCS embedded data format codes.
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d6d0e9a0eee1..0bcbf3063dbc 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8510,6 +8510,11 @@ content is more or less device specific but the data is transmitted and received
 by multiple devices that do not process the data in any way, simply writing
 it to system memory for processing in software at the end of the pipeline.
 
+The exact layout of the data generated by the device is reported by the
+:ref:`V4L2_CID_METADATA_LAYOUT <image_source_control_metadata_layout>`
+control. For in-memory formats, :ref:`Generic line-based metadata formats
+<v4l2-format-generic-meta>` are used.
+
 "b" in an array cell signifies a byte of data, followed by the number of the bit
 and finally the bit number in subscript. "x" indicates a padding bit.
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index bb8b0b174a43..23112f256da1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1234,6 +1234,7 @@ enum v4l2_jpeg_chroma_subsampling {
 	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
+#define V4L2_METADATA_LAYOUT_CCS		1U
 
 /* Image processing controls */
 
-- 
2.39.5


