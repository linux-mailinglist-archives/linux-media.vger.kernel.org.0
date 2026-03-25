Return-Path: <linux-media+bounces-56978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLCMDeu/w2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:58:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 204EA323641
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9C9B3035ECF
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208C93C554F;
	Wed, 25 Mar 2026 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+DDiMob"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28B39FCA2
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436320; cv=none; b=cmF6wIDRgitJe2R6nyhiIlpaxE5EGyCSyV4xtVI748xr2LIoGkzQkvmbqGMEGGxyJrNzhynxIdEL1IdOkUKmauOC58HOktdmk9sNU6b44UyZW0gdZ/Qqivkv+ABNuh7PNlRY2wqdIYRXijAFzBgvNvVh6VASaXdH393qxh15oiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436320; c=relaxed/simple;
	bh=j+13JDSRgL3DT64HztntgxDNmEWh7wHGkzBzQE4MW/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAc5uhC4E64eamYWy++GNtWzFciYnDuVAHmmRQ0KvGR+xx/c7XRmp8Vp+DmtXumeJ/YKpXIE6J1bvyFNonbv4pgx/rpdOf/yj6J9J1kcbTZuFT1K1O8lqsbjH3XW13hkbvPkcEwr3pbWsOF/iIN7eBvcUffcVNl8XQi1Sl9ABn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+DDiMob; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436318; x=1805972318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j+13JDSRgL3DT64HztntgxDNmEWh7wHGkzBzQE4MW/w=;
  b=H+DDiMobJBr4UDXq8vm7kwRJMwDhLof8TPck1/qz1h3uUrZBws+HOzKy
   wInuhi2TJIuVEBIeJGBeQ0LYy3y5ftSQDlhOgaPfBtrARlSpEbbDp4wuZ
   r7KQzpPfCCI0hpIBJNSDPXZzorUTVagHuGrUrDoo8C9umjSmruogUbJma
   3W954SP0aGIs4fhnm0lLukqo4QIc8+GSYbO5eZeXhm/aaJCwPAc8QeInA
   HhNGv81/ccjZopQULon4FHEi+S7Ns6DUrQfu9MEKXJUcTsgtQxWlKgl0v
   m+LZkYkXj+S495HyCCzFX9DpLJYfZKmMPXP+FM8LhzWVew0f7spyGY5FP
   w==;
X-CSE-ConnectionGUID: XLKH9op2TJqENSXa8RZa2Q==
X-CSE-MsgGUID: 2fz3Pr+7Rm6ajIo0m9UKGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75186762"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75186762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:33 -0700
X-CSE-ConnectionGUID: FQqDHhsQSuOhAfizrQaZ/Q==
X-CSE-MsgGUID: 7TNTlRy6Su+1P5yVL+4lbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="262568555"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7A4A3121D20;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwI-00000004w9z-3sqT;
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
Subject: [PATCH v3 03/22] media: imx219: Set horizontal blanking on mode change
Date: Wed, 25 Mar 2026 12:57:59 +0200
Message-ID: <20260325105818.1176816-4-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-56978-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 204EA323641
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver UAPI is mode-based, allowing the user to choose a mode from a
small list based on the output size. The vertical blanking is set based on
the mode, do the same for horizontal blanking so the frame rate obtained
is constant.

Additinally, it's best to use a known-good horizontal blanking value as
choosing the value freely may affect image quality. While the minimum
value may not be the best value for horizontal blanking, at least it is
constant rather than a minimum value of a different configuration.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 89061dc1842d..62a23541b1dc 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -837,11 +837,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	u8 bin_h, bin_v, binning;
-	u32 prev_line_len;
 	int ret;
 
 	format = v4l2_subdev_state_get_format(state, 0);
-	prev_line_len = format->width + imx219->hblank->val;
 
 	/*
 	 * Adjust the requested format to match the closest mode. The Bayer
@@ -882,7 +880,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int exposure_max;
 		int exposure_def;
-		int hblank, llp_min;
+		int llp_min;
 		int pixel_rate;
 
 		/* Update limits and set FPS to default */
@@ -924,15 +922,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					       llp_min - mode->width);
 		if (ret)
 			return ret;
-		/*
-		 * Retain PPL setting from previous mode so that the
-		 * line time does not change on a mode change.
-		 * Limits have to be recomputed as the controls define
-		 * the blanking only, so PPL values need to have the
-		 * mode width subtracted.
-		 */
-		hblank = prev_line_len - mode->width;
-		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
+
+		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, llp_min - mode->width);
 		if (ret)
 			return ret;
 
-- 
2.47.3


