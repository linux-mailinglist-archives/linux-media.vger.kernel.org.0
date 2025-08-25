Return-Path: <linux-media+bounces-40955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C9DB33BE6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD42D1883EB4
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8FD2DA776;
	Mon, 25 Aug 2025 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3QpXwl1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4532D97BD
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115504; cv=none; b=E2hv9ngDRt4+dgvySTsu/1QFqR+5n4M7sw5P9Tquk4yAtd2rCV/41MKdBmAgvFjsvOPve0pW14mankYC4AqgoDldHd/ytJ15CIR2Mf5XL5v/WhLkYt8tLYbSIhU7LqBfbsrX3Sx6dnlrrqMuNmeLpd4IcqOd1SlOlilIFFs15es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115504; c=relaxed/simple;
	bh=wCF7wzA+/ki35L/bBprcNBuKg7fWxE+U7FuehlNSs0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rc+xifrnLnBzdG9kBhnn6ff9b6Lvn/hVo5AC4lgdS2Aq/hIa8HHDPfVKQ3MyauffqqEydM038xQTRm4OPK6XsKj/rbK4pzF0dtRa+rh22eOZT5st/zRoUl/yq0BfO+kXQv/vpS4gL4aU1K/xiiwI2l/0GrCic0ICvP2jga3NKog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3QpXwl1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115503; x=1787651503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wCF7wzA+/ki35L/bBprcNBuKg7fWxE+U7FuehlNSs0A=;
  b=J3QpXwl17JSqxtTiHx5s1/9o3XMxvOb2OF1RlX54G7ZJQfoESgZniiVi
   k7Y2YSPzfpYK9o1KPz/zjsa9RsK5OOQ6LDxNtRe5lYctDammsAwZr8HPe
   QohHzQ23PV8Qx7Z+BdJaBQgNpYWecbYnEXeLF6J/IsJGMiSJCfEESziGg
   ZggbA/bd5UQXx6pMJm4qbOJNi+7NQp56qtldng23a3aOypAfboQ1E/wRF
   fU5d3NRtguClc7tw1BdpBwNQmMq00bA4NqlfdCjNR0s4o/F1JrY+4/MFQ
   UtHoQSUcVi67t6yekQaKVPYVR4Mr1CZiuERBHTEtHXgBiGwzZLJ47FAyk
   g==;
X-CSE-ConnectionGUID: xn0p8T0ZSM+edLdgzejQGg==
X-CSE-MsgGUID: HiFmyOyNTqCR9ddjYdHKsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696049"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696049"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: +fRO6JM6SGC3Zr6JbXldUA==
X-CSE-MsgGUID: wd3X5hyAQ1WmYgVsKASX5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195512"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 70B9D121FD5;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005afN-1mmC;
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
Subject: [PATCH v11 27/66] media: uapi: ccs: Add metadata layout for MIPI CCS embedded data
Date: Mon, 25 Aug 2025 12:50:28 +0300
Message-ID: <20250825095107.1332313-28-sakari.ailus@linux.intel.com>
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

Add new metadata layout (V4L2_METADATA_LAYOUT_CCS) for MIPI CCS embedded
data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 12 ++++++
 .../userspace-api/media/v4l/meta-formats.rst  |  1 +
 .../media/v4l/metadata-layouts.rst            | 39 +++++++++++++++++++
 .../media/v4l/subdev-formats.rst              |  5 +++
 include/uapi/linux/v4l2-controls.h            |  1 +
 5 files changed, 58 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index d803a2f0f2f9..371c155a88f7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -153,3 +153,15 @@ Image Source Control IDs
     streams. The control is used in conjunction with :ref:`generic metadata
     formats <media-bus-format-generic-meta>` formats to specify the layout of the
     data.
+
+.. flat-table:: V4L2 metadata layouts
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       1 2 1
+
+    * - Macro name
+      - Synopsis
+      - Value
+    * - V4L2_METADATA_LAYOUT_CCS
+      - :ref:`CCS embedded data <media-metadata-layout-ccs>`
+      - 1
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 0de80328c36b..542fbecab2dc 100644
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
index c36cd42b09c6..f027a37f1774 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8503,6 +8503,11 @@ content is more or less device specific but the data is transmitted and received
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
index 74e22a930be4..d31cd22d1fa9 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1240,6 +1240,7 @@ enum v4l2_jpeg_chroma_subsampling {
 	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
+#define V4L2_METADATA_LAYOUT_CCS		1U
 
 
 /* Image processing controls */
-- 
2.47.2


