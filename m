Return-Path: <linux-media+bounces-40991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B13B33C02
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128841885324
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33EC2E1C63;
	Mon, 25 Aug 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYAqueKP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831502C0F93
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115524; cv=none; b=eJC0f6spCac+41EO3nQRRgMx4ZBjqaUW2wuvI2q+DFbYhDWwpzdcheUh2lQA0TLW24f/1jdJLRyvtjd9t90v4h119GRBqerZuV5Bj2eph/JYJDWymu1c+wijCGERuPGeB8rlqxcxgVbf33xbmgR+bg5uX/dNxkvLEpV/xAGzqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115524; c=relaxed/simple;
	bh=uXZAM9Xr+J0CHnJJeX5VgO6qpprlt/q7Mvs3ZC6RzfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDnxV41dw6jlFSiK/qAM0Tsih1JLRIbX/wVjBlfGAJq5DMjTIv8EtGlgefnSa/GorqaqsWpKEiJxB3weV+fXJqNLVW9Lw2A9zvLGrBK0LmXZ7mx33RpQP6wJmaCLv48viqe34Njez5Y5260hICeMqdnWSXDXQ2OmkVUrrGv5kQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYAqueKP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115523; x=1787651523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uXZAM9Xr+J0CHnJJeX5VgO6qpprlt/q7Mvs3ZC6RzfA=;
  b=YYAqueKPmVqznRCFkEJzKOcxMknsEzMgwzd6mSQ6Zj7fkG8DTjuiP0gP
   r6r0kPHtjuASALfveO4USTvp04L+j9ReXXPNTwIQwBkYcOVhaPLMZIYLR
   g2A+aUpu46BqsBwIYspeZXzOIyU5gKnQvbIa8uTXoRMwRxRRDsfSWOeKv
   TntXczqcXj84W1HYj6zEbX59QPaR0L9HJaHoqfXMY1kJMAi8mTaqeIeHL
   rwqm4NhGfgmlV7Ejb2M8MX+zPFji0euNwEVbrHcSkEySOaxh295amCUCs
   GLn9mBrvrHhSzs3bM2gnlWNGgpzZxkM8EeFC4TvvBzZUCTGyL1A31HMm0
   Q==;
X-CSE-ConnectionGUID: INW/BOPRTsS8dzlhQDpK7w==
X-CSE-MsgGUID: cKtMd59lS9a5XdeZrwrhxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032490"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032490"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:55 -0700
X-CSE-ConnectionGUID: IQAfYVP0TiyBNrm/7AI0Tg==
X-CSE-MsgGUID: gVvU9AwXSb2R5oMR449l9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431161"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5EAB5122013;
	Mon, 25 Aug 2025 12:51:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr3-00000005aiW-1TfP;
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
Subject: [PATCH v11 66/66] media: ipu6: Add support for raw CFA-agnostic formats
Date: Mon, 25 Aug 2025 12:51:07 +0300
Message-ID: <20250825095107.1332313-67-sakari.ailus@linux.intel.com>
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

Add support for CFA-agnostic mbus codes and V4L2 pixelformats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c   | 3 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 3 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c  | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index b6421d6b978a..21a4f130bb34 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -35,16 +35,19 @@ static const u32 csi2_supported_codes[] = {
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
index 5db59cec821e..407db2ebe6ee 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -32,6 +32,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
 	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_RAW_12:
 	case MEDIA_BUS_FMT_META_12:
 		return 12;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
@@ -39,6 +40,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
 	case MEDIA_BUS_FMT_META_10:
 		return 10;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
@@ -46,6 +48,7 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_RAW_8:
 	case MEDIA_BUS_FMT_META_8:
 		return 8;
 	default:
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 9a6b4736cd67..362608f89fc5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -91,6 +91,12 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
 	{ V4L2_PIX_FMT_Y12, 12, 12, MEDIA_BUS_FMT_Y12_1X12,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
+	{ V4L2_PIX_FMT_RAW_8, 8, 8, MEDIA_BUS_FMT_RAW_8,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
+	{ V4L2_PIX_FMT_RAW_CSI2_10, 10, 10, MEDIA_BUS_FMT_RAW_10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
+	{ V4L2_PIX_FMT_RAW_CSI2_12, 12, 12, MEDIA_BUS_FMT_RAW_12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
 	{ V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10,
-- 
2.47.2


