Return-Path: <linux-media+bounces-56078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ98KE1UuWkNBAIAu9opvQ
	(envelope-from <linux-media+bounces-56078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:17:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B6B2AAAF7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 950153060CF7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCFD1DF723;
	Tue, 17 Mar 2026 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlfHKyiV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB63F3CB2D6
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753379; cv=none; b=mMgOCTC0yWFJ06US0bOVg6mVYMeWZ6Px5JSUT8temG7gXz+3/3SUmxUzmvaMZndAnylScpPh0zXVgcqWjz9rgEyT1LQBnemBiZF4HiQQka9lQn/oSr7NZC9hyePwZOkSEIhfWVwvmhR4a6sq9xMAMQ3gy+57EaH5MpoNoQYf9wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753379; c=relaxed/simple;
	bh=dubpLgnBvsBp2+LIPbFIW1d2uoCDDfoHRhzX3nWyMJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzMkqKT5YrITdOEDusgTtV5+/HCrTdllhB+OwLtbb/JiP53d/gTNnS+x48p6YNOXJRztX+bW+67Bsan+TPcyEVl+ldhQ0330oFiH8kSoLprHPeXNswuSU/K3BSTTjb3OoRi+2IEDFpBRrhYNrQ/NlmaQAMHVEMsjgMbI03x/dZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlfHKyiV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753378; x=1805289378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dubpLgnBvsBp2+LIPbFIW1d2uoCDDfoHRhzX3nWyMJM=;
  b=FlfHKyiVrEx//XVmw2g2pUM71d3XVhTokMUW5aFn1yUmQh2xV3oiYXkR
   FFjiZraoPXayDg7IvSKTwb5tRx4MbOELZpYbswa/7eUnZ5/8DIPv+sB3p
   bd00NQ2di5lRjQSrJn+insusC1GQwzGdz78Snjw1DhgotNl9ql0/y3tfc
   7Tr0MwzPxB32H85hS37lY7O1ZjcVQ24odMye+iFC6gtjGIw9GjEAceEgf
   QZ11/NzFUSAtFwM8NHjMQbYTGpZA0c5BOQWHc91QrHggLDHyIXCQyYsdO
   3ZQXy5s/6NH5TqGeRb21UD6PM2DT6+QoV+aiYrjYCYtcR5y1nAMMoohAk
   g==;
X-CSE-ConnectionGUID: 50zfq1RuSMW56vdDpODDuw==
X-CSE-MsgGUID: 5ekJxvQTQYuskdK+548JfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411100"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411100"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:15 -0700
X-CSE-ConnectionGUID: d3vl5NtBQ2Omgr4vSv34Hg==
X-CSE-MsgGUID: vQOYQG6DT+S1uhVuMI2zvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226733224"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E376C121D57;
	Tue, 17 Mar 2026 15:16:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2UJJ-00000000u01-3UTw;
	Tue, 17 Mar 2026 15:18:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 3/6] Add quotes for "-f help" in help text and do a line wrap
Date: Tue, 17 Mar 2026 15:18:10 +0200
Message-ID: <20260317131813.215230-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317131813.215230-1-sakari.ailus@linux.intel.com>
References: <20260317131813.215230-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56078-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21B6B2AAAF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 raw2rgbpnm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 96466a5a1d44..1f00787e80d7 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -931,11 +931,12 @@ int main(int argc, char *argv[])
 			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
 			       "                          (float, default 1.0)\n"
 			       "--format, -f <format>     Specify input file format format\n"
-			       "                          (-f help for list, default UYVY)\n"
+			       "                          (\"-f help\" for list, default UYVY)\n"
 			       "--help, -h                Show this help\n"
 			       "--high-bits, -g           Use high bits for Bayer RAW 10 data\n"
 			       "--size, -s <XxY>          Specify image size\n"
-			       "--swap-rb, -w             Swap R and B channels\n", progname, argv[0]);
+			       "--swap-rb, -w             Swap R and B channels\n",
+			       progname, argv[0]);
 			exit(0);
 		case 's':
 			if (parse_format(optarg, &width, &height) < 0) {
-- 
2.47.3


