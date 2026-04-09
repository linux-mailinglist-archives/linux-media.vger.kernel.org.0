Return-Path: <linux-media+bounces-58452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EVeO5UK2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:22:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5903CF72E
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E004C30A0B05
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C0E36EA88;
	Thu,  9 Apr 2026 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVt2BH3K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632813624AE
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765742; cv=none; b=TP99PC2RV/zGNnq7pFzuRA5xEvfPnYk4e3M94LP0otggHBvVkYjqmHH205hGO0cmXjIeBpCnPtO5DoUaO04Gb+pCPl7Ga3U8KjwRrCJ+5OH2zU4JaK7BmTZV29ide0DQ0nPVu+gpjPH5bXcoK+Bx/ZWF6cAsRNlzg6bQi2KJypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765742; c=relaxed/simple;
	bh=wAsOkfVavOOzWU1Axhxv2X4saZDB2wnwBJ1JPAIpiEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMDsrcb0iHDA5NeteP/t7NQ8kyFSnm+nE8dK5DzVeeNS7AUrSfamRqgIlsHL2WJ/QrAplPxQdK4oNNM0GoG2/j+6dwVIXARQTDRuSmjHlZrsw59g1ZcxZrTTQHCPPwO/7eLSkPnQMYunORU+sQlTjRxejXR0ZK3/FrWoEjkLSNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVt2BH3K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765742; x=1807301742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wAsOkfVavOOzWU1Axhxv2X4saZDB2wnwBJ1JPAIpiEM=;
  b=KVt2BH3K/gjSRYQ2fYuQIq+xlLe/fSrqgEvTq9I2l4vLzyCH999SsVDL
   CMQHHV7pU87DSsZlkVemGoJ78ik4VsCa4VpnUWG8sQ+idzrjlxJrbsIF/
   ASbcaY/tsMlCgO2mDkNa7GEjUK3wj/Qz6QbdPexw7+dLT8IACvVjqiFeg
   u2DLpNwBxRIqAE7S3RomlGP7HprbUGArJNvIrw6y5QP+u3pRBLJa7jIMK
   O14r1VEvoRp/sE8tn6piK8EnhQu1boPRJ1srfMjYne88ugmwaUz9ZwIAs
   8XlJa5bm81Lu+5LHFi8rX/XgHnhrNOCpRh5bWNkF9mcwAJvvOGmlzQ0c6
   A==;
X-CSE-ConnectionGUID: Z6W2zQNMRD+cK2HfVqAsMQ==
X-CSE-MsgGUID: rc20dpoDStGP8Wz20Ld2Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176718"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: ZIUopcAkRH2pBJnEniZtAg==
X-CSE-MsgGUID: 1O0eVLtWQQaENvGv3wHbbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047631"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3FEF12293D;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nV-1FHl;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 44/86] media: ccs: Add support for generic raw mbus codes
Date: Thu,  9 Apr 2026 23:14:19 +0300
Message-ID: <20260409201501.975242-45-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58452-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D5903CF72E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for generic media bus codes for 8, 10, 12 and 14 bits per
pixel.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 54 ++++++++++++++++++++++----------
 drivers/media/i2c/ccs/ccs.h      |  2 ++
 2 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1cd4db3f5708..0248a51eba8f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -642,13 +642,18 @@ static const struct ccs_csi_data_format ccs_csi_data_formats[] = {
 	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, 8, CCS_PIXEL_ORDER_RGGB, },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, 8, CCS_PIXEL_ORDER_BGGR, },
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, 8, CCS_PIXEL_ORDER_GBRG, },
+	/* Generic formats are placed below. */
+	{ MEDIA_BUS_FMT_RAW_8, 8, 8, 0, true },
+	{ MEDIA_BUS_FMT_RAW_10, 10, 10, 0, true },
+	{ MEDIA_BUS_FMT_RAW_12, 12, 12, 0, true },
+	{ MEDIA_BUS_FMT_RAW_14, 14, 14, 0, true },
 };
 
 static const char *pixel_order_str[] = { "GRBG", "RGGB", "BGGR", "GBRG" };
 
-#define to_csi_format_idx(fmt) (((unsigned long)(fmt)			\
-				 - (unsigned long)ccs_csi_data_formats) \
-				/ sizeof(*ccs_csi_data_formats))
+#define to_csi_format_idx(fmt)						\
+	(((unsigned long)(fmt) - (unsigned long)ccs_csi_data_formats)	\
+	 / sizeof(*ccs_csi_data_formats))
 
 static u32 ccs_pixel_order(struct ccs_sensor *sensor)
 {
@@ -669,27 +674,25 @@ static u32 ccs_pixel_order(struct ccs_sensor *sensor)
 
 static void ccs_update_mbus_formats(struct ccs_sensor *sensor)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	unsigned int mask = sensor->csi_format->is_generic ? ~0 : ~3;
 	unsigned int csi_format_idx =
-		to_csi_format_idx(sensor->csi_format) & ~3;
+		to_csi_format_idx(sensor->csi_format) & mask;
 	unsigned int internal_csi_format_idx =
-		to_csi_format_idx(sensor->internal_csi_format) & ~3;
-	unsigned int pixel_order = ccs_pixel_order(sensor);
+		to_csi_format_idx(sensor->internal_csi_format) & mask;
+	unsigned int pixel_order = sensor->csi_format->is_generic ?
+		0 : ccs_pixel_order(sensor);
 
 	if (WARN_ON_ONCE(max(internal_csi_format_idx, csi_format_idx) +
 			 pixel_order >= ARRAY_SIZE(ccs_csi_data_formats)))
 		return;
 
 	sensor->mbus_frame_fmts =
-		sensor->default_mbus_frame_fmts << pixel_order;
+		(sensor->default_mbus_frame_fmts << pixel_order) |
+		sensor->default_generic_mbus_frame_fmts;
 	sensor->csi_format =
 		&ccs_csi_data_formats[csi_format_idx + pixel_order];
 	sensor->internal_csi_format =
-		&ccs_csi_data_formats[internal_csi_format_idx
-					 + pixel_order];
-
-	dev_dbg(&client->dev, "new pixel order %s\n",
-		pixel_order_str[pixel_order]);
+		&ccs_csi_data_formats[internal_csi_format_idx + pixel_order];
 }
 
 static const char * const ccs_test_patterns[] = {
@@ -896,7 +899,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 	struct v4l2_fwnode_device_properties props;
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 19);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 21);
 	if (rval)
 		return rval;
 
@@ -1091,6 +1094,17 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
 	v4l2_ctrl_cluster(2, &sensor->hflip);
 
+	v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
+			  V4L2_CID_CFA_PATTERN, sensor->default_pixel_order,
+			  sensor->default_pixel_order, 1,
+			  sensor->default_pixel_order);
+
+	v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler, NULL,
+			  V4L2_CID_CFA_PATTERN_FLIP,
+			  V4L2_CFA_PATTERN_FLIP_BOTH,
+			  V4L2_CFA_PATTERN_FLIP_BOTH, 1,
+			  V4L2_CFA_PATTERN_FLIP_BOTH);
+
 	rval = v4l2_ctrl_handler_init(&sensor->src->ctrl_handler, 0);
 	if (rval)
 		return rval;
@@ -1199,15 +1213,21 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 			const struct ccs_csi_data_format *f =
 				&ccs_csi_data_formats[j];
 
-			if (f->pixel_order != CCS_PIXEL_ORDER_GRBG)
-				continue;
-
 			if (f->width != fmt >>
 			    CCS_DATA_FORMAT_DESCRIPTOR_UNCOMPRESSED_SHIFT ||
 			    f->compressed !=
 			    (fmt & CCS_DATA_FORMAT_DESCRIPTOR_COMPRESSED_MASK))
 				continue;
 
+			if (f->is_generic) {
+				sensor->default_generic_mbus_frame_fmts |=
+					BIT_U64(j);
+				continue;
+			}
+
+			if (f->pixel_order != CCS_PIXEL_ORDER_GRBG)
+				continue;
+
 			dev_dbg(&client->dev, "jolly good! %u\n", j);
 
 			sensor->default_mbus_frame_fmts |= BIT_U64(j);
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 58952c5bf06b..df044dbde23f 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -170,6 +170,7 @@ struct ccs_csi_data_format {
 	u8 width;
 	u8 compressed;
 	u8 pixel_order;
+	bool is_generic;
 };
 
 #define CCS_SUBDEVS			3
@@ -226,6 +227,7 @@ struct ccs_sensor {
 	const struct ccs_csi_data_format *csi_format;
 	const struct ccs_csi_data_format *internal_csi_format;
 	u64 default_mbus_frame_fmts;
+	u64 default_generic_mbus_frame_fmts;
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
 
-- 
2.47.3


