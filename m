Return-Path: <linux-media+bounces-66588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id paW6L89BSWrkzgAAu9opvQ
	(envelope-from <linux-media+bounces-66588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:24:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0D0708126
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:24:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=cByrfRWw;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66588-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66588-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4CB43008450
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 17:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554B5374A18;
	Sat,  4 Jul 2026 17:24:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6D25B099;
	Sat,  4 Jul 2026 17:24:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185859; cv=none; b=dkm4jzZw9wwEz9RqRoXiBzqyK+2jx084j4CkGyRTod8ygt7yV6pF2xtuLwjczlUDIBiJswo4z/JU+33utgu3QZ74Qo20PWQmVURBw9BR7UiQj/DisSVd9mUD9wYf1Lj+znP510nWGPfdBzlwd5EEvhsx64ZP5oilAhzoqYLQSEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185859; c=relaxed/simple;
	bh=YIUNVjVMRCV0zPA4GTAAkceNEBIJj6m9M3C6VQ1rCRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CR283gbionw4ZZI8WEwqPe33iDiScnVbfIflPubMz/cabBvc/90DTrlQMZKvhOM4ybtNCZHjZgOlg5OWntTprpBHdLvM5JMwXQyZ8S+zbGkk79C/j0Ag1fIq4UsYaobVNnzVycSFhGe897URF7PYWToq3RLmGK8ZLWrg9I6QD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cByrfRWw; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783185857; x=1814721857;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YIUNVjVMRCV0zPA4GTAAkceNEBIJj6m9M3C6VQ1rCRc=;
  b=cByrfRWwi+ARysDX2+HwHKzpb2ME4Msp3Kh+myCi43On9uokTL524V5R
   vqoJdKTiT1vygzmfCvHfrPQdkiw09fDpzUuWkfDrPjyWx3T1xbgrbf+pI
   pAB2Lk+PTdhFhLPOpAC4L31WEYFd2ChAv/gAjPnJx5I2OxrcUQ+7BMtus
   pIZiSDjDjusJFzny+aaMsu0fUAeWdmaiYfMKnswWwoijrqpeD3CK6jz7F
   ROrCB1u1mVVZawwpj/rgkuDLmb/mR8iEi02BFxsHjEFHPrcvdIlqMgkLv
   HwAf/vGFlffWN1YC8jH1HD2PFe71xs2b+vajhqvuQI/sVtfSvvx2gSKjq
   A==;
X-CSE-ConnectionGUID: FnGpTAxhTi2mO5tZ9n0esA==
X-CSE-MsgGUID: bwrUaIyCQMe7MoKwAyJTNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="101308159"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="101308159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 10:24:16 -0700
X-CSE-ConnectionGUID: L7JCFJxiS62b96EpF61mmg==
X-CSE-MsgGUID: 7RVCWWmGQ5GhAmRZgQrjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="250677810"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.6])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jul 2026 10:24:13 -0700
From: Arun T <arun.t@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miguel Vadillo <miguel.vadillo@intel.com>
Cc: Len Brown <lenb@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@intel.com>,
	linux-acpi@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add NVL CVS/IPU8 camera support
Date: Sat,  4 Jul 2026 22:48:51 +0530
Message-ID: <20260704171855.1462214-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,intel.com:server fail,sin.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66588-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:mchehab@kernel.org,m:miguel.vadillo@intel.com,m:lenb@kernel.org,m:sakari.ailus@linux.intel.com,m:mehdi.djait@intel.com,m:linux-acpi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF0D0708126

This series adds NVL CVS support to the ACPI dependency handling,
the IPU bridge, and the CVS driver. It also adds the IPU8 PCI device
ID needed for the CVS driver to bind on NVL camera hardware.

Changes in v2:
- Add a cover letter for the multi-patch series.
- Add Reviewed-by from Sakari Ailus to patch 1.

Arun T (4):
  ACPI: scan: Honor ACPI _DEP dependency for NVL CVS
  media: pci: ipu-bridge: Add NVL CVS ACPI ID
  media: i2c: cvs: Add IPU8 PCI device ID
  media: i2c: cvs: Add NVL ACPI ID

 drivers/acpi/scan.c                  | 1 +
 drivers/media/i2c/cvs/core.c         | 3 +++
 drivers/media/pci/intel/ipu-bridge.c | 1 +
 3 files changed, 5 insertions(+)

-- 
2.43.0


