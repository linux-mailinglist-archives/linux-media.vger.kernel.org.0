Return-Path: <linux-media+bounces-58252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO33DQB31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFEB3BE556
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC937305AC86
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8723D6CDB;
	Wed,  8 Apr 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYprCyzd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1A3D5657
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662811; cv=none; b=OBkTXPew2z9YvVDqCKxbIeYhDfhYxg4ETBMb2biFTExhPNhpboUD/pj+0qks0KzpNTiX5wLJ79LwrIWNbcQQ6rj8jDFDZ7OHifMFvajkNPzeSXYl7Q0U/DyuHXUbK9bcCe2qvccQFFOWkk0CUfcn6dUU6AOU4eNeMgsi1PvAgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662811; c=relaxed/simple;
	bh=S0+dV0rvc6kMU3KgKQFdqNqd9tRljqenTXpuDQQSuUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeREDEp99kBeMwpQDiKYkSewBvJ4ZANya4Lvg+kMeD7VzhDW+Nvv3L+s4Iw5t+3QcccZLov5owtmWoTslQdwWJITnOhHgNDqKRUuO071gKU1RB/qAuLCvGKYbPQ5Vauxf/sVlvEeJw3OqBHAvoyRqXzwgE+dH6aTsw3Mwc2LyTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYprCyzd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662806; x=1807198806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S0+dV0rvc6kMU3KgKQFdqNqd9tRljqenTXpuDQQSuUA=;
  b=jYprCyzdNAmTdu9cQKIEVUVUTbO8JndXASRnqIrXCCLU5GQOxtejH83V
   ucthmYW/OESh277BTfV1iPbpoujMj15BuQSwdNVt6x6OmW0UIhJpkZQUO
   uiStzKpIywYnVCCATK4Tb6m3ip/Y8sUD3LRYQP4x89J+ydbcarWAMc6vT
   7M5Qemz1QsN0/AISIcGhKAV8A60K41F8faX0FgcFdjToi6p3A5GleGzKJ
   75Nkj4MM9vFaP5uCtWJOVpzacq82ot9YSQB95MVgwHZj3mif/apvkCj6i
   kwOpC5P2O9AchbnKMD/qnnBFbIwtVp5Zj35PsKCewcV+judCA2jPs8m6D
   A==;
X-CSE-ConnectionGUID: Gk3/CR7mTlyRAMGHPF8Lsg==
X-CSE-MsgGUID: 5wkwOzfyQoOoLRwXhLrY0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038362"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038362"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
X-CSE-ConnectionGUID: XFyTDzNIQzanVNrud34WGw==
X-CSE-MsgGUID: waZyb7GUQeKOcwgnfEWfPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740285"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 048F0121EBF;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044D0-1qiL;
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
Subject: [PATCH v4 11/29] media: imx412: Remove redundant kernel-doc comments
Date: Wed,  8 Apr 2026 18:39:20 +0300
Message-ID: <20260408153939.969381-12-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58252-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.938];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAFEB3BE556
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


