Return-Path: <linux-media+bounces-58241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NGTEAp31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA33BE56C
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C89A9302DF52
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E9C3D3482;
	Wed,  8 Apr 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqLT4O6+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963D3D3319
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662787; cv=none; b=obqbxDkCdnsb7MdR6jt2bTZC7Y49ssqqhDGrGLFbsJckTKfiWXC1iv90PaaQdaoQU425QXoh208wJ2BWspl/R+00oWfjcA+BGmabPkcnPPu3EfKAQVL1hqI0TuMJzSIdIUozakoHdqjN17lcX+U2CxDyZdHnN03QQKwOgG8fADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662787; c=relaxed/simple;
	bh=NwBBbKKcP3Uk/PKMlFrD2OPElWKyj3IFXaibxwnudCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIzAv1gknvzidTQycutb8cHaI07hsN8WLXdGuYpmvpMctTJR4LIA/4V+GO9Oba1rG5Vc21BhNDDUSuo4O9JzWUXc8dk07bQ7o9j0XY4irGFov1h2dTXotqytZAOAk23KSv1oqgabIchC5lTdO+mwhNkb6fWXRoLHV/yoxN/aZ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqLT4O6+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662784; x=1807198784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwBBbKKcP3Uk/PKMlFrD2OPElWKyj3IFXaibxwnudCc=;
  b=RqLT4O6+YOkyR9OoWHR6QXupyN3oUHyJtXmZSmW+alvVmu9mffIhl+fY
   HV78QEv7GpZ19k/wvHQrR+nzPgJcY3GNC9S3PfPHVX1i9+Q2P7wdMTF5I
   r80zr4DrDWi8seMsag5teRs6gC1Fvsgx2bNe8kSPgosFrebMZGuJ2E7Rq
   GHiJb7fYwW4pEJ36o2C8o/5BLNQ3NZhIWEd9hn1VR8yhdt4mXIPYj83Yy
   GGcPatAiBb1LESg47jr/ebUu71bNGNhCkkZunHwvDKdKWrBmolldgbU8i
   ruKvwKh9Mi6ldaBV0AY1Jm60/uuzcgDeMHUf6i0OFN6hx5g+AacNBLvdf
   Q==;
X-CSE-ConnectionGUID: O3Zsvge9Sv2QdY42/sCAGg==
X-CSE-MsgGUID: Wd2p8SsnRU+mf8yqF/SUBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80510253"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="80510253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:43 -0700
X-CSE-ConnectionGUID: 4wh8epvyRJWLGsWLQ/cZlQ==
X-CSE-MsgGUID: tY46MSzHQeu6snmoyQYsdw==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:37 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CE343121D2C;
	Wed, 08 Apr 2026 18:39:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044CU-15YP;
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
Subject: [PATCH v4 03/29] media: imx219: Set horizontal blanking on mode change
Date: Wed,  8 Apr 2026 18:39:12 +0300
Message-ID: <20260408153939.969381-4-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58241-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.931];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1BA33BE56C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver UAPI is mode-based, allowing the user to choose a mode from a
small list based on the output size. The vertical blanking is set based on
the mode, do the same for horizontal blanking so the frame rate obtained
is constant.

Additionally, it's best to use a known-good horizontal blanking value as
choosing the value freely may affect image quality. While the minimum
value may not be the best value for horizontal blanking, at least it is
constant rather than a minimum value of a different configuration.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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


