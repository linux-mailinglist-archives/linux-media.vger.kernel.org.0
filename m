Return-Path: <linux-media+bounces-55056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPmIGJfbr2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:51:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC767247A53
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A5533190F17
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952AF4301B0;
	Tue, 10 Mar 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4NtDup0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70A04301D7
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132348; cv=none; b=AlZEOuRWHv/pZ4e5Mg0+Vm7HRRur+kgTHHF5hHIF0yyWuiTP3Z3pjkE/6Pkb4kr1dgLfYbcDq+yWDL5inb74me6zv6wfkS2fkPQEo1saqMFExHiSQhmZ5+ryjRgbWX+NscK4960lg1Zgdcu7n/O1+GI5cX6E3p2xGw1dcAexXRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132348; c=relaxed/simple;
	bh=MPN0+UpugGONOEVEH27MRgS+PTV7+Op9eJAe+5SaBcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PM23jaGcluTgKQKTvTRJM1xsWICWCeI3KGt4oAm5A0a9ZGB0ub4Fgw3J2jv/6BMIm6k0NPmS9KvXGZ/oG2VKhz+VEVH5k1OIDfg9GoDZQUVTjdnO7n5TB9rBA8Jhz4TPLMTauOHAayWoP+uMNjSEHzHoRv6r6wQultzbV0VPHDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4NtDup0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132346; x=1804668346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MPN0+UpugGONOEVEH27MRgS+PTV7+Op9eJAe+5SaBcY=;
  b=d4NtDup0kpeYkqs7SYMQ60N3dXaw9RxWLxatIiOWS5TUUh021urgzjFb
   fSFXjDC0MUGKVZM2u+k/z8K81ReGhDmL+OTYffAv1PmNY+OFnLmD+79F1
   ou8UZErsB/eFgXhB3z93m2O+MgoeyqBokS7gHrmSTGzXwDAuMUhtTGRBF
   JRcCpX9l1cUDyl+t5fvUpXRBGP6WhZmNWnxcNIxWVZEU3XvM15pc9+0GA
   7ULEQfqVhZVPshU1YEVcvbgSn5XAabAxO8COTI1dIzI/FJYp3OTVJOzMd
   Fck5sd/bqLE2PCriCqTPUOFJzdttTuubY7dHs3ltGePXlWwjAxpRyRzKX
   g==;
X-CSE-ConnectionGUID: z3X14dY1SpefMOfin13qlA==
X-CSE-MsgGUID: esflA7k6QSOClnUb7KocWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501744"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:45 -0700
X-CSE-ConnectionGUID: YwC6S46uQDaOckiNImiaSQ==
X-CSE-MsgGUID: MXGFTAQwQs60Jk+Sb6eikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727683"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:44 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6A7F3121D37;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xnW-1At8;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 02/11] Add compiler options to avoid warnings
Date: Tue, 10 Mar 2026 10:46:08 +0200
Message-ID: <20260310084615.1183141-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC767247A53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55056-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add -Wno-missing-field-initializers option to avoid warnings on modern
GCC.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ab363501a212..7545682dbcce 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 CROSS_COMPILE ?=
 
 CC	:= $(CROSS_COMPILE)gcc
-CFLAGS	?= -O2 -W -Wall -Iinclude
+CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers
 LDFLAGS	?=
 
 %.o : %.c
-- 
2.47.3


