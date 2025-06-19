Return-Path: <linux-media+bounces-35330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C3AE0503
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9635A4414
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E011625C818;
	Thu, 19 Jun 2025 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GN/QQH5A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10F525BEFF
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334374; cv=none; b=HvMjGQ2pNh7BK5n3FXD0O3Z5XEB3c7/RNML7wNI/U4aBqP5DGxoc1pMQZQ9Ia5GfM7/LDiCdrF/oiYQa+MflSCWReTvvDrvhdhMj8VmQnkyHelmVDVAy6gR3Nt2nPcGG71u3qMg4o4Q+WJY9ERimR/pAgjAH2pcFf9KABMxBLHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334374; c=relaxed/simple;
	bh=FAXZvBPUX9BUF3G4egfXUJWno6suOnQVy8XVfS+1oeo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mKX9Tn2us1G9EeMx0C2Eoiw9WdttYIpgEO6Fc5cgn03bGMG2AVACqnHcYymujFQO2xjfofZZq6ruBkT7K+UHsZnBTEwXTvQflq3M/daVwZfFrvoOlXz9LwHtVowQ1UXo41q2NYpc7R6fIJaPlr1NatqBwSPOgghNumpBjYAR2fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GN/QQH5A; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334373; x=1781870373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FAXZvBPUX9BUF3G4egfXUJWno6suOnQVy8XVfS+1oeo=;
  b=GN/QQH5AuSuIRxvY0DrPOfhpT3ub2OfYLxhkvj+xcYWDgTl/563Q4Crp
   m88VrASMtdu8D5z6hsaLEkQSQ1Y6secsqcWV029Z+/3Zpr+30s/5FnltF
   lp1BAGJYNngwRcfsKlgQsgBTxte0U+dfU7DDatRtRAl4hnW/GsMynRUM0
   THSuCDJwwgMgPRyNcOQurwlbCnBQpDhqN6ft93UPOdRJZImSJUyDAcGAq
   olMtKRUjjEg0LyXoPL31G5aka8ZDX8znOFOrkqY0AFAg0C2qdJkSc658r
   wvchctgdUnKNcVGsY7ovb3TXCOUzCtnDHHUng+s671opXnrj9Xz6GId5w
   w==;
X-CSE-ConnectionGUID: S1NROrLMSPiyJuK8EGSFyQ==
X-CSE-MsgGUID: +OV7yDMyQ366Q8dOCmT7/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386952"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386952"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:21 -0700
X-CSE-ConnectionGUID: 5905Ac6ZT1aOqwg4MsCaEQ==
X-CSE-MsgGUID: QqNtJH6kQ52f/l9ZfoKLHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908542"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7ED6912329C;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AMe-1a;
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
Subject: [PATCH v10 63/64] media: ipu6: Add support for luma-only formats
Date: Thu, 19 Jun 2025 14:58:35 +0300
Message-Id: <20250619115836.1946016-64-sakari.ailus@linux.intel.com>
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

Add support for luma-only formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c   | 4 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 8 ++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c  | 8 ++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 8d57cdb6aeb0..b470fc19168b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -30,18 +30,22 @@ static const u32 csi2_supported_codes[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_UYVY8_1X16,
 	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_Y16_1X16,
 	MEDIA_BUS_FMT_SBGGR10_1X10,
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
index 463a0adf9e13..dca8035bb65d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -25,24 +25,28 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_RGB565_1X16:
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_Y16_1X16:
 	case MEDIA_BUS_FMT_META_16:
 		return 16;
 	case MEDIA_BUS_FMT_SBGGR12_1X12:
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
@@ -65,21 +69,25 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
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
index db00e4f3afc7..c647ec7ec41c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -85,6 +85,14 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGB565 },
 	{ V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGBA888 },
+	{ V4L2_PIX_FMT_GREY, 8, 8, MEDIA_BUS_FMT_Y8_1X8,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
+	{ V4L2_PIX_FMT_Y10, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
+	{ V4L2_PIX_FMT_Y12, 12, 12, MEDIA_BUS_FMT_Y12_1X12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
+	{ V4L2_PIX_FMT_Y16, 16, 16, MEDIA_BUS_FMT_Y16_1X16,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
 	{ V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10,
-- 
2.39.5


