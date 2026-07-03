Return-Path: <linux-media+bounces-66466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xp2FDuHVR2pKgAAAu9opvQ
	(envelope-from <linux-media+bounces-66466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:31:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97C703E6C
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=neQO9GiW;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66466-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66466-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED1263037F70
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A174414DE5;
	Fri,  3 Jul 2026 15:25:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D921FF25
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092312; cv=none; b=CqMm+XON1PoXWmPkpx7sH29FLdbbOs+Y1N+xNMhAe6LXcIgcGpv7RUWUS1lkbEArT8Rfpf7RGlieTh3/5Am/63AWDuMRtCDEVPjbvA4yASnyLMCVIVs0KC/fBnrvr+Y/bnFI1XUiFUEC8RSbli0nTG5hJsJU1S6XVnB8AWHyDuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092312; c=relaxed/simple;
	bh=/4Hf3agluTaeER6IIrjWsWiYlRdifR7KrPnww6CADRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=glp0VkzNgtF4hGXiLzYystxbSSofNANJrbJM1r15LHnYQ8iwBRlVjorUnkGqItVxXQ3TdkaVWWm/i7C1/GZ/K0Fn1C1CCEJF+LEyL/xHCERRaCU1EUIC+1FtZVlcOMM8tJSf+koTzoIYKIm/QPJ59tTEm6lqCj1V7Zd8gIn7fts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neQO9GiW; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092311; x=1814628311;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/4Hf3agluTaeER6IIrjWsWiYlRdifR7KrPnww6CADRo=;
  b=neQO9GiWnAIPiqJKYwcgNdB7yj+DjR1bvrBPmbZAg2LOCLZHch2wkiiY
   KAmWPwsE5ViaH2WkCKNlitcEK69xxfkJYrbP3H3iFe4FiWCo5b4HShGwC
   zV4+7yHR3QjkdIRf215EzvOkujqpfD/b0ky0ey0v/mithGnYq3zyHZOU9
   zEsgWk7hV8O07TVFRZv952LQ2grpcazlX2JGGUj8bW39oJGW7s9r7tSMd
   uCtplASh8LTcCcLPLRex1zDtD6XvB8gY0ccM+LMH5s0joTQ8+J6xX/6eA
   v77UvWTqAe7sCa9pEb2t+jkZdEeu0sWgUwEa1NoeyU//Mck3rNUSgpGGD
   g==;
X-CSE-ConnectionGUID: mtS0Bpa4RduWaTR0z6wPNA==
X-CSE-MsgGUID: bjLn8r0XR7ShPR/mDUghCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396095"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:10 -0700
X-CSE-ConnectionGUID: 6eOkYAEIRqaJdsh+hvz/fw==
X-CSE-MsgGUID: 3uI4E6UESua+iDmkmwUqvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799457"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:09 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 00/41] media: ipu6: Add support for ipu7 hardware
Date: Fri,  3 Jul 2026 18:24:10 +0300
Message-ID: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66466-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F97C703E6C

Hello,

The 7th Gen Intel Imaging Processing Unit is a PCI device including
input system and processing system. This set adds support for ISYS
in IPU7.

At this point only IPU7 is supported, not 7.5.

Device matching related code will still be subject to rework for
a later version of this set.

Antti Laakso (41):
  media: ipu6: Replace internal hw flag
  media: ipu6: Rename pointer to firmware context
  media: ipu6: Rename buttress_ipc pointer
  media: ipu6: Remove duplicate warnings in cpd validation
  media: ipu6: Remove unused ipu6 firmware struct
  media: ipu6: Cleanup ipu6_mmu_init()
  media: ipu6: Simplify firmware com arguments
  media: ipu6: Add IPU7 pci IDs
  media: ipu6: Add ipu7 match tables
  media: ipu6: Prepare buttress for ipu7 support
  media: ipu6: Use single struct for registers
  media: ipu6: Rename IPU subsys ID
  media: ipu6: Add ipu7 buttress support
  media: ipu6: Prepare mmu code for hw variation
  media: ipu6: Add ipu7 mmu support
  media: ipu6: Add ipu7 cpd handling
  media: ipu6: Rename isys fw msg union
  media: ipu6: Move isys isr handlers down to fw file
  media: ipu6: Move hw specific buffer handling down
  media: ipu6: Isolate hw specific buffer handling
  media: ipu6: Add isys firmware ops
  media: ipu6: Add ipu7 fw com methods
  media: ipu6: Add ipu7 fw isys ops
  media: ipu6: Add ipu7 csi2 register definitions
  media: ipu6: Add ipu7 isr handler
  media: ipu6: Add ipu7 csi phy driver
  media: ipu6: Parse bus type for ipu7
  media: ipu6: Enable ipu7 isys interrupts
  media: ipu6: Skip watermark configuration for ipu7
  media: ipu6: The SPC init is valid only for ipu6
  media: ipu6: The VC arbitration mechanism is ipu6 only
  media: ipu6: Move buttress mem alloc out from probe
  media: ipu6: Read correct SKU ID for ipu7
  media: ipu6: Add support for fixed iova region
  media: ipu6: Make fw mapping function more generic
  media: ipu6: Move isys fw mapping to pci_probe
  media: ipu6: Add check for pkg_dir before freeing
  media: ipu6: Map ipu7 firmware
  media: ipu6: Set model name for ipu7
  media: ipu6: Set ipu7 as supported for ipu6 driver
  media: ipu6: Add ipu7 as supported device

 drivers/media/pci/intel/ipu6/Makefile         |   10 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |    5 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  580 +++++---
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |   48 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  184 ++-
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |   43 +
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |   30 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |    2 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  584 +++++++-
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |   48 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |    5 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |   87 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |    6 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  168 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |    1 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  405 ++----
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   55 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    |  292 ++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  120 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |  158 ++-
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  103 ++
 drivers/media/pci/intel/ipu6/ipu6.c           |  396 +++---
 drivers/media/pci/intel/ipu6/ipu6.h           |  210 +--
 drivers/media/pci/intel/ipu6/ipu7-boot.c      |  408 ++++++
 drivers/media/pci/intel/ipu6/ipu7-boot.h      |   41 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.c    |   74 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h    |   53 +
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  788 +++++++++++
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h   |  296 ++++
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.c  | 1074 +++++++++++++++
 .../media/pci/intel/ipu6/ipu7-isys-csi-phy.h  |   16 +
 .../pci/intel/ipu6/ipu7-isys-csi2-regs.h      | 1188 +++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c    |  601 +++++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h    |  146 ++
 .../media/pci/intel/ipu6/ipu7-platform-regs.h |   32 +
 include/media/ipu6-pci-table.h                |    3 +
 36 files changed, 6977 insertions(+), 1283 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-platform-regs.h

-- 
2.54.0


