Return-Path: <linux-media+bounces-56976-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOuQOua/w2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56976-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:58:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6902D32363A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 451D9302989C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BBA3C4579;
	Wed, 25 Mar 2026 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuPFVLwY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D60E2F290B
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436317; cv=none; b=geq3o8z9zto9z0Kg4J1poDnl6lhbPhiwOWxZojRcWtRC/fNopbUw7yTOeulXGlHAQXAiGBtbMylRGkOtwQHRYt17uRHafH3fjT/uqFvMxEpAwVomSX1JiOQPguC/WaAQ+a3vvDIhEb8W4iiaQ5JsFik/cNVKRF+KNeEVbHnsfUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436317; c=relaxed/simple;
	bh=n55vQASObQEFlCDfmgHVdeUWCqh9AyJe6dUm3UFzswA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjzsAD19Tv7MS+ykUbUpNQvIESBbPDLKU72lfFnDtRAZhMyL4jrbppPgBsXhswdH4B0cADevJ/SuoRvg3GJkrrgujen36dkIe3Vj4ABiyLjXHOnj4/1Bch7LGpYA+W2FTDXOCpBih0Atempv9xma2nPlXcK+y4pAye/5gXMYlKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuPFVLwY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436315; x=1805972315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n55vQASObQEFlCDfmgHVdeUWCqh9AyJe6dUm3UFzswA=;
  b=OuPFVLwY3CvHttbs1U9Pdj9N5Y3W7qoGaXmtXk+RwyRj6mgr/vfgAIdo
   846DllUz84IsCdOHC1wsUOTR7xMDwdg0j3ZONAL0u12JvpWGM8R2Or8Y5
   7bOCKBIzg3o71OYxK/lwTd+YbgTpfeVgBKpxzIyGt0Y7mwbVeTRUEJ70Z
   REtCkSZ3FyJM2ptjygUNtj6eVu0sH5Th7iKCgZFj9Cjfq95ImZdn3H7xm
   YFH+8nnIYrRJubla8uYzoj11/rXPPMyCt4o8w9eZ+cGkRL1LN2Jt5rdnN
   Xex+X/SMTHyG8PrlrWOiI01LNGHlGLpIWQ9ry9+1JwEITBSu3DNUzylQS
   Q==;
X-CSE-ConnectionGUID: sl19gIDCQza3XbwKWFvGyw==
X-CSE-MsgGUID: GvrWDBW3Ta6v+/PeABd1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75186750"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75186750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:33 -0700
X-CSE-ConnectionGUID: Yp/K1Br2Qdac9opAe6sbWw==
X-CSE-MsgGUID: XkccJqi9TzG0hLvicp2lhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="262568552"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 78B35121CF9;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwI-00000004w9r-3gZF;
	Wed, 25 Mar 2026 12:58:18 +0200
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
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 01/22] media: imx219: Rename "PIXEL_ARRAY" as "VISIBLE"
Date: Wed, 25 Mar 2026 12:57:57 +0200
Message-ID: <20260325105818.1176816-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56976-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6902D32363A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The imx219 driver uses macros for denoting the size of the pixel array.
The values reflect the area of manufacturer-designated visible pixels,
reflect this in the naming by calling it "VISIBLE" instead of
"PIXEL_ARRAY".

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7da02ce5da15..cbd151d4af5f 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -142,10 +142,10 @@
 /* IMX219 native and active pixel array size. */
 #define IMX219_NATIVE_WIDTH		3296U
 #define IMX219_NATIVE_HEIGHT		2480U
-#define IMX219_PIXEL_ARRAY_LEFT		8U
-#define IMX219_PIXEL_ARRAY_TOP		8U
-#define IMX219_PIXEL_ARRAY_WIDTH	3280U
-#define IMX219_PIXEL_ARRAY_HEIGHT	2464U
+#define IMX219_VISIBLE_LEFT		8U
+#define IMX219_VISIBLE_TOP		8U
+#define IMX219_VISIBLE_WIDTH		3280U
+#define IMX219_VISIBLE_HEIGHT		2464U
 
 /* Mode : resolution and related config&values */
 struct imx219_mode {
@@ -675,13 +675,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	bpp = imx219_get_format_bpp(format);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
-		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
+		  crop->left - IMX219_VISIBLE_LEFT, &ret);
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
-		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
+		  crop->left - IMX219_VISIBLE_LEFT + crop->width - 1, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
-		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
+		  crop->top - IMX219_VISIBLE_TOP, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
-		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
+		  crop->top - IMX219_VISIBLE_TOP + crop->height - 1, &ret);
 
 	imx219_get_binning(state, &bin_h, &bin_v);
 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
@@ -867,8 +867,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	 * Use binning to maximize the crop rectangle size, and centre it in the
 	 * sensor.
 	 */
-	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
-	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
+	bin_h = min(IMX219_VISIBLE_WIDTH / format->width, 2U);
+	bin_v = min(IMX219_VISIBLE_HEIGHT / format->height, 2U);
 
 	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
 	binning = min(bin_h, bin_v);
@@ -967,10 +967,10 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
-		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
-		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
-		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
+		sel->r.top = IMX219_VISIBLE_TOP;
+		sel->r.left = IMX219_VISIBLE_LEFT;
+		sel->r.width = IMX219_VISIBLE_WIDTH;
+		sel->r.height = IMX219_VISIBLE_HEIGHT;
 
 		return 0;
 	}
-- 
2.47.3


