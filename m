Return-Path: <linux-media+bounces-57247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB+lJxSMxmlELgUAu9opvQ
	(envelope-from <linux-media+bounces-57247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:54:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 097FF345A2E
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 589483133DF9
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E193EDAD7;
	Fri, 27 Mar 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K23YzmPE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B06A221FDE;
	Fri, 27 Mar 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619122; cv=none; b=Oq02BMvP1vqgpA9fDhecooM6ucGtiRIzNATpzZcH1SrtGc5oJ2iRK3HcMr732z5Lln0AqDAto2D405ChmjCzlgnxo7ViJ5QvWiJYENSHDr+LmwbOGAA9vqoNdJPjFV5at9hO3kgxpD9mwgV5XgLZKPtaeD0BwUkcK/N1L+uZX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619122; c=relaxed/simple;
	bh=mbd4hbH46DNOxyeEoRr6WazwjwjR91gBPMTDKaMHigQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dV73nQoW6vlHox1WiVBS7KHJlY2QkoQ+vSOt4cYP7TkjsFpU2Wjm8VXJu8cfgK2ShQyhzaKaFwSCcSAu26n6lgScU4GDLWnL709BAMjalqNVmN7DPpJJXN+5RCAYtfCasmpiJfyzcVCJf+Xo0i9xe9Pe7ypfzlsmhQdzdpIwtrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K23YzmPE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774619120; x=1806155120;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mbd4hbH46DNOxyeEoRr6WazwjwjR91gBPMTDKaMHigQ=;
  b=K23YzmPENQrOwksIzcvycvzTfnpqAzzewvbEbq8x2c/iPsAn6Wr9ONRz
   z/awA0PjU2yf/pkW0/XTFjZzHYarwhJ30kBC3KwMHIQ2IsFg8frcVsAgl
   BvwNMd7x/1C9PjQDpX8WP1LNcE4vxZdHHS3un5hcpkvMQpPrB7zCI+RB0
   +bAlemFZGkuhcdPJuZ2BOer5HNlJecNeaXf1vo4yUf3nsMrDO7O/hZZps
   tcYMU3ZOTnAD3yJgyPXEsZUfYV1eBF88/xxb4nueP9omxJ3bNfZDyNa9a
   bGkOmqAyKA0mjLlKTsELtTWqxrEgaF9xWDtAMiVnseFNYlA0y3JmvAAg2
   w==;
X-CSE-ConnectionGUID: i++YlqXCTryEFMF3Ko/dqg==
X-CSE-MsgGUID: bttUWNw/Qc+ZYZQa9jT8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74873790"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74873790"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 06:45:19 -0700
X-CSE-ConnectionGUID: mHpAgwODRhyLidz9LQroew==
X-CSE-MsgGUID: ripqjm2WTZW0VQh6ctV8GQ==
X-ExtLoop1: 1
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2026 06:45:16 -0700
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
Subject: [PATCH v5 0/2] Add TPS68470 power supply support for ov13b10 sensor
Date: Fri, 27 Mar 2026 19:09:03 +0530
Message-ID: <20260327133905.3509868-1-arun.t@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57247-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 097FF345A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms.

The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC.
This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences.

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
  media: i2c: ov13b10: support tps68470 regulator and gpio

 drivers/media/i2c/ov13b10.c                   |  47 ++++---
 .../x86/intel/int3472/tps68470_board_data.c   | 127 ++++++++++++++++++
 2 files changed, 153 insertions(+), 21 deletions(-)

-- 
2.43.0


