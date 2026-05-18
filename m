Return-Path: <linux-media+bounces-62044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJi3CQJCC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D09E45711FB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5C24303F456
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C32548C3EA;
	Mon, 18 May 2026 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zu0xirUV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6A48C41B
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122616; cv=none; b=nsXPBIZy7PFfMX0XjNCeFtYavU3/BowA1jidzC7JwPipGIDjWDn9qEANx0DKsqgheTNdgYc5JwUFzVRH1EJJseiLHu0vlZmmhGwD4PSu/ad4T22v7XH2KE+gw83EbPiqZh6oaH5GEdwkFmiERhcQnsCPxB48HBr69czp1cIUB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122616; c=relaxed/simple;
	bh=Y3O95Ec8NG6W4v8nsNuLZfUD4S62gsn1uN5O/8xlBKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KS8dagd3IwJvDmd+KmIogxnMmVaSHv5wyYANklZyJ9y55uExgMGq0aYEQKk42ZDMXHkI++DOT09elIuAi2X41pI5KmvgN0/IEMFaTWP+uMLKrkv24TAqaDoEHwRfuiMslfFNNQXViSTYC87MprrUQFJLKY8mhZfUf4i/gF9gBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zu0xirUV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122616; x=1810658616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y3O95Ec8NG6W4v8nsNuLZfUD4S62gsn1uN5O/8xlBKg=;
  b=Zu0xirUVzhEAmOuWy5WwvWeghbS2RYGAxjZND8sUwidljjW1NWDrraXz
   nTkFWdG5yCiwylnP+EpMrajA4loqY25KpMOfz9Z0+8OiFo94HwHLMebl6
   QuH5QPiseNTZHGdK3OVmn0d2IXiR0G9ell0nO+jiFxmpa7VyrWULPBfJQ
   3sZw0+fbUDvaufs0AvCHegC2zyCtnJpwuCmTZSRJp2wXCVqMDsAO5eEQJ
   9jUNMhv3akNJM6iEAbxyzCmidQjUJpvbIbjmdjodx5r1B/meNrn8yHANe
   uS1bcB/LLZgDJBleVnMEZO35ltQomTlrgEPNzXKthzKb4hRTtRHPpRClq
   A==;
X-CSE-ConnectionGUID: bbdMCpvxSb+HddBN7TUS4Q==
X-CSE-MsgGUID: ZHBn2h76S86Gke8bWTaTlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413887"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413887"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:30 -0700
X-CSE-ConnectionGUID: klOhVePtQc+CUdFV5WPYqw==
X-CSE-MsgGUID: 2p5SM920R/O4qIxCGRBVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019315"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 592DD121D25;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8Ap-1Ikg;
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
Subject: [PATCH v2 17/17] staging: media: ipu7: Use v4l2_subdev_get_frame_desc()
Date: Mon, 18 May 2026 19:43:17 +0300
Message-ID: <20260518164318.3367888-18-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-62044-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: D09E45711FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../staging/media/ipu7/ipu7-isys-csi-phy.c    | 19 ++++++--------
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   | 26 ++++++++-----------
 2 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index 3f15af3b4c79..70f8a55e3bce 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/bug.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/iopoll.h>
@@ -300,7 +301,6 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
 {
 	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
 	struct device *dev = &csi2->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc desc;
 	struct v4l2_subdev *ext_sd;
 	struct media_pad *pad;
 	unsigned int i;
@@ -318,17 +318,14 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
 		 pad->entity->name))
 		return -ENODEV;
 
-	ret = v4l2_subdev_call(ext_sd, pad, get_frame_desc, pad->index, &desc);
-	if (ret)
-		return ret;
-
-	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_warn(dev, "Unsupported frame descriptor type\n");
-		return -EINVAL;
-	}
+	struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(ext_sd, pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 
-	for (i = 0; i < desc.num_entries; i++) {
-		desc_entry = &desc.entry[i];
+	for (i = 0; i < desc->num_entries; i++) {
+		desc_entry = &desc->entry[i];
 		if (desc_entry->bus.csi2.vc < IPU7_NR_OF_CSI2_VC) {
 			ret = __dids_config(csi2, id, desc_entry->bus.csi2.vc,
 					    desc_entry->bus.csi2.dt);
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index f34eabfe8a98..08f4ca1e0289 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -6,6 +6,7 @@
 #include <linux/atomic.h>
 #include <linux/bits.h>
 #include <linux/bug.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -491,11 +492,9 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
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
@@ -505,18 +504,15 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
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
@@ -534,8 +530,8 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
 
 	*entry = *desc_entry;
 
-	for (i = 0; i < desc.num_entries; i++) {
-		if (desc_entry->bus.csi2.vc == desc.entry[i].bus.csi2.vc)
+	for (i = 0; i < desc->num_entries; i++) {
+		if (desc_entry->bus.csi2.vc == desc->entry[i].bus.csi2.vc)
 			(*nr_queues)++;
 	}
 
-- 
2.47.3


