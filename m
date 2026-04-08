Return-Path: <linux-media+bounces-58244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLmCJBN31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:41:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7FC3BE583
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90DA73034552
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD003D5238;
	Wed,  8 Apr 2026 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPWJE8B2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1872DF132
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662791; cv=none; b=KavAbu5okcBcaVb2Jw69Eo2CT5Db7LwInnsKKhbidC1tVOZn4IRKTHG8KEqTgHmB6DDMe8I2SQs7bRw7JBUexBEf+uL4xUaJfu5cXkvUoMkv99kfE4vm2arauuYbAaLLBJA0xG0ebCEzVVyfpouKNSHbydDBd+qCePNmWUiPo1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662791; c=relaxed/simple;
	bh=n55vQASObQEFlCDfmgHVdeUWCqh9AyJe6dUm3UFzswA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ty5+IBpAxTsoQG9tWoLwqmp3w+hPI1XwwgugS5tFKkQTz0cL9maMN5WsehJtV+WRVpCqEnndd8ccI9023ESTefPJbG0LGT3yQcVvMmD54AcPshZXUaJy8E2RwGfkJZ0faF79J2sSyUbYczpncA5mCoHpD4hja4+nSeh3P7BPrLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPWJE8B2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662788; x=1807198788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n55vQASObQEFlCDfmgHVdeUWCqh9AyJe6dUm3UFzswA=;
  b=KPWJE8B2otSG0lDSqkCXiZvwOldaWOnRzkhFjrdqaZHMlEcRUhIuEudy
   HXmbdF4lamzKuxy9bjs9EqmhvWXzhLAza2bd5w4w+rgsS9/cu8qzssLET
   hIF0XjAtMvj6zkSUj+QU9nNvFuW/qdRVrzWd/RIZCXO9jnkb5ntpIT+PA
   z7sbr3AMY3lT/XhUCeVJ2Tgz/jpirP20hw5IH6nDYxzysyxIE3KVt0sOw
   pnZoiwKjCnhsUeR5WnYJVsJ08QrmgZwFgqoPYL4EA+HYN5ckSEb8L1vSL
   Z3SQ5HTZeNT0RR5odw8BT/Cz3TPsYE8sZwQvdVbeNxxkF/oj2Qg2fVzlW
   g==;
X-CSE-ConnectionGUID: m/nF4MzIS/uainGfTk1ZDQ==
X-CSE-MsgGUID: PEsNHbjHS/qFJp8F8HeWvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80510301"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="80510301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:44 -0700
X-CSE-ConnectionGUID: xChe8WW2Qumoc5udAZRKdQ==
X-CSE-MsgGUID: yERzkFO5SnO8kVRBVPJvqA==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:37 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C87EC121CF4;
	Wed, 08 Apr 2026 18:39:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044CM-0vJ4;
	Wed, 08 Apr 2026 18:39:39 +0300
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
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v4 01/29] media: imx219: Rename "PIXEL_ARRAY" as "VISIBLE"
Date: Wed,  8 Apr 2026 18:39:10 +0300
Message-ID: <20260408153939.969381-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
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
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58244-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
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
	NEURAL_HAM(-0.00)[-0.965];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D7FC3BE583
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


