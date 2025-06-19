Return-Path: <linux-media+bounces-35281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7813AE04C5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B04EF1798F6
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892432550C7;
	Thu, 19 Jun 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aL4T/aJL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B22F22E403
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334345; cv=none; b=oLt1O2/fajA+iEIXMUGPtf5rNn7yr5yuZozU1goGZCM9/xpZz7GYB4TGSjCxtUVhu3GVoiIVnEoZHdh8x8/esZiYgewMOm4F+EHMWj/VNL+Jljva2rRVib6Y1jo7d2Jxq2iMtpLlI7gw58uW4TPRZwTUEbD04S1PLNplpRAqtZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334345; c=relaxed/simple;
	bh=oBLxByXXnQN+dWuYE91kF4fz9oGaJthT6ajeU9V8Vuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=inQr3z3ro/QMzz2V4ZFt/x+DgbSiytbbEyXXQMs1TvEiq42PUblYmZ4Qs9Gp8dI3FOkmXWK8wftWNJsPpkLP/MYXsGiR+PEuanlIscRshHVhiLVj71n8wN6kIYWc0XwLLRrLazGyXXizOvhmIhFMKH6NVoK3T6XJGLkMZWbs6vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aL4T/aJL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334344; x=1781870344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oBLxByXXnQN+dWuYE91kF4fz9oGaJthT6ajeU9V8Vuc=;
  b=aL4T/aJLvSLe3iTpt2juZLq4+7R3zDB0q+hZ88pB4pTFrY0wzvnVTzHr
   zmgwiNts2QP1TfRy1Q3EP0r275v0RYUD4d1nH1zqvxLMhOPbBJp448o4V
   bcrNlJcVHhRTmOpoAjV3gxi9HXk/rYAxEH/353GUoTwZKAWUFszfFvmIN
   yz8APjmUEQ1yo3B27SoDx9voqnUtio+wZLEBwl/cFL9Jvyscu+CGFg2hn
   0CgD8pUdG4EqNVV+jDpMiP0VnY5Ne9xxukcPf9Gm5kIXWyUmUXUmhcxcj
   gXeOtGZ7TlGrl2Wc0p8LrHzLYQTbIE97ShLSvIWKZk1G50SUzngWC2dlb
   Q==;
X-CSE-ConnectionGUID: OpS1kqpgSEuZm0Ems7JZ0w==
X-CSE-MsgGUID: gq2swcQ6S+SvlL4JQFugsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64015054"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64015054"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:03 -0700
X-CSE-ConnectionGUID: OL19yaoFTL+uSPRrUGFRmg==
X-CSE-MsgGUID: vMoteRtKQWyDtG+HQySKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192287"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D6D43120B03;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AIr-2k;
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
Subject: [PATCH v10 16/64] media: uapi: Add new media bus codes for generic raw formats
Date: Thu, 19 Jun 2025 14:57:48 +0300
Message-Id: <20250619115836.1946016-17-sakari.ailus@linux.intel.com>
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

Add new media bus codes for generic raw formats that are not specific to
the colour filter array but that simply specify the bit depth. The layout
(packing) of the data is interface specific.

The rest of the properties of the format are specified with controls in
the image source.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/subdev-formats.rst              | 40 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         | 10 +++++
 2 files changed, 50 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 9ef1bc22ad9c..c06d8c83e2b8 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3434,6 +3434,46 @@ organization is given as an example for the first pixel only.
 
     \endgroup
 
+Generic raw formats on serial interfaces
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Those formats transfer (largely) unprocessed raw pixel data typically from raw
+camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
+interfaces. The packing of the data on the bus is determined by the hardware,
+however the bit depth is still specific to the format.
+
+The colour components and the native pixel order are determined by the
+``V4L2_CID_COLOUR_PATTERN`` control. Whether or not flipping controls
+(``V4L2_CID_HFLIP`` and ``V4L2_CID_VFLIP``) affect the pattern is conveyed via
+the ``V4L2_CID_COLOUR_PATTERN_MODIFY`` control.
+
+.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: Generic raw formats on serial buses
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       1 1
+
+    * - Format name
+      - Bit depth
+    * - MEDIA_BUS_FMT_RAW_8
+      - 8
+    * - MEDIA_BUS_FMT_RAW_10
+      - 10
+    * - MEDIA_BUS_FMT_RAW_12
+      - 12
+    * - MEDIA_BUS_FMT_RAW_14
+      - 14
+    * - MEDIA_BUS_FMT_RAW_16
+      - 16
+    * - MEDIA_BUS_FMT_RAW_20
+      - 20
+    * - MEDIA_BUS_FMT_RAW_24
+      - 24
+    * - MEDIA_BUS_FMT_RAW_28
+      - 28
 
 Packed YUV Formats
 ^^^^^^^^^^^^^^^^^^
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index ff62056feed5..3abae4c77c6d 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -185,4 +185,14 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
+/* Generic (CFA independent) pixel data formats. Next is 0xa009. */
+#define MEDIA_BUS_FMT_RAW_8			0xa001
+#define MEDIA_BUS_FMT_RAW_10			0xa002
+#define MEDIA_BUS_FMT_RAW_12			0xa003
+#define MEDIA_BUS_FMT_RAW_14			0xa004
+#define MEDIA_BUS_FMT_RAW_16			0xa005
+#define MEDIA_BUS_FMT_RAW_20			0xa006
+#define MEDIA_BUS_FMT_RAW_24			0xa007
+#define MEDIA_BUS_FMT_RAW_28			0xa008
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.39.5


