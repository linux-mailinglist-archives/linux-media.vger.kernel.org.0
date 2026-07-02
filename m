Return-Path: <linux-media+bounces-66368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Me0cFoRoRmq+TQsAu9opvQ
	(envelope-from <linux-media+bounces-66368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:32:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15CD6F8629
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:32:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=On29tT7L;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66368-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66368-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD4E93056539
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B074A2E2B;
	Thu,  2 Jul 2026 13:27:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA124A2E05;
	Thu,  2 Jul 2026 13:27:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998853; cv=none; b=Qtn3Cih9mtLzBFyYfwA8tXLp3NfJ8OXX6s+JXJjSU0BaQBKJinJcrwC9Nu9M8shBA7oiqQTtAhcYQUKZ6+iCN7mX2r4U1QHZMYJCsCaWm+B6m+0UGhv+zAV/OmTj2Mdbi2TgXGWdzh8dSzv9p4g5YKUdtYrcKYAD/2p+uR8To2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998853; c=relaxed/simple;
	bh=bwJgzEjDtCiFYLEBeDIfh4X6nAtb+oau958LGiGYgO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQZZ1oQ0AQ9Zbg5pikdZYZKxm3gN5YtGni6WqJ6D/SbRzSz0IhmL5OCBbt9WQmFLoZMr/TTnGlPq++z0ClGmM8Bvba+uFNkZwTu/JfjW8plUKkrvGgay9AuJLl4WNg47zZNRzcYqapqPL2AmYe4qbLpBUEVye986EQOF3aNHSF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=On29tT7L; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782998852; x=1814534852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bwJgzEjDtCiFYLEBeDIfh4X6nAtb+oau958LGiGYgO4=;
  b=On29tT7LuRm5T/nfbbSBPYLHhrd13hA5uzERc4V4lWVeuCLEOrk0c6n3
   Ko6OPTT2Tkkm0YmPHWPkvDU0TXmEUD6SuLOTuQQqnKSYb8TkBZovOIJJ7
   taK8yC4kKxsgMFe5YNg9TL7QOYPRiKoFcfyaa/Dk5tPbMbBHZDD6IqYOx
   pXvYMuJx/g8CzZ6LMVWBgDQMixq4E0W9cIkKPiPHudBad3GmtFTCD2l2k
   CT5XCcCtd7nWUvDTGzmyHKj7v3yM4a04QTfpGNJInJJTKBYBze3SLN0Sg
   MPFmJtzUczZeilAOkUMupkWUg5sw15/a97Cix6osSMK6RCiGzsI0kOMmX
   A==;
X-CSE-ConnectionGUID: w1wE/KXJRx6T1/QZtvkmlA==
X-CSE-MsgGUID: l+w8s50hTfSgrdgfH9Iz8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82742422"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="82742422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:27:32 -0700
X-CSE-ConnectionGUID: xkjMt/JbQCS+3+40hKdVcg==
X-CSE-MsgGUID: NpzFrzhkQDCEezE79sSzpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="249512257"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.6])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2026 06:27:30 -0700
From: Arun T <arun.t@intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehdi Djait <mehdi.djait@intel.com>
Subject: [PATCH 4/4] media: i2c: cvs: Add NVL ACPI ID
Date: Thu,  2 Jul 2026 18:52:13 +0530
Message-ID: <20260702132213.1226645-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702132213.1226645-1-arun.t@intel.com>
References: <20260702132213.1226645-1-arun.t@intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66368-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.vadillo@intel.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mehdi.djait@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C15CD6F8629

Add INTC10FA to the CVS ACPI match table so the driver can bind to
CVS devices exposed on NVL platforms.

Signed-off-by: Arun T <arun.t@intel.com>
---
 drivers/media/i2c/cvs/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index 8270d93f1abe..7486815b16bd 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -965,6 +965,7 @@ static const struct acpi_device_id intel_cvs_acpi_match[] = {
 	{ "INTC10DE" }, /* LNL */
 	{ "INTC10E0" }, /* ARL */
 	{ "INTC10E1" }, /* PTL */
+	{ "INTC10FA" }, /* NVL */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_cvs_acpi_match);
-- 
2.43.0


