Return-Path: <linux-media+bounces-62740-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM2FHIQFFWroSAcAu9opvQ
	(envelope-from <linux-media+bounces-62740-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 04:29:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DC05CFEC7
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 04:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AAAAE300B1B1
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 02:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E27B30C174;
	Tue, 26 May 2026 02:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkvLwcQJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB44305692
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762557; cv=none; b=egO5zF22xRYqyYp4o0EM0fAUFjz7AB3ae7POJZUOgDpjrff7j3XkiUK3fT2wHUnA4yPA3Llv86jhyoT4yD6Z+rswEiTPb4Hqr2kKwisYR3AIlbdZDsglS4ekrdspYbQTGbUq6P4gKGGuNRDp9Kv+isCkosLTt2Duaq6HWkGddnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762557; c=relaxed/simple;
	bh=Y+dcXZL4sDmeH6/gm5Jck71THZDYdbyDB0TgIc6C7bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4Dn9yoN7gU5MIwOtsdFvxYiidsOP9vzxOglTLDZhvDra28GT/bpXlip8nwsDuBNeLTnHmFGJQB6irIkZv1i1+p2Uwpqu2IYVnS8uHwwtSFk94bdrwEKGZksl0H3H7Amf9SsdKg4F2WLJ9tOLmNuMLUwo5S/P7WgAdLWtyyViC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkvLwcQJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779762556; x=1811298556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y+dcXZL4sDmeH6/gm5Jck71THZDYdbyDB0TgIc6C7bc=;
  b=WkvLwcQJhsv4CenuMmbWG/0S5vki5TRPvxuxqrtquj+TTMrTciXMDoWL
   2P5LAj+o+XXlTKxvFS94qe7T8VcdRt9PMiRmxkU6NB3PnV1gL5DUCm3Iw
   fYB0VvPefscF6TEEo2BIkFRzFRzVFEVdPHNt/51RWeX97PErlqltvxA+0
   6SxDbiqdvIHGoqf4lf8nkDrV3EPIG0Q4whwZsaZneIBsrL54wdrRP8LUn
   SXawhvjzoDc4kAoWWiOmq4k+s/kdymbOFrbNuO9tQS/VtjMO6nPnSQTnA
   WL6NwqhGdzxZTAfEcCOBMa+V++aaTlg8AcJYrvb4Xj4rxpKneCGFdEr+V
   A==;
X-CSE-ConnectionGUID: 4EtSVQ2bRSCWA3RenPj9qw==
X-CSE-MsgGUID: 05XtNl5UQOaU758wKs8jOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91960346"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="91960346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 19:29:13 -0700
X-CSE-ConnectionGUID: 04nchiTNSpOMUwV8Lu83Nw==
X-CSE-MsgGUID: KBg6RrJ9RBOELbHKH8XSfQ==
X-ExtLoop1: 1
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by fmviesa003.fm.intel.com with ESMTP; 25 May 2026 19:29:12 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: wei.a.xu@intel.com,
	atul.raut@intel.com,
	sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	kieran.bingham@ideasonboard.com,
	miguel.vadillo@intel.com
Subject: [PATCH v4 3/3] ACPI: scan: Honor _DEP for Intel CVS devices
Date: Mon, 25 May 2026 19:25:08 -0700
Message-ID: <20260526022509.162908-4-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526022509.162908-1-miguel.vadillo@intel.com>
References: <20260526022509.162908-1-miguel.vadillo@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62740-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 44DC05CFEC7
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
 drivers/acpi/scan.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index e8cdbdb46fdb..c09232253046 100644
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


