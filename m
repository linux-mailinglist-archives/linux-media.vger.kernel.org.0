Return-Path: <linux-media+bounces-57996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLIuDGjlzmk5rQYAu9opvQ
	(envelope-from <linux-media+bounces-57996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:53:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97B38E796
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 031FF307B234
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 21:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D488D372EC5;
	Thu,  2 Apr 2026 21:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeRdDoaD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830AD37F8D0
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 21:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166599; cv=none; b=rUYCIJbqs+hS9H+zvxes80lTobYff95HPup7Vf+Ah+GnO1j5CDQTBW45Kbhkz2YyUdJP66S7b9NI4W+Wo2OHH3t5PJjvlmg/Wiy92ekoF4nxMo1gKBjYtvAkGuv8b4nP6ZOhocsQqrL1V1hjULOdjhOvlPfbIoh4RAhyJ2K/11c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166599; c=relaxed/simple;
	bh=Ss3ejvuvBjdpUiaPaAGMCsm9lCz59N0pupQKwuvxTI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ho0NRctNhsKOXEUUNv6RlU/ckwbvsz2W0TzSu1iPh7cKqTu5XPiC0A8RiWSZ7JzhkbyxcrBumrPamhHZEOjRdcW7H8GilKKYPI8Xm6eAs7BGygdpTYKo5BXxsebPLZljR+zwivRmhKFosEO3YytiOucRNIcsh0Ms/Oc2XbeAVo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeRdDoaD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775166596; x=1806702596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ss3ejvuvBjdpUiaPaAGMCsm9lCz59N0pupQKwuvxTI4=;
  b=AeRdDoaDD3sgiPN5jNjqAGBSV9K3Ta3mHL+aBQ1A0rygr9YDwyFL+Csy
   pU+hbbP3V4Yn7WvjIXATgGrcn3LWvo7VhBHxvYS8z7lX91JQTBMfNjCuA
   loeFUbmi2ek+sQTUrlloeLDk7oEwGw7iOGLyN2S6kHbCEb+7gE/FFbQJw
   rxX4I2YgRs7okZtvvlsPFp6CHSA0ffgpuzJpk8flniCeHCVQJhsoQFAyD
   rB+efiZv9JdmwS7nd2WE8ITv/sMri5cMYDmw2TAlT50PsO/gKYADovJzR
   XE20dXUx0MsTr5RhYCc9XsQ0tIGFIKl5Bcrap/b4MrDL00HrXQfNPtO0s
   g==;
X-CSE-ConnectionGUID: lPO9LYQlRnClfVLTa8FhlQ==
X-CSE-MsgGUID: aBR0+QCLQ+m6ibcVGGqqXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75405651"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75405651"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:51 -0700
X-CSE-ConnectionGUID: RibcTdCFRWGKEjvI/frm8w==
X-CSE-MsgGUID: hCH+Qa29SnSfIWI45hK/uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="250154352"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CE777122037;
	Fri, 03 Apr 2026 00:49:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w8PvG-0000000G3h5-161y;
	Fri, 03 Apr 2026 00:49:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 5/6] media: ov9282: Remove redundant kernel-doc comments
Date: Fri,  3 Apr 2026 00:49:53 +0300
Message-ID: <20260402214954.3827408-6-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-57996-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 8D97B38E796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove kernel-doc comments from regular callback functions. These comments
have no information value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov9282.c | 67 --------------------------------------
 1 file changed, 67 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2167fb73ea41..5b6f897a74fc 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -586,18 +586,6 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
 	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
 }
 
-/**
- * ov9282_set_ctrl() - Set subdevice control
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
 static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov9282 *ov9282 =
@@ -704,14 +692,6 @@ static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
 	.try_ctrl = ov9282_try_ctrl,
 };
 
-/**
- * ov9282_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
- * @sd: pointer to ov9282 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @code: V4L2 sub-device code enumeration need to be filled
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -780,14 +760,6 @@ static void ov9282_fill_pad_format(struct ov9282 *ov9282,
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
-/**
- * ov9282_get_pad_format() - Get subdevice pad format
- * @sd: pointer to ov9282 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -807,14 +779,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * ov9282_set_pad_format() - Set subdevice pad format
- * @sd: pointer to ov9282 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
@@ -852,13 +816,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
-/**
- * ov9282_init_state() - Initialize sub-device state
- * @sd: pointer to ov9282 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int ov9282_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
@@ -1157,12 +1114,6 @@ static const struct v4l2_subdev_internal_ops ov9282_internal_ops = {
 	.init_state = ov9282_init_state,
 };
 
-/**
- * ov9282_power_on() - Sensor power on sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int ov9282_power_on(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1206,12 +1157,6 @@ static int ov9282_power_on(struct device *dev)
 	return ret;
 }
 
-/**
- * ov9282_power_off() - Sensor power off sequence
- * @dev: pointer to i2c device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int ov9282_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1333,12 +1278,6 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	return 0;
 }
 
-/**
- * ov9282_probe() - I2C client device binding
- * @client: pointer to i2c client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static int ov9282_probe(struct i2c_client *client)
 {
 	struct ov9282 *ov9282;
@@ -1435,12 +1374,6 @@ static int ov9282_probe(struct i2c_client *client)
 	return ret;
 }
 
-/**
- * ov9282_remove() - I2C client device unbinding
- * @client: pointer to I2C client device
- *
- * Return: 0 if successful, error code otherwise.
- */
 static void ov9282_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-- 
2.47.3


