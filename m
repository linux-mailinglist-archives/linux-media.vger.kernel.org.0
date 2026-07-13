Return-Path: <linux-media+bounces-67545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xXLSNDLsVWoZwAAAu9opvQ
	(envelope-from <linux-media+bounces-67545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:58:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E47521FD
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:58:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Cl2iWTPJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67545-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67545-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 535233040C65
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE5B3F44FA;
	Tue, 14 Jul 2026 07:58:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C643F23C9;
	Tue, 14 Jul 2026 07:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015900; cv=none; b=YZOgUa//U0cCouFEIRR2nOnG2YCrVuudYDgB5rckCLOWAd0JMxf2JXQF2UPb+ZmrUeiVyB8KNcTeuMw6spZhIQB0yx/D4caOhGDG6F6MoUa2fLfsgiC932yDzjAdsnVr808PkRjUlN/6pCWFGOkol8hVQsWUM0DbKtctE3HKCUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015900; c=relaxed/simple;
	bh=FcbdSecE3CbmaU6kiFheKcd8VvJ0qHTofjF3ByVL9lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XepuLpD5D7yU+UzU6HiP9/fH0q7rLuUJMRuOqVsF+VdyLWLI4fC+crGK0EVaU88FAZ9ksvdgxQeTnBXJBh5+7jwKo023KAu9jHowzeCxbFsk2rSNv3eFhQ13h5rohu3LCDxZad8Lh6pa7n8F/LU90nj2Yj0XVh8FLki3/J/bznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cl2iWTPJ; arc=none smtp.client-ip=198.175.65.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784015898; x=1815551898;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FcbdSecE3CbmaU6kiFheKcd8VvJ0qHTofjF3ByVL9lQ=;
  b=Cl2iWTPJKsnX2Nlx79Kq00+lZ2eqitB53q9zASn9muXMTqekeDYOoXdR
   IYSyZLm/b/arEEdzfzTMpXybkoNOMnAvk4s2vHDT65NIrBgg1QFuKdoaC
   nqaerEVL2fuO9ljf+uxczqxMZSMh3NVom2/K1OTd03Ek5dadTFBEuzCeq
   A+PxXiF5yebefDD2zz9sMeL2bemCkWK2CotHjBBb+m/oHrKe7Lx0NS9bV
   JAjJz7z5xWHZO9SufcbrKrcJLlX2gqmFBnTZ1f7iyfCzCTDTWrCVxiySh
   q0nr+7sUlM9vCl89etHcQA3/8jH0HhqOsdGq1DB2fWCjFTRF7HEm6zVzh
   w==;
X-CSE-ConnectionGUID: zmEsn0PaQeG11A0jsHKCWg==
X-CSE-MsgGUID: vFKR2HO1Tcu2c/jUQTMRFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84826962"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84826962"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 00:58:17 -0700
X-CSE-ConnectionGUID: kT2o0qwcQqueQxDbWvow0A==
X-CSE-MsgGUID: m7s5LQMYR+WaNZSc9dPfNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="260662347"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.245])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 00:58:16 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 738CE11F8D1;
	Tue, 14 Jul 2026 01:12:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wjJHc-000000000xa-02Be;
	Mon, 13 Jul 2026 19:13:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power management code
Date: Mon, 13 Jul 2026 19:13:27 +0300
Message-ID: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67545-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:apw@canonical.com,m:joe@perches.com,m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hans@jjverkuil.nl,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A0E47521FD

The V4L2 pipeline power management code, in particular
v4l2_pipeline_link_notify(), v4l2_pipeline_pm_get() and
v4l2_pipeline_pm_put() are deprecated and shall not be used in new code.

The drivers need to use the Runtime PM instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..a8a7374dc9c4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -879,6 +879,9 @@ our %deprecated_apis = (
 	"DEFINE_IDR"				=> "DEFINE_XARRAY",
 	"idr_init"				=> "xa_init",
 	"idr_init_base"				=> "xa_init_flags",
+	"v4l2_pipeline_link_notify"		=> "",
+	"v4l2_pipeline_pm_get"			=> "",
+	"v4l2_pipeline_pm_put"			=> "",
 );
 
 #Create a search pattern for all these strings to speed up a loop below
-- 
2.47.3


