Return-Path: <linux-media+bounces-55058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F3tLofar2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:47:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A2247903
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 137A33025F06
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C86430BB5;
	Tue, 10 Mar 2026 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XY86ziSp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298CB430B9B
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132349; cv=none; b=LOLq8wh/KIQvVzLBU0EJYUD6lLWCrWHDC21wbeUCPwz6NDFix/vNimlTjxpJR41RgjPYifKu0o3CB0drYJho8iY4r88quubNYVkrPcpfiQWmoMMdGYPpp5sqJ1+/dwHfc+mrwBnuVgbJj4NdKfXvP2ROqrZv7dNqpOG5AaRYeXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132349; c=relaxed/simple;
	bh=1UvaIwHsjCbC5537YizAt3IRmErMj20BCpvG5+OdwpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1JEvTWT1cgu+jLLlG+lb1rmD7Xpge/Satg5QdJIc/8v4Va4NHlQAyx4EICUST5fblzA2mZqs4Id72DbdZCXKOHGL+7t6I4RHdEOsqRcUNxg1CByZeQ94npVNUKl7qDqwX2slwaxlPixfgOcI9YddgRuRlcGC5h5IM/S/ix/byA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XY86ziSp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132348; x=1804668348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1UvaIwHsjCbC5537YizAt3IRmErMj20BCpvG5+OdwpU=;
  b=XY86ziSp9f86/w2aLHpN+ObmXd2NWMoVz9rDDNbxWyQHGFrhH7h6A8+c
   R9NuGVWO1CWhV88QjlitPBhzKXnlhDxWGy+TrtiL/I+w428n2bE5+nfSY
   QKNXO8A8QU5SjKeWkFVEtjsKdZasP2JJgn8twWCNQmMTVDXL4hov/QzCC
   LpzEhRAx2Iy+46H6vKES68kipU+r+A8jNYQYPRY7xMMKBW/ueYKqypO0q
   s2warm6N7NkFvXsl/3+AtPGaxMbGCK5t0wDOg6YIQhTtgpHAHTv80H0X9
   vMA5JIyxFupiHjaswZLpxSPKpLULCWe2Ej5kM9TbUTU7+xE1aPSPMPusZ
   g==;
X-CSE-ConnectionGUID: bfa8tF3cRjOuQaxZgUZCqA==
X-CSE-MsgGUID: afVWHUNSQY+RuRhrJsm+CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501746"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:45 -0700
X-CSE-ConnectionGUID: ptTn/5KUTWqv2M0L77T0Sg==
X-CSE-MsgGUID: 6MPBq0NiTF6n7LQG/sKdmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727684"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:44 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6FA0F121E13;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xne-1HqD;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 04/11] Support long options and improve help text
Date: Tue, 10 Mar 2026 10:46:10 +0200
Message-ID: <20260310084615.1183141-5-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: BE3A2247903
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55058-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 14cfa7e7a46c..16ef64e984b9 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -24,6 +24,7 @@
  */
 
 #include <ctype.h>
+#include <getopt.h>
 #include <stdio.h>
 #include <stdint.h>
 #include <stdlib.h>
@@ -836,6 +837,17 @@ static int parse_format(const char *p, int *w, int *h)
 	return 0;
 }
 
+static struct option options[] = {
+	{ "algo", required_argument, NULL, 'a', },
+	{ "brightness", required_argument, NULL, 'b', },
+	{ "format", required_argument, NULL, 'f', },
+	{ "help", no_argument, NULL, 'h', },
+	{ "high-bits", no_argument, NULL, 'g', },
+	{ "size", required_argument, NULL, 's', },
+	{ "swap-rb", no_argument, NULL, 'w', },
+	{ 0 },
+};
+
 int main(int argc, char *argv[])
 {
 	FILE *f;
@@ -849,7 +861,7 @@ int main(int argc, char *argv[])
 	int width = -1;
 
 	for (;;) {
-		int c = getopt(argc, argv, "a:b:f:ghs:w");
+		int c = getopt_long(argc, argv, "a:b:f:ghs:w", options, NULL);
 		if (c==-1) break;
 		switch (c) {
 		case 'a':
@@ -889,14 +901,18 @@ int main(int argc, char *argv[])
 			break;
 		case 'h':
 			printf("%s - Convert headerless raw image to RGB file (PNM)\n"
-			       "Usage: %s [-h] [-w] [-s XxY] <inputfile> <outputfile>\n"
-			       "-a <algo>     Select algorithm, use \"-a ?\" for a list\n"
-			       "-b <bright>   Set brightness (multiplier) to output image (float, default 1.0)\n"
-			       "-f <format>   Specify input file format format (-f ? for list, default UYVY)\n"
-			       "-g            Use high bits for Bayer RAW 10 data\n"
-			       "-h            Show this help\n"
-			       "-s <XxY>      Specify image size\n"
-			       "-w            Swap R and B channels\n", progname, argv[0]);
+			       "Usage: %s [--algo|-a <algo>] [--brightness|-b <brightness>]\n"
+			       "       [--format|-f <format>] [--help|-h] [--high-bits|-g] [--size|-s XxY]\n"
+			       "       [--swap-rb|-w] <inputfile> <outputfile>\n\n"
+			       "--algo, -a <algo>         Select algorithm, use \"-a ?\" for a list\n"
+			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
+			       "                          (float, default 1.0)\n"
+			       "--format, -f <format>     Specify input file format format\n"
+			       "                          (-f ? for list, default UYVY)\n"
+			       "--help, -h                Show this help\n"
+			       "--high-bits, -g           Use high bits for Bayer RAW 10 data\n"
+			       "--size, -s <XxY>          Specify image size\n"
+			       "--swap-rb, -w             Swap R and B channels\n", progname, argv[0]);
 			exit(0);
 		case 's':
 			if (parse_format(optarg, &width, &height) < 0) {
-- 
2.47.3


