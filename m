Return-Path: <linux-media+bounces-35300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6FAAE04DA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B9904A408B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B6A257AEC;
	Thu, 19 Jun 2025 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njrdok2W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88772571C2
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334355; cv=none; b=bB5IckfuS06VIjqOCd80lo8nfscfm25sECi80kMthLTWCYck2Z49ru+EV+WrNfZLrKJcLU5DysGGlwrknfBco8jYLrYzMwMfT6eHVa389DnubMiuTwEtSXMRA4N6hHCOpRXp1WSbGaxsAQxO8z+MrmByHAkI3FlaHzLXSGszhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334355; c=relaxed/simple;
	bh=Pnxb5TAOrp6Du+wWL6x4R3RF7AIz+Y9RsI0zGnUqofo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gzR24uhkNI6nEr+OzAgtoaFc8mFBzNhNo1EQyroBjMUuEB0aNTtYZRi+cfBD/HY3j6okcVQHhILWa0L+Dhc8FHCG6Fc3IIaP+ofYN+mbfLMsDYJJJpBDg45KoyRXUdzN7bk0Jrf19bVZRyWfnmpJhMBMRp0tqNx5CZfh5f93MOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njrdok2W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334354; x=1781870354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pnxb5TAOrp6Du+wWL6x4R3RF7AIz+Y9RsI0zGnUqofo=;
  b=njrdok2WXiAtnFGH6eVPs+WtrFC25xeFeAoxfTcu4cPrwEKT9opiKY9P
   2dwmRBiCrg+2WNF4MyrDyNLtV1TArFy/Pby0bY8gkvnH02jK8db/5PWPr
   yBVMC9/Xy39Nqy1quDoccQpD1XrDYJyRb6+UP5M/AcqU8bsFgY2Ukkehy
   JawOUGeZe0K6J408/2MX2tK8araYrgE7SaStmHmokvqNytoJrX8BCt77T
   TGVN5PgHiXkGdJHaTh9R9WJOgzt/EyV2bmPJs6AydSVezpjC9yU7fAVFZ
   R2JPaTjmDbrr6didMbZSJVIJCm0548yZYkJy26Mem2neMT81VuZP9FsqI
   A==;
X-CSE-ConnectionGUID: PvgytS0ZRpSJZ696Su/A2g==
X-CSE-MsgGUID: 40KG2/xYQNGxs5l39IwbyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386513"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
X-CSE-ConnectionGUID: obYHZuA4Q+KyB6kehxJo1w==
X-CSE-MsgGUID: /Y/3KLQTS1mrIknpI/hbBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908334"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:58 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1CC45122334;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AKE-0I;
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
Subject: [PATCH v10 33/64] media: ccs: Detemine emb_data_ctrl register from sub-device state
Date: Thu, 19 Jun 2025 14:58:05 +0300
Message-Id: <20250619115836.1946016-34-sakari.ailus@linux.intel.com>
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

Determine the value to write to emb_data_ctrl register from sub-device
state.

This also moves up the embedded data definitions. There are no changes to
the definitions themselves.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 118 ++++++++++++++++---------------
 drivers/media/i2c/ccs/ccs.h      |   2 -
 2 files changed, 62 insertions(+), 58 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1193cde1c98c..87a1614a020b 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1869,6 +1869,57 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	return rval;
 }
 
+#define CCS_EMBEDDED_CODE_DEPTH(depth, half_depth)			\
+	depth,								\
+	CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW##depth,		\
+	CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW##depth,		\
+	CCS_EMB_DATA_CTRL_RAW##half_depth##_PACKING_FOR_RAW##depth,	\
+	MEDIA_BUS_FMT_META_##half_depth,				\
+	MEDIA_BUS_FMT_META_##depth,					\
+
+static const struct ccs_embedded_code {
+	u8 depth;
+	u8 cap_two_bytes_per_sample;
+	u8 cap_no_legacy;
+	u8 ctrl;
+	u32 code_two_bytes;
+	u32 code_legacy;
+} ccs_embedded_codes[] = {
+	{ CCS_EMBEDDED_CODE_DEPTH(16, 8) },
+	{ CCS_EMBEDDED_CODE_DEPTH(20, 10) },
+	{ CCS_EMBEDDED_CODE_DEPTH(24, 12) },
+};
+
+static const struct ccs_embedded_code *ccs_embedded_code(unsigned int bpp)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ccs_embedded_codes); i++)
+		if (ccs_embedded_codes[i].depth == bpp)
+			return ccs_embedded_codes + i;
+
+	WARN_ON(1);
+
+	return ccs_embedded_codes;
+}
+
+static u32
+ccs_default_embedded_code(struct ccs_sensor *sensor,
+			  const struct ccs_embedded_code *embedded_code)
+{
+	if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+	    BIT(embedded_code->cap_two_bytes_per_sample))
+		return embedded_code->code_two_bytes;
+
+	if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
+	      BIT(embedded_code->cap_no_legacy)))
+		return embedded_code->code_legacy;
+
+	WARN_ON(1);
+
+	return embedded_code->code_legacy;
+}
+
 static int ccs_enable_streams(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *state, u32 pad,
 			      u64 streams_mask)
@@ -2003,7 +2054,16 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 
 	/* Configure embedded data */
 	if (sensor->csi_format->compressed >= 16) {
-		rval = ccs_write(sensor, EMB_DATA_CTRL, sensor->emb_data_ctrl);
+		const struct ccs_embedded_code *embedded_code =
+			ccs_embedded_code(sensor->csi_format->compressed);
+		const struct v4l2_mbus_framefmt *meta_out_fmt =
+			v4l2_subdev_state_get_format(src_state, CCS_PAD_SRC,
+						     CCS_STREAM_META);
+
+		rval = ccs_write(sensor, EMB_DATA_CTRL,
+				 meta_out_fmt->code ==
+				 embedded_code->code_legacy ?
+				 0 : embedded_code->ctrl);
 		if (rval < 0)
 			goto err_pm_put;
 	}
@@ -2127,57 +2187,6 @@ static const struct ccs_csi_data_format
 	return sensor->csi_format;
 }
 
-#define CCS_EMBEDDED_CODE_DEPTH(depth, half_depth)			\
-	depth,								\
-	CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW##depth,		\
-	CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW##depth,		\
-	CCS_EMB_DATA_CTRL_RAW##half_depth##_PACKING_FOR_RAW##depth,	\
-	MEDIA_BUS_FMT_META_##half_depth,				\
-	MEDIA_BUS_FMT_META_##depth,					\
-
-static const struct ccs_embedded_code {
-	u8 depth;
-	u8 cap_two_bytes_per_sample;
-	u8 cap_no_legacy;
-	u8 ctrl;
-	u32 code_two_bytes;
-	u32 code_legacy;
-} ccs_embedded_codes[] = {
-	{ CCS_EMBEDDED_CODE_DEPTH(16, 8) },
-	{ CCS_EMBEDDED_CODE_DEPTH(20, 10) },
-	{ CCS_EMBEDDED_CODE_DEPTH(24, 12) },
-};
-
-static const struct ccs_embedded_code *ccs_embedded_code(unsigned int bpp)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(ccs_embedded_codes); i++)
-		if (ccs_embedded_codes[i].depth == bpp)
-			return ccs_embedded_codes + i;
-
-	WARN_ON(1);
-
-	return ccs_embedded_codes;
-}
-
-static u32
-ccs_default_embedded_code(struct ccs_sensor *sensor,
-			  const struct ccs_embedded_code *embedded_code)
-{
-	if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
-	    BIT(embedded_code->cap_two_bytes_per_sample))
-		return embedded_code->code_two_bytes;
-
-	if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
-	      BIT(embedded_code->cap_no_legacy)))
-		return embedded_code->code_legacy;
-
-	WARN_ON(1);
-
-	return embedded_code->code_legacy;
-}
-
 static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
@@ -2429,16 +2438,13 @@ static int ccs_set_format_meta(struct v4l2_subdev *subdev,
 
 		if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
 		      BIT(embedded_code->cap_no_legacy)) &&
-		    code == embedded_code->code_legacy) {
+		    code == embedded_code->code_legacy)
 			meta_fmt->code = embedded_code->code_legacy;
-			sensor->emb_data_ctrl = 0;
-		}
 
 		if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
 		    BIT(embedded_code->cap_two_bytes_per_sample) &&
 		    code == embedded_code->code_two_bytes) {
 			meta_fmt->code = embedded_code->code_two_bytes;
-			sensor->emb_data_ctrl = embedded_code->ctrl;
 			meta_fmt->width <<= 1;
 		}
 
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 3fddbe267409..27d38cf927ac 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -236,8 +236,6 @@ struct ccs_sensor {
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
 
-	u8 emb_data_ctrl;
-
 	u8 frame_skip;
 	u16 embedded_start; /* embedded data start line */
 	u16 embedded_end;
-- 
2.39.5


