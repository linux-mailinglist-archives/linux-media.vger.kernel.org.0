Return-Path: <linux-media+bounces-55064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH0mB6bar2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:47:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D62247927
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB054302D69B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E2743637D;
	Tue, 10 Mar 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYwljayC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD2E430B8C
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132366; cv=none; b=oI9/qfEy+HS/r00eNxT1scrhkW0fNj8JNGjfY+RQOUDjRx7yECOtRe50icQKqm6VaJXV82KSnypVLjR8qlZpkI4up8KvdWWLiGj1ZScBj+TKkHsW+jRSs40OtMx9tCnIo0wG/5FfS0HanMdnKWKVm0CZ7c/iiSd2WEJXqQwCvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132366; c=relaxed/simple;
	bh=Lar5nQIPCcEuADcrdWAHdNbb1eEC62i+MUskcEYVWhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQrM3z8ZWeVyPGXRAfakiHN+bc/9QnqFjHQsU9Tu2G8TXIr8+tnQ68SEskhLHgCOYWRd/RNRwuJNiUBMonR/S1JlPIW5wsFPST7d43m6OwlMsb4NgxJhI6gPkBHZQzseXSz78M+ALXAlj4aUaSyL/wPjkZqLj+z3hvqtjEPrPZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYwljayC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132365; x=1804668365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lar5nQIPCcEuADcrdWAHdNbb1eEC62i+MUskcEYVWhs=;
  b=aYwljayCpeC0HUaL8XZJfIJB2Y3SRZ0MHnap9nxRvNQCCrLkRj1e/CN+
   9ctSWWE++YhJCbLbUXEOy31/FpKKWslOzi5+MbxhzSntCDkrHtV6sIszN
   blG+htBy4nRtHCVAOJrNyBpYUCpCJogbSyyR1zA7xxtARRaD5pRf/PxGC
   +QfDi4XnvDt62yM/0aHP29enAaCWTyWspsbdVweh+xxcJYRBj6+0C2DRq
   cTyE3GKNeRU6Sg4ioQrW5gXbGkMKGneojf8zvK7HseMLX06yvhPkGG/wp
   /QOgACwTIi+jPO4hjq5QYN+RvPGT314FHuWOuoH0WZo8P4xu5xhByYZw3
   g==;
X-CSE-ConnectionGUID: GKcc/JcQTnOjmOx2zr2j9w==
X-CSE-MsgGUID: xr7fqlRWSlKhXNOcmgXgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501772"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501772"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:57 -0700
X-CSE-ConnectionGUID: ZDOqNuiPRniBx4gZoFaKJA==
X-CSE-MsgGUID: 0oXzOhLORJGqT33h8b5Ksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727709"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 80380121EE1;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xo4-1c8H;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 09/11] Improve input validation
Date: Tue, 10 Mar 2026 10:46:15 +0200
Message-ID: <20260310084615.1183141-10-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: 33D62247927
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
	TAGGED_FROM(0.00)[bounces-55064-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 9ec9f06de052..4b7fa0e18f9b 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -153,7 +153,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int width,
 	if (!f) error("fopen failed");
 	int r = fseek(f, 0, SEEK_END);
 	if (r!=0) error("fseek");
-	int file_size = ftell(f);
+	long file_size = ftell(f);
 	if (file_size==-1) error("ftell");
 	r = fseek(f, 0, SEEK_SET);
 	if (r!=0) error("fseek");
@@ -163,13 +163,22 @@ static unsigned char *read_raw_data(char *filename, unsigned int width,
 		height *= info->planes;
 	}
 
-	if (file_size*8 < width*height*bpp) error("out of input data");
-	if (file_size*8 > width*height*bpp) printf("warning: too large image file\n");
+	if (!width || UINT_MAX / width / MAX(8, bpp) < height)
+		error("width or height is bad");
+	line_length = line_length ?: (width * bpp + 7) / 8;
+	if (!line_length || UINT_MAX / line_length < height ||
+	    line_length < width * bpp / 8)
+		error("line_length is bad");
+	if (file_size > UINT_MAX)
+		error("too large file");
+	if ((unsigned int)file_size < line_length * height)
+		error("out of input data");
+	if ((unsigned int)file_size > line_length * height)
+		printf("warning: too large image file\n");
 	if (file_size % height == 0) {
-		line_length = width * bpp / 8;
 		padding = file_size / height - line_length;
 		printf("%u padding bytes detected at end of line\n", padding);
-	} else if ((file_size * 8) % (width * height * bpp) != 0) {
+	} else if ((file_size * 8) % (line_length * height) != 0) {
 		printf("warning: input size not multiple of frame size\n");
 	}
 
-- 
2.47.3


