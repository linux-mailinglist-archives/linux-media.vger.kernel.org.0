Return-Path: <linux-media+bounces-35327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD8BAE04F7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6451D17FBCD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A1E248F47;
	Thu, 19 Jun 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPyYZouV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFA25B680
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334372; cv=none; b=EcsEg+sT8bFermIzJdq6QsNFKJq5xuMHejlUFN/2NCdeZtLJt8WG5wi30+nzDC6ViHe78XL6Dge2razvc041HUoFrpM7eXHTYKqUY77e6bFETBiuuCIEoVE4Mqa4mX/X2LlZ/iJ3e4rAXPEp69/2aI2HGV1u3+tCdcQ98gs6WX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334372; c=relaxed/simple;
	bh=2rFlMwUKeZ2BWBciPcayPrpLlF1FuTxuppvO7qy2MWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RVfiY4JPAodtAVvz/vn1g5CQrP89HMGTvzyvK5wOjkLVIpcDcct2ZMrGJn/rre5qSj6rR7oJR63vRwrpkR7RhaZIaWmRMn/qjNK2IEkiEEdGgZ60hWnd1/NjDcmRducGIOZCa0BcgtnDjuBcEUSItWgB13NYH+VSafIe30PBPk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPyYZouV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334372; x=1781870372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2rFlMwUKeZ2BWBciPcayPrpLlF1FuTxuppvO7qy2MWc=;
  b=iPyYZouVK2VvM4ENoxGfU5VXllEahIOZIkA8Jv5OIQhDqUjDsu3XhGvw
   saB7fTw3nKbN//8iUJYRO6p8TQ8jw99NitrzsgPv6Gt6iMokQv85BzDTz
   gUWnoZSfud9IGQMpcr2pO0htzL3qF9sQ5ENbQidjCA9zKP0wVbGxdT3Nk
   mp+YdnVfwmJcA4lzEfCgFGi+ZhO8QGZRPy97cvzjrZDF/LEwugEG5xdSB
   lnv9LW1jndJlWA4xFXujDdbXt2WZ8nQVdgaxhDimp5cb86GBQfcT8TIbV
   LY28A8vv8QpV5O/1WmtFVnZ9d3K/DHGt2Y6cTk2cpm1O70wH/ktKB+4P7
   w==;
X-CSE-ConnectionGUID: sXJ3th0iRNOjqMWwEtw5TA==
X-CSE-MsgGUID: tfO9nA8GQJOX8eHlvasdXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386939"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:21 -0700
X-CSE-ConnectionGUID: QfW9wum5Qhip3x9dOTvPuw==
X-CSE-MsgGUID: FU/OWqA2Rja6gkavUEyVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908535"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7621E123293;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AMP-1S;
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
Subject: [PATCH v10 60/64] media: imx219: Add support for generic raw formats
Date: Thu, 19 Jun 2025 14:58:32 +0300
Message-Id: <20250619115836.1946016-61-sakari.ailus@linux.intel.com>
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

Add support for colour pattern agnostic raw formats, including controls to
convey the colour pattern and related information.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 44 +++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 8b5d7d6a5fb2..9138219d7f85 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -284,6 +284,12 @@ static const u32 imx219_mbus_formats[] = {
 	MEDIA_BUS_FMT_SBGGR8_1X8,
 };
 
+static const u32 imx219_mbus_formats_raw[] = {
+	IMX219_NATIVE_FORMAT,
+	MEDIA_BUS_FMT_RAW_10,
+	MEDIA_BUS_FMT_RAW_8,
+};
+
 /*
  * Initialisation delay between XCLR low->high and the moment when the sensor
  * can start capture (i.e. can leave software stanby) must be not less than:
@@ -386,6 +392,10 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 {
 	unsigned int i;
 
+	if (code == MEDIA_BUS_FMT_RAW_10 ||
+	    code == MEDIA_BUS_FMT_RAW_8)
+		return code;
+
 	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
 		if (imx219_mbus_formats[i] == code)
 			break;
@@ -650,6 +660,20 @@ static int imx219_init_controls(struct imx219 *imx219)
 		/* The "Solid color" pattern is white by default */
 	}
 
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_COLOR_PATTERN,
+			  V4L2_COLOR_PATTERN_RGGB, V4L2_COLOR_PATTERN_RGGB,
+			  1, V4L2_COLOR_PATTERN_RGGB);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+			  V4L2_CID_COLOR_PATTERN_FLIP,
+			  0, V4L2_COLOR_PATTERN_FLIP_BOTH,
+			  0, V4L2_COLOR_PATTERN_FLIP_BOTH);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_METADATA_LAYOUT,
+			  0, V4L2_METADATA_LAYOUT_CCS,
+			  1, V4L2_METADATA_LAYOUT_CCS);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err_probe(&client->dev, ret, "Control init failed\n");
@@ -871,11 +895,16 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case IMX219_PAD_IMAGE:
+		const u32 img_codes[] = {
+			IMX219_NATIVE_FORMAT,
+			MEDIA_BUS_FMT_RAW_10,
+		};
+
 		/* The internal image pad is hardwired to the native format. */
-		if (code->index > 0)
+		if (code->index > ARRAY_SIZE(img_codes))
 			return -EINVAL;
 
-		code->code = IMX219_NATIVE_FORMAT;
+		code->code = img_codes[code->index];
 		return 0;
 
 	case IMX219_PAD_EDATA:
@@ -898,10 +927,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->stream == IMX219_STREAM_IMAGE) {
 		u32 format;
 
-		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
-			return -EINVAL;
+		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4) {
+			u32 idx = code->index - ARRAY_SIZE(imx219_mbus_formats);
+			if (idx >= ARRAY_SIZE(imx219_mbus_formats_raw))
+				return -EINVAL;
 
-		format = imx219_mbus_formats[code->index * 4];
+			format = imx219_mbus_formats_raw[idx];
+		} else {
+			format = imx219_mbus_formats[code->index * 4];
+		}
 		code->code = imx219_get_format_code(imx219, format);
 	} else {
 		struct v4l2_mbus_framefmt *fmt;
-- 
2.39.5


