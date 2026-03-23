Return-Path: <linux-media+bounces-56695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DYSBg8cwWn5QQQAu9opvQ
	(envelope-from <linux-media+bounces-56695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:55:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 561522F0986
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BCA9302EE8F
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA3A3914FC;
	Mon, 23 Mar 2026 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BugrQJLP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8244361672
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262909; cv=none; b=WVr0A8FL4qQG9nkdrWdhR9uvfRH/1LHnzOLWRyKAPjTYpTymoGRg2wdwr7Lr5mjsySxnSyvImLqapyeFMsBB4RBXcxkHx/WRXtyBBzaFzJle7ppRU+V+ouTc+GZNHGm9c2Z94LDKuPMetZey7pSQ6AgqeW0cL1KIoUFa4KFOcmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262909; c=relaxed/simple;
	bh=enMd2pFV0p9u9I1BigMRTdQchIsfoXprD/4gBoB4A2Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=A3d5gNsBWLSDsLFniltGHXuwZk44rMTwCrJxNm2PA81OJsku3eK8ZmfdpAbMwHqTn79Oge6MVOosimhlfnEzfpyMEe80o+gM75a8mykx8IaRFKsWHjJWvrJEf2K8k1+OsJdacGestizOQpGDYdrEOtrvIyc7f9RGUq7wIRREVdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BugrQJLP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774262908; x=1805798908;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=enMd2pFV0p9u9I1BigMRTdQchIsfoXprD/4gBoB4A2Q=;
  b=BugrQJLPJuUUy5UXPgdHR9ZwedbClLIxu9bWSFHfnvuq8XWoeFfvDRr+
   wK7DXNxeXREJnxgKzlVJM0EtF58RDFZJTGS3g4cbhxk1mm2aT+i2OIHtU
   4+XSbn4miL9l2WzEVSlzR1QmB0L5vkm8rWPpMy81Z5yW8s3rN62c/kabp
   6ksM68qYFHrIdas6yOfVyAI3QCBeEs7Vw+2cFFciu7rkbMrigSBp32VRc
   Y4X6DjMxdqeB5uVGESzZ7re0sglYMBAsZxrvUKe5wESfbLajnAeYx3nO1
   zzCkZBmEAd4vrcaUtf8CYbq9qNshaH7HkZ0gbOCvBk3n1QXQ2z2++wAoI
   Q==;
X-CSE-ConnectionGUID: ezOlexQPSOGHUU6RZFcEow==
X-CSE-MsgGUID: 92gmE4zAQNqLbFWSERW0cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79116066"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="79116066"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:48:28 -0700
X-CSE-ConnectionGUID: 3VrICam1Q42JGmklZIgayA==
X-CSE-MsgGUID: 8kiKvhgfTuy68Ie0FJXsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223183303"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:48:26 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4BC34120832
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:48:29 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w4cpg-000000037SM-2oLV
	for linux-media@vger.kernel.org;
	Mon, 23 Mar 2026 12:48:28 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] staging: media: ipu7: Update TODO
Date: Mon, 23 Mar 2026 12:48:28 +0200
Message-ID: <20260323104828.743638-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_FROM(0.00)[bounces-56695-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 561522F0986
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove cleanup of the register definitions from the TODO file.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu7/TODO | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/ipu7/TODO b/drivers/staging/media/ipu7/TODO
index 7fbc37059adf..dc27bb6463da 100644
--- a/drivers/staging/media/ipu7/TODO
+++ b/drivers/staging/media/ipu7/TODO
@@ -19,10 +19,8 @@ staging directory.
   IPU7 driver is expected to work with the common IPU module in future.
 
 - Register definition cleanup
-  Cleanup the register definitions - remove some unnecessary definitions
-  remove 'U' suffix for hexadecimal and decimal values and add IPU7 prefix
-  for IPU7 specific registers.
-  Some ISYS IO sub-blocks register definitions are offset values from
-  specific sub-block base, but it is not clear and well suited for driver
-  to use, need to update the register definitions to make it more clear
-  and readable.
+  Add IPU7 prefix for IPU7 specific registers and related macros. Some
+  ISYS IO sub-blocks register definitions are offset values from specific
+  sub-block base, but it is not clear and well suited for driver to use,
+  need to update the register definitions to make it more clear and
+  readable.
-- 
2.47.3


