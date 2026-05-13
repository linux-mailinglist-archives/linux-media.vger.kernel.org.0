Return-Path: <linux-media+bounces-61386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG57II9WBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:46:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC939531959
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C31830AAB62
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64DB3EFD0C;
	Wed, 13 May 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCKiyVYL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15563FB7EB
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669052; cv=none; b=h1cHg4Rk9E/YokFoaXgJukgdCHtAjRPZzsyqus8iFZsll7DCF9enGdLXGmodGiSk37ZAJKIQ9O8xTvwwVP0qeFh67IFlikFyNo38bBtIEF3wak8Hi5bvBSUUrEIZDwIfc5Y/kt1VJedO4YgEAT4Klqrp5rtrgLI6JDLmsWMms78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669052; c=relaxed/simple;
	bh=KTm7DNjOFInO38Sd5cWy+Bn+BajxHELnnE0BvVLrIjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iw4uqncxYXUFvA+Dhedhhll9QHl2s3ZjqlXEtOcUXVi2MX/PbWcQ5hOcxDrY4o+m6rXw548iofRJLbxM4ANkJ4h2c4yIsW8lllV18CwyRLvV1Gd0xGQ6bEiXfyhK+Xmp/E3x8iP8fGsQOiqpl7XLlcNIHv0v21fJMScsGWKZgMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCKiyVYL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669051; x=1810205051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KTm7DNjOFInO38Sd5cWy+Bn+BajxHELnnE0BvVLrIjY=;
  b=XCKiyVYLTiNuH1aObKOr5GU8c1IQm+V3oN0YneHbU8snqqHACOMFOfUO
   EYOE8y40MbAss7RGXyLNZjGqfz8xxXVg2ArLSTDaFCWvPzbX8velykeGd
   acepafzhjEtCo6nMhPBJ8yvcEanjmULXOvYvEgFocg0JJQoKQQpeuyj3n
   6YaphHXU29V79Msuy63Aywwmo7i3ooTOu+i4oI+9ByzRGLefUjBoUg86C
   q+Zej/Zcug7jpE56YyoZ2hctMYW9t4xODIr8FHkZRiMuMxy2oCQMUfS/p
   eBR+OETNKcjwsyAUc2MA8/PLskx179/8A8HKLNR9Ypp94M+G/f2apfe/V
   g==;
X-CSE-ConnectionGUID: FE3IYHdiQN6h7BG8nzdBxQ==
X-CSE-MsgGUID: w7L8snKRRNyo7U2Qn0U6pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464472"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:08 -0700
X-CSE-ConnectionGUID: xf6rhQ4UTMeCZcT+ofESuQ==
X-CSE-MsgGUID: rqB/slQER6e6270jlMfT5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599265"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DA044121DA8;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1u-3Vny;
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
Subject: [PATCH 11/17] media: raspberrypi: cfe: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:52 +0300
Message-ID: <20260513104358.2252605-12-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: DC939531959
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61386-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  | 29 +++++++++----------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..111597c5b031 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2023-2024 Ideas on Board Oy
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -803,7 +804,8 @@ static int cfe_get_vc_dt_fallback(struct cfe_device *cfe, u8 *vc, u8 *dt)
 static int cfe_get_vc_dt(struct cfe_device *cfe, unsigned int channel, u8 *vc,
 			 u8 *dt)
 {
-	struct v4l2_mbus_frame_desc remote_desc;
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		NULL;
 	struct v4l2_subdev_state *state;
 	u32 sink_stream;
 	unsigned int i;
@@ -816,34 +818,29 @@ static int cfe_get_vc_dt(struct cfe_device *cfe, unsigned int channel, u8 *vc,
 	if (ret)
 		return ret;
 
-	ret = v4l2_subdev_call(cfe->source_sd, pad, get_frame_desc,
-			       cfe->source_pad, &remote_desc);
-	if (ret == -ENOIOCTLCMD) {
+	fd = v4l2_subdev_get_frame_desc(cfe->source_sd, cfe->source_pad,
+					V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (PTR_ERR(fd) == -ENOIOCTLCMD) {
 		cfe_dbg(cfe, "source does not support get_frame_desc, use fallback\n");
 		return cfe_get_vc_dt_fallback(cfe, vc, dt);
-	} else if (ret) {
+	} else if (IS_ERR(fd)) {
 		cfe_err(cfe, "Failed to get frame descriptor\n");
-		return ret;
-	}
-
-	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		cfe_err(cfe, "Frame descriptor does not describe CSI-2 link");
-		return -EINVAL;
+		return PTR_ERR(fd);
 	}
 
-	for (i = 0; i < remote_desc.num_entries; i++) {
-		if (remote_desc.entry[i].stream == sink_stream)
+	for (i = 0; i < fd->num_entries; i++) {
+		if (fd->entry[i].stream == sink_stream)
 			break;
 	}
 
-	if (i == remote_desc.num_entries) {
+	if (i == fd->num_entries) {
 		cfe_err(cfe, "Stream %u not found in remote frame desc\n",
 			sink_stream);
 		return -EINVAL;
 	}
 
-	*vc = remote_desc.entry[i].bus.csi2.vc;
-	*dt = remote_desc.entry[i].bus.csi2.dt;
+	*vc = fd->entry[i].bus.csi2.vc;
+	*dt = fd->entry[i].bus.csi2.dt;
 
 	return 0;
 }
-- 
2.47.3


