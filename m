Return-Path: <linux-media+bounces-40966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5198B33BD8
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457513B3209
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4394D2DE6F5;
	Mon, 25 Aug 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCYYeGHA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE92DBF4B
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115509; cv=none; b=UbPbHfXDyNEL1x2QyfJ6A9oQvxrxITOlH2f2OejmX2npjKpVr4DsV+dRMiLXHgHH8jVgv356ypBHo4n6d0vAay9IJUwa1DCu8mZPtIjJS85KKnMCKwT637cp+Lp/aHzGjRsNp7Y8DYoMAxM0jQKSpTuQQr++WSbq2O9pioGAq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115509; c=relaxed/simple;
	bh=3vcfuxXcVOYoXS2oSu+cg0iM3wIDuOrXWjtrL3FMPME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muXVlJQjoaMqdjR8kyK3q2swwnueoYHsmaqSd93l8eujULLspQPc3f+iHoLasKbrQy+WSoNvDx2IoNWHI9jdE5qirw7OM0HblorD3UZyzHuFO9pDeD/s2BCxfo2XL8yXV63HRaFSDvVTe2PfxmQ7S454JleDDdaV19UIMS5dlMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCYYeGHA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115509; x=1787651509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3vcfuxXcVOYoXS2oSu+cg0iM3wIDuOrXWjtrL3FMPME=;
  b=BCYYeGHAufieGkpws5q167saUec9S2E15xEyNk6m4wwTfI93/YHBHeQx
   0avyr3lIQDlMX/zJRbjIi0bXk+xYogGxOn5+V8+d8YruZQ4alBSG4f2P9
   b46xipY/gzNYLNYvlNnz1uHU3SNDd5S/gO70BnwGj9RJmHISbCBd4yA3C
   3dcDOuOOyrsMPbxkrpJPNDf07OLIOeSzIs0RiAx0Ov8phxXG0A5szx4Y2
   ZwRZ2wj3ebXaaPrIOCG2S4mHbxuMSpr2B+P1XMfd6FIMu+yMjN0/5nzOC
   cdcbu3kqaA3xYUfzleICMZdjVnMTPGuShRK2yRJfKGZBJAApMsi23l2vB
   w==;
X-CSE-ConnectionGUID: 2QMINbsfQFGcqrpMcqMNJw==
X-CSE-MsgGUID: 4UvHazjdSr2eKfl+BrwFDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032194"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032194"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:45 -0700
X-CSE-ConnectionGUID: OGttgdjvQMSKaeSwv/kG/w==
X-CSE-MsgGUID: kJXVYgTaSIKo7w/xiLge8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431072"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 99805121FEB;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ag6-2T5w;
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
Subject: [PATCH v11 36/66] media: ccs: Detemine emb_data_ctrl register from sub-device state
Date: Mon, 25 Aug 2025 12:50:37 +0300
Message-ID: <20250825095107.1332313-37-sakari.ailus@linux.intel.com>
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
2.47.2


