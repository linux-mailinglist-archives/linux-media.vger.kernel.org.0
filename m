Return-Path: <linux-media+bounces-53037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNkDKIN5lWl8RwIAu9opvQ
	(envelope-from <linux-media+bounces-53037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:34:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8881541B3
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CA82301CFC4
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5594A314B78;
	Wed, 18 Feb 2026 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpJE3AVK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CD31B814
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403647; cv=none; b=ZkK7IzoRVk2IsbfwCLbOCsWHhW/prlDx/dBodMVcbQpMWk2rVYIstc2gWck9TCADW6rEpcPdAZ9J3x2RGNqRTAzQmhm1oBur4mkpCKIhmWLPoCrVCA3QYjJTuEbwNvX9xS3zwbroTyF02Uu9tDFSeEwuInWmz3y4NoU41JnBeQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403647; c=relaxed/simple;
	bh=Cw9DSf/pFv1XynvLDCFOugDLMPRHf040jg/g/deH0EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHAaq0vTQbhcuCzTkTKdLDXOWP9UeEyS2vx9AL0ac7nqmgcHxhb2zwf5CkfxaPMxRcoRMmE1mj5/d52Qytvlr7yfTHuTTFbmwaXA1StDo2XXCjGB+jYpezDMzCVrU/KgAxRjljlm/8NyHRcksl88y4mUaqG5efM+OxK6hvJvUEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpJE3AVK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771403646; x=1802939646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cw9DSf/pFv1XynvLDCFOugDLMPRHf040jg/g/deH0EA=;
  b=OpJE3AVKMXcR2eT5w5XDFNmxNtzkSyEFfIhE5D+yZtdKql2ksCWDQdL9
   JEgZBLTcyGlxOejwfss07quPomsLRWj/cyw6w0ZHQsv1nQtR+YXvHLm+E
   sENRED9nqWCZDjRFYsF1YDtHLVBZFqkN7qWRPdexDjpI2iVXbRXtyz6cu
   i4ZWcddhVomQCbujmbVcRsBmpZ5eJR4h/fto/bdJImTQSzx9A6tjm+RFa
   8f7V0SNzVa1gZVAtzhC94LE5WBKZhThR7pY9dapCBuJL5qb88GCbTwao3
   y/MM9d1Kzr2ojH31pJwBLldk+mXYZx/a96MgG63y94avf7CnrUwjHRN8w
   g==;
X-CSE-ConnectionGUID: zWM/VAFvR8KkY7iLdDhEZg==
X-CSE-MsgGUID: aaDvD3vvQy+JUHbGGXb5jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72391232"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72391232"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:34:03 -0800
X-CSE-ConnectionGUID: RQOAOjOFRsWh6hUXcwbi3g==
X-CSE-MsgGUID: 0Zcqcf1CRKGdhp8/P9jz9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="237133558"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:34:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D499B121D40;
	Wed, 18 Feb 2026 10:34:24 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vsd0q-0000000ACp0-33K7;
	Wed, 18 Feb 2026 10:34:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v3 3/3] Add 10-bit CSI-2 packed format support
Date: Wed, 18 Feb 2026 10:34:24 +0200
Message-ID: <20260218083424.2432541-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
References: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-53037-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 1A8881541B3
X-Rspamd-Action: no action

Add support for the 10-bit CSI-2 packed raw formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 5df3ff7ab31d..f3ff515a2923 100644
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
 
+static inline uint16_t raw_get(uint8_t bpp, unsigned char *ptr,
+			       unsigned int stride, unsigned int x,
+			       unsigned int y)
+{
+	switch (bpp) {
+	case 10: {
+		unsigned char *base = ptr + y * stride + (x & ~3U) / 4 * 5;
+		unsigned int idx = x & 3U;
+
+		return (base[idx] << 2) | ((base[4] >> (idx << 1)) & 3U);
+	}
+	default:
+		error("getting raw %u not supported", bpp);
+	}
+
+	return 0;
+}
+
+static inline void raw_put(uint8_t bpp, unsigned char *ptr, unsigned int stride,
+			   unsigned int x, unsigned int y, uint16_t value)
+{
+	switch (bpp) {
+	case 10: {
+		unsigned char *base = ptr + y * stride + (x & ~3U) / 4 * 5;
+		unsigned int idx = x & 3U;
+
+		base[idx] = value >> 2;
+		base[4] &= ~(3U << (idx << 1));
+		base[4] |= (value & 3U) << (idx << 1);
+		break;
+	}
+	case 16:
+		*(uint16_t *)&ptr[y * stride + x * 2] = value;
+		break;
+	default:
+		error("putting raw %u not supported", bpp);
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
+				raw_put(16, tmp_src, new_stride, src_x, src_y,
+					raw_get(info->bpp, src, src_stride,
+						src_x, src_y));
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


