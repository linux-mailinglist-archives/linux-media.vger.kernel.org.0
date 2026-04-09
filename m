Return-Path: <linux-media+bounces-58381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOCzIygJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BD23CF494
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB7073034DC4
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F79A33ADA9;
	Thu,  9 Apr 2026 20:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVRSiuy5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEE33A9E9
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765707; cv=none; b=NO2rj5ZB1xL+HngTwWQXcDe4TDdaMvcPkqGiYnKLsqpz11vuzYblGjMR32EmO5DGqa/CbR0+sdqX+PpVzoVylSVetXu4n0rVKENi9it28E1WugW8ctiz/Rmf6UMLdiocLqXNzd025t+6G35/4LbxmIYZiXQboMLRMESC+T5Lv1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765707; c=relaxed/simple;
	bh=GlO+kz9eob8xNOjljKpsKIxs3blzksb0mrLEwcJmeMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wpk1/h5NffGCqNxYcJXkuUzh6/xflH7+ZABLVtL9u9rRueKPTmTEbq1IJvYVUEPlP/8/JOHKb0jPqkBtPoq5+jij6s8N/fYfVKzzrfBspd4+IW0z8H7bhPAkAsdBBRrGKxrT19oPx7Od1810xZXmy1pZDEG8cUwv6tYIS/GFENk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVRSiuy5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765705; x=1807301705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GlO+kz9eob8xNOjljKpsKIxs3blzksb0mrLEwcJmeMk=;
  b=gVRSiuy5HOZehwdUB9JUqu/G79Pu6XBQJjZ9nILrz8OFVwCfk+rNwh2b
   /9MK8VmyiK+D7Lshfls2nl7K+j4PLunBlvqJ2BbiKxUaXhEhV/IE7fSAB
   UwzW9gQpj4W7gryfs8GNCj8cZW3aBr1S/9fTxIT3fTL2BuUvDmp8i4MBY
   zBR4t+l5/ZqyjV7NqrSS8bjALXq8ZGhesZGG9gUZyzR0b3MUNSbGDki9N
   kaX/xST66UgJeYAACdNy6XgpwLxg9eVsU2oaB39b/qgyZtZ+avOfyWn8U
   N10sSpl2xol2Hne4FIPwTgmUykqcYScLkU9Mj3jaotmB18JhH53Zxf7nr
   w==;
X-CSE-ConnectionGUID: Wz7iGbB3S02geJzKsv4hlA==
X-CSE-MsgGUID: WW29716uQ8SYMCY85hAoOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408565"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:02 -0700
X-CSE-ConnectionGUID: dBL8kbFQQA+FEEHJEPtsJg==
X-CSE-MsgGUID: /Ruy452nSt+ra+X3iXOK0Q==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1E73F121D22;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045ok-2Q0D;
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
Subject: [PATCH v12 61/86] media: imx219: Add support for generic raw formats
Date: Thu,  9 Apr 2026 23:14:36 +0300
Message-ID: <20260409201501.975242-62-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58381-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5BD23CF494
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for colour pattern agnostic raw formats, including controls to
convey the colour pattern and the configuration model (common raw sensor).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 40 +++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e744b96a08f6..a7d59d16add5 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -290,6 +290,11 @@ static const u32 imx219_mbus_formats[] = {
 	MEDIA_BUS_FMT_SBGGR8_1X8,
 };
 
+static const u32 imx219_mbus_formats_generic[] = {
+	MEDIA_BUS_FMT_RAW_10,
+	MEDIA_BUS_FMT_RAW_8,
+};
+
 /*
  * Initialisation delay between XCLR low->high and the moment when the sensor
  * can start capture (i.e. can leave software stanby) must be not less than:
@@ -394,6 +399,10 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 {
 	unsigned int i;
 
+	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats_generic); i++)
+		if (imx219_mbus_formats_generic[i] == code)
+			return code;
+
 	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
 		if (imx219_mbus_formats[i] == code)
 			break;
@@ -414,12 +423,14 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_RAW_8:
 		return 8;
 
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
 	default:
 		return 10;
 	}
@@ -433,12 +444,14 @@ imx219_get_embedded_format_code(const struct v4l2_mbus_framefmt *format)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_RAW_8:
 		return MEDIA_BUS_FMT_META_8;
 
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
 	default:
 		return MEDIA_BUS_FMT_META_10;
 	}
@@ -662,6 +675,20 @@ static int imx219_init_controls(struct imx219 *imx219)
 		/* The "Solid color" pattern is white by default */
 	}
 
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CFA_PATTERN,
+			  V4L2_CFA_PATTERN_RGGB, V4L2_CFA_PATTERN_RGGB,
+			  1, V4L2_CFA_PATTERN_RGGB);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+			  V4L2_CID_CFA_PATTERN_FLIP,
+			  0, V4L2_CFA_PATTERN_FLIP_BOTH,
+			  0, V4L2_CFA_PATTERN_FLIP_BOTH);
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
@@ -895,10 +922,17 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->stream == IMX219_STREAM_IMAGE) {
 		u32 format;
 
-		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
-			return -EINVAL;
+		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4) {
+			u32 idx = code->index -
+				ARRAY_SIZE(imx219_mbus_formats) / 4;
+
+			if (idx >= ARRAY_SIZE(imx219_mbus_formats_generic))
+				return -EINVAL;
 
-		format = imx219_mbus_formats[code->index * 4];
+			format = imx219_mbus_formats_generic[idx];
+		} else {
+			format = imx219_mbus_formats[code->index * 4];
+		}
 		code->code = imx219_get_format_code(imx219, format);
 	} else {
 		struct v4l2_mbus_framefmt *fmt;
-- 
2.47.3


