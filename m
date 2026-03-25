Return-Path: <linux-media+bounces-56987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJzWAcnBw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4153237F1
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AAA530AE932
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317C23C7E11;
	Wed, 25 Mar 2026 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePFZDH6a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E31E3C456B
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436327; cv=none; b=o4Eg3LP9gGFrrcoBEHFbfZ8n+hF4ubZqMl7l3Vk/3ZvDdzSGIMvFcd5MUxyNuNH6XTgrLDb6q4Wj9FuncI48FsaYN7x6wySILYaWMIpUZ168LlZrKr6z9vRpl1OjPYAFaGw1S9EewEwdTijKUd47AQ2WVpG0OSqZkHhNDP+o0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436327; c=relaxed/simple;
	bh=Z6MyDWrZviFYM6hf/z+ARRiW75XDAvHjdaUGyb9jj9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbzAbBfsZDwxGs6OBo0eqNLD8RPoH/HL93/DEAOozaML8tOtwihMw2mQRCmj4J1HcqLmL0bhT0nQLAQX8M8j5u6HJLDWvmT0Vpzwg6blACCSzwSAs2X4/z8xwcSd/KCv5KW1PCthnh779wUbaVzK/2LwLe6X+7ZLwB78ICd9Hzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePFZDH6a; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436326; x=1805972326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6MyDWrZviFYM6hf/z+ARRiW75XDAvHjdaUGyb9jj9Q=;
  b=ePFZDH6a0JMZbZLVXXdsx+kIzDy3SiQAu4C7h4Tvp3xyMTVXTjf5tZKp
   +vViSZCEfko2FalTf3tFTMZQ4AtTPCHL+B79Cg9MBqO8LHEa0aGrphMtn
   ODLJsTNnj0qOl6yb+knALCQHv+kVa7nt1glDS19uAiMRYGLM/s8goxBon
   QlsKkbxzS3l+zrjanXItv21WxiNrTWClUgsGpgxjCSEZbM80cv4uW6fNL
   VGUI9ocFrX3bX55oeRTASokgpbMgjkj3FpY08NWagu8T3fb9u0ECVASUV
   Qg/sq8Rdi8ftAUinlFHPBVlIMp5WX/i6UvjAJ6RYIlLN4QyU5WvGMu5DK
   Q==;
X-CSE-ConnectionGUID: JdPdPpftT/K+hDw49ZfJ8g==
X-CSE-MsgGUID: g/cdjZipSjeJZcRdF4yYTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496364"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496364"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:42 -0700
X-CSE-ConnectionGUID: ZGoI9YryR7OfxzYVYpHukw==
X-CSE-MsgGUID: 1TpQyy2BSOmdos094Jr61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763484"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8C40C121DA0;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwI-00000004wAF-4ADy;
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
Subject: [PATCH v3 07/22] media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
Date: Wed, 25 Mar 2026 12:58:03 +0200
Message-ID: <20260325105818.1176816-8-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56987-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A4153237F1
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


