Return-Path: <linux-media+bounces-55057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO0LFKTbr2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:51:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A1247A69
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67EAA30E99F4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E1D430B96;
	Tue, 10 Mar 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPMUi44A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0F94301DE
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132348; cv=none; b=rTAxK2q1TRBuZwaVgxOOMs6zXQjoRO7HEAIHT8u/4q/fRm8bqIFOrJVnuvlcq2f6O0caFDOEj4REc/fl6B3e5yT67rnVV+fW9Oo1cCXP+h3pEYzZBtsAikVC8V3RfcMB++Njuq/g2jiTzNAbZ/nwi/63vSLZGDLi5HFbwrFqtp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132348; c=relaxed/simple;
	bh=+FAVIe4nojV+pn7xVPRuogWnvIm3Denv9d0P1cLNwxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaouU8d9nBklbcPp1ondYv5h2A+GvXYV5N8VmPYp93ACWTgwiWC2zoKHLefV6l5zDCE1yl57qoWsdn+eNFLl/fitHWc5gmZMm4jRTpA6ZIeiH/DW0YBG+G5j/B1CdOhrYniCyhaaD4r4zqEajjKVe5gN1NKpuCpOkjD5JQr7MGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPMUi44A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132347; x=1804668347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+FAVIe4nojV+pn7xVPRuogWnvIm3Denv9d0P1cLNwxQ=;
  b=GPMUi44AgVkgWWO8orRGq2bImjGrdVQrwLuaoIjNaS6dJz0xa342f8vo
   DUahFkzFoxo8eXC/Tr/rMD0vmdD4CVWvxh0WGFSWIYZasKzKP0bnBR+0h
   GpoUGqtl0sknU2KteQ2bxKDaI+lrjn6Verw3tDnmjqhk8ixLpdlyM+eKh
   whrNt7JwmCi7jcJb8HsO7Uza4/HrEEGR4phWw4OunIQEK+4ANr1SWYz+0
   yRX0cUGobeHaQGLEty2vmdpymahyiTT5HuNhEEwC5RyS33krKiXNrOs1G
   LCUxzwMxHKIKk2xfMN+qz52LUWEnM2/M3pThXx2EoFGfn9u6I57sXZM8O
   g==;
X-CSE-ConnectionGUID: BUBOhvMhT8Wqd8MqmiE7xQ==
X-CSE-MsgGUID: M5cll4sORBGJcHbQxArRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501745"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501745"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:45 -0700
X-CSE-ConnectionGUID: FynlMObPRjaG1Syot9fsRg==
X-CSE-MsgGUID: i7FMefXQR1OuPcIJaIysCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727685"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:44 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 69DC5121D0B;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xnS-15Gl;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 01/11] Add explicit switch fallthrough notation
Date: Tue, 10 Mar 2026 10:46:07 +0200
Message-ID: <20260310084615.1183141-2-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: BB8A1247A69
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
	TAGGED_FROM(0.00)[bounces-55057-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use __attribute__((fallthrough)) instead of a comment this is taking
place, to make modern GCC happy.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 raw2rgbpnm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index baeb8efc863a..5df3ff7ab31d 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -362,7 +362,7 @@ static void raw_to_rgb(const struct format_info *info,
 
 	case V4L2_PIX_FMT_NV21:
 		color_pos = 0;
-		/* fallthrough */
+		__attribute__((fallthrough));
 	case V4L2_PIX_FMT_NV12:
 		src_luma = src;
 		src_chroma = &src[src_width * src_height];
@@ -576,7 +576,7 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_SRGGB10:
 		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
 			error("Can't convert RAW layout to GRBG");
-		/* fallthrough */
+		__attribute__((fallthrough));
 	case V4L2_PIX_FMT_SGRBG16:
 	case V4L2_PIX_FMT_SGRBG14:
 	case V4L2_PIX_FMT_SGRBG12:
@@ -620,7 +620,7 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_SRGGB8:
 		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
 			error("Can't convert RAW layout to GRBG");
-		/* fallthrough */
+		__attribute__((fallthrough));
 	case V4L2_PIX_FMT_SGRBG8:
 		buf = malloc(src_width * src_height * 3);
 		if (buf==NULL) error("out of memory");
@@ -688,7 +688,7 @@ static void raw_to_rgb(const struct format_info *info,
 
 	case V4L2_PIX_FMT_BGR24:
 		swaprb = !swaprb;
-		/* fallthrough */
+		__attribute__((fallthrough));
 	case V4L2_PIX_FMT_RGB24:
 		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
 			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
-- 
2.47.3


