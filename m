Return-Path: <linux-media+bounces-58255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ig2JW531mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:42:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15A3BE616
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FF58306B2C9
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1F23D3485;
	Wed,  8 Apr 2026 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PG92xTxF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4B3D5238
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662817; cv=none; b=o4ULft/wi3FAFkM/DRR2fOb9OSGUfkqTsDmHtIE5SrIF9ps0RG+CAtHRBQ8dE+5rCpYpX5FYH3BbxdPgkBwDzD1o1cydxA9GeUiA3eBYkKtL/aH6rYkz+4s5mSap7bfXN6delKLZEkxQyaXJJuwwVQ1c7CMk71P6Q9ZEMOBM0QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662817; c=relaxed/simple;
	bh=fFDIYTfO3BoZruAtF9QRkwTyTsJj/ZfxTSVhaMSGEJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdQlNA4vtEJv0UnuSlN0DKROFI8pLSAbpzBZAtrOZ8KQ77OKbq3zV9l6J/bh9KRU/4kPx2L0it166uhOCthX4dsoPcumrJTAp2XHk6grO1waWwh0l4wvtxM/gXQPMzsAxPyQ7/UpOQVTsm1vYV3u+w6Eb3kch75mRexCfIWDsno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PG92xTxF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662813; x=1807198813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fFDIYTfO3BoZruAtF9QRkwTyTsJj/ZfxTSVhaMSGEJc=;
  b=PG92xTxFgSlFZa/b7JTXTI6Ol0ez1vRX+IaeAeKwRsomaJb1eCqBF+jg
   LWGy+IjRxBzO16NkQGl8bmrDvFQl9IGEXLH7d2BXzvmoI9IJzVNlXbw59
   65+oII6FR43b163iKZPsODmkUHiMQN4j13S+EWXxT8W6DPOTgYf0BPoE4
   Z9h36YHeyhYyrBlKoEqP9isgMrDyeZVjGxl3qdHNWe7OyEvz+EB2K4d6n
   q4ivXEPLhL+BQdyikNDnt7EwCymwDi/+mHpqy+QUAewHlQ74UOoiRED3j
   onVz27x8oF8Q0t/prGMWUj3LC9xPk7mBCd60wQoo1LyrOpqhHb+sPvfV9
   A==;
X-CSE-ConnectionGUID: MijNEpZnRpGFeKo0l2Q+zw==
X-CSE-MsgGUID: Tk1/jaGiQxCgzFf/cRl3Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038410"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038410"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:54 -0700
X-CSE-ConnectionGUID: RoxzWhpcRgmFwBK6Lw99hg==
X-CSE-MsgGUID: SRaxjGTHQtq51PmMQJKy4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740295"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1036D121F82;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044D8-2188;
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
Subject: [PATCH v4 13/29] media: tvp514x: Remove redundant kernel-doc comments
Date: Wed,  8 Apr 2026 18:39:22 +0300
Message-ID: <20260408153939.969381-14-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58255-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.934];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC15A3BE616
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove kernel-doc comments from regular callback functions. These comments
have no information value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/tvp514x.c | 55 +------------------------------------
 1 file changed, 1 insertion(+), 54 deletions(-)

diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index f9c9c80c33ac..7af8f37646d6 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -686,13 +686,6 @@ static int tvp514x_s_routing(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * tvp514x_s_ctrl() - V4L2 decoder interface handler for s_ctrl
- * @ctrl: pointer to v4l2_ctrl structure
- *
- * If the requested control is supported, sets the control's current
- * value in HW. Otherwise, returns -EINVAL if the control is not supported.
- */
 static int tvp514x_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = to_sd(ctrl);
@@ -789,13 +782,6 @@ tvp514x_set_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * tvp514x_s_stream() - V4L2 decoder i/f handler for s_stream
- * @sd: pointer to standard V4L2 sub-device structure
- * @enable: streaming enable or disable
- *
- * Sets streaming to enable or disable, if possible.
- */
 static int tvp514x_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	int err = 0;
@@ -850,14 +836,6 @@ static const struct v4l2_ctrl_ops tvp514x_ctrl_ops = {
 	.s_ctrl = tvp514x_s_ctrl,
 };
 
-/**
- * tvp514x_enum_mbus_code() - V4L2 decoder interface handler for enum_mbus_code
- * @sd: pointer to standard V4L2 sub-device structure
- * @sd_state: subdev state
- * @code: pointer to v4l2_subdev_mbus_code_enum structure
- *
- * Enumertaes mbus codes supported
- */
 static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
@@ -877,14 +855,6 @@ static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * tvp514x_get_pad_format() - V4L2 decoder interface handler for get pad format
- * @sd: pointer to standard V4L2 sub-device structure
- * @sd_state: subdev state
- * @format: pointer to v4l2_subdev_format structure
- *
- * Retrieves pad format which is active or tried based on requirement
- */
 static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *format)
@@ -909,14 +879,6 @@ static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * tvp514x_set_pad_format() - V4L2 decoder interface handler for set pad format
- * @sd: pointer to standard V4L2 sub-device structure
- * @sd_state: subdev state
- * @fmt: pointer to v4l2_subdev_format structure
- *
- * Set pad format for the output pad
- */
 static int tvp514x_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
@@ -1014,15 +976,7 @@ tvp514x_get_pdata(struct i2c_client *client)
 	return pdata;
 }
 
-/**
- * tvp514x_probe() - decoder driver i2c probe handler
- * @client: i2c driver client device structure
- *
- * Register decoder as an i2c client device and V4L2
- * device.
- */
-static int
-tvp514x_probe(struct i2c_client *client)
+static int tvp514x_probe(struct i2c_client *client)
 {
 	struct tvp514x_platform_data *pdata = tvp514x_get_pdata(client);
 	struct tvp514x_decoder *decoder;
@@ -1113,13 +1067,6 @@ tvp514x_probe(struct i2c_client *client)
 	return ret;
 }
 
-/**
- * tvp514x_remove() - decoder driver i2c remove handler
- * @client: i2c driver client device structure
- *
- * Unregister decoder as an i2c client device and V4L2
- * device. Complement of tvp514x_probe().
- */
 static void tvp514x_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-- 
2.47.3


