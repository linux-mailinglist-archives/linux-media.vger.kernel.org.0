Return-Path: <linux-media+bounces-54816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BqGBnwCq2nPZQEAu9opvQ
	(envelope-from <linux-media+bounces-54816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:36:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E89225327
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21E75300B9D4
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 16:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DA73A4F3E;
	Fri,  6 Mar 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDXSRnn2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E195AD2C;
	Fri,  6 Mar 2026 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814958; cv=none; b=Wm9mcpmWkZIXDAFXQ4A16GbpoeLpqj6G0R460oi6l5iMd0gm5sDyMlLyopvF9+EZBuHXEbQn2oxxIJzv7cFuJ4T0PSu5IMvl/OArORKCIse9Ed58eAQh5SqGEHlHtpDMWj7J6NJ0ewzBpvaX7o2VAMrXzGyH02UzRALq/2tchwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814958; c=relaxed/simple;
	bh=V21srALT+hTXVqWvmCdn2I3ACewpkLe/mqQ8ZUkY9kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqNNsZE7g3MYFryTbApHjmj42wyth7LEVhempZS2EHbqMtTuoz6p77KXD9NnJnkpcNh9vnXcVFB/T04KKoPVd615maAyjcAQoT2g6m+yLwbHntlXjeuLzqhKECYiKJihRMrLDB4KjxdPQnaXdzWZpq5f/GwiG77S/y7ecAKtpc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDXSRnn2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772814957; x=1804350957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V21srALT+hTXVqWvmCdn2I3ACewpkLe/mqQ8ZUkY9kM=;
  b=KDXSRnn2PqGjVuP1EjN6xA7dPxgxkd/TMhc/2Zz27MPwBdJeMP+6UvrG
   bSGzYPeaPCZzJBqkoPT27KIVqK8TVKZbKe5zHjRbJ9Hdp/NreEDy846TC
   Gsp875ep5ZSSMGZHDHglYSqbeMc7EVfaXpQEr02wzqx3E+4N/7Qmrj42g
   WvyACqeqwV383KFNBFKOmuYTtyiTG7FvdTvZxjqNUFJvar1FSz5p+c93r
   1hgq8gJTzXaZrI6o61J1BSiGBAzN7pziccYaLZHSeyBjY+rKPJ6/1r0li
   8IaVki02HJEnrdSdr7RVnFc8I2IlXQuYrtb+gCTlHwmsIoGd8MCWzipcy
   A==;
X-CSE-ConnectionGUID: M6mvdvqZTmqKD6BKfa2nfg==
X-CSE-MsgGUID: doZIe1AGSdeDULMLhisnrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77773856"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77773856"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:35:56 -0800
X-CSE-ConnectionGUID: LpAVxWNYQAWlLFW/w1pFlg==
X-CSE-MsgGUID: eb08P6P3SY+S0+YEZxi6uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219180548"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2026 08:35:54 -0800
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
Subject: [PATCH v4 0/2] Add TPS68470 power supply support for ov13b10 sensor
Date: Fri,  6 Mar 2026 22:00:17 +0530
Message-ID: <20260306163019.1619490-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 20E89225327
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-54816-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.990];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action


This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms.

The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC.
This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences.

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

 drivers/media/i2c/ov13b10.c                   |  47 +++---
 .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
 2 files changed, 176 insertions(+), 21 deletions(-)

-- 
2.43.0


