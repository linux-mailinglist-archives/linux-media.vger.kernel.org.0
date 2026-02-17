Return-Path: <linux-media+bounces-52993-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H21FjzhlGlqIgIAu9opvQ
	(envelope-from <linux-media+bounces-52993-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 22:44:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84BD150D59
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 22:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E60D73048108
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 21:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B672F744A;
	Tue, 17 Feb 2026 21:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCtH0Lf1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0904A2F0C7E
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771364658; cv=none; b=RysEwxVMNA7NHyVv3OEP/67SfiPqh6Hps1bTG0KQZgc/Wi6XhkhQRByEARAK6ozQJIfEEU6fzUo+3aRP5RUm8RvgdmgR+T4H2a6cl9i0e1a1vsR0w/N4npSsglzF3aRsj6CWZHiENLWVHjhAQujhzE4F17rVdZLgkNzLwxCxt/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771364658; c=relaxed/simple;
	bh=2xafdBM3GIAaYfd+r79cbjZVGg8tn5byPbDwOKJqoW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZApGJvWUGU3odyMSvyCQfg2LXIT02oDmH6EkprAi4NiJ5Ne9QiVjjOdGV4w8yV5wmfsj8uLWO0lPtJIMPupusPAZylf5iimEO9Rn+OtRYT5AaEtYTbnsndyIMKcaWphmP5WrgG5N6ouUjUDQYmOMHIlo7HvdlLH/0hPKeFjlis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCtH0Lf1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771364657; x=1802900657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2xafdBM3GIAaYfd+r79cbjZVGg8tn5byPbDwOKJqoW8=;
  b=kCtH0Lf1wWcRL12hE6hElVrP/uzFcozdFyv3pAFNu0dLWX8IX01eJ2eS
   MIgNVN0BP7rFELhaYpRJUwftMoBR1EUpBnI7/w2EyEAgLwNFfvjKCM2Wq
   iQN83/xB+SEEYwEZ2eHaPhketdn/QQK2pyIg9cGc7Xb++aq8IW4LhYr9U
   Od64zskEVYCnxe9Z7YjFFfFry7nez4mTV6T5swEVaQVy3MbO+uWlpaPYW
   8tMHotO4qhq/0oVwjb4CysKE6NEKY8dv0c75NCcXKtdgkrD52P/k4iLH0
   KnU1Gi3Cq/7kzxfRGlskW3ajOgU/95Su0xnN+3ODwmlKJb1AyCjxYNYEh
   g==;
X-CSE-ConnectionGUID: ic/lQ/goSiC/2XJqtKNe+w==
X-CSE-MsgGUID: 5jFAKRfkTOmdWhe4PFahfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76061968"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="76061968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 13:44:15 -0800
X-CSE-ConnectionGUID: 12QL9cu0TvqQiYAZXMbvnQ==
X-CSE-MsgGUID: o7491zlsRACFDvnv+OcP8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="212172505"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.189])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 13:44:13 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D342711FC4C;
	Tue, 17 Feb 2026 23:44:35 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vsSrz-0000000ACdv-2sx4;
	Tue, 17 Feb 2026 23:44:35 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH 1/2] Add compiler options to avoid warnings
Date: Tue, 17 Feb 2026 23:44:34 +0200
Message-ID: <20260217214435.2431864-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217214435.2431864-1-sakari.ailus@linux.intel.com>
References: <20260217214435.2431864-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-52993-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C84BD150D59
X-Rspamd-Action: no action

Add -Wno-missing-field-initializers and -Wno-implicit-fallthrough options
to avoid warnings on modern GCC.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ab363501a212..8a612710ee2e 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 CROSS_COMPILE ?=
 
 CC	:= $(CROSS_COMPILE)gcc
-CFLAGS	?= -O2 -W -Wall -Iinclude
+CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers -Wno-implicit-fallthrough
 LDFLAGS	?=
 
 %.o : %.c
-- 
2.47.3


