Return-Path: <linux-media+bounces-57939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGuLHDtJzmknmgYAu9opvQ
	(envelope-from <linux-media+bounces-57939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 12:47:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D88FC387D88
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 12:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA46A303F57A
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 10:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47FF376BF1;
	Thu,  2 Apr 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwdY0wpR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241B2E11A6;
	Thu,  2 Apr 2026 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775126832; cv=none; b=t2mCLUkcVfp01N7MwCBU4lDg1n0MMI7ThZsCVuTz6JaJapd370Gt6OZy1pj1X7IBiNzBtr+wfslJTgmqAZnO7x35KdgcSEEB6WgBTeBGLHUodRLkAU4d8t8L7EZX7bOKe37g7TNFsFhnS+qvWqhqwQEpBrq80Nxurj6yvXS/YEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775126832; c=relaxed/simple;
	bh=dm0Ml4lyUVXyd/khsBjrBM24z5kEdXZTL1wVaZojj6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=psbwIbI/DQKF3Xv5+ww/phUQizTyX9N7yZJxfAQG3zyc0pu2/ouAZlvcLlnV9KL9/j2XRlMfX/rQ1WNuSKLFMIIiv1k0U+YT2JMOB+6F0ok8QJPI8jgltnFL+3lypVPnbP+gFfFMTXV5H6RtnpoVV8JOd0pm+nmAMQ4O4pxlTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwdY0wpR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775126831; x=1806662831;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dm0Ml4lyUVXyd/khsBjrBM24z5kEdXZTL1wVaZojj6I=;
  b=PwdY0wpR5H/74851faY99X/1g1F83JtllvdjVOA9WZkerUdgP+gYOiI5
   tNvm5q7ZKhnP/deny5s7qEJiCSBbyvCr3iFrwo6HsjKTEoisZXzy97FHD
   h1hItC9XIJfDKZTTOPUBYVkn6WgMym1L54Y8ioexbs+mevsABfXDAps2S
   lpSd6ViJ/LH/BfvTqMLQLXC29Xe0mRUrTGlLoyPGV/tWaMdAJWUN/tcYR
   /CqMBoW4biFWV60rVu+YKybZOLV0Ylj3SplOjb49tmvL4SPYprk01UD9v
   m6tAor14wKRrJDfu9HnJxGnDNJ1KGXqaAASVyie4XdIJMp4JOeYfF0JOZ
   Q==;
X-CSE-ConnectionGUID: Xir4Gnq+QwiNonGv1/q+ag==
X-CSE-MsgGUID: DzLumzb6RmmXPXCWEVVKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76370696"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76370696"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 03:47:10 -0700
X-CSE-ConnectionGUID: xxlV3t1NRPa7DLHghd8iKw==
X-CSE-MsgGUID: lWjrNmftQAmhxi3FXXPNNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="231349388"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2026 03:47:08 -0700
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com,
	johannes.goede@oss.qualcomm.com
Cc: sakari.ailus@linux.intel.com,
	arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com,
	dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehdi.djait@intel.com
Subject: [PATCH v8 0/2] Add TPS68470 power supply support for ov13b10 sensor
Date: Thu,  2 Apr 2026 16:10:36 +0530
Message-ID: <20260402104045.4040328-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57939-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D88FC387D88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms.

The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC.
This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences.

Changes in V8:
        - Removed explicity added reviewer name
        - corrected reviewer name format

Suggested by Sakari:
        - Remove explicitly added reviewer name

Suggested by Ilpo Järvinen:
	- Reviewer name misformatted

Changes in V7:
        - Rebased two patches top of "adding support for an MSI laptop" Patches
        - Removed unused regulator init data
        - Added VCM regulator names passed to appropriate device sensor device

Suggested by Sakari:
        - Asked to add patches top "adding support for an MSI laptop"
        - Removed unused regulator init data

Changes in V6:
        - Changed consumer supply arrays from int3472_* to ovti13b1_* and update all references.
        - Removed consumer supply zero-init fields
        - Updated commit message for ov13b10 driver and rewritten for regulator bulk support
        - Updated <linux/regulator/consumer.h> in alphabetical order

Suggested by Dan Scally:
        - Rename consumer supply arrays to ovti13b1_* naming
        - Drop explicit 0 initialization for empty consumer lists
        - Add <linux/regulator/consumer.h> in alphabetical order

Changes in V5:
        - keep supply names to only those consumed for sensor driver like dvdd, avdd, dovdd regulators
        - Removed always_on flag for other power sources except only VSIO power rail
        - Removed unused gpio names (s_idle/s_enable) in gpio lookup table
        - changed gpio lookup table name as intel_nvl_ovti13b1_gpios

Suggested by Dan Scally:
        - Limit regulator supplies to only those consumed by sensor driver: Keep only dvdd, avdd, dovdd; remove unused vdd, vsio, vddd, vdda, vdddo mapping
        - Only VSIO should be forced always-on; drop it from CORE, ANA, VCM, and VIO rails to reduce power draw.
        - Rename table to intel_nvl_ovti13b1_gpios, keep only reset GPIO (remove unsupported s_idle and s_enable)
        - Remove gpio lookup table name like intel_nvl_ovti13b1_gpios

Suggested by Sakari Alius:
        - Asked to remove always_on flag for all power sources except vsio

Changes in v4:
        - Discrete INT3472 supplying regulator to i2c-OVTI13B1:00 and tps68470 supplying regulator to i2c-OVTI13B1:01.
        - Change Analog regulator name as avdd for tps68470 pmic
        - Fixed regulator_consumer_supply maps to i2c-OVTI13B1:01 device.
        - Removed vdd regulator from Power supply names list

Suggested by Hans:
        - No "avdd" found, only "vdda" and "ana" - check if "ana" should be changed to "avdd".
        - Drop unused regulator maps. Only keep the 3 maps used by sensor-driver.
        - For "i2c-OVTI13B1:01" consumer, only map "dovdd", "avdd", and "dvdd" supplies.

Changes in v3:
        - Fixed check patch errors as updated by sakari
        - Enabled VCM regulator for ov13b10 sensor to enable autofocus to work

Suggested by Sakari:
        - Add include header file in alphabetical order
        - Remove extra space
        - Asked to check vcm instance

Changes in v2:
        - Added power supply names array for the three required regulators
        - Implement regulator handling with devm_regulator_bulk_get()
        - Add regulator_bulk_enable() and regulator_bulk_disable() for sensor power on/off sequence

Suggested by Hans:
        - Add multiple regulators you should use the bulk regulator API
        - Use use "reset" instead of "s_resetn" for parse gpio name.
        - Add diffent regulator power supplies  in single array


Arun T (2):
  platform/x86: int3472: Add TPS68470 board data for Intel nvl
  media: ov13b10: Support multiple regulators

 drivers/media/i2c/ov13b10.c                   |  47 ++++----
 .../x86/intel/int3472/tps68470_board_data.c   | 108 ++++++++++++++++++
 2 files changed, 134 insertions(+), 21 deletions(-)

-- 
2.43.0


