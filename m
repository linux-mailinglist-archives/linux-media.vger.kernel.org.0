Return-Path: <linux-media+bounces-58453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HAuEIUJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0622A3CF571
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1EA0302FF1B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD098340293;
	Thu,  9 Apr 2026 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeprlzJH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B9364957
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765743; cv=none; b=bQN2MjsYM9SljLEE7/LIwb0MNGsIZEM+AOJ3BEk0+oOdaSkHXR/xB703YY1skaHzLZiRsNYd4tYwHD0ImogWxE94wDwGR+4KGgnhVfEvfbtovva8g6NV1YF+2+iBTALR+QI6PrOvuGtWpMWejt4HIxx6s7dWRKnNwypy1Dkc9pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765743; c=relaxed/simple;
	bh=svuDrQC21pBTb///cb5/41E0sY2XCBwZkQWYTGz1JFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2dhvnFSlo85CxYQ5XxJKDwK7Vwucaf8UzwZ8qI3qCWgeWgw8HBc3bZ2+gqJyhkyD8RixkSMLocTGze6BrXGAa73nTmmqBX0FkGcC+CPoXsh3kX+Yxw4Q89KepW0nalfQFKKOYvVcDKWpbQlgjeDBFFgItdLirrC+l9ywqOjn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeprlzJH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765742; x=1807301742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=svuDrQC21pBTb///cb5/41E0sY2XCBwZkQWYTGz1JFw=;
  b=PeprlzJHPZsWF9HBCjP9ay27daXAgaVWCwAWw4AEnj+AlAHnVnjvGAcj
   zkSh8axUtHXIb33EffYp3VgHcdg4xk1GnaRLOm3U/Zbzg3mbS8L7+aurB
   gud9ScAmUAT6COtsu8bTuHN5O/DP/9it3qASrTXagJ8oTvv1noACp7FIZ
   kEPeKJsa3qa0t0U+94uY4D6Y0hInt6zdSkyl80qEkbZX97c63cu7P/KxF
   PmtWWPgvh1w3tMNur3SFN9By490289ohRu+OdH9I+Jx9tCvINB7mXH5he
   xf04uvIvlcf+rL5whUyHMMys7DFnaUl2PIcKuvl7YbnTWw+6c1eubVnAe
   A==;
X-CSE-ConnectionGUID: Lr1e60wxQjObTJ0t3J2hwA==
X-CSE-MsgGUID: bCisnTLaSNqHm026E0hL/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176742"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: kXknMKX5RIO4XdMCRtVt4w==
X-CSE-MsgGUID: U1K9+sLJT4uIk1KJ3S0MrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047637"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D29A1122938;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nR-1Ak7;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 43/86] media: uapi: ccs: Add metadata layout for MIPI CCS embedded data
Date: Thu,  9 Apr 2026 23:14:18 +0300
Message-ID: <20260409201501.975242-44-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58453-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,linux.intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mipi.org:url];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0622A3CF571
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new metadata layout (V4L2_METADATA_LAYOUT_CCS) for MIPI CCS embedded
data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 12 ++++++
 .../userspace-api/media/v4l/meta-formats.rst  |  1 +
 .../media/v4l/metadata-layouts.rst            | 39 +++++++++++++++++++
 .../media/v4l/metafmt-generic.rst             |  2 +
 .../media/v4l/subdev-formats.rst              |  5 +++
 include/uapi/linux/v4l2-controls.h            |  1 +
 6 files changed, 60 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index fb4dee1b4f94..4ed9bea89101 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -161,6 +161,18 @@ Image Source Control IDs
     :ref:`generic metadata formats <media-bus-format-generic-meta>` formats to
     specify the layout of the data.
 
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
+
 .. _image_source_control_binning_factors:
 
 ``V4L2_CID_BINNING_FACTORS (integer menu)``
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 3e0cab153f0a..218d75965a73 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -17,6 +17,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
+    metadata-layouts
     metafmt-intel-ipu3
     metafmt-pisp-be
     metafmt-pisp-fe
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
new file mode 100644
index 000000000000..cd190f453994
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
+specifies the exact layout of the metadata stream while the a :ref:`generic
+metadata mbus code <media-bus-format-generic-meta>` on the subdevice pads
+only describe the size of the :term:`Data Unit`.
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
diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 07147b4d0dd2..fb97fe4d3c72 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -8,6 +8,8 @@ V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MECA'), V4L2_M
 
 Generic line-based metadata formats
 
+.. _v4l2-format-generic-meta:
+
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 4b832118060a..30dd26804776 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8932,6 +8932,11 @@ content is more or less device specific but the data is transmitted and received
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
index aaa0d88d7e6e..e27a7ad47c51 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1248,6 +1248,7 @@ enum v4l2_jpeg_chroma_subsampling {
 	(V4L2_CFA_PATTERN_FLIP_HORIZONTAL | V4L2_CFA_PATTERN_FLIP_VERTICAL)
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
+#define V4L2_METADATA_LAYOUT_CCS		1U
 
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
 #define V4L2_BINNING_FACTORS_MAKE(hnum, hdem, vnum, vdem)		\
-- 
2.47.3


