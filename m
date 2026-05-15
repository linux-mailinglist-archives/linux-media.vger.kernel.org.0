Return-Path: <linux-media+bounces-61765-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEaSEYBdB2qw0QIAu9opvQ
	(envelope-from <linux-media+bounces-61765-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:53:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E6555A7D
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B4B23003D1C
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56FA3F99F2;
	Fri, 15 May 2026 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="it0D0H5P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF843F8887;
	Fri, 15 May 2026 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778867577; cv=none; b=BcW/gTopQIM5uXn+gWeAiTTujeRVqrDqZ+l5ZphGB+s2qo+1WBDSKKI2Uqpw682R2hqSFLgbfh0w/Y5v2SaKZzJsv+JUMUkFPM/v7Z5eriRSceUrldEwaC9WCBrPJBxb96jSz2uzOs7T8Jot21pejOialVsiZDWniWYHT2wrzqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778867577; c=relaxed/simple;
	bh=5vcKLLQkP8LKqWmr/WcS40lrqBcddn7Z6/VvlypLjJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WKBLdV9vkNL8JbxdmfWc2L7LfRsCk5Xf6KtrxGjiV+kTckKzBtG0Tm4PNR9meJ9ZB5RnLbQNHgkX2dXBgal+dnCUA9M8ki96aXN5QS498+GeQTWK4hQ7gm5VJZVKn7iTjNrHXW7RB5Lt02J2B5K5NMAHdiU6tyuAbJUGZ1PX7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=it0D0H5P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778867575; x=1810403575;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5vcKLLQkP8LKqWmr/WcS40lrqBcddn7Z6/VvlypLjJs=;
  b=it0D0H5PJz/fNqfr+YjM1kSCdnrbKrC1Zq/8WVMsptLty1fIJa74YeBv
   T23herVbdCYMBuR41wkQtLaYXkPgIM5PsQPXQ9ejCBqYzzHytCBAf5Bvu
   VNkohL2uFp+iwBrhJ9FELf32855PI7AHSeGJ9JTgT+AiC9ekAtJZ2MMMi
   UhkVIY2x2R2do8vIrviovTQ1eAtz8rJoAQ8T/koRrHMxXLo6FLlhvh8Lt
   1/NeLYQiDmekHwRt0eHJD1vhGn9k+Yz25D0cyWizERt1iLyYSWvYkRGFe
   9jOu3iD5RyjLx8XSSnSUiL+O3jfK4fE8lOC5s8fCYgC9qYMNzNL/7IIxe
   Q==;
X-CSE-ConnectionGUID: ZTCIswKCSHuENHwqKODnxQ==
X-CSE-MsgGUID: oUPtuj2RQ7WM4fvLwgZ98Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90931310"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90931310"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 10:52:55 -0700
X-CSE-ConnectionGUID: brejMsBvRlWxVJVQjAVbmQ==
X-CSE-MsgGUID: LiSWkhlIS6+j7zwfsTH4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237760886"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2026 10:52:52 -0700
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
Subject: [PATCH v11 0/3] Add TPS68470 power supply support for ov13b10 sensor
Date: Fri, 15 May 2026 23:15:09 +0530
Message-ID: <20260515174514.3752028-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2E7E6555A7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61765-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action


This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms.

The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC.
This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences.

Changes in V11:
	- Resending full series (patches 1 and 2 were not delivered previously)
	- Split the introduction of generic int3472_tps68470_daisy_chain_gpio_props[]
  	  and removal of msi_prestige_ai_evo_gpio_props[] into a separate patch

Suggested by Sakari:
	- check checkpatch for commit message content
	- remove msi_prestige_ai_evo_gpio_props and keep
	  int3472_tps68470_daisy_chain_gpio_prop for all sw group node.

Changes in V10:
        - Checked checkPatches for new patches
        - Configured GPIO1 and GPIO2 for tps68470 daisy chain operation

Suggested by Sakari:
        - Check checkpatch for tab/new line issues
        - Configure GPIO 1 and GPIO 2 for daisy chain operation

Changes in V9:
        - Removed explicity added reviewer names
        - corrected space issues

Suggested by Sakari:
        - Remove explicity reviewer name
        - Resolve extra line

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


Arun T (3):
  platform/x86: int3472: Rename daisy-chain GPIO props to generic
  platform/x86: int3472: Add TPS68470 board data for intel nvl
  media: ov13b10: Support multiple regulators

 drivers/media/i2c/ov13b10.c                   |  47 ++++----
 .../x86/intel/int3472/tps68470_board_data.c   | 113 +++++++++++++++++-
 2 files changed, 135 insertions(+), 25 deletions(-)

-- 
2.43.0


