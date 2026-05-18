Return-Path: <linux-media+bounces-62041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLD/KvJBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3F5711DD
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CCA13036713
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D413448C8D1;
	Mon, 18 May 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuofndUe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C1948C41A
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122615; cv=none; b=Zd3cWgjz4pzGagrAsPB32Uh18GhoQIqDBa2ouYmkmiu8jZ5VAkUzD9WiIemTr/lSUA4iJrAwDyqi2TvrnXNdUdkL/GfOMW/oaL+ByI1d4VRqIcu7htGEyzHPciguCZ9K0LAU40JecSCU+ufe85fpT2iox9ZkxNZCvhLhehZBH28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122615; c=relaxed/simple;
	bh=Pm/Hnorr04AiZx3URFULUWwnuMjTTMDrM9ckcoOd6fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgLCUZYcSH70ZqLRS9aVDoe1JNoNka9Lqd/kSqiOY+hS7AoB1U5NX/L077kfBYmLtVjcQ56GNYg7lCIMrmjaHkXafXfFKv6VezgASEl4+SPhrdUwFxfsnrk/4cPnOlGVjSa298QeMwmBzmeRMivSHuyF7rJImUITCOCGAtla00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuofndUe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122614; x=1810658614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pm/Hnorr04AiZx3URFULUWwnuMjTTMDrM9ckcoOd6fc=;
  b=OuofndUe0ccZEq3XYKIEBgiRIwPt5V6qYVSVgjfnC5A6nTK8ThAanqAq
   +J5/70iSUoN8xjgU64QPSzeJDW95kBzDvq4Hg2PzDy9TGuiQ/KWJbFTHn
   quuAngFcxe9necrr8+Fd6SCw5U++rOf7Kz4TopmLSxoe+aG98K+FKu/M/
   /8+891mVXxrxXC5a/3fP2RxCI0HhqAQXx/MerHGdRqIffX9IcrDKfyMTz
   7oYB16SE8OTGWdsq58CJLgbaw/6jboURdjzLMaMX4j/p9lMl+WQ3BzImd
   ito6bQQ3KIzEFK7wT6NeOQ3JyXEMG63RdbxEFXu8xZsRr7ioK//JoBqyl
   w==;
X-CSE-ConnectionGUID: zL4Hso9RR6qWQjIXqqxqiA==
X-CSE-MsgGUID: Nsb6DlSwQ0yRJex6u6LyPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413867"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:30 -0700
X-CSE-ConnectionGUID: /D8SWzQiSaWhrWzbBI4oLQ==
X-CSE-MsgGUID: gsy6zkbPSgKziztFlvpvpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019244"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 47EE4121D1A;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8AP-0zBf;
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
Subject: [PATCH v2 12/17] media: rzg2l-cru: Use v4l2_subdev_get_frame_desc()
Date: Mon, 18 May 2026 19:43:12 +0300
Message-ID: <20260518164318.3367888-13-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-62041-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 65C3F5711DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 27 +++++--------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..710fe028fb46 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2008 Magnus Damm
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
@@ -406,31 +407,17 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 {
-	struct v4l2_mbus_frame_desc fd = { };
 	struct media_pad *remote_pad;
-	int ret;
 
 	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
-	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
-	if (ret < 0 && ret != -ENOIOCTLCMD) {
-		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
-		return ret;
-	}
-	/* If remote subdev does not implement .get_frame_desc default to VC0. */
-	if (ret == -ENOIOCTLCMD)
-		return 0;
 
-	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
-		return -EINVAL;
-	}
-
-	if (!fd.num_entries) {
-		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
-		return -EINVAL;
-	}
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(cru->ip.remote, remote_pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd))
+		return PTR_ERR(fd);
 
-	return fd.entry[0].bus.csi2.vc;
+	return fd->entry[0].bus.csi2.vc;
 }
 
 void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
-- 
2.47.3


