Return-Path: <linux-media+bounces-62038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLxPEOBBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7F25711B0
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6719F302ACFE
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4469C48C401;
	Mon, 18 May 2026 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyDh18+x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575548C3FE
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122613; cv=none; b=etMn2LXB5jaAy8j0TVJ9zZ+kuOw2TpGNv/KHHJ5JAYf29WsKwlxtRMXkP9wi/aLpyxhRCIpM1SKW+ZQAUEhHi1b/gw8YWgtRZCB5YoCkv05QNRY4hsdu+jJ7mjnjyFUGpN3/Tuwuy+Svp1DUUuiNc1Xz3ibSqTDJghBEatO3zIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122613; c=relaxed/simple;
	bh=sh0ODpP2MOffQt3fyT2C33WBoCV63dtyJ//wbFV924I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkMS6pErm6be8fvG8l3TVHGpIhokzxqOE9lE+jUaYk7vHmQjaOEMCzjRAyGS89u/KHcNnBQEd8TzhFVHHLtWQjdp77Pr9HqPqkh5Tqep1u+KQBf/tbm0ZUy/aWBeRq3qL6z2a9nCTPmOoz0hYazj0OTzck0KWZ/SDnVHWD0tCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyDh18+x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122612; x=1810658612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sh0ODpP2MOffQt3fyT2C33WBoCV63dtyJ//wbFV924I=;
  b=TyDh18+xdaAF+1si5HwqPbQuF9a9cc26JXC3tYTeCQtL+D/EnSkV7uVu
   IW7hePRUjJJEZaTgsLnAQQNw3hleBtJn47pJhM/h542u16EwXqTILu9/Y
   iLr9SLWUzniAa4jfhWSJfdQh5cHXmY/Tmh+05+8K2ZmC55XQvOw19AHtb
   hlRRGQeeTnimYdLpa3Fq7jA32wS7vjtYmCp+z2/Flt0dZXKuC73sMiuht
   dMkACAPm7ZCKKu/GuzOq6mLvkiQAUFfctvkN8ZhPD3uqTohx989HWlzNY
   UbrGvGnJliUCISVselFtCMrnA2+ip0DNCG4k9HHkIeMKYCENocn20Nipl
   w==;
X-CSE-ConnectionGUID: qIe6Qa0UQbOdVGk4XfrxvA==
X-CSE-MsgGUID: SlzVj9SxSaKAFeVSn1ZQ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413857"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413857"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:29 -0700
X-CSE-ConnectionGUID: trDxXTZkRQeTG73peK/QJQ==
X-CSE-MsgGUID: TbUkbZeqRaSRk6e0QMWlxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019224"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4432C121D09;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8AK-0vad;
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
Subject: [PATCH v2 11/17] media: raspberrypi: cfe: Use v4l2_subdev_get_frame_desc()
Date: Mon, 18 May 2026 19:43:11 +0300
Message-ID: <20260518164318.3367888-12-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-62038-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: AC7F25711B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..662a99cee30d 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2023-2024 Ideas on Board Oy
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -803,7 +804,6 @@ static int cfe_get_vc_dt_fallback(struct cfe_device *cfe, u8 *vc, u8 *dt)
 static int cfe_get_vc_dt(struct cfe_device *cfe, unsigned int channel, u8 *vc,
 			 u8 *dt)
 {
-	struct v4l2_mbus_frame_desc remote_desc;
 	struct v4l2_subdev_state *state;
 	u32 sink_stream;
 	unsigned int i;
@@ -816,34 +816,30 @@ static int cfe_get_vc_dt(struct cfe_device *cfe, unsigned int channel, u8 *vc,
 	if (ret)
 		return ret;
 
-	ret = v4l2_subdev_call(cfe->source_sd, pad, get_frame_desc,
-			       cfe->source_pad, &remote_desc);
-	if (ret == -ENOIOCTLCMD) {
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(cfe->source_sd, cfe->source_pad,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
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


