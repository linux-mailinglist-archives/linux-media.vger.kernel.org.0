Return-Path: <linux-media+bounces-62031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI4ADLZBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D241157116E
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6F163011791
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9223FDBE7;
	Mon, 18 May 2026 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiUczfFE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324C409DE0
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122605; cv=none; b=lH8e/BARlqNhOjv/Ji0wAOHGQfynYhJF8dt4YYKtCFUz0MPVSWybnND2aZKK/FTGGDmxigQHBQznAHghaq80SlsTxJxboD841bkTFygJgzapPZthqiskNSpVsz6p6VM95y9wNwtjYQtS7FWUXCj3kJYDs/s8svNSF0zAXTvoWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122605; c=relaxed/simple;
	bh=YwVytGHMIjbbtR3+MNjtAt9eeB+aqUwcvYlowf9khUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZS2Hs6/rj3jQivgVlX9lVFyNAQeuLs6teG31YrvK1RNOU5YpbF0qVTlJml+5e+Odx44AAyV3MuFKD3mIHxot8TbXlilnsZyq/899k2+D6e+6vr7L9DwabFVg+54MkZswfD2R0bbgO7yv/rp9Xr1FHjkXaLpe1KUs3Lf+Dtwaws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiUczfFE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122604; x=1810658604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YwVytGHMIjbbtR3+MNjtAt9eeB+aqUwcvYlowf9khUo=;
  b=JiUczfFEdaFYKc74RLftQ5WypUK5WBsL0W0AfzLtluudPy9BPNbBHAFh
   joi1eUIqNGHTXpXoVM/jrcM6TCl0gJkvI+SiKCWHxvOrio/Wwtg1TLD3c
   CO3rVQ7VX/AnR//xxZPhK1Fx1hOBLKtIjntaq5S6NLt2SloAa0oDu88lh
   7bFH/SW6znQxeX5QYHPIqRp8eA7X3EnBkOm8cj5PvImPA7vpRdn6VSPdM
   Or4aYDAl+gNSs/ZgdVNt1CXcK/BLRCc7WaWDufM1pswyR0VEqjCAnzLpO
   8h24bt56n3McSXU2HihiNG+x57lAeKrnF6vfAK0vFO3IlG2MIrEt8wl3X
   g==;
X-CSE-ConnectionGUID: +IWbzs0+QfGFga4/HkNZdw==
X-CSE-MsgGUID: 6giOFBxqQWmkDceMT0Ly3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413827"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413827"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:20 -0700
X-CSE-ConnectionGUID: 4ajkOt9GTXO7qZ+Jz/aHbA==
X-CSE-MsgGUID: twNMQnlQQ2Sh8EML6dD0sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019136"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 27EAD121CB1;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E89Z-0Fyi;
	Mon, 18 May 2026 19:43:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v2 01/17] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
Date: Mon, 18 May 2026 19:43:01 +0300
Message-ID: <20260518164318.3367888-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62031-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,intel.com:email,intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D241157116E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frank Li <Frank.Li@nxp.com>

Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
to reduce codes such as

	static const struct imx7_csi_pixfmt pixel_formats[] = {
        {
                .fourcc = V4L2_PIX_FMT_UYVY,
                .codes  = IMX_BUS_FMTS(
                        MEDIA_BUS_FMT_UYVY8_2X8,
                        MEDIA_BUS_FMT_UYVY8_1X16
                ),
                .yuv    = true,
                .bpp    = 16,
        },
	....

.bpp can be removed from pixel_formats with this helper function.

CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
See section 9.4.

Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
MIPI defined data type and avoid below duplicated static array in each CSI2
drivers.

	{
		.code = MEDIA_BUS_FMT_UYVY8_1X16,
		.data_type = MIPI_CSI2_DT_YUV422_8B,
	}

Only add known map for dt type. Need update media_bus_fmt_info when new
mapping used.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 183 ++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |  24 ++++
 2 files changed, 207 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bceafc4e92c8..2bf53799587f 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -46,6 +46,7 @@
 #include <linux/uaccess.h>
 #include <asm/io.h>
 #include <asm/div64.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -808,3 +809,185 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 	return clk_hw->clk;
 }
 EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
+
+/**
+ * struct media_bus_fmt_info - information about a media bus format
+ * @code: media bus format identifier (MEDIA_BUS_FMT_*)
+ * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
+ * @bpp: bit width per pixel, which is suffix from MEDIA_BUS_FMT_*, no pad. no
+ *	 compressed data.
+ */
+struct media_bus_fmt_info {
+	u32 code;
+	u8 dt;
+	u8 bpp;
+};
+
+static const struct media_bus_fmt_info media_bus_fmt_info[] = {
+	{ .code = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21 },
+	{ .code = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48 },
+
+	{ .code = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 15 },
+	{ .code = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 24 },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+
+	{ .code = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8 },
+
+	{ .code = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8 },
+
+	{ .code = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 32 },
+
+	{ .code = MEDIA_BUS_FMT_META_8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_META_10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_META_12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_META_14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_META_16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_META_20, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_META_24, .bpp = 24 },
+};
+
+static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
+		if (media_bus_fmt_info[i].code == bus_fmt)
+			return &media_bus_fmt_info[i];
+	}
+
+	return NULL;
+}
+
+int media_bus_fmt_to_csi2_dt(u32 bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	if (!info)
+		return -EINVAL;
+
+	/* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type code */
+	return info->bpp ? info->dt : -EINVAL;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
+
+int media_bus_fmt_to_csi2_bpp(u32 bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	if (!info)
+		return -EINVAL;
+
+	return info->bpp ? info->bpp : -EINVAL;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index 40fc0264250d..86601c9824bc 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -8,6 +8,8 @@
 #ifndef _MEDIA_MIPI_CSI2_H
 #define _MEDIA_MIPI_CSI2_H
 
+#include <linux/types.h>
+
 /* Short packet data types */
 #define MIPI_CSI2_DT_FS			0x00
 #define MIPI_CSI2_DT_FE			0x01
@@ -44,4 +46,26 @@
 #define MIPI_CSI2_DT_RAW20		0x2f
 #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
 
+/**
+ * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus format
+ *
+ * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ *
+ * Return: MIPI CSI2 data type MIPI_CSI2_DT_*, or -EINVAL if no mbus code is
+ * found..
+ */
+int media_bus_fmt_to_csi2_dt(u32 bus_fmt);
+
+/**
+ * media_bus_fmt_to_csi2_bpp - Get media bus format's bit depth
+ *
+ * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ *
+ * Return: bit depth, -EINVAL if fail to get from bus_fmt.
+ *
+ * Notes: this bpp is suffix from MEDIA_BUS_FMT_*, no pad, not for compressed
+ * data.
+ */
+int media_bus_fmt_to_csi2_bpp(u32 bus_fmt);
+
 #endif /* _MEDIA_MIPI_CSI2_H */
-- 
2.47.3


