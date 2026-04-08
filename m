Return-Path: <linux-media+bounces-58250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGEnCkB31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:41:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB93BE5D3
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60B97304B2BA
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3B23D6CD3;
	Wed,  8 Apr 2026 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5s7/f4e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDB53D6CCD
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662806; cv=none; b=uBS6h/yFc9DYQW9VivQY7I9Z7QqALSgI9wrHgl3/YX8LFGd8DJGxNOjgeqMvaJaLZ4+p+jTqNrK8zUPvihuMr01pBavt+4CSUBLmQLo5vN8dfVTuYqS7guIowFn+32KeHuF8RZgJYgSok8MLZPx594Ufm5pONq7nTRiUYjx7/AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662806; c=relaxed/simple;
	bh=sMx1BAC0rTQO9irSYSSFp0Fn4NTWHvNZN/sAKLa7bpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aol8ttr//Ck8Wod7OktZdC90Hss9TcqvAyNtw52+YXgcSNY0a2094mFYPz0mpiQ87iZDbhjgPw2vbQcdzdZEvwKtCEuLPFA9bqA3XyFIlMRPe3DqZjffa1iDJMbRnN/JMrSPdCm6mknzS9Xgw6MtYoRL8UVSfxHF5ZOkezzHnq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5s7/f4e; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662802; x=1807198802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMx1BAC0rTQO9irSYSSFp0Fn4NTWHvNZN/sAKLa7bpI=;
  b=c5s7/f4eTmu95It4O07rHDQ+B06ma1Q5o/S6AUSI+1d01rVD+TbcaW2s
   yEpSHCPRaAwhgG6eegN16pn+WlDRLV1dna8Eld0r6SzqGa3vTFQQsaLb1
   YVGv9C7r6vTq7j+oVyzWOEG4VJKSc33YXyMpji5+O04jYSsf7RaSE/2wL
   b7pCNBVjhDELQRVn2jzzCffiQwRkp89OLVaUfYp5G0ibNq2XJwjRAzHqR
   cf+PU+MmfusEdQ1kskRELm06YI8ZJy4/Y11uGIiPVQp/HFzWep6q50M46
   xyDBoOqU1XKnb5LjRBIss3ZWZJui32BC8lbIjfOCtdMlVLpi3XvPf6VJL
   w==;
X-CSE-ConnectionGUID: V4M1uWUjQWi23LMlAjBxug==
X-CSE-MsgGUID: 9dg4O8NcQWyCPdtecdL9/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038350"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038350"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
X-CSE-ConnectionGUID: Cp9ZjpUcQvG6tRV/fEF+SQ==
X-CSE-MsgGUID: wEt9RDMPS+Wr5nizmDo+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740282"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F190E121E1D;
	Wed, 08 Apr 2026 18:39:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044Cs-1fe1;
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
Subject: [PATCH v4 09/29] media: imx334: Remove redundant kernel-doc comments
Date: Wed,  8 Apr 2026 18:39:18 +0300
Message-ID: <20260408153939.969381-10-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58250-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.936];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91EB93BE5D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove kernel-doc comments from regular callback functions. These comments
have no information value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx334.c | 93 --------------------------------------
 1 file changed, 93 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 9654f9268056..553a16b84f4d 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -566,18 +566,6 @@ static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
 	return ret;
 }
 
-/**
- * imx334_set_ctrl() - Set subdevice control
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
 static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx334 *imx334 =
@@ -678,14 +666,6 @@ static int imx334_get_format_code(struct imx334 *imx334, u32 code)
 	return imx334_mbus_codes[0];
 }
 
-/**
- * imx334_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- * @code: V4L2 sub-device code enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -698,14 +678,6 @@ static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx334_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- * @fsize: V4L2 sub-device size enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
@@ -749,14 +721,6 @@ static void imx334_fill_pad_format(struct imx334 *imx334,
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
-/**
- * imx334_get_pad_format() - Get subdevice pad format
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_get_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -776,14 +740,6 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx334_set_pad_format() - Set subdevice pad format
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -815,13 +771,6 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * imx334_init_state() - Initialize sub-device state
- * @sd: pointer to imx334 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device state
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
@@ -856,15 +805,6 @@ static int imx334_set_framefmt(struct imx334 *imx334)
 	return -EINVAL;
 }
 
-/**
- * imx334_enable_streams() - Enable specified streams for the sensor
- * @sd: pointer to the V4L2 subdevice
- * @state: pointer to the subdevice state
- * @pad: pad number for which streams are enabled
- * @streams_mask: bitmask specifying the streams to enable
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_enable_streams(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state, u32 pad,
 				 u64 streams_mask)
@@ -929,15 +869,6 @@ static int imx334_enable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * imx334_disable_streams() - Enable specified streams for the sensor
- * @sd: pointer to the V4L2 subdevice
- * @state: pointer to the subdevice state
- * @pad: pad number for which streams are disabled
- * @streams_mask: bitmask specifying the streams to disable
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_disable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
@@ -1067,12 +998,6 @@ static const struct v4l2_subdev_internal_ops imx334_internal_ops = {
 	.init_state = imx334_init_state,
 };
 
-/**
- * imx334_power_on() - Sensor power on sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_power_on(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1101,12 +1026,6 @@ static int imx334_power_on(struct device *dev)
 	return ret;
 }
 
-/**
- * imx334_power_off() - Sensor power off sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1206,12 +1125,6 @@ static int imx334_init_controls(struct imx334 *imx334)
 	return 0;
 }
 
-/**
- * imx334_probe() - I2C client device binding
- * @client: pointer to i2c client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int imx334_probe(struct i2c_client *client)
 {
 	struct imx334 *imx334;
@@ -1311,12 +1224,6 @@ static int imx334_probe(struct i2c_client *client)
 	return ret;
 }
 
-/**
- * imx334_remove() - I2C client device unbinding
- * @client: pointer to I2C client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static void imx334_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-- 
2.47.3


