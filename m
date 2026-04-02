Return-Path: <linux-media+bounces-57995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GQ5Glzlzmk5rQYAu9opvQ
	(envelope-from <linux-media+bounces-57995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:53:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C6838E78F
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 546C4306B9FB
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 21:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2EC373BEC;
	Thu,  2 Apr 2026 21:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4RYLoMM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8458937F011
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 21:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166597; cv=none; b=hFp1ZirTHkHBCMS8kIkQF+BqXH14lPUWlsi5uwcRdZUfA2469c+Mw4/RtlhkTGaPcTm9IFcQ2jTkm/MWPmPlj/SpKg9EsZdaXOBRVYdUDvYLlkxQvxQElTLndSYGQNEV73dm71gEAGklYXOEQTKPXPFJO1ytzA5Z/xBIQ/A8Y68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166597; c=relaxed/simple;
	bh=fFDIYTfO3BoZruAtF9QRkwTyTsJj/ZfxTSVhaMSGEJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgi0+GdLzuJLxE73wzMUsHT8mNz1wPlT6qITE4ULyDpjW5ZcI3ztJCUxBroXO//h9zCAfbD6w6dFXHMOzZ1KAWzVjZInzadOjw33XC+QlJUiMjHXX6VmxcDYGlZUx+uHDPkCzCIE8cyobviLoRuq7srpXRTUFyAu8p8PujDN1DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4RYLoMM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775166594; x=1806702594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fFDIYTfO3BoZruAtF9QRkwTyTsJj/ZfxTSVhaMSGEJc=;
  b=S4RYLoMMYOduwRtlIUp/qx/5AvS9XYnTy4ByrbsnNpAy3z5Ich7e9CLh
   Mxex1ncp2530ZhCVvG3NSxVhIOmm0YFb4y8r8a0ovlw0+IPu4jLrNLTR4
   xC7Lhy3RhR4lgDshLbA+f9nFL8c9Ik9heCimPN5RS7IxUX7Z6NYYltwmM
   3zyWDWcHp6DFPWkyQtKg1QClfMjQfotnbiZdcFtDB7xG/9iJfINhx2p9h
   uITEumywLzIVMNAwN96IwJ766o2Gs6T0phi1abHM/HIb2nkptr4c+U3Fc
   X07AN6nvjrMN/xbFLpBUPtTRAB3YHwzkXjxz/zWiT8WYkE1Whl0WL2XS8
   A==;
X-CSE-ConnectionGUID: FKwH0yMDSqyHsyr//8ATZQ==
X-CSE-MsgGUID: kKH/sJ6EQWCcqIjHxSGhWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75405647"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75405647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:51 -0700
X-CSE-ConnectionGUID: Cnoit4zSRtaT7HKMS4tHHg==
X-CSE-MsgGUID: yyXO+s5GSo+eAoo0TXzKHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="250154351"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D241E1220B7;
	Fri, 03 Apr 2026 00:49:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w8PvG-0000000G3h9-1D08;
	Fri, 03 Apr 2026 00:49:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 6/6] media: tvp514x: Remove redundant kernel-doc comments
Date: Fri,  3 Apr 2026 00:49:54 +0300
Message-ID: <20260402214954.3827408-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402214954.3827408-1-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-57995-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F3C6838E78F
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


