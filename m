Return-Path: <linux-media+bounces-53033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AL5DWB4lWl8RwIAu9opvQ
	(envelope-from <linux-media+bounces-53033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:29:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F41540FA
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 349523061CDB
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2A1318BA1;
	Wed, 18 Feb 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieItIyA6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D223191D8
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403157; cv=none; b=d/9ueOlGDEAV/JsSgK2Dd08qsbYWz8e4KB5U7z0eaV/FFYdkeZ9xFa3x51gZNyd0pN//RQFdXHnr/uHbQlICzrT6VkgwA2g+i4i5HBKrlxb1AbBA83+f/k/y7WDUFv1W7FgMPkJXeuC809A+ajHYbZIZqI3OeGapu8ccwKxYrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403157; c=relaxed/simple;
	bh=8VocE4H+7CsKNXx/qvp4+utF+V88/4qkd4bg42kf8Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j349iEj+sPnUaIJIBXYHwVoHO+5q8a/YNhQnUWlbf5/zQbuTlfyHd9T2h0JJVSt9lGcW38cA+InlIIHgyLEcnzgKo+MSf1i7ceR8pfcfssKxW0EYp4vhxY6bt1LAyBFkiyEGVuQS6vSgQZItxQ/6sPmXMhxrur6A48FWgmofRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieItIyA6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771403156; x=1802939156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8VocE4H+7CsKNXx/qvp4+utF+V88/4qkd4bg42kf8Rw=;
  b=ieItIyA65V8lsYbXM/qXfXoFEsFK5sJ/GcphzGxlOV9TCuJ0tFvVW13H
   UVJBu3MDWkMdrMOiOpH7BY30VPT5ZwkLUuiLaRQs/KJ97R2LC6MiSacF/
   mEODfJoMkqTlWko9vWWLd3RYRtA6E8R/8X3n0j7r2VmKXucAHjcICgnWE
   Iy+o976oJYsiExD9e9UVsGGo3wdxV+Nvu0DHhaGDyQBXanhd5aiSE1q7l
   DAUV2CZfCHA5PtWWXHlZpgNXUnkqaUjvpM3h7pHucTlwyjfMnY9Xbyn38
   uJ0Z9ZOmVaSD6BCN11ZuGCvZqKv401bPwsjlibc9wQe7JLj6iiMhuIOSh
   A==;
X-CSE-ConnectionGUID: S0mI/CnoTLSgO52+Sqn9dg==
X-CSE-MsgGUID: /mEErJwwRDyK6if0TAKofA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="95102857"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="95102857"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:25:54 -0800
X-CSE-ConnectionGUID: 23OWdYkkQ7+4Gj9tEeY4Fw==
X-CSE-MsgGUID: uh19pBKWSV66wuHnnsmnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213375795"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:25:52 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E7BDD121D40;
	Wed, 18 Feb 2026 10:26:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vscsw-0000000ACnF-3Ly6;
	Wed, 18 Feb 2026 10:26:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v2 3/3] Add 10-bit CSI-2 packed format support
Date: Wed, 18 Feb 2026 10:26:14 +0200
Message-ID: <20260218082614.2432432-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218082614.2432432-1-sakari.ailus@linux.intel.com>
References: <20260218082614.2432432-1-sakari.ailus@linux.intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53033-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A91F41540FA
X-Rspamd-Action: no action

Add support for the 10-bit CSI-2 packed raw formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 5df3ff7ab31d..62466bc60322 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -25,6 +25,7 @@
 
 #include <ctype.h>
 #include <stdio.h>
+#include <stdint.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <string.h>
@@ -56,6 +57,7 @@ static const struct format_info {
 	unsigned int cb_pos;
 	unsigned int cr_pos;
 	unsigned int planes;
+	__u32 compat_fmt;
 } v4l2_pix_fmt_str[] = {
 	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0, 1 },
@@ -98,6 +100,10 @@ static const struct format_info {
 	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SBGGR10P, 10, 10, "SBGGR10P (10 BGBG.. GRGR..)", 0, 0, 0, 1, V4L2_PIX_FMT_SBGGR10 },
+	{ V4L2_PIX_FMT_SGBRG10P, 10, 10, "SGBRG10P (10 GBGB.. RGRG..)", 0, 0, 0, 1, V4L2_PIX_FMT_SGBRG10 },
+	{ V4L2_PIX_FMT_SGRBG10P, 10, 10, "SGRBG10P (10 GRGR.. BGBG..)", 0, 0, 0, 1, V4L2_PIX_FMT_SGRBG10 },
+	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, "SRGGB10P (10 RGRG.. GBGB..)", 0, 0, 0, 1, V4L2_PIX_FMT_SRGGB10 },
 	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0, 1 },
 	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0, 1 },
@@ -186,6 +192,45 @@ static unsigned char *read_raw_data(char *filename, int width, int height,
 	return b;
 }
 
+static inline uint16_t raw_get(uint8_t bpp, uint8_t bpc, unsigned char *ptr,
+			       unsigned int stride, unsigned int x, unsigned int y)
+{
+	switch ((bpp << 8) | bpc) {
+	case 0x0a0a: {
+		unsigned char *base = ptr + y * stride + (x & ~3U) / 4 * 5;
+		unsigned int idx = x & 3U;
+
+		return (base[idx] << 2) | ((base[4] >> (idx << 1)) & 3U);
+	}
+	default:
+		error("getting %u/%u not supported", bpp, bpc);
+	}
+
+	return 0;
+}
+
+static inline void raw_put(uint8_t bpp, uint8_t bpc, unsigned char *ptr,
+			   unsigned int stride, unsigned int x, unsigned int y,
+			   uint16_t value)
+{
+	switch ((bpp << 8) | bpc) {
+	case 0x100a: {
+		unsigned char *base = ptr + y * stride + (x & ~3U) / 4 * 5;
+		unsigned int idx = x & 3U;
+
+		base[idx] = value >> 2;
+		base[4] &= ~(3 << (idx << 1));
+		base[4] |= (value & 3) << (idx << 1);
+		break;
+	}
+	case 0x1010:
+		*(uint16_t *)&ptr[y * stride + x * 2] = value;
+		break;
+	default:
+		error("putting %u/%u not supported", bpp, bpc);
+	}
+}
+
 static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src,
 			      int src_width, int src_height, unsigned int src_stride)
 {
@@ -283,6 +328,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 static void raw_to_rgb(const struct format_info *info,
 		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
 {
+	unsigned char *tmp_src = NULL;
 	unsigned int src_stride = src_width * info->bpp / 8;
 	unsigned int rgb_stride = src_width * 3;
 	unsigned char *src_luma, *src_chroma;
@@ -298,6 +344,40 @@ static void raw_to_rgb(const struct format_info *info,
 	int cr_pos;
 	int shift;
 
+	switch (info->fmt) {
+	case V4L2_PIX_FMT_SBGGR10P:
+	case V4L2_PIX_FMT_SGBRG10P:
+	case V4L2_PIX_FMT_SRGGB10P:
+	case V4L2_PIX_FMT_SGRBG10P: {
+		const struct format_info *old_info = info;
+		unsigned int new_stride = src_width * 2;
+
+		tmp_src = malloc(new_stride * src_height);
+		if (!tmp_src)
+			error("can't allocate memory for the temporary buffer");
+
+		for (src_y = 0; src_y < src_height; src_y++)
+			for (src_x = 0; src_x < src_width; src_x++)
+				raw_put(16, 16, tmp_src, new_stride, src_x, src_y,
+					raw_get(info->bpp, info->bpc, src,
+						src_stride, src_x, src_y));
+
+		src_stride = new_stride;
+		src = tmp_src;
+
+		for (unsigned int i = 0; i < SIZE(v4l2_pix_fmt_str); i++) {
+			if (v4l2_pix_fmt_str[i].fmt == info->compat_fmt) {
+				info = &v4l2_pix_fmt_str[i];
+				break;
+			}
+		}
+
+		if (info->compat_fmt)
+			error("no supported format found for %s",
+			      old_info->name);
+	}
+	}
+
 	switch (info->fmt) {
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YVYU:
@@ -734,6 +814,8 @@ static void raw_to_rgb(const struct format_info *info,
 		}
 		break;
 	}
+
+	free(tmp_src);
 }
 
 static int parse_format(const char *p, int *w, int *h)
-- 
2.47.3


