Return-Path: <linux-media+bounces-35311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A30BCAE04CA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1056818952E0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5A625A353;
	Thu, 19 Jun 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WE/M8qCF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E007259C9A
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334363; cv=none; b=eQLEiALNunHYSOIkHKDo068cIafENDj2WhbIVEfpCVHnC4NAL8sb1kQM2CxclyfujzZlp5ETwxQdQN8Se0s5t0bzKiyMasWZEWgGbJrTYargpwIVnXHeUlEWp5wMwcSYcS1EMFm/j00AwjbJwlyn4QHl7FYqYmPAVeG8lNVlYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334363; c=relaxed/simple;
	bh=rD7OC+Kq9UwOL7DqZHJxmNHLXx+DV1fX/LExAV3Qvyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=guXnNkRCKHdyNSbDhgdNaNhmFKQO8uUWIvv0Dfv0kTsxmQKAgdTc9tKqVKN4IEje2xhtlZQleqDU33QH+h3YrQKOKnX4qSnD2dqHMMhwGJgrGvSCb8q9YrCMj5nmG4MsCIuCyL0ik+3TZlZsbH5lF0OEhkjgHzw+nvZXT0khtGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WE/M8qCF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334361; x=1781870361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rD7OC+Kq9UwOL7DqZHJxmNHLXx+DV1fX/LExAV3Qvyw=;
  b=WE/M8qCFIQNV0qhYzfBcK1ho4m8tTvde0j15fZAaaYQ2Gs5Wy1bUs+ao
   2zrke4wNwE/DvJko6e5cfpKTTv5MrBJjx91Lf4qBnSZ78OoKaeGKdan5Q
   jxf9UA7EX1mssI0Gc+ITGuGjW4L4Mg9+Wyaf4XSaazHmsw++fZEIqacvG
   9B3w6lebT4mWFS0oUMj2qtRtA8ARuQVdfUPrqFeAjLKiFxOyR/7a/TbWM
   l935B2MWIPGnttQy9alEUJlY/4YZRGbm3kzFcWnf8dVUibgkketVn21ZN
   ftVNG7s1plHHZtuwZCLy+tL2Rbpz0hF4Fob1oOzJsp37PrFBXMqzN5VgC
   A==;
X-CSE-ConnectionGUID: C5SqgiWjQ5yLrCoch37nrA==
X-CSE-MsgGUID: bARVdXliQ7qD9BTnT6tv+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386701"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386701"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: GUFDB9q9QOaHK3JDX+1wYw==
X-CSE-MsgGUID: RqjrT0JQSCKQw69zFpf3rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908450"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 468CD123247;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALH-0q;
	Thu, 19 Jun 2025 14:58:37 +0300
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
Subject: [PATCH v10 46/64] media: uapi: Add metadata layout for ov2740 embedded data
Date: Thu, 19 Jun 2025 14:58:18 +0300
Message-Id: <20250619115836.1946016-47-sakari.ailus@linux.intel.com>
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

Add a metadata layout for ov2740 camera sensor embedded data and document
it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 .../media/v4l/metadata-layouts.rst            | 70 +++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 2 files changed, 71 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index a4f7e93e6a29..9d7096138ef0 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -39,3 +39,73 @@ format" (code ``0xa``) but their use may be extended further in the future, to
 cover other CCS embedded data format codes.
 
 Also see :ref:`CCS driver documentation <media-ccs-routes>`.
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
index 61d82e250480..9f4e61499592 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1238,6 +1238,7 @@ enum v4l2_jpeg_chroma_subsampling {
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 #define V4L2_METADATA_LAYOUT_CCS		1U
+#define V4L2_METADATA_LAYOUT_OV2740		2U
 
 /* Image processing controls */
 
-- 
2.39.5


