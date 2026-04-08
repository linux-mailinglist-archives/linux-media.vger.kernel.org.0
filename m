Return-Path: <linux-media+bounces-58247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN4eAOd21mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2EB3BE516
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5EED301469E
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE30D3AD52A;
	Wed,  8 Apr 2026 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JamiWuFt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9335E3B19CC
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662800; cv=none; b=ipHy1y5KQft2zqZ2RTEJXlMrhjYN+P8s6sB/UEpQNb29BW3ZwKNxRc4Fs9rjjyxw29HfGtyOrAd3xQcZpA0k6jjavNu6ltnUn+lkCFFJZhh1pd2wHECcydQLTMAVyjN19rSrEnSTna4iAFrDgTL7Kz3grikjOq5TTE3Q0E4vD18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662800; c=relaxed/simple;
	bh=Z6MyDWrZviFYM6hf/z+ARRiW75XDAvHjdaUGyb9jj9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CV03K7ZVqYg64jUNSDa1fOUgw/eaF1cmoVgmx7y30QH1Av1v/ZHbZUDpbrP+0hWzYsvrLn7pbie6D8LQG+em/THt/gGdTDqVGmUPWREcIe8X18QEin3h+F753mnrV7ijeWYyhIFS0crZE4xFqv5H9HFm8bg14uuxg3AGSSfFwCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JamiWuFt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662795; x=1807198795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6MyDWrZviFYM6hf/z+ARRiW75XDAvHjdaUGyb9jj9Q=;
  b=JamiWuFt5+V4Pv14Pqa630Zh0Ft83EML/Hm1jSBQH/KDW8p05GV6XZhq
   0r5AvW98zUeESERMsYJIWpC9nbxhgCGL5Fq2XsRpOSN7TPsk3Gw33A3ar
   8OTYNy62bEgJR61few7Sd+Sy0bCxX/o5mM1Ac+MMDnIBuo4EVTPPz4shB
   0GoyASBCLO6tkYDIkU5M8Syp80hvWuzjyccK8l4FLkBaQ8RGBwLM4s2y8
   elX9b4uv2UKwOpfgzjaucuEWh1yY7SaZH4dbPvMyWk7bVJLuoNi+TlVQE
   LoUhBv590IehiZIe3Uigm2J+n6PXnZJuTJveh6RodLTDLWBcwNJa99xr1
   g==;
X-CSE-ConnectionGUID: BQ6QwYNXTyq/oCBc5frzSg==
X-CSE-MsgGUID: upaq49L8Smawk6QcyBaTOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038311"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038311"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:52 -0700
X-CSE-ConnectionGUID: udl9KW1bQXSyhscoaiA45Q==
X-CSE-MsgGUID: TD0xubX7SZeIbBWKNQT+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740276"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E3369121DEB;
	Wed, 08 Apr 2026 18:39:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044Ck-1RzK;
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
Subject: [PATCH v4 07/29] media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
Date: Wed,  8 Apr 2026 18:39:16 +0300
Message-ID: <20260408153939.969381-8-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58247-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.936];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D2EB3BE516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename "binning" as "bin_hv" in anticipation of having a variable called
"binning" for another purpose.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index ca6a5939773d..5a85d76af65a 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -825,7 +825,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx219_mode *mode;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
-	u8 bin_h, bin_v, binning;
+	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
 	format = v4l2_subdev_state_get_format(state, 0);
@@ -858,11 +858,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	bin_v = min(IMX219_VISIBLE_HEIGHT / format->height, 2U);
 
 	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
-	binning = min(bin_h, bin_v);
+	bin_hv = min(bin_h, bin_v);
 
 	crop = v4l2_subdev_state_get_crop(state, 0);
-	crop->width = format->width * binning;
-	crop->height = format->height * binning;
+	crop->width = format->width * bin_hv;
+	crop->height = format->height * bin_hv;
 	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
@@ -872,15 +872,15 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 		/* Update limits and set FPS to default */
 		ret = __v4l2_ctrl_modify_range(imx219->vblank,
-					       (int)(mode->height / binning),
+					       (int)(mode->height / bin_hv),
 					       IMX219_FLL_MAX - mode->height, 1,
-					       (int)(mode->fll_def / binning) -
+					       (int)(mode->fll_def / bin_hv) -
 					       (int)mode->height);
 		if (ret)
 			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
-					 (int)(mode->fll_def / binning) -
+					 (int)(mode->fll_def / bin_hv) -
 					 (int)mode->height);
 		if (ret)
 			return ret;
-- 
2.47.3


