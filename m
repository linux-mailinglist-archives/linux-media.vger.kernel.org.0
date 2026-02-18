Return-Path: <linux-media+bounces-53032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKI5DaR3lWl8RwIAu9opvQ
	(envelope-from <linux-media+bounces-53032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:26:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E315405B
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E1AC3023DF0
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22C2319855;
	Wed, 18 Feb 2026 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRw1xgFD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BDF318ED1
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403156; cv=none; b=PlEZqrL4MgGyDbAs0AMjVlaCtPgkI6PdEd5UACPYPS/j3h9OQFgnJ5/+CQ+VEXiXEgCeY6A0+U+CvX50VgxccttKzWpX7yvNV/bspWZMRJE9C0ktaQtXbGLu8IQLCpbk+SJNi/BbePC+6lm2bnhwxEHMvBA2l5H36Xy/BY3MvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403156; c=relaxed/simple;
	bh=b4jaEx8LM3whbA6RpLkuiAAIIQ9HnMyEhJX46Fgycu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnSK8fBcBpjtzvfUy68nEKWbZfqeRh1ECRRQ6SCX+iwqD94mzWgC4bhyvlXJJEJng07AOXiZW/3HyTLXDrPA+yxEdqHa8hp/RCFH5Z71h4mI3ixGHh2C3ZzjX0dMV7UQb6wxaLwwQsU2/dA6DAgR42sFkdk4aFItmaHBk158CUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRw1xgFD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771403156; x=1802939156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b4jaEx8LM3whbA6RpLkuiAAIIQ9HnMyEhJX46Fgycu4=;
  b=IRw1xgFDskkk694fV4ogdOTi9SBh3G9ddRy78SGz5k9oMvqa1pQb7pRI
   1ayPIOBwelT5TXKXDGTnw7D+7Ic7DP6kHP35r3ozx/tNJbyFgF+kfkJNJ
   xi2CRX0P7qYnBwkdqNrd/5TxKsIYRaRwesCC6e06EuIenDBFAbhbwzWIk
   ZLVFHB8xXZxQgweemm+oUovNRlGTfiDvxuJE0n0Od7ZJznAbO2/oGv7+F
   RW7dDE+JYAv3/xUjyByE2lsmmLxGvhx5VCeDGNXBklH5sDzyEbNgLUErk
   KdufZHCUO63PkzOwJplPVDYROF/no4t7siMd+sm08DfwkvfwOpN7+GR+C
   g==;
X-CSE-ConnectionGUID: iijiLDJISuO3QX762dYSMw==
X-CSE-MsgGUID: EFyKWfHvStOU0MSRkeSVVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="95102852"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="95102852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:25:53 -0800
X-CSE-ConnectionGUID: nrTvMkFRTI+WprXZk1wX8A==
X-CSE-MsgGUID: OfSatwFzSG+Uu4ixVyVCIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213375794"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:25:52 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E5E06121D37;
	Wed, 18 Feb 2026 10:26:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vscsw-0000000ACn7-3EBH;
	Wed, 18 Feb 2026 10:26:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v2 1/3] Add explicit switch fallthrough notation
Date: Wed, 18 Feb 2026 10:26:12 +0200
Message-ID: <20260218082614.2432432-2-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53032-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 954E315405B
X-Rspamd-Action: no action

Use __attribute__((fallthrough)) instead of a comment this is taking
place, to make modern GCC happy.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


