Return-Path: <linux-media+bounces-61387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH3cM2FWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03090531906
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 438CE304E771
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC9D3FD132;
	Wed, 13 May 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgfjIN/r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9C3FA5F0
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669053; cv=none; b=M6kqmCIf6sBzJ41QSTFKmzzUCtOnakbTy+zU4rbCF3WZXNGo8siJiyHyoiJyzP8+Q9dFeRSnaZgjpN7sG8dPry5b9qPlytjXN9PgRtrZBQs9kObFqJAwCXcwB04RVF9KrwPPYUTSEwXqG68PKQWL4klb0fUTdcF+Yf8xoPc8Y/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669053; c=relaxed/simple;
	bh=/fhUhQlM0ynhdcFNyuKb2iszhaY6FxlCe3gU6nuciSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFHrvoj+UTnc7zISQv8+r2Kleem1NQ7ir0ifd9FS99Q67U7SUplsJrRna4+o3leFv6tvPH4NFqD5ZlRu7qfxpDSb1OC+qaAwxhbBbQusyO8Ia3Lit/1QvOTW510TE/2i6pUV/pxLRPVtFh48l/io65eI2MlJkxqTVyxt/v060ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgfjIN/r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669052; x=1810205052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/fhUhQlM0ynhdcFNyuKb2iszhaY6FxlCe3gU6nuciSA=;
  b=jgfjIN/rAMHX9wl9UQ1L9xJHUqU3iSPoSwrCx2ngzieP3xFcALJ52tGP
   TiJtY3dUiWsP0Fm/nKdOFf+dcfAGQIoSgDpYspINGkYwZ2gQYGLnw7nZq
   U0ap5W0kA7T7H6QFcMcrD4AHqlhoElhBnxznwSW39MVIdhuf6RniRdt62
   sRj6e5wZXSz18YIWKK3qi4jshuEgB6X7c9Gkg2Pofd/aqyXhigAbVDHMB
   /UaJ14glQJmthNu+W8nfAtfyXXLSriSrgC4ARdGdAx2PXOJO181X2XYZ5
   IE8FdSqc3P/zf6g1cSs0bnCOZG5uHtI+FNczGyFEEQV879No5LIcAG9yO
   w==;
X-CSE-ConnectionGUID: nhLgi0WFRq6yev9g2Akaaw==
X-CSE-MsgGUID: ZMgUvjeSQEKio6dziMEP/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464477"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:08 -0700
X-CSE-ConnectionGUID: FjCX/B3TRgulvkGk3I6GAg==
X-CSE-MsgGUID: 50uL7gkZQESyiVLN8784Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599266"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E0BFB121DB6;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S23-3cHS;
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
Subject: [PATCH 13/17] media: rkisp1: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:54 +0300
Message-ID: <20260513104358.2252605-14-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: 03090531906
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61387-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..7e94ff2037a6 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -87,7 +88,8 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
 				struct media_pad *source)
 {
 	struct v4l2_subdev *source_sd;
-	struct v4l2_mbus_frame_desc fd;
+	struct v4l2_mbus_frame_desc *fd = __free(v4l2_subdev_free_frame_desc) =
+		NULL;
 	unsigned int dt;
 	u32 mask;
 	u32 val;
@@ -101,8 +103,8 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
 	 */
 
 	source_sd = media_entity_to_v4l2_subdev(source->entity);
-	ret = v4l2_subdev_call(source_sd, pad, get_frame_desc,
-			       source->index, &fd);
+	fd = v4l2_subdev_get_frame_desc(source_sd, source->index,
+					V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
 	if (ret) {
 		dev_err(rkisp1->dev,
 			"failed to get frame descriptor from '%s':%u: %d\n",
@@ -110,13 +112,13 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
 		return ret;
 	}
 
-	if (fd.num_entries != 1) {
+	if (fd->num_entries != 1) {
 		dev_err(rkisp1->dev, "invalid frame descriptor for '%s':%u\n",
 			source_sd->name, 0);
 		return -EINVAL;
 	}
 
-	dt = fd.entry[0].bus.csi2.dt;
+	dt = fd->entry[0].bus.csi2.dt;
 
 	if (rkisp1->gasket_id == 0) {
 		mask = ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY
-- 
2.47.3


