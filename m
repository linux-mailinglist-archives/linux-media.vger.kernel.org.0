Return-Path: <linux-media+bounces-40980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A6AB33C09
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B13A7B3727
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2630F2E06D2;
	Mon, 25 Aug 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqDcUOQV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6922E03E1
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115518; cv=none; b=RZu55SWaHgtKFiQXGPkurcKxU/hh/4I097MI1myHtiPB4Jdi2q2BawfrkqOdPhZ5I88iLKMGTQsDkBKO4/UKUQSqCZmumRxfi/CRLwz8aKuTKiUw8vwUhQY3e6SMaJMBOpkGPKpaPU+AfDdxj+lltXzs6+wEiBdH5MbotRwVQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115518; c=relaxed/simple;
	bh=H3CTGjYs3TxJoTvmZDjqCNtYPeLUKmp6JgvxcHF3uzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZe2RyZ24mjvf5tdLIK+ntfwBA05E2xdve0Uxcm0kQgtCddxJwif2CEtex4LE13PJxUXvYcMpqRThpO9AJm9erwKuyyg+7Tmw2UCilAmx1a6n5ZGx76VSs+cIzbbFPtT2Qwyob6IvpDAzCLF5F5d/v21VaK0lbWMphesr7rmODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqDcUOQV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115517; x=1787651517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H3CTGjYs3TxJoTvmZDjqCNtYPeLUKmp6JgvxcHF3uzY=;
  b=lqDcUOQVCOOSlePy6b48MutIA+dWPnYIG9bH1n/ngwQnnBG5mOrrceUR
   QZcdXI6zRCA6jZwErUmSbm3xJSteaVH59tSFhAQN7q2E2AVC149NAHDA9
   idHoRLrO9WFE+aGDBDHkumspSWYKATxxIMwpRsE07IkFOgfNmSuQ9mqwl
   jJN5ilJBHVCFg8nzHqUFYQgKcHWTztHBIejjGXDnLnSHiVN+3EG2dChSH
   /U8AIvdPka4o1JPAuEmM/pfagLXd2kpSaJVEqe2bojph402X0vXmsbZQU
   d8BOKo7u6OvVykwYOw2mSqC7uTsHiqMAM/kv0ZSxuPxTqEUl16/VqBche
   Q==;
X-CSE-ConnectionGUID: vuucajjDRzeR+G+w9hfBOg==
X-CSE-MsgGUID: nSRXBgnrT2COvBmzhaMuKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032347"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:46 -0700
X-CSE-ConnectionGUID: sNX9XoMlTtKr+801CFjDTQ==
X-CSE-MsgGUID: Iq7NaFlTSKKEVL0s5XsvKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431105"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BE845121FF7;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005agu-37ss;
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
Subject: [PATCH v11 46/66] media: uapi: Add metadata layout for ov2740 embedded data
Date: Mon, 25 Aug 2025 12:50:47 +0300
Message-ID: <20250825095107.1332313-47-sakari.ailus@linux.intel.com>
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

Add a metadata layout for ov2740 camera sensor embedded data and document
it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      |  3 +
 .../media/v4l/metadata-layouts.rst            | 72 +++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 76 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 371c155a88f7..ced358d7c250 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -165,3 +165,6 @@ Image Source Control IDs
     * - V4L2_METADATA_LAYOUT_CCS
       - :ref:`CCS embedded data <media-metadata-layout-ccs>`
       - 1
+    * - V4L2_METADATA_LAYOUT_OV2740
+      - :ref:`OV2740 embedded data <media-metadata-layout-ov2740>`
+      - 2
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index a4f7e93e6a29..e667148cc3cb 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -39,3 +39,75 @@ format" (code ``0xa``) but their use may be extended further in the future, to
 cover other CCS embedded data format codes.
 
 Also see :ref:`CCS driver documentation <media-ccs-routes>`.
+
+.. _media-metadata-layout-ov2740:
+
+Omnivision OV2740 Embedded Data Layout (``V4L2_METADATA_LAYOUT_OV2740``)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Omnivision OV2740 camera sensor produces the following embedded data layout,
+indicated by ``V4L2_METADATA_LAYOUT_CCS`` metadata layout. The format conforms
+to :ref:`CCS embedded data layout <media-metadata-layout-ccs>` up to level 1.
+
+.. flat-table:: Omnivision OV2740 Embedded Data Layout. Octets at indices marked
+                reserved or unused have been omitted from the table. The values
+                are big endian byte order.
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
+      - Dpc correction threshold
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
index 51d43d4a3151..bac2fdcbd202 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1244,6 +1244,7 @@ enum v4l2_jpeg_chroma_subsampling {
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 #define V4L2_METADATA_LAYOUT_CCS		1U
+#define V4L2_METADATA_LAYOUT_OV2740		2U
 
 
 /* Image processing controls */
-- 
2.47.2


