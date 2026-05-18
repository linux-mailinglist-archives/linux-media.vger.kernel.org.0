Return-Path: <linux-media+bounces-62040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EQVOOtBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDB5711CE
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C86EE3030F54
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B083FCB3D;
	Mon, 18 May 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XuiJbWH/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB048C3F4
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122614; cv=none; b=T29+QseYKVBeqGhxLHOQuGsLSOKdhkcfQgYqT/EW2L0H1FbEw8mCF1OAESmh1zAIQ0dT1AvhtBeSuvY15vDxzvFP9AlgeO67+d8ZvXxECxr32eIeM7AOKzV7lx4/Wc0qlRqINT2KsyK5ms1og9Wuc6LvOTy/hcfeKNeabGOPoPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122614; c=relaxed/simple;
	bh=RNfM/RqLpwhvy3uQkMJeGHLkU/s7fmmF0iPBcAAwj88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4svFMOnCE5y+ZUmQF2lyKUEFV18j6lYeyjMuP6mMocM0kQcv3aHCaf3PAqL0m5MrnN94/cuqB02nSOlZkshbo5PqQ7xCGwTOHAkEUgfIZMVB+uhqRi1zO/y+nk14K+2fNBaS2Jg8cq3bqFctpBU2zcDLFpwATrvRoewiRjcQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XuiJbWH/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122614; x=1810658614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RNfM/RqLpwhvy3uQkMJeGHLkU/s7fmmF0iPBcAAwj88=;
  b=XuiJbWH/xVadxKrPJRFGtp3WJdSgg7+r+3E9pqGgHOavAsc+ObchYrET
   IpwPq3Osgs17cWV1UZbeskqYUmlKFH+lcsUqMbVv8eOgXjFmuxyX91QGO
   1pGBWlzwXtYq7jfrz8kh8q4Bn184KZaukJNd2O4aaz++kD0eUl5kiK9WU
   1mAF+NVw4RoJhzLnA/c/0Hewu4QswZoVmWandqcNg7Q2mRrspI5vmMyNi
   qiAg6XeurqFM/K86lYt1bC50dSoUi330asyA0OgCn/tghtH8rCWGIWlYC
   lj+Y1hHf2jdxizmJTJBYxizVjjWsxmY179vmLtfs0ds/RvMS2eigz7Xsa
   Q==;
X-CSE-ConnectionGUID: jt5lm5eKQaiIZRUdZ7jlRA==
X-CSE-MsgGUID: iBV6gRCOTLCv0NhGlfHLjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413863"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413863"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:29 -0700
X-CSE-ConnectionGUID: g13QaoqmQKCGf6H6bUBS5g==
X-CSE-MsgGUID: iG1GxgoLQwSibxtWMCg3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019243"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4B820121D1E;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8AU-13YG;
	Mon, 18 May 2026 19:43:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v2 13/17] media: rkisp1: Use v4l2_subdev_get_frame_desc()
Date: Mon, 18 May 2026 19:43:13 +0300
Message-ID: <20260518164318.3367888-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62040-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:mid,intel.com:email,intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EDDB5711CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..21d9f7f41411 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -87,11 +88,9 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
 				struct media_pad *source)
 {
 	struct v4l2_subdev *source_sd;
-	struct v4l2_mbus_frame_desc fd;
 	unsigned int dt;
 	u32 mask;
 	u32 val;
-	int ret;
 
 	/*
 	 * Configure and enable the gasket with the CSI-2 data type. Set the
@@ -101,22 +100,24 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
 	 */
 
 	source_sd = media_entity_to_v4l2_subdev(source->entity);
-	ret = v4l2_subdev_call(source_sd, pad, get_frame_desc,
-			       source->index, &fd);
-	if (ret) {
+
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(source_sd, source->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd)) {
 		dev_err(rkisp1->dev,
-			"failed to get frame descriptor from '%s':%u: %d\n",
-			source_sd->name, 0, ret);
-		return ret;
+			"failed to get frame descriptor from '%s':%u: %ld\n",
+			source_sd->name, 0, PTR_ERR(fd));
+		return PTR_ERR(fd);
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


