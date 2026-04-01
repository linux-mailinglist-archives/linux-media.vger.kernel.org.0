Return-Path: <linux-media+bounces-57871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDTNA0gSzWmMZwYAu9opvQ
	(envelope-from <linux-media+bounces-57871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 14:40:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2E837A94D
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 14:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5C3B30CE79F
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 12:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFD640711B;
	Wed,  1 Apr 2026 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0ScKeqM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA2402444;
	Wed,  1 Apr 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775046416; cv=none; b=RFf1itzJb2tkdNGg8qdQJB+DLOgaz3FVMjzn3Dok8obqJlBtvaBzdV+vqBzakrOQvRHPIK9xbz2CW1JdjrIAyXFHbGX2WzjTV7GA3R66vwa5ixPa3H5MnUdFGsVWaj0eLcNUHG6kdqH+RU/LH18k3H9Z+nsuw4xymu9KhJ19X7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775046416; c=relaxed/simple;
	bh=PndrRQ6EQGP8y8tUcb3wAWLzWJ/6goN0Lzsf2+6H5Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYwCP/LvLuSC3ij5XJ9vDaYa25gI+gV1vfSUvefI+71rHs/NI2WTWbIUM62CSPrRgucDIwfjrn1mnchSStzCcN5k8hQRWY4eU+wQsfDKTSA/HPwaxotSVm+NtPFMEs7FYxEMer6X7KfDQLP0RKjiT3KEEC66jrpLFuQnq/9HNJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0ScKeqM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775046414; x=1806582414;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PndrRQ6EQGP8y8tUcb3wAWLzWJ/6goN0Lzsf2+6H5Gk=;
  b=e0ScKeqMmQIVtTddib92ix7KNog9sdVU97ZXMnISpCIp3wiUk9wWpvYb
   eviOPHuGCUpPWbuBzY+whZx4cxaSGhriBJomVQ7Lc1mNniSdAMv591OfU
   nD4Ko+YVfyq1KW+ZKIJ4Sf/NEBilPlwpO1AKeTfNuvlHxqCEN9UIfIjfG
   G9e+DNOKuq8YuxPN27w3Eoq6HxvDWfoDk2o+7RR1tlh2cXEyoxcT0jqoK
   xR0VPsd2sqkvwkTDLYEwdv7/ct5kKFnValZMX+Ix63EAQwgkEfRy/hvCX
   8CnEvQbOnaLEVrmDu9PxdFuVUZ8tvothGuKnyre2sxIkvwNslMc1Myk3U
   A==;
X-CSE-ConnectionGUID: S+yeWnCERJWx8/lIaCU0LQ==
X-CSE-MsgGUID: L3ATofFvRliIhwaNWLATVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79936875"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79936875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 05:26:53 -0700
X-CSE-ConnectionGUID: AmlXKHsrTnWVb6LH+LeUag==
X-CSE-MsgGUID: T3eMsyg5RZaPHUkixXhdpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="249698765"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa002.fm.intel.com with ESMTP; 01 Apr 2026 05:26:50 -0700
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
Subject: [PATCH v7 0/2] Add TPS68470 power supply support for ov13b10 sensor
Date: Wed,  1 Apr 2026 17:50:28 +0530
Message-ID: <20260401122030.3955499-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57871-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 2A2E837A94D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms.

The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC.
This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences.

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


Antti Laakso (1):
  platform: int3472: Add MSI prestige board data

Arun T (1):
  platform/x86: int3472: Add TPS68470 board data for Intel nvl

 .../x86/intel/int3472/tps68470_board_data.c   | 207 ++++++++++++++++++
 1 file changed, 207 insertions(+)

-- 
2.43.0


