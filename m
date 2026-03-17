Return-Path: <linux-media+bounces-56077-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCkTAWxWuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56077-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:26:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B502AAD1F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AAA9305B001
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875AB3CB2C8;
	Tue, 17 Mar 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lP8lpLG9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C03C73D5
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753379; cv=none; b=OOk2gsO4yEy8fG51AjTHMNvV4GntJKP0TRNT1NjYDl5gShV34N4DGGbsZL3E9YHJ/PWgcFZA92RkrS19YUx68JARMj98YubI4R6zmIBvS/xz5hzeWXQL9KO8PXU42EXgHfFGTKLwTZRVjIcWL6rtn24RCyyacbKE7mR9Q33xIVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753379; c=relaxed/simple;
	bh=8XoYQKxsQuBl2V00cr6xKyA5/gIj2LoNY11KHjPH7M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYPJtAy/kXJ6nGNAe2KWgj2K/BjStBmBEG35CNmlcsbi2LyeceC5ZswID2vm2zlUrqsYMu1fxcI98zVYZTZcKm+0spaxW9en1FTJn3HSdK4Rm2QAzWYchw7+sAl4lc+Mi/uGg80NWwvJw9ZQ1XTjVkxglyQAUij1813tJVPKhEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lP8lpLG9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753377; x=1805289377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8XoYQKxsQuBl2V00cr6xKyA5/gIj2LoNY11KHjPH7M8=;
  b=lP8lpLG9k5zNvwkFuOwbmMFLRbDGuDsMF0FpvcLujAEVgkGQ6c0OTIQg
   G2ytgxw+DR9qsdHu5z+RaXo/nC8Heyk4Pco1+snTm7l7Z+2Dgsz6kslJx
   dXY+x35vwgRi7WmPCenge1r8WbCWrfxWIcxcfCYf7zu8eZJ1STVik6xC6
   X8gIycCBt8zA1ABZ+QLtm4lAD7GCzEu51Fnyu9IJrSL9uVVgWOV8HQ3oP
   ESfjrPR+Kw2se8/3WQV05YIjEWJgUFBAeD+l8pSPcgzyyNe2ttrnuJLuf
   0Hp8sd6uZ/yyTrD/ZLEoe+vaP+t9ObI9KhObRu2kpTb6K827MXKSnu3Jt
   w==;
X-CSE-ConnectionGUID: rayUMaF/Shi7COWDkTwvWA==
X-CSE-MsgGUID: CFvx+PKFQB61GLsn373EfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411098"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411098"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:15 -0700
X-CSE-ConnectionGUID: rAC4vdNpRfSPclHKzf43Dg==
X-CSE-MsgGUID: 8pi5RYeoSKuIW4kWHRjjQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226733222"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E1D97121D4E;
	Tue, 17 Mar 2026 15:16:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2UJJ-00000000tzx-3Pna;
	Tue, 17 Mar 2026 15:18:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 2/6] Check we have a supported format first before allocating memory
Date: Tue, 17 Mar 2026 15:18:09 +0200
Message-ID: <20260317131813.215230-3-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56077-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47B502AAD1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 007ee7a37636..96466a5a1d44 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -372,20 +372,7 @@ static void raw_to_rgb(const struct format_info *info,
 		src_width &= ~3;
 
 		const struct format_info *old_info = info;
-		unsigned int new_stride = src_width * 2;
-
-		tmp_src = malloc(new_stride * src_height);
-		if (!tmp_src)
-			error("can't allocate memory for the temporary buffer");
-
-		for (src_y = 0; src_y < src_height; src_y++)
-			for (src_x = 0; src_x < src_width; src_x++)
-				raw_put(16, tmp_src, new_stride, src_x, src_y,
-					raw_get(info->bpp, src, src_stride,
-						src_x, src_y));
-
-		src_stride = new_stride;
-		src = tmp_src;
+		unsigned int unpacked_stride = src_width * 2;
 
 		for (unsigned int i = 0; i < SIZE(v4l2_pix_fmt_str); i++) {
 			if (v4l2_pix_fmt_str[i].fmt == info->compat_fmt) {
@@ -397,6 +384,19 @@ static void raw_to_rgb(const struct format_info *info,
 		if (info == old_info)
 			error("no supported format found for %s",
 			      old_info->name);
+
+		tmp_src = malloc(unpacked_stride * src_height);
+		if (!tmp_src)
+			error("can't allocate memory for the temporary buffer");
+
+		for (src_y = 0; src_y < src_height; src_y++)
+			for (src_x = 0; src_x < src_width; src_x++)
+				raw_put(16, tmp_src, unpacked_stride, src_x, src_y,
+					raw_get(old_info->bpp, src, src_stride,
+						src_x, src_y));
+
+		src_stride = unpacked_stride;
+		src = tmp_src;
 	}
 	}
 
-- 
2.47.3


