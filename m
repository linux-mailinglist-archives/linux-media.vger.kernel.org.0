Return-Path: <linux-media+bounces-62042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICyqMdJBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE7C571199
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CD5F3016408
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423A448C41A;
	Mon, 18 May 2026 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgTdcXKh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A148C8AA
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122615; cv=none; b=PcLMJ3BUwx9RnmXEvcb5hEkGzcMjP+5RRp20qiqPtvmi+GewpExu67qvJTCN1U/NSG5TMIe6CH9fBnVWpwaH1osDIfcUc1ho7Tnr5bNf6kJNIJ2kc7trA41EWK1O8i4MfEfMD6V4kfxfajJRdOqgRkfQQJ/JqOZYyU9xBYN8SOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122615; c=relaxed/simple;
	bh=ansiQJO3XoUN4IxToqnSmaOUi0Bt4Xd+69o09PTSq9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bi99C6aqsDtnCFm1dgsUlpG5RWmWPeWDax6qBRGv5ewRzvnBMNR3Sk7U3rHOCi4tSRdz2vr4Y3AUFZucgutD4FUHXsCN3qB+jMtm59ka+mgUZEfQDRLt/1a+yP+TQ3cXSoLA3Hhf76CKVE2qQzuxg0VFsa2ci5jHrIIQ3bitgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgTdcXKh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122614; x=1810658614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ansiQJO3XoUN4IxToqnSmaOUi0Bt4Xd+69o09PTSq9c=;
  b=OgTdcXKhmQwnSvlvHYVrI62ed7wFFlrupIdXGxLTNFnvhAIX5QFLRGcb
   aff5r4WLy7f+qLcFJmgKFCBrqE3adrUH1k2k0nP4kT0V31op5psIoN1eC
   DVbOm528JM+exun2paIZcqT9plYCs7A4gfdROZTMsIvvev+3w+R1X2adN
   97zkfqCop7IAacoS7kieBH4M746Nj1REzCeCX+g/VF7MeBJwK1CoK3zuO
   J9rakNdDwkkphy7ozT1h/YZChIUGe8IdXcBoEyFKjLV7ONSP3V2MNkO13
   CflMkBiF4coadda85y1FbJZgGkPGc6NWGsLeBK9XeMt+lRf0YACPHHrS+
   g==;
X-CSE-ConnectionGUID: xOIZzpH4Tj2UNpdmSUygIg==
X-CSE-MsgGUID: C0/gp9cuSOm94QTxM0IZDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413880"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413880"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:30 -0700
X-CSE-ConnectionGUID: l/uEflxISGeHGUBefrfvLA==
X-CSE-MsgGUID: l3spk4RCQhuEfquHkug3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019311"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 55501121D22;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8Af-1B6l;
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
Subject: [PATCH v2 15/17] media: ti: cal: Use v4l2_subdev_get_frame_desc()
Date: Mon, 18 May 2026 19:43:15 +0300
Message-ID: <20260518164318.3367888-16-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62042-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,linux.intel.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FE7C571199
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 26 +++++++++-----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 00a71dac0ff4..9ea1f3551d22 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -9,6 +9,7 @@
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -872,7 +873,8 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				       struct v4l2_mbus_frame_desc *fd)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
-	struct v4l2_mbus_frame_desc remote_desc;
+	struct v4l2_mbus_frame_desc *remote_desc
+		__free(v4l2_subdev_free_frame_desc) = NULL;
 	const struct media_pad *remote_pad;
 	struct v4l2_subdev_state *state;
 	u32 sink_stream;
@@ -893,24 +895,20 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		goto out_unlock;
 	}
 
-	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
-			       remote_pad->index, &remote_desc);
-	if (ret)
-		goto out_unlock;
-
-	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		cal_err(phy->cal,
-			"Frame descriptor does not describe CSI-2 link");
-		ret = -EINVAL;
+	remote_desc =
+		v4l2_subdev_get_frame_desc(phy->source, remote_pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(remote_desc)) {
+		ret = PTR_ERR(remote_desc);
 		goto out_unlock;
 	}
 
-	for (i = 0; i < remote_desc.num_entries; i++) {
-		if (remote_desc.entry[i].stream == sink_stream)
+	for (i = 0; i < remote_desc->num_entries; i++) {
+		if (remote_desc->entry[i].stream == sink_stream)
 			break;
 	}
 
-	if (i == remote_desc.num_entries) {
+	if (i == remote_desc->num_entries) {
 		cal_err(phy->cal, "Stream %u not found in remote frame desc\n",
 			sink_stream);
 		ret = -EINVAL;
@@ -919,7 +917,7 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 	fd->num_entries = 1;
-	fd->entry[0] = remote_desc.entry[i];
+	fd->entry[0] = remote_desc->entry[i];
 
 out_unlock:
 	v4l2_subdev_unlock_state(state);
-- 
2.47.3


