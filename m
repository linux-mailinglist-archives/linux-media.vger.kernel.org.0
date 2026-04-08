Return-Path: <linux-media+bounces-58248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDicM+121mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 878FD3BE52C
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06D843050439
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48F73D6CD2;
	Wed,  8 Apr 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8daHJvi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A607E3D75AD
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662801; cv=none; b=Gu68+cyls0pU0TRRW9Nyf2Gi/vtvQWWklPuvn/hjl2ei6oMz+etBtdNypTBKcqyoGujnxmBLjXdiO2Ef4+dyp1HuSwh8uGwAeVMMjQmXFAONIE6VqUv5LKTilwX+L5uyp7qYwLzyt/XjMhuBm5S1MCnGSSqHYwuaaBowxpki38U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662801; c=relaxed/simple;
	bh=Cn1i+KMApijiqUxwksNRqaQbO6weNLSPZXS/G0BeH5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ev8uhA7+Wfc+Spe91FX07tDrHNT88J0M3l8XysroFVXnViirEgrMO3O3h9Qt9+GcW7fToWGvSc5FOyN5O2CfVFwinKm4Ury3BHg+dKktzyNADm3SHHRt1R11YfuECThQKhwdADpGAt5w7JAxcINUFzwtzxhCce1oIhEoDcNHOmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8daHJvi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662796; x=1807198796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cn1i+KMApijiqUxwksNRqaQbO6weNLSPZXS/G0BeH5I=;
  b=T8daHJvitwydbBCV3SsIdsbhNYSMBClRCm3lWil2dKSqb6WSa7jLtLy5
   jpSTfF6Qnn0/Ohs4wBYYNfTS6FACeQsUWxfIMGLZhErHLZA5l/0RfkIBr
   P/RtYycBzD1fG/JHUCIDGQaBCBrxWhjcJ48uaLDlxQgnflnzpTjZ8Q8rb
   kJxSMVWLoQ4hhfhtg8wDYdrb3NHYtB+j9ctqHW3C0eGJNf/hBMWb5nCoG
   FV4n8IzYKuXiyB+pm3XGmF+U3gmsQ9L8Ki3NrzqooZsMyvkWTp4hE4VA4
   aTgXaNbtM+lGfmiFwTfQfiD9cECzGW0XSduw5Gx71vSFpB1KFJ1g6wcbr
   A==;
X-CSE-ConnectionGUID: hPx6uU6XRUijQf/g6c0q6Q==
X-CSE-MsgGUID: w/mqtXFhRz+GR+wsPly5ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038324"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038324"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
X-CSE-ConnectionGUID: FoZ3+7AkRBez6DIJ2/9zdg==
X-CSE-MsgGUID: Qjh9S4kfQl2gP3tp2KhgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740275"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EF3CF121DFB;
	Wed, 08 Apr 2026 18:39:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044Co-1YlK;
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
Subject: [PATCH v4 08/29] media: imx274: Remove redundant kernel-doc comments
Date: Wed,  8 Apr 2026 18:39:17 +0300
Message-ID: <20260408153939.969381-9-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58248-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.937];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 878FD3BE52C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove kernel-doc comments from  regular callback functions. These
comments have no information value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx274.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 8ec78b60bea6..241821572e03 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -897,14 +897,6 @@ static int imx274_regulators_get(struct device *dev, struct stimx274 *imx274)
 					imx274->supplies);
 }
 
-/**
- * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
- * @ctrl: V4L2 control to be set
- *
- * This function is used to set the V4L2 controls for the imx274 sensor.
- *
- * Return: 0 on success, errors otherwise
- */
 static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -1059,16 +1051,6 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 	return 0;
 }
 
-/**
- * imx274_get_fmt - Get the pad format
- * @sd: Pointer to V4L2 Sub device structure
- * @sd_state: Pointer to sub device state structure
- * @fmt: Pointer to pad level media bus format
- *
- * This function is used to get the pad format information.
- *
- * Return: 0 on success
- */
 static int imx274_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
@@ -1081,16 +1063,6 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx274_set_fmt - This is used to set the pad format
- * @sd: Pointer to V4L2 Sub device structure
- * @sd_state: Pointer to sub device state information structure
- * @format: Pointer to pad level media bus format
- *
- * This function is used to set the pad format.
- *
- * Return: 0 on success
- */
 static int imx274_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
@@ -1423,16 +1395,6 @@ static void imx274_load_default(struct stimx274 *priv)
 	priv->ctrls.test_pattern->val = TEST_PATTERN_DISABLED;
 }
 
-/**
- * imx274_s_stream - It is used to start/stop the streaming.
- * @sd: V4L2 Sub device
- * @on: Flag (True / False)
- *
- * This function controls the start or stop of streaming for the
- * imx274 sensor.
- *
- * Return: 0 on success, errors otherwise
- */
 static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 {
 	struct stimx274 *imx274 = to_imx274(sd);
-- 
2.47.3


