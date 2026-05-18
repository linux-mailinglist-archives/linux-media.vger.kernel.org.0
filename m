Return-Path: <linux-media+bounces-62043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKLCB/xBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 885FC5711EB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67DC0301231F
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9F2480954;
	Mon, 18 May 2026 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJUy01zU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD8748C8B1
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122616; cv=none; b=LthqjmlvHPcPH+HK62tybkHta7cTC5n5Gzyyov1+xQ1aazxbrDf0ZzX4Mxtnaks/pTrQnemnMEeS4XGTWXt1b+l9idV50tmKjN4Gn8+3C0MBdDvFiqxHAPhq+lJbnbee+KlD2n8A6Z5psgX+bu5X/ddLSLLXBJ6XYNz2ipd8L3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122616; c=relaxed/simple;
	bh=HfAawddpAq74fAhNjHkmArww3ydntulmM65/XPRoUSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhFHiV3GKYfsY7ZYQ4TIZtxsv9Ai46Y6aAEpmWHLyG8CNkV85ZR2CbHQuYGZodc2VHVfcN3hPnjrI7h5rDeS7mzI265Abm0L/sKD3RYby9lkFbEWS9yVywpqKyhzBFsYym213sGE+DCJuKdbQp2L1CKnaBS2SwBrlOc5uPDoC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJUy01zU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122615; x=1810658615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HfAawddpAq74fAhNjHkmArww3ydntulmM65/XPRoUSU=;
  b=LJUy01zUFTqX9sU2s/KHTgaYa0lb+4KDlmpVY1fI6FFhDiyK5lST0bhM
   MDI1FxjLvfE6NzN7JMmAjH6qFFRYaxBn+omac3aLi1/3U1B/dKmNihz8/
   g3QMbXnSKrXa+pdM004iZRjtLnpt8rGAwjg9ajspMn2xcdQ6o9vtuXpP/
   3G8OMWC7D/joQ2rmpIFl2kCZBa9sLfJd78aL+MtGCoDRVCZjVQ5MIFjQK
   ZbT03o29TaZ/G2mrAuVjH2oOolEm+gbwfCrAYPIeGdX53t/pWOBSu4hww
   vhaDmW5vyUYROU+1e421MwacQbkjk7gZvke9qNhgp6l8Wo9GirK8jiwLU
   g==;
X-CSE-ConnectionGUID: zWTaATsKS/iCiMqvceif+g==
X-CSE-MsgGUID: Rayh4RJaSDmeNZTcxg6akA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413884"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413884"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:30 -0700
X-CSE-ConnectionGUID: CGClJyUDTWKTyikQmVi6hg==
X-CSE-MsgGUID: jiw5iQjFR1OKgYs+qPeDuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019310"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 58492121D24;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8Ak-1F3R;
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
Subject: [PATCH v2 16/17] media: ipu6: Use v4l2_subdev_get_frame_desc()
Date: Mon, 18 May 2026 19:43:16 +0300
Message-ID: <20260518164318.3367888-17-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62043-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:mid,intel.com:email,intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 885FC5711EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 22 ++++++++-----------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 7e539a0c6c92..5317b01935a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -6,6 +6,7 @@
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -600,11 +601,9 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
 {
 	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
 	struct device *dev = &csi2->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc desc;
 	struct v4l2_subdev *source;
 	struct media_pad *pad;
 	unsigned int i;
-	int ret;
 
 	source = media_entity_to_v4l2_subdev(source_entity);
 	if (!source)
@@ -614,18 +613,15 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
 	if (!pad)
 		return -EPIPE;
 
-	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
-	if (ret)
-		return ret;
-
-	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(dev, "Unsupported frame descriptor type\n");
-		return -EINVAL;
-	}
+	struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(source, pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 
-	for (i = 0; i < desc.num_entries; i++) {
-		if (source_stream == desc.entry[i].stream) {
-			desc_entry = &desc.entry[i];
+	for (i = 0; i < desc->num_entries; i++) {
+		if (source_stream == desc->entry[i].stream) {
+			desc_entry = &desc->entry[i];
 			break;
 		}
 	}
-- 
2.47.3


