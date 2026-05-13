Return-Path: <linux-media+bounces-61389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI4qM6RWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:47:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A0531961
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23E7730F3E66
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B023FE37E;
	Wed, 13 May 2026 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvgYbJ1W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC03FCB03
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669053; cv=none; b=pCsKlslcbxA20vL3DS9GKMWeA+sWWR0SUjDeXPmMsQBK3JHQTYoRqJTM2giJFRlI9Pm+10h3ohO1OVKxDp8Mtr1LJG/MPqikrxU5oY6gcA8VeuuWnOU81tqHlZD29XKZXXqJ//+aSv8OHGGL0/T536gJ13qPkqGZHd7c/+KpCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669053; c=relaxed/simple;
	bh=qwp3qKeUD6zfoReKydwZNu0N0fQBjOgtGZqfeaz91Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/qwsZ/CvN4lf0STBwP3mDNnPQdunA57rziORa7YIPIm5CHmX+hTSH/Hv0I51BP49Kp11Q68t+tbs4sGhMJe2y305QW5vARng1PKyJNsZ2hdeiRlUfonbv1LKxgnZrXC4AtCe5uzTeKHLHT7zImyJ2gBTc5GE7Mo/FtZHmBPnA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvgYbJ1W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669053; x=1810205053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qwp3qKeUD6zfoReKydwZNu0N0fQBjOgtGZqfeaz91Pk=;
  b=OvgYbJ1Wsbno9d4oh8N77CcC+jY46AEs1yFCsKqFcdWNLGMYH92hg7+w
   +/HIFVRKbp+zGiMBsG1w6sL0FOn2Vwg86zvGas5il5M3+sAxC2IjAnkbB
   0iShCxGA/5hQTvEQLeZfbD3WU9Kr9mCK/CvKYfhD8G+ekx+6UE/dxVbpo
   rHP+COQNojTQCenvwEzkc/po5zga6i3NFQAUDHfB6RFXTjK2+jWODml3L
   7Xy4Y+8S+7cxD1tX0H3BCh81oJqin4UrulEaFvKfo7/i/bdwZY7qy+qyz
   JpsdPukB1DDFfy5WCO1fWvYxNHkH7+4j1ghNMhVH1W0Jlm8lheYZMvdtl
   Q==;
X-CSE-ConnectionGUID: BZJukSlFSniaiViXfF64BQ==
X-CSE-MsgGUID: 3SIh+sKoT3ic28CeZprY2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464479"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:08 -0700
X-CSE-ConnectionGUID: N/Zd7WULSDi6J6fD5hXqLw==
X-CSE-MsgGUID: QrV32yTKSq6CvQMbVwr6GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599267"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E425F121DB7;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S29-3fjS;
	Wed, 13 May 2026 13:43:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 14/17] media: exynos4-is: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:55 +0300
Message-ID: <20260513104358.2252605-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 478A0531961
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61389-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/samsung/exynos4-is/fimc-capture.c   | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index d85811f4b8c5..7f463871ea0c 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -6,6 +6,7 @@
  * Sylwester Nawrocki <s.nawrocki@samsung.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
@@ -853,18 +854,23 @@ static int fimc_get_sensor_frame_desc(struct v4l2_subdev *sensor,
 				      struct v4l2_plane_pix_format *plane_fmt,
 				      unsigned int num_planes, bool try)
 {
-	struct v4l2_mbus_frame_desc fd = { };
+	struct v4l2_mbus_frame_desc *alloc_fd
+		__free(v4l2_subdev_free_frame_desc) = NULL, fd = { };
 	int i, ret;
 	int pad;
 
 	for (i = 0; i < num_planes; i++)
-		fd.entry[i].length = plane_fmt[i].sizeimage;
+		set_fd.entry[i].length = plane_fmt[i].sizeimage;
 
 	pad = sensor->entity.num_pads - 1;
-	if (try)
+	if (try) {
 		ret = v4l2_subdev_call(sensor, pad, set_frame_desc, pad, &fd);
-	else
-		ret = v4l2_subdev_call(sensor, pad, get_frame_desc, pad, &fd);
+	} else {
+		alloc_fd = v4l2_subdev_get_frame_desc(sensor, pad,
+						      V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+		ret = PTR_ERR(alloc_fd);
+		fd = *alloc_fd;
+	}
 
 	if (ret < 0)
 		return ret;
-- 
2.47.3


