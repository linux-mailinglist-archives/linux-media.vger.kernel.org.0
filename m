Return-Path: <linux-media+bounces-40994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F750B33C0C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AD0B7B3D74
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5872E1EE8;
	Mon, 25 Aug 2025 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKFbgz4l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B282D838F
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115525; cv=none; b=hyvH7WjkWngFJOqlGIbWkZFh/FgTTcc52L/c1frElHchg10ANzZ9cVdAQxwYNDE6YG0YDklBm0d2Jr0Lhppa1FivgNvzw1BwujsCVbNU/6gR1yA/MUngRvZsoPQoD2hnyZpYUZRfWU92E5TMzGdL+BTNAU7k7CVIiDI2jDPLQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115525; c=relaxed/simple;
	bh=dBaqmedJnfsUP0B3yn/+wVQncZLyeD9nkEUK/p3fSkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIjes/J474m2m+FlA5D5rONIIWBetjTnQOx4EMoVnsT6QxipXx0QXQREDWJ5aESyFAk/4hM787F4wmvi8yNJu7Ls3zr13h8Rh3wCuOXG9c3NTMuMAgCZHvUUwEhzK6a7TQF6KMsgI/EUMAUFic90wR5Dva73t3z316V6zPP9Qd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKFbgz4l; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115525; x=1787651525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBaqmedJnfsUP0B3yn/+wVQncZLyeD9nkEUK/p3fSkM=;
  b=TKFbgz4lk6M5n3fBv+4qs7Fvd9+O5iA4jrX7wdbrxhFJPm6IycfzGBG5
   yrD3giPspyoVo2vOG60QqFRM/086231su7FNAe1mLZO5o/vrNN6MpiFuf
   hQ84Ayj4zHFJ1+WHUakr+JJiz8EsUIgwVv41jZgLgNi2mtRiqKtayNION
   BGIge9yV1xdmJcl16avQyW2pFhmBssCtKGbp+Xk6EXUAV9uoOypOWo+7E
   9gyIXMATlH+m9nnprnGQGprfdTQHFJtJde7CYQ/+YfvDU9NbMAHpwGv/2
   SjctBv4G9Awtq2/ZPWAKodkwUu6nUKUcR+95anJ84x7byFloDoITr5wxC
   A==;
X-CSE-ConnectionGUID: H0FzYIjSTAWz3f8q8X8TIw==
X-CSE-MsgGUID: VZJLkpjpSGuQ495CaJDtLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032523"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:55 -0700
X-CSE-ConnectionGUID: bso3LobZQ5eoQJJCwkEdqg==
X-CSE-MsgGUID: h0KmlMZ3Q8yUHKHr0kl31Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431167"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A4FE122012;
	Mon, 25 Aug 2025 12:51:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr3-00000005aiR-1OrW;
	Mon, 25 Aug 2025 12:51:09 +0300
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
Subject: [PATCH v11 65/66] media: ipu6: Add support for luma-only formats
Date: Mon, 25 Aug 2025 12:51:06 +0300
Message-ID: <20250825095107.1332313-66-sakari.ailus@linux.intel.com>
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

Add support for luma-only formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c   | 3 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 7 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c  | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index d1fece6210ab..b6421d6b978a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -34,14 +34,17 @@ static const u32 csi2_supported_codes[] = {
 	MEDIA_BUS_FMT_SGBRG10_1X10,
 	MEDIA_BUS_FMT_SGRBG10_1X10,
 	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_Y10_1X10,
 	MEDIA_BUS_FMT_SBGGR12_1X12,
 	MEDIA_BUS_FMT_SGBRG12_1X12,
 	MEDIA_BUS_FMT_SGRBG12_1X12,
 	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_Y12_1X12,
 	MEDIA_BUS_FMT_SBGGR8_1X8,
 	MEDIA_BUS_FMT_SGBRG8_1X8,
 	MEDIA_BUS_FMT_SGRBG8_1X8,
 	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_Y8_1X8,
 	MEDIA_BUS_FMT_META_8,
 	MEDIA_BUS_FMT_META_10,
 	MEDIA_BUS_FMT_META_12,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 463a0adf9e13..5db59cec821e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -31,18 +31,21 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGBRG12_1X12:
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_Y12_1X12:
 	case MEDIA_BUS_FMT_META_12:
 		return 12;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_Y10_1X10:
 	case MEDIA_BUS_FMT_META_10:
 		return 10;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
 	case MEDIA_BUS_FMT_META_8:
 		return 8;
 	default:
@@ -65,21 +68,25 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
 	case MEDIA_BUS_FMT_SGBRG16_1X16:
 	case MEDIA_BUS_FMT_SGRBG16_1X16:
 	case MEDIA_BUS_FMT_SRGGB16_1X16:
+	case MEDIA_BUS_FMT_Y16_1X16:
 		return MIPI_CSI2_DT_RAW16;
 	case MEDIA_BUS_FMT_SBGGR12_1X12:
 	case MEDIA_BUS_FMT_SGBRG12_1X12:
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_Y12_1X12:
 		return MIPI_CSI2_DT_RAW12;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_Y10_1X10:
 		return MIPI_CSI2_DT_RAW10;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
 		return MIPI_CSI2_DT_RAW8;
 	case MEDIA_BUS_FMT_META_8:
 	case MEDIA_BUS_FMT_META_10:
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index e1306b9510e7..9a6b4736cd67 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -85,6 +85,12 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGB565 },
 	{ V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGBA888 },
+	{ V4L2_PIX_FMT_GREY, 8, 8, MEDIA_BUS_FMT_Y8_1X8,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
+	{ V4L2_PIX_FMT_Y10, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
+	{ V4L2_PIX_FMT_Y12, 12, 12, MEDIA_BUS_FMT_Y12_1X12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
 	{ V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10,
-- 
2.47.2


