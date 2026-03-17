Return-Path: <linux-media+bounces-56022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGF8IxcmuWm1sQEAu9opvQ
	(envelope-from <linux-media+bounces-56022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:59:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFCA2A7663
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C79D930541EC
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D872BE05A;
	Tue, 17 Mar 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiUH+QtX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07923A168C
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741366; cv=none; b=NGl+LoAJ63akVrR7wyswW2LGw0iqurklmY+nZXLcrwXFLNtLKusLvxuMVNvgP9QUGfbxor1ZYiHKjoY1nSC0BqPU9rm9rgd3kMLETELCJblVNjr8YAMK1lyeAq9qnvfG16x6hRI97fZNf6Rr55gCO+7btY0YzYvl6olbScxcsD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741366; c=relaxed/simple;
	bh=hsqtJ2YMezwjWgr0C68CJCkfmWKQ1n/tADFeHeq+4KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtaQeCHPoPTi9LpoYFJwKFdW7/7122Jfa0jgz9CNJ2b8GO4XrzOagnkfJSDtg/pb135hMxvEXCNF+JsijszYQ1f1SjqwkRBijrUE9wCXxajnlsZiam0MkJ3ZQS1mtq73R9pZHFvg3J+HBlJYNnTl5CozwQbNLiEMgyXaAJ+9vok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiUH+QtX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773741365; x=1805277365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hsqtJ2YMezwjWgr0C68CJCkfmWKQ1n/tADFeHeq+4KI=;
  b=NiUH+QtXYb0UqzAMEnOkcYXT/52wrQLNOL8CAQ3smpFbhTxqK9EPHQF+
   LthzV8sZdTEZpfIAF22sYaHUR/xwA0iow2SjQQUuDYoCGEnkaCXx/R5qC
   T3wMu1sLtghzD5yckWINARJqAc6nxoqWhZzWLLmKQGR0LEl6C00jdr9ak
   DfMZLY6yqgCZheGWUMYm880Jci1gkB71IkpoQ8Qcnr9emQu/KYzVmWDVP
   oh69fAuHiT5nT/Bvr0ojTi3kP3i0KoNG42MxJg2z4iuz5qMMt0uqUrp4L
   juy3Coe7fmF5LVq0u67uCfLAlAfFK4j4jUNTwDEVQt3gljHDeOsIMLW6e
   A==;
X-CSE-ConnectionGUID: lcG7XMk2QveUenZGy40T3w==
X-CSE-MsgGUID: 5cH1nZUpRm+Cm9fhCAerPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62335665"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62335665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:03 -0700
X-CSE-ConnectionGUID: 7kFJj2B9RdSKgHmD+GwXyQ==
X-CSE-MsgGUID: mLeDnPEpQQOija46v7F9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226344874"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6442A121D4E;
	Tue, 17 Mar 2026 11:56:00 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2RBa-00000000tof-13Cv;
	Tue, 17 Mar 2026 11:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/7] Reorder headers alphabetically
Date: Tue, 17 Mar 2026 11:57:56 +0200
Message-ID: <20260317095802.214532-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56022-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFFCA2A7663
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 24a88feddf00..121f0e0272e4 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -26,8 +26,8 @@
 #include <ctype.h>
 #include <getopt.h>
 #include <limits.h>
-#include <stdio.h>
 #include <stdint.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <string.h>
-- 
2.47.3


