Return-Path: <linux-media+bounces-58456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDUiBVQK2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A43CF708
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CA7A30A3A2D
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097C3371049;
	Thu,  9 Apr 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hm1qmB3z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BB36E494
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765744; cv=none; b=LBN+UYcS8kcz4wiYRJyDhmjYk6gw9oV94yXVCW/y5c/Z+Nxh7GnbVl6FeV8bxsKQwJsdBjFKhC8m3LgQPKbTX1yJfcJu2Fr+BtCzlUXFQIcdvM8XJrVYi1VvoLE/3e1mCsVVcN+UHX1xQ/cShSJF+Gyj2XBTw2zsvU3OcN1cARc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765744; c=relaxed/simple;
	bh=SWliIHtG+eEOd7rMxMrj/lGdImxrk2U1CgExzuxejDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVyKECXd1Yk8pPvcTPJfXz74WdPHvByvGHAuiKUlhxevosptNEExtgngqhIDYK2elxsh/9XsU7bioNDaPfyL2s8nqG1KTmDNRsxfp0s57gmLhKYxRYq1nIpcITuuKWmDv5ICQZqDMSg1hKj+Z2U64HN44I2JI4Y/sY2WnoyaYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hm1qmB3z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765743; x=1807301743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SWliIHtG+eEOd7rMxMrj/lGdImxrk2U1CgExzuxejDU=;
  b=hm1qmB3zIAuJzRwWYs1HOP36w7VNzkf+bMnVuE8PmCVkGQX+GJPg4vq2
   AddserZcKV8EPcueMJL6LYt4jIZ7u6pMD97cAksLNU8dog2yWg3zveZUX
   MvcoyeNghGbGOWa+LX8wlm9/PEDTaBhGNBxacPiruZpqGpd+EbL9AP32O
   rKXoeGlUsLOGG/jkK48UvI0d/Da33eDbygG1yN+D+KR+oiJCTwhthxduS
   DMgd2ZT+OrklbkW86eG2cMng5Zuf2UH+QN4V7G+sHWFSJYimeW8CIyYr5
   M8J6uG53UwjFDpj3td2QwiNjwijoDlhq2Aa5C+jOMsBbQBaEs3CIaEWYg
   g==;
X-CSE-ConnectionGUID: KjgXLOC7TT64B4jVIBulJg==
X-CSE-MsgGUID: MOF2LtCbQUqyJjU/2dBLmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176778"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176778"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: jzWZ/pVBShqx3Ac4X8mJrw==
X-CSE-MsgGUID: ojUNQ2qDSkOvMJnNKsVh5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047641"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E6DBB122955;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nl-1WsU;
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
Subject: [PATCH v12 48/86] media: uapi: Add metadata layout for ov2740 embedded data
Date: Thu,  9 Apr 2026 23:14:23 +0300
Message-ID: <20260409201501.975242-49-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58456-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,linux.intel.com:mid,ideasonboard.com:email,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F0A43CF708
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a metadata layout for ov2740 camera sensor embedded data and document
it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      |  3 +
 .../media/v4l/metadata-layouts.rst            | 73 +++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 77 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 4ed9bea89101..bf208de8e626 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -172,6 +172,9 @@ Image Source Control IDs
     * - V4L2_METADATA_LAYOUT_CCS
       - :ref:`CCS embedded data <media-metadata-layout-ccs>`
       - 1
+    * - V4L2_METADATA_LAYOUT_OV2740
+      - :ref:`OV2740 embedded data <media-metadata-layout-ov2740>`
+      - 2
 
 .. _image_source_control_binning_factors:
 
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index 0f8709f2e9af..b4d04d82662b 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -39,3 +39,76 @@ format" (code ``0xa``) but their use may be extended further in the future, to
 cover other CCS embedded data format codes.
 
 Also see :ref:`CCS driver documentation <media-ccs-routes>`.
+
+.. _media-metadata-layout-ov2740:
+
+Omnivision OV2740 Embedded Data Layout (``V4L2_METADATA_LAYOUT_OV2740``)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Omnivision OV2740 camera sensor produces the following embedded data layout,
+indicated by ``V4L2_METADATA_LAYOUT_OV2740`` metadata layout. The format
+conforms to :ref:`CCS embedded data layout <media-metadata-layout-ccs>` up to
+level 1.
+
+.. flat-table:: Omnivision OV2740 Embedded Data Layout. Octets at indices marked
+                reserved or unused have been omitted from the table. The values
+                are in big endian byte order.
+    :header-rows: 1
+
+    * - Offset
+      - Size in bits (active bits if not the same as size)
+      - Content description
+    * - 4
+      - 16 (10--0)
+      - Analogue gain
+    * - 6
+      - 16
+      - Coarse integration time
+    * - 10
+      - 8
+      - DPC correction threshold bits 9--2
+    * - 15
+      - 16
+      - Output image width
+    * - 17
+      - 16
+      - Output image height
+    * - 23
+      - 8
+      - MIPI header revision number (2)
+    * - 31
+      - 8
+      - Vertical (bit 1) and horizontal flip (bit 0)
+    * - 32
+      - 8
+      - Frame duration A
+    * - 33
+      - 8
+      - Frame duration B
+    * - 34
+      - 8
+      - Context count (2)
+    * - 35
+      - 8
+      - Context select
+    * - 54
+      - 8
+      - Data pedestal bits 9--2
+    * - 63
+      - 8
+      - Frame average bits 9--2
+    * - 64
+      - 16
+      - Digital gain red
+    * - 66
+      - 16
+      - Digital gain greenr
+    * - 68
+      - 16
+      - Digital gain blue
+    * - 70
+      - 16
+      - Digital gain greenb
+    * - 89
+      - 8
+      - Frame counter (starts at 1, wraps to 0 after 255)
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index e27a7ad47c51..b2f1ffd7071c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1249,6 +1249,7 @@ enum v4l2_jpeg_chroma_subsampling {
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 #define V4L2_METADATA_LAYOUT_CCS		1U
+#define V4L2_METADATA_LAYOUT_OV2740		2U
 
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
 #define V4L2_BINNING_FACTORS_MAKE(hnum, hdem, vnum, vdem)		\
-- 
2.47.3


