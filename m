Return-Path: <linux-media+bounces-58254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBe0BwV31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A29CD3BE55E
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1618305CD96
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03333D7D91;
	Wed,  8 Apr 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkC0UYIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9AB175A63
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662815; cv=none; b=nLIonrMGPn5/+69WPfdXYo0oVtS/UVGNapYIl1rCdHduCDQs6eNjfNzgYbj6NVDNWRbWP0svKfX4S56NPMFTV+z7b4GJZtiZSFl7FzbWDJQbe4gqclbmcIkZoO67DB+GjgbefxPmTAk0z5k4yQ8TeIgiNm6YCWNX/lC14ez2S7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662815; c=relaxed/simple;
	bh=p1ChjdlUdlU9EfV7WyFxL00sbB2pUyUXrpQBue8z2NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAZoAn+wCDLxE7/4qGXbQAd/XYGya9BfvOLlS2NgbYaEfUTbz1AQZINnNrDtzZwNE+cs6NQ7/kyPnUy6exZ2mBiZXVvSzU9bzuuVzmZr+4gMRjYX9DMZiR/zqXYC23f8+p48wtYmPanRUT1cb4uETwBx0AfQlEWXz84Bwm88BP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkC0UYIU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662811; x=1807198811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p1ChjdlUdlU9EfV7WyFxL00sbB2pUyUXrpQBue8z2NA=;
  b=nkC0UYIUiW3kUaPDdRUZazzBFc3ZLQURvBOukSuNiw6vGtGS9tANKvKV
   O/yZ7Dyw+fULY8iv6leBXfzcjAL1jo9cz1KCfUJOCm5cWpsfolEmQYcpb
   sWmAyBd0Lx7eS7JVN/mrFrgaQAJ21VizZo+Z31FEOv8SQm65C0nMMmpuC
   U9RzYyLl6m1IQxqhI7TkhNFIj0d8iuZ6flm+IZkKSWRsANpQG9NDdpAiT
   j1O+6lHOLhTSDAqqfylx0NYn/w4AevvtmIbPszios2zDsMgVZEFqUbVrG
   o4vFpl7P95edmlZiJkMvk4iwc8LnFzgumsmh6DrwkjlgSLMFNDpjMBt9w
   w==;
X-CSE-ConnectionGUID: 8kSOE1XdQGm2T4SWCLsMZQ==
X-CSE-MsgGUID: o9VWa3KLStu187gERKzimA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038387"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038387"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:54 -0700
X-CSE-ConnectionGUID: 2W6XScs8R3uEQcYqoChVdw==
X-CSE-MsgGUID: EyIpTvHpRNC70SY0oUk+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740289"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 013D7121E39;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044Cw-1kBB;
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
Subject: [PATCH v4 10/29] media: imx335: Remove redundant kernel-doc comments
Date: Wed,  8 Apr 2026 18:39:19 +0300
Message-ID: <20260408153939.969381-11-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58254-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: A29CD3BE55E
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


