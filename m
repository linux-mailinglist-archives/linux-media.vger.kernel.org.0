Return-Path: <linux-media+bounces-55060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPCIHqnbr2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:51:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EC0247A70
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16FC4319CA22
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243E843636B;
	Tue, 10 Mar 2026 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IltlG/Pg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7BE436354
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132355; cv=none; b=sgZqWbntzk8X1FbuahJMhlCll5bnObhYaCZT4whIi0EzRn9aclHqN5vmy5snJe4MNJtBFtyi9ZKqNROMX5S/QzAG4sK/3kBVzMoQwfbm4zJfsxVmlheh854C0NI0jYNsZKr1D4quMuoVAgSZ+I3b3DpehTlLgJaUkqZixZvuJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132355; c=relaxed/simple;
	bh=7kVsTu9syU5/JfFqSmDjF/cR3MkepYCm/jjdyOf2S6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjvkE79Fq4Q/0Yk5K7SILqc6RYz3oyBSWAiaM0mJ3Us6RNYsjOwrks3kFzVx7893hcY6O8bhPxBEHYw0llRAzR/+z/TjHpDfphn0TvLldVrpeAMaAPBvx3YMwNEcCFwTZJLTowwVWdpAOeZ2cl/CMmb0ukogFiEg9HMxfHiLa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IltlG/Pg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132354; x=1804668354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kVsTu9syU5/JfFqSmDjF/cR3MkepYCm/jjdyOf2S6s=;
  b=IltlG/PgROsVjRvYJVa6yRrNvUn0mQB7eu0o6erIIjfv2ZUIl9vAYARL
   Y6qwAWlyWJo23FrQVX0+DX31lO9bRhm9TTqw2ci/LobW/E87BgGMEJEtV
   NG7NEgdBOXe6+vFonxs4cUQ75R8+ZIgLBQKL/c06dW03+WwMgH0ZdxgkL
   8X+xwTIdq3jKOri6ob4kbQB4wpAP3Ry9J3upUassnbhdjc26U4FquSOsF
   Lay/o7l0kmQQiHZBOGj3aUXl9x7aNATYbcsLEd/kDDjRFABVDClNV+htO
   /jApEhfC8XvlY22e0g2lEZrXlVS66U9Ze3Tyt3RIFA9L6SHubgAL9bmWI
   g==;
X-CSE-ConnectionGUID: oeIqccD3Qry99fMuuMGQYA==
X-CSE-MsgGUID: PAxhohykSHmct3AFiEbs7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501763"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501763"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:54 -0700
X-CSE-ConnectionGUID: r6dBJK1NSyiBDr2hyeziYA==
X-CSE-MsgGUID: ek2lGBX8TwygUhoBpTCsBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727701"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 72583121E24;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xni-1M5v;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 05/11] Add "help" for listing formats and de-Bayering algos, document it
Date: Tue, 10 Mar 2026 10:46:11 +0200
Message-ID: <20260310084615.1183141-6-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: 16EC0247A70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55060-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

'?' is a problematic character for shells.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 16ef64e984b9..b0151789b0c1 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -865,7 +865,7 @@ int main(int argc, char *argv[])
 		if (c==-1) break;
 		switch (c) {
 		case 'a':
-			if (optarg[0]=='?') {
+			if (optarg[0]=='?' || !strcmp(optarg, "help")) {
 				printf("Available bayer-to-rgb conversion algorithms:\n");
 				qc_print_algorithms();
 				exit(0);
@@ -876,7 +876,7 @@ int main(int argc, char *argv[])
 			brightness = (int)(atof(optarg) * 256.0 + 0.5);
 			break;
 		case 'f':
-			if (optarg[0]=='?' && optarg[1]==0) {
+			if ((optarg[0]=='?' && optarg[1]==0) || !strcmp(optarg, "help")) {
 				unsigned int i,j;
 				printf("Supported formats:\n");
 				for (i=0; i<SIZE(v4l2_pix_fmt_str); i++) {
@@ -904,11 +904,11 @@ int main(int argc, char *argv[])
 			       "Usage: %s [--algo|-a <algo>] [--brightness|-b <brightness>]\n"
 			       "       [--format|-f <format>] [--help|-h] [--high-bits|-g] [--size|-s XxY]\n"
 			       "       [--swap-rb|-w] <inputfile> <outputfile>\n\n"
-			       "--algo, -a <algo>         Select algorithm, use \"-a ?\" for a list\n"
+			       "--algo, -a <algo>         Select algorithm, use \"-a help\" for a list\n"
 			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
 			       "                          (float, default 1.0)\n"
 			       "--format, -f <format>     Specify input file format format\n"
-			       "                          (-f ? for list, default UYVY)\n"
+			       "                          (-f help for list, default UYVY)\n"
 			       "--help, -h                Show this help\n"
 			       "--high-bits, -g           Use high bits for Bayer RAW 10 data\n"
 			       "--size, -s <XxY>          Specify image size\n"
-- 
2.47.3


