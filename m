Return-Path: <linux-media+bounces-58373-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B5IB8oI2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58373-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 637CE3CF3C2
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A5EE30147BE
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9B93191D8;
	Thu,  9 Apr 2026 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJn6Vspe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1827C32BF42
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765699; cv=none; b=qdtQQ9NDtgQyEfTBCnA7BTWObfCpFDcwHMUaQKvXDti0MbIathXSJbMGRsMzvQtK9gRu54b51gMlFVX/sbMc1bu53N5DVEfj6YBW3b0AVxp1yaaRh7ZXFqK4Z74Bgnnco3QXvz4EOu0/Ozek5wybUABn1/mCIzWL31DoQnOPrx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765699; c=relaxed/simple;
	bh=I4QY3lakyQLsi6C6GVTQGHkiheNM/5EVa6nnM2tJd/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1Vm4RNaSl4GGGvoXWgmbcvQS0xYJckJ2DBUF1besvdB/8wmlLxCDzb3Givhy6os15PZSmpnAfbZhwSepC8p2jzyWlg/w8P4o2Xx1MzE/wWVrQBRVFjLP5eZX6vxp9IGLcLJL7Z07TrTDeqB7MhHk/AJwEv/FWyOBxE7tvTD5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJn6Vspe; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765698; x=1807301698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I4QY3lakyQLsi6C6GVTQGHkiheNM/5EVa6nnM2tJd/U=;
  b=EJn6VsperVIKIGFdSYWCxg16YRMpX3UJMn6VM/m2AB9g7V8j/6QwiAp+
   lXygMpbZiFKkevRH1NZ8q8nHYpghFhP1l0QHOMP0fXcBf6lZAh/JBj9Ov
   ThoV+MHBSzR5QYid18DkkTEotpzSKKh64ZzpXlqKFZpZ8XDPP07CndfTi
   N0WHWPH1+0RKnmOkG3b/Oab3Tv5MASg41/lrDcwBCQ5eNXWesgo1L8A7Y
   uCiBF5syaMqKZsA7+xh2vSNtycm3F732CNJlHEsiIPA/p5uUzgZpFk2mi
   /0rCj5H87po9vOalDUH3Ky6q+26CmpxY7Bmnc070q6rQ/wkdqkUnITCGL
   A==;
X-CSE-ConnectionGUID: +EO3kH3OQFquCZ1uimb5Aw==
X-CSE-MsgGUID: fvm2hdjUR/eGJbfc11s0TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408460"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408460"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:54 -0700
X-CSE-ConnectionGUID: dJgt9fpVSRioLtzD0wi3hQ==
X-CSE-MsgGUID: B9cncBRMR8CTHFe0MdRiiw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F1D98121CE5;
	Thu, 09 Apr 2026 23:15:02 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045o5-1sGr;
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
Subject: [PATCH v12 53/86] media: ov2740: Add support for FLL and LLP controls
Date: Thu,  9 Apr 2026 23:14:28 +0300
Message-ID: <20260409201501.975242-54-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58373-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 637CE3CF3C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the V4L2_CID_FRAME_LENGTH_LINES and
V4L2_CID_LINE_LENGTH_PIXELS controls.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 55 ++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 1ab2b82f4099..833785ab419d 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 
 #define OV2740_LINK_FREQ_360MHZ		360000000ULL
 #define OV2740_LINK_FREQ_180MHZ		180000000ULL
@@ -562,9 +563,12 @@ struct ov2740 {
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *fll;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *llp;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	bool setting_ctrl;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -741,18 +745,28 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov2740 *ov2740 = container_of(ctrl->handler,
 					     struct ov2740, ctrl_handler);
-	s64 exposure_max;
-	int ret;
+	int ret = 0;
 
 	/* Propagate change of current control to all related controls */
-	if (ctrl->id == V4L2_CID_VBLANK) {
-		/* Update max exposure while meeting expected vblanking */
-		exposure_max = ov2740->cur_mode->height + ctrl->val -
-			       OV2740_EXPOSURE_MAX_MARGIN;
-		__v4l2_ctrl_modify_range(ov2740->exposure,
-					 ov2740->exposure->minimum,
-					 exposure_max, ov2740->exposure->step,
-					 exposure_max);
+	switch (ctrl->id) {
+	case V4L2_CID_FRAME_LENGTH_LINES:
+	case V4L2_CID_VBLANK:
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+	case V4L2_CID_HBLANK: {
+		struct v4l2_subdev_state *state =
+			v4l2_subdev_get_locked_active_state(&ov2740->sd);
+		const struct v4l2_mbus_framefmt *format =
+			v4l2_subdev_state_get_format(state, OV2740_PAD_SOURCE,
+						     OV2740_STREAM_PIXEL);
+
+		ret = v4l2_subdev_sensor_fll_llp_set(ov2740->fll, ov2740->vblank,
+						     ov2740->llp, ov2740->hblank,
+						     ov2740->exposure, format,
+						     ctrl, &ov2740->setting_ctrl,
+						     OV2740_EXPOSURE_MAX_MARGIN);
+		if (ret)
+			return ret;
+	}
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
@@ -776,8 +790,10 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_VBLANK:
-		ret = ov2740_write_reg(ov2740, OV2740_REG_VTS, 2,
-				       ov2740->cur_mode->height + ctrl->val);
+		break;
+
+	case V4L2_CID_FRAME_LENGTH_LINES:
+		ret = ov2740_write_reg(ov2740, OV2740_REG_VTS, 2, ctrl->val);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -807,7 +823,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 15);
 	if (ret)
 		return ret;
 
@@ -828,10 +844,22 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	vblank_min = ov2740->cur_mode->vts_min - ov2740->cur_mode->height;
 	vblank_max = ov2740->cur_mode->vts_max - ov2740->cur_mode->height;
 	vblank_default = ov2740->cur_mode->vts_def - ov2740->cur_mode->height;
+	ov2740->fll = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+					V4L2_CID_FRAME_LENGTH_LINES,
+					ov2740->cur_mode->vts_min,
+					ov2740->cur_mode->vts_max, 1,
+					ov2740->cur_mode->vts_def);
 	ov2740->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_VBLANK, vblank_min,
 					   vblank_max, 1, vblank_default);
 
+	ov2740->llp = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+					V4L2_CID_LINE_LENGTH_PIXELS,
+					ov2740->cur_mode->hts,
+					ov2740->cur_mode->hts, 1,
+					ov2740->cur_mode->hts);
+	if (ov2740->llp)
+		ov2740->llp->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	h_blank = ov2740->cur_mode->hts - ov2740->cur_mode->width;
 	ov2740->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_HBLANK, h_blank, h_blank, 1,
@@ -1223,7 +1251,6 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 		.routes = routes,
 		.num_routes = ARRAY_SIZE(routes),
 	};
-	struct ov2740 *ov2740 = to_ov2740(sd);
 	int ret;
 
 	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
-- 
2.47.3


