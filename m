Return-Path: <linux-media+bounces-35329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29443AE04F9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DF45167F3E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98307246BB4;
	Thu, 19 Jun 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJoQWxC2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3E25C6F4
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334373; cv=none; b=ncRopPK4OdexVtJohdxIB0CwcsJDXzlIYz/wKlgXm1OwPpvx/zaQMovgfJqcAtTdolMFF2u29c0vOjFhnPtJ/gYEkbyGqHn2wyek/daNKJdw0MLCagYLRvMjnENG7KIjqY6FSwLRF02eYNDj8S+W5C4MjXIkSqFYCZJDlR1+qAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334373; c=relaxed/simple;
	bh=9uRCQIWicttEnfdyFzwY9kMeYzJhx993FPosew+sZ64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rxN+fel0Pf6zYocNSZ2sL3Eq43KSmqu2Wp1eT84GEzbhgf6+/ZyKfhDmW3bWVMkckSV32dBCw/54FKJ0P50Amn6FGMXY9fXfoz08eSTmRkpJu7MQ8PeX8BCLpFC3/a9s057vS5z0osIJfFNrCNnDBThZCDmJR0q+3sHEW24LSk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJoQWxC2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334372; x=1781870372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9uRCQIWicttEnfdyFzwY9kMeYzJhx993FPosew+sZ64=;
  b=gJoQWxC2TI0rUkjKhV4cW9sq896Lu7fCWGQ8h+Kgjjgk8/qELJw5iWZq
   CEHwwimC+Yr5CqjVq/sHLwZi8EVYx/fHnGKhHhvFmkpX34L0iXaLdTpY7
   7O+ykIUP000o6eDT/0L2OsZ505eyhPldrJv3wR1JkMmHxA/EuCqWKv3SJ
   gf606xRQBTM/DkWE2CmDu+IzUTkZAPLofJU7GclL1N3JcNt7V/2cmuFLu
   ZJBtx417UxNBcSiGvK51OL5QuBK5P7/pRR5tJgRd6EzVI3WEeUuG6JCmc
   Ne/UUIWuTCL1MJ+umyXAXoM5W2ZSWDXEuxuBjLKAHSOx6BjpfmH6GkbFA
   g==;
X-CSE-ConnectionGUID: 9Mf1VCosSAGW79PrGFy/IQ==
X-CSE-MsgGUID: sTaIiBxgSCeytvGAy5u+hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386942"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386942"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:21 -0700
X-CSE-ConnectionGUID: +xAIs8faRq2MxW00vVeOZw==
X-CSE-MsgGUID: A52hkBwgRsKTVv0iJgMw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908539"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 80E3612329F;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AMj-1c;
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
Subject: [PATCH v10 64/64] media: ipu6: Add support for raw CFA-agnostic formats
Date: Thu, 19 Jun 2025 14:58:36 +0300
Message-Id: <20250619115836.1946016-65-sakari.ailus@linux.intel.com>
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

Add support for CFA-agnostic mbus codes and V4L2 pixelformats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c   | 4 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 4 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c  | 8 ++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index b470fc19168b..dfedfd26f229 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -31,21 +31,25 @@ static const u32 csi2_supported_codes[] = {
 	MEDIA_BUS_FMT_UYVY8_1X16,
 	MEDIA_BUS_FMT_YUYV8_1X16,
 	MEDIA_BUS_FMT_Y16_1X16,
+	MEDIA_BUS_FMT_RAW_16,
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 	MEDIA_BUS_FMT_SGBRG10_1X10,
 	MEDIA_BUS_FMT_SGRBG10_1X10,
 	MEDIA_BUS_FMT_SRGGB10_1X10,
 	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_RAW_10,
 	MEDIA_BUS_FMT_SBGGR12_1X12,
 	MEDIA_BUS_FMT_SGBRG12_1X12,
 	MEDIA_BUS_FMT_SGRBG12_1X12,
 	MEDIA_BUS_FMT_SRGGB12_1X12,
 	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_RAW_12,
 	MEDIA_BUS_FMT_SBGGR8_1X8,
 	MEDIA_BUS_FMT_SGBRG8_1X8,
 	MEDIA_BUS_FMT_SGRBG8_1X8,
 	MEDIA_BUS_FMT_SRGGB8_1X8,
 	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_RAW_8,
 	MEDIA_BUS_FMT_META_8,
 	MEDIA_BUS_FMT_META_10,
 	MEDIA_BUS_FMT_META_12,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index dca8035bb65d..da6d235513bc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -26,6 +26,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_YUYV8_1X16:
 	case MEDIA_BUS_FMT_Y16_1X16:
+	case MEDIA_BUS_FMT_RAW_16:
 	case MEDIA_BUS_FMT_META_16:
 		return 16;
 	case MEDIA_BUS_FMT_SBGGR12_1X12:
@@ -33,6 +34,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_RAW_12:
 	case MEDIA_BUS_FMT_META_12:
 		return 12;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
@@ -40,6 +42,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
 	case MEDIA_BUS_FMT_META_10:
 		return 10;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
@@ -47,6 +50,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_RAW_8:
 	case MEDIA_BUS_FMT_META_8:
 		return 8;
 	default:
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index c647ec7ec41c..56d0b0df5ab6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -93,6 +93,14 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
 	{ V4L2_PIX_FMT_Y16, 16, 16, MEDIA_BUS_FMT_Y16_1X16,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
+	{ V4L2_PIX_FMT_RAW_8, 8, 8, MEDIA_BUS_FMT_RAW_8,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
+	{ V4L2_PIX_FMT_RAW_CSI2_10, 10, 10, MEDIA_BUS_FMT_RAW_10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
+	{ V4L2_PIX_FMT_RAW_CSI2_12, 12, 12, MEDIA_BUS_FMT_RAW_12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
+	{ V4L2_PIX_FMT_RAW_16, 16, 16, MEDIA_BUS_FMT_RAW_16,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
 	{ V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10,
-- 
2.39.5


