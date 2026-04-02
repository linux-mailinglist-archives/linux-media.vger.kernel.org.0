Return-Path: <linux-media+bounces-57992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIbUCTzlzmk5rQYAu9opvQ
	(envelope-from <linux-media+bounces-57992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:53:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2D038E77F
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D0C53053080
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 21:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CD637F8B0;
	Thu,  2 Apr 2026 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBjb4mIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027737C0E7
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166594; cv=none; b=XrB3VwHhwsR+GpSrwcOLT434o4BcfcJVBw+mXtaWulF+0ilnpoxntSpZDGtQxSOn0aBGbdJdR8e6TyrltwlJUC7XP39aTtlhN1oGgputhKhYWFsIAGBae8nm/FNiKVEWfGZQIFU/TXaz0SZj4fiqoH8VQOrajjDIJk9If34phbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166594; c=relaxed/simple;
	bh=S0+dV0rvc6kMU3KgKQFdqNqd9tRljqenTXpuDQQSuUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+tdVEpQrxxKBLRVfs4haP4gD5ivr5e3dHvlE2y1vzhN3YsfwnOgX6DwThr/WF4uN7Qv/3SdqLKLkqGf9HzHHR09/eE/DiALTlXh6vIao5cfzie/F8QQ1zN6jhK8gGxmztxjaVW7CAd7VL7wpTmgPcfLwMAhCP2VO2WeT5fkCWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBjb4mIU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775166592; x=1806702592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S0+dV0rvc6kMU3KgKQFdqNqd9tRljqenTXpuDQQSuUA=;
  b=FBjb4mIUBpMpRc5IpBBIR6XkU9d8cfLuKShV0JuLAicz6qu04jwJJdtR
   68s/fdHLD4p8naMys62M92WSl+86xA7eJ+55ej3A99IYQInsAasTFmGkz
   Nmd1YE37uT2ukCaViFKxrl8XoA4RgnzNwxGFjsM0bkXJk1I0G2Cd87VAD
   dglxJjMWjI6Oo0aGyvG9f+r0PuYiY4QguWZgiyiAkfhxXccqd/x8hJdNJ
   9HF0W6zLp0ULuViUnI3nFxPY0U+FrC/gBNPACDKclE9xzkilLdkJZC563
   6xDiel81ndKtwq9N75HR/LPDYBoHWipvgtRiwt3gPZKdKW7v+ZaLxfRZP
   w==;
X-CSE-ConnectionGUID: TP71GvrwR/6qLSXhnk2l3w==
X-CSE-MsgGUID: 5yyiDwYtRuSyOEHqKdEuvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75405632"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75405632"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:48 -0700
X-CSE-ConnectionGUID: i0XVMkdHRxGiemTT6MB5Kw==
X-CSE-MsgGUID: 500dKDMaRGCgT5iYcqDVAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="250154323"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:46 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C6155121FF9;
	Fri, 03 Apr 2026 00:49:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w8PvG-0000000G3h1-101Z;
	Fri, 03 Apr 2026 00:49:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 4/6] media: imx412: Remove redundant kernel-doc comments
Date: Fri,  3 Apr 2026 00:49:52 +0300
Message-ID: <20260402214954.3827408-5-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-57992-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 7B2D038E77F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove kernel-doc comments from regular callback functions. These comments
have no information value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx412.c | 82 --------------------------------------
 1 file changed, 82 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index e25e0a9ff65c..2705af2f16c0 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -570,18 +570,6 @@ static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
 	return ret;
 }
 
-/**
- * imx412_set_ctrl() - Set subdevice control
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
 static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx412 *imx412 =
@@ -634,14 +622,6 @@ static const struct v4l2_ctrl_ops imx412_ctrl_ops = {
 	.s_ctrl = imx412_set_ctrl,
 };
 
-/**
- * imx412_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
- * @sd: pointer to imx412 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @code: V4L2 sub-device code enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -654,14 +634,6 @@ static int imx412_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx412_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
- * @sd: pointer to imx412 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @fsize: V4L2 sub-device size enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
@@ -701,14 +673,6 @@ static void imx412_fill_pad_format(struct imx412 *imx412,
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
-/**
- * imx412_get_pad_format() - Get subdevice pad format
- * @sd: pointer to imx412 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_get_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -731,14 +695,6 @@ static int imx412_get_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx412_set_pad_format() - Set subdevice pad format
- * @sd: pointer to imx412 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -768,13 +724,6 @@ static int imx412_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * imx412_init_state() - Initialize sub-device state
- * @sd: pointer to imx412 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
@@ -840,13 +789,6 @@ static int imx412_stop_streaming(struct imx412 *imx412)
 				1, IMX412_MODE_STANDBY);
 }
 
-/**
- * imx412_set_stream() - Enable sensor streaming
- * @sd: pointer to imx412 subdevice
- * @enable: set to enable sensor streaming
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx412 *imx412 = to_imx412(sd);
@@ -1010,12 +952,6 @@ static const struct v4l2_subdev_internal_ops imx412_internal_ops = {
 	.init_state = imx412_init_state,
 };
 
-/**
- * imx412_power_on() - Sensor power on sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_power_on(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1053,12 +989,6 @@ static int imx412_power_on(struct device *dev)
 	return ret;
 }
 
-/**
- * imx412_power_off() - Sensor power off sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1159,12 +1089,6 @@ static int imx412_init_controls(struct imx412 *imx412)
 	return 0;
 }
 
-/**
- * imx412_probe() - I2C client device binding
- * @client: pointer to i2c client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx412_probe(struct i2c_client *client)
 {
 	struct imx412 *imx412;
@@ -1254,12 +1178,6 @@ static int imx412_probe(struct i2c_client *client)
 	return ret;
 }
 
-/**
- * imx412_remove() - I2C client device unbinding
- * @client: pointer to I2C client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static void imx412_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-- 
2.47.3


