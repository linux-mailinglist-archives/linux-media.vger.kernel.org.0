Return-Path: <linux-media+bounces-56025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DiRLTUmuWm1sQEAu9opvQ
	(envelope-from <linux-media+bounces-56025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:00:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1172A7691
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B630F305BA92
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331FF376BC1;
	Tue, 17 Mar 2026 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFlPsisj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615773A1A5D
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741367; cv=none; b=oH5HZSG6peedxtwDJ59dAsBtFn9gR6ptCpmSRpyArR4/A9ZqrZdlwWMilZIMAgubECqT14r7aeg9r6ayMZDRMY7iZUulQkOFcc6Wv9McgQkjY3Zn2GILtDedqTei43sAj6nOsEJ2uqlXWrbaITqLNW2HymGY96TfAGI1n5XbsZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741367; c=relaxed/simple;
	bh=iFNWX2lU9gzr8y8aa2OsVHeu/y3mtrYfK3fHembHC20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBpqSC/MhMPe8Cfwv6anp6XxIPdfpke3rSvLXCoxZGGkVNxbqLpOY+cGo3JNTPUhhit05lT6rxQqWKp2ssznAU74SA1TVoE9MpH5cBXlBgDO0i4JR6+Ng0FjYrQlwARoaXXjm+CKHKTxo0brLVXHr11TZMHWjFmlR80iTIv5TNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFlPsisj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773741367; x=1805277367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iFNWX2lU9gzr8y8aa2OsVHeu/y3mtrYfK3fHembHC20=;
  b=bFlPsisj3TfdhSzUl9yiRm+k+eZ25XpRUUKZytyENbIaueyuutaW3afp
   NZc1gk4LgXL7cDlhYJckEgTsea6s+vn5Nv3Dl815uQv38AH0/cO/Jm487
   pi67p2BxusSK7LVNzd+aLUW8Zqpl7p7JYnxF8ZWFdfVBYamqL98E9R5hp
   6fl2vW4UnbFL5fxzdMe/KKD3sBgbPaTq43P+Vd6Xd3JbtWOBQSmB/Tqvx
   dvpyBmUIg/waeQk2yLfr5nOJlUH9KgHSRt6KdqSPtg+90qdNcEUHZsOAV
   kVPDGXgTNRaA751Z7SAaxBwTnVV0KK/hsY3Xn4DBxfKKO4lN0vBmIHi+M
   A==;
X-CSE-ConnectionGUID: zlJ8EPUvT7mGllu7W6TvzA==
X-CSE-MsgGUID: 0RXWL72XS62BnyuSAPAukA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62335670"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62335670"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:03 -0700
X-CSE-ConnectionGUID: 8Ic/3Oj3TYGv/BGHErGhXw==
X-CSE-MsgGUID: jNPvN0a2SZ2B/Y+e+BFFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226344879"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 63DC911F870;
	Tue, 17 Mar 2026 11:56:00 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2RBa-00000000toj-1AHd;
	Tue, 17 Mar 2026 11:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/7] Check we have a supported format first before allocating memory
Date: Tue, 17 Mar 2026 11:57:57 +0200
Message-ID: <20260317095802.214532-3-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56025-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B1172A7691
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 121f0e0272e4..8aa7258218ad 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -370,20 +370,7 @@ static void raw_to_rgb(const struct format_info *info,
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
@@ -395,6 +382,19 @@ static void raw_to_rgb(const struct format_info *info,
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
+					raw_get(info->bpp, src, src_stride,
+						src_x, src_y));
+
+		src_stride = unpacked_stride;
+		src = tmp_src;
 	}
 	}
 
-- 
2.47.3


