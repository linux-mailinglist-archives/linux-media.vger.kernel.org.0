Return-Path: <linux-media+bounces-63318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBFQEbrhHWqefgkAu9opvQ
	(envelope-from <linux-media+bounces-63318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 21:47:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D4624C3C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 21:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22B57302D95D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 19:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2C737F73D;
	Mon,  1 Jun 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hafTxt39"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4B637204C;
	Mon,  1 Jun 2026 19:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343091; cv=none; b=Xf1TgohfJduDJlSg637Tifx8ZZiKl7AQ6O3kL8UnexJXHRMFZtGiOJjzgtMhUspVMm/vpjBmpQWU1HzX9smNQCFikynSRew+WzvhnpM6sWJslgDe3xh0ypRzk9ieeMAR8pyr8wOUJsK44eEfuY4wUXIoXHb8L2lgCrfaEYOK5Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343091; c=relaxed/simple;
	bh=VTlcwuaW4RDLr0BJhr9F06LVLxfFJWSD1KWH4T38YyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dES38GiqnJPPNogomYeR7hls93ErEeKhDPr7BBAz+0tOkfUGB+vopsaUtaJ1EJ9ETjsJXjJlU8cD+T4mMe7vElsFNKOWmpAj6KKVCRvivl48an348+f+OduRu6KSfgRxhRv4SLm/mKuTfzTkO2PwJ0jzQ46wnytDgRxFUbPOWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hafTxt39; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780343090; x=1811879090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VTlcwuaW4RDLr0BJhr9F06LVLxfFJWSD1KWH4T38YyU=;
  b=hafTxt3907aRlaPXPtjMkqO9xxPkEbsTt8ENhsUULxVY8XDElrgNoIkm
   mVVnl0ube2YomBQWZ9JDzJOvSURfOMWkzjDqWwnWPEYzOoXUUfRvYHDrb
   iPE6omm/Z3LcihKEOADmAaEeQbqJR7RrqwpY99r2TP4/TzcuAY68g4Tka
   lRaH+Kf6JcKyf7jpLHNjbMQ/1ZY2G2VwOzZBoUSPTQFBmt7Xi2JfL8sLi
   YFturOq69Ujbe9YTW/yYWcws8U2gcqLziUYlMEbduw2fjXEiRvKKA2hm7
   50o35x6fa9Yu5zBuNlkJKDLVG0Cnc3LIwUe49MBPxSwgVKOtNMZTDIHu5
   g==;
X-CSE-ConnectionGUID: pareK+fUT3C+CAu0dwAq7w==
X-CSE-MsgGUID: /AkxUtJFSxiQMZhODNo4WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="83689310"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="83689310"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:44:49 -0700
X-CSE-ConnectionGUID: 3UDHrJozQZWnILd3RZ4GgQ==
X-CSE-MsgGUID: vmnRNMtKQOCC4bIgfn4TFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="239504840"
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jun 2026 12:44:49 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-acpi@vger.kernel.org
Cc: rafael@kernel.org,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com,
	wei.a.xu@intel.com,
	atul.raut@intel.com,
	miguel.vadillo@intel.com
Subject: [PATCH] ACPI: scan: Honor _DEP for Intel CVS devices
Date: Mon,  1 Jun 2026 12:40:40 -0700
Message-ID: <20260601194040.18223-1-miguel.vadillo@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63318-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 869D4624C3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CVS (Computer Vision Sensing) is an ACPI-enumerated device that sits
inline in the CSI-2 path between the camera sensor and Intel IPU.
On platforms where CVS is present, the camera sensor's ACPI node
declares a _DEP dependency on the CVS device.

The CVS driver must be fully initialized before camera sensor drivers
probe, because CVS controls the CSI-2 link ownership handshake (via
GPIO REQ/RESP), the MIPI/CSI-2 lane configuration, and the camera
power domain. Without CVS ready, the sensor driver can bind but the
CSI-2 stream will not function correctly.

The CVS driver calls acpi_dev_clear_dependencies() at the end of its
probe() to unblock waiting consumers once it is ready.

Move the CVS HIDs from acpi_ignore_dep_ids[] to acpi_honor_dep_ids[]
so that camera sensor enumeration is deferred until the CVS driver has
finished probing, matching the behavior already in place for IVSC.

Signed-off-by: Miguel Vadillo <miguel.vadillo@intel.com>
---
Note: this patch has a functional dependency on the CVS driver and its
IPU bridge support, which are queued in media-next for v7.2. Without
those drivers, no code will call acpi_dev_clear_dependencies() for the
CVS HIDs and camera sensors will remain deferred indefinitely.

The CVS driver series (v5) can be found at:
  https://lore.kernel.org/linux-media/20260527170531.383871-1-miguel.vadillo@intel.com/

 drivers/acpi/scan.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 530547cda8b2..1463eb3a4f6e 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -848,8 +848,6 @@ static bool acpi_info_matches_ids(struct acpi_device_info *info,
 static const char * const acpi_ignore_dep_ids[] = {
 	"PNP0D80", /* Windows-compatible System Power Management Controller */
 	"INT33BD", /* Intel Baytrail Mailbox Device */
-	"INTC10DE", /* Intel CVS LNL */
-	"INTC10E0", /* Intel CVS ARL */
 	"LATT2021", /* Lattice FW Update Client Driver */
 	NULL
 };
@@ -861,6 +859,9 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC100A", /* IVSC (RPL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
+	"INTC10DE", /* CVS (LNL) driver must be loaded to allow camera streaming */
+	"INTC10E0", /* CVS (ARL) driver must be loaded to allow camera streaming */
+	"INTC10E1", /* CVS (PTL) driver must be loaded to allow camera streaming */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
 	"RSCV0005", /* RISC-V SBI MPXY MBOX */
-- 
2.43.0


