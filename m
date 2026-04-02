Return-Path: <linux-media+bounces-57994-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON19MJnkzmk5rQYAu9opvQ
	(envelope-from <linux-media+bounces-57994-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:50:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBAA38E728
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B417C30457DF
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 21:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B75C37FF47;
	Thu,  2 Apr 2026 21:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0rasecx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DB837EFFD
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 21:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166596; cv=none; b=Af+5O+Wm68PCAOPTB2OJTcbPrK96pglB9g5uJEJmXAaosygWz14HSpgIS/6UX+reHW7xKeFIRJ9uZm6arFQu8c6bVnOS+95Rpalp8+8meeph7YpmR1UHh+XGUJ1Ea3bdapOoWpcKTZjMzYhVt9h1K7H6al/4MFEHaAt6MXpLTOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166596; c=relaxed/simple;
	bh=p1ChjdlUdlU9EfV7WyFxL00sbB2pUyUXrpQBue8z2NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddalO+1tJNKJEpKc32YkMzYKyUnuHtMZE6/zFmjkZZ8wMk8tmvr8awW3l/uA+aYDvpcPuXVQccvuaBezhJGPJUDlkRE5cMJRqXcdQaTCNipZnjsgPWalOuHwbuhHOpW0YYY2/LhzOiyNko1JklGfd2fK+2PnRn2eAYa4fJcfmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0rasecx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775166594; x=1806702594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p1ChjdlUdlU9EfV7WyFxL00sbB2pUyUXrpQBue8z2NA=;
  b=b0rasecxKb4rUPnwW8JK5yisTV/YEezBzYiJR/+PpJro9EHj8nSWDvMq
   ncOh6XVqNQ/IL2wg8uDBH9DL5f1gR7fhVFq5hpikaavTdfZXYpjKuSF7t
   l0OYWEzdEYUK5nG22MeYPUGtgfySP7HSumfQxTN9Xr31oEvsq9/7Nihts
   TAwXlktOTqJegq5kDqH2POdXn1cVbaETnNxNHVWgEmbg9MuVM76Aac591
   0N5FjuuSnBeBhn3+sLEpxHJJlP7c5Y1hyTRHQm8Goz0M877bdy8YGm51+
   A0NORyae6eZZCQXEeOzCMTgfCk0OZWYcME+CNfoVxLP+ipYufYGtFvnXZ
   Q==;
X-CSE-ConnectionGUID: Ix+daddURvC153e4nTClcA==
X-CSE-MsgGUID: 8AHXGWGtRbe+ZdpOysMksQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75405640"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75405640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:48 -0700
X-CSE-ConnectionGUID: gbWf5KEOSZexsfmKf+jBoQ==
X-CSE-MsgGUID: 2uqkgBUCQ3yuRx81rbXRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="250154325"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:46 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C6180122034;
	Fri, 03 Apr 2026 00:49:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w8PvG-0000000G3gx-0vhz;
	Fri, 03 Apr 2026 00:49:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 3/6] media: imx335: Remove redundant kernel-doc comments
Date: Fri,  3 Apr 2026 00:49:51 +0300
Message-ID: <20260402214954.3827408-4-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-57994-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BBAA38E728
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove kernel-doc comments from regular callback functions. These comments
have no information value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx335.c | 87 --------------------------------------
 1 file changed, 87 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 5790aa4fabeb..1f777a1a8192 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -698,18 +698,6 @@ static int imx335_update_test_pattern(struct imx335 *imx335, u32 pattern_index)
 	return ret;
 }
 
-/**
- * imx335_set_ctrl() - Set subdevice control
- * @ctrl: pointer to v4l2_ctrl structure
- *
- * Supported controls:
- * - V4L2_CID_VBLANK
- * - cluster controls:
- *   - V4L2_CID_ANALOGUE_GAIN
- *   - V4L2_CID_EXPOSURE
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx335 *imx335 =
@@ -800,14 +788,6 @@ static int imx335_get_format_code(struct imx335 *imx335, u32 code)
 	return imx335_mbus_codes[0];
 }
 
-/**
- * imx335_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
- * @sd: pointer to imx335 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @code: V4L2 sub-device code enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -820,14 +800,6 @@ static int imx335_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx335_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
- * @sd: pointer to imx335 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @fsize: V4L2 sub-device size enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
@@ -871,14 +843,6 @@ static void imx335_fill_pad_format(struct imx335 *imx335,
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
-/**
- * imx335_set_pad_format() - Set subdevice pad format
- * @sd: pointer to imx335 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -923,13 +887,6 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * imx335_init_state() - Initialize sub-device state
- * @sd: pointer to imx335 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
@@ -947,14 +904,6 @@ static int imx335_init_state(struct v4l2_subdev *sd,
 	return imx335_set_pad_format(sd, sd_state, &fmt);
 }
 
-/**
- * imx335_get_selection() - Selection API
- * @sd: pointer to imx335 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @sel: V4L2 selection info
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
@@ -1011,15 +960,6 @@ static int imx335_set_framefmt(struct imx335 *imx335)
 	return ret;
 }
 
-/**
- * imx335_enable_streams() - Enable sensor streams
- * @sd: V4L2 subdevice
- * @state: V4L2 subdevice state
- * @pad: The pad to enable
- * @streams_mask: Bitmask of streams to enable
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_enable_streams(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state, u32 pad,
 				 u64 streams_mask)
@@ -1097,15 +1037,6 @@ static int imx335_enable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * imx335_disable_streams() - Disable sensor streams
- * @sd: V4L2 subdevice
- * @state: V4L2 subdevice state
- * @pad: The pad to disable
- * @streams_mask: Bitmask of streams to disable
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_disable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
@@ -1299,12 +1230,6 @@ static int imx335_power_on(struct device *dev)
 	return ret;
 }
 
-/**
- * imx335_power_off() - Sensor power off sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1430,12 +1355,6 @@ static int imx335_init_controls(struct imx335 *imx335)
 	return 0;
 }
 
-/**
- * imx335_probe() - I2C client device binding
- * @client: pointer to i2c client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx335_probe(struct i2c_client *client)
 {
 	struct imx335 *imx335;
@@ -1530,12 +1449,6 @@ static int imx335_probe(struct i2c_client *client)
 	return ret;
 }
 
-/**
- * imx335_remove() - I2C client device unbinding
- * @client: pointer to I2C client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static void imx335_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-- 
2.47.3


