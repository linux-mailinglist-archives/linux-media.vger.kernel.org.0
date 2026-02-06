Return-Path: <linux-media+bounces-52292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPkRABvphWnCHwQAu9opvQ
	(envelope-from <linux-media+bounces-52292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0DCFDF2A
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D054304C047
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43D23D6665;
	Fri,  6 Feb 2026 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzbzFJFa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130233D330D
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383618; cv=none; b=UB/jGEUls0FwdeQK9NtDekNKsx4CHA5occlogcPcN95aRFH9E3MzrYTP7tyjkJyqR9e26sF2Yye2zyRxpayERAafvEiR+kleaUoKe4aw5YzjRQc1d3Ns8C2zWV1wce7MicC6peuIls7nSCW6QRgdaeu3MADl92fScFirUF3UF80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383618; c=relaxed/simple;
	bh=bAwMwkgd7CjdEwH8mKy4oHqYagQfAW66fXJC90aViXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CY457vbCOIyf/+UVuyht1IxdjeWkYGcNH4VdBmE7ot31+MkA5n8/9GRpl44d9PQUMV0JH5rrrLBmUwrZWPW8ODzQup9xZaatnp+pTZigzCwmRq4eva5FxFqTz0/7BcIsNG6v9XFqgpkdKao36fa6qVS1YiZoDiL5LYDzqGyA/O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzbzFJFa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770383618; x=1801919618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bAwMwkgd7CjdEwH8mKy4oHqYagQfAW66fXJC90aViXE=;
  b=jzbzFJFamHkfHO8+pho6MMygBj9DzDnu3dNDQT8zVCD4Y2AviaLsZOe+
   ojDoliFFaCLXRFw5003tKp7Wu67eyf3d2Qne6WZqaVNcLMqE7tXnfegAi
   6E1g3JINMxRQTIOPJ1zlAfbQYc0Oi3APs9/kNP9rV0XuDPOzyEZX1TB+w
   ReUKZZ7GixG/TCO7WpRq2dCboiiB0vW/Hf255KxRvEDZaLZtZI93Jpc3C
   H1nIgVjeqr83uZwM+pndY9cWE0wZiPIXxWaTQyRLu1cE9pnLGen7ssW11
   f+POAtZIOKCk5rQljFriFwqFINpW09KZ7qrkBBVh0+hBqE0ZZ1XUg09yZ
   Q==;
X-CSE-ConnectionGUID: zVWkolQvQBOrOcVUgJ8XTA==
X-CSE-MsgGUID: o9q3Rv2IR2S4xYe7XHQ+tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75441155"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75441155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:36 -0800
X-CSE-ConnectionGUID: OYPld+jmSnubh6bjtpjaMQ==
X-CSE-MsgGUID: LmAm/h+cSNGtQSumx2AOMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215391205"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:30 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 64E8412026D;
	Fri, 06 Feb 2026 15:13:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1voLeL-00000005Ts4-0qKE;
	Fri, 06 Feb 2026 15:13:29 +0200
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH 01/13] media: imx219: Rename "PIXEL_ARRAY" as "CROP"
Date: Fri,  6 Feb 2026 15:13:18 +0200
Message-ID: <20260206131329.1306429-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
References: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-52292-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E0DCFDF2A
X-Rspamd-Action: no action

The imx219 driver uses macros for denoting different aspects of the pixel
array. The values used for IMX219_PIXEL_ARRAY_* macros imply a crop
configuration however, not the size of the pixel array. Reflect this in
the naming, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index fee63bc106d9..54622c406a03 100644
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
+#define IMX219_CROP_LEFT		8U
+#define IMX219_CROP_TOP			8U
+#define IMX219_CROP_WIDTH		3280U
+#define IMX219_CROP_HEIGHT		2464U
 
 /* Mode : resolution and related config&values */
 struct imx219_mode {
@@ -675,13 +675,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	bpp = imx219_get_format_bpp(format);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
-		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
+		  crop->left - IMX219_CROP_LEFT, &ret);
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
-		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
+		  crop->left - IMX219_CROP_LEFT + crop->width - 1, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
-		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
+		  crop->top - IMX219_CROP_TOP, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
-		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
+		  crop->top - IMX219_CROP_TOP + crop->height - 1, &ret);
 
 	imx219_get_binning(state, &bin_h, &bin_v);
 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
@@ -867,8 +867,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	 * Use binning to maximize the crop rectangle size, and centre it in the
 	 * sensor.
 	 */
-	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
-	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
+	bin_h = min(IMX219_CROP_WIDTH / format->width, 2U);
+	bin_v = min(IMX219_CROP_HEIGHT / format->height, 2U);
 
 	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
 	binning = min(bin_h, bin_v);
@@ -967,10 +967,10 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
-		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
-		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
-		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
+		sel->r.top = IMX219_CROP_TOP;
+		sel->r.left = IMX219_CROP_LEFT;
+		sel->r.width = IMX219_CROP_WIDTH;
+		sel->r.height = IMX219_CROP_HEIGHT;
 
 		return 0;
 	}
-- 
2.47.3


