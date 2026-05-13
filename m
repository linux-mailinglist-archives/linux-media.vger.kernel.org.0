Return-Path: <linux-media+bounces-61390-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNEZHLFWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61390-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:47:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE7253196F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C115E30FAC24
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0473FE641;
	Wed, 13 May 2026 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bfx3azSd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8533FBEA5
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669054; cv=none; b=A7X8XAQVos+Ciy1DjfsnIL6ZrWMWU80D/3iLdg7f4ueWqR22iMPJl96BHPLHweuelqGPpF7EKnkz8Rs4fQlhh6Rb9Ahi2viAtDJP+5Ucc4MNcwUaaFnouv1uRXsU2uWnwFxbaEPOHofoWNxHA+6i78gkxlJcG9HuqICmdUKdySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669054; c=relaxed/simple;
	bh=3TXipw4iugDApJYUhC1oGY494SyXf/QFghbwJxgANYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+EzZbSGNrylCj/eeVB4Pv5O5mNSHdP5ZvYZ1W27sPpQ09zWQXkGoxG+C31ZsNrSQZ8BUm/EzM+dEkD8bJJTatQZkjUCqrh9yYjR9/2383z2F4G3GK6Le0b8uVgta+dM/iPERdNnA+0Fbz4eGRoDV4VSLbezcZsjcl/eIpniDRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bfx3azSd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669053; x=1810205053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3TXipw4iugDApJYUhC1oGY494SyXf/QFghbwJxgANYc=;
  b=Bfx3azSdbn5f4qlaf5cnkWYlc9vpiY/WJfOXjLrr/uuLDQckLxpqiBSs
   +uPZSpnWIwpDIwq+OvJQP2ZI/K3LBeDBBdRXt8DZCuv7UXltpO+LDMdez
   WO9c8DWI08Uj0bDLOVb12K4XdIn8hOnmTCjKeMF4HdM7+PZZamSNBpEJX
   yVZFJur4wrKIF5tRsqz5nlR3qQcuJjMxzvgkNwJyM+hwiWqwpX8oU6RTp
   qtNbG7Byt5RmayutNm7ps1lv7BGNmu3/8jKBBYGo+2FxoVFVYmozBHpnK
   XBx+yC/vYnQpEBdChzRaal5vFaMdJBFtMPGcQnyYvhldW4XguFQ0Mpkxt
   Q==;
X-CSE-ConnectionGUID: mu6AmVKsQpuVcgVt90jGPQ==
X-CSE-MsgGUID: coijMR0ySUO+sUg52POF6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464491"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464491"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:12 -0700
X-CSE-ConnectionGUID: gBaCSzT6Rwe3chW5GhiAdg==
X-CSE-MsgGUID: DyW5hvCDREyVpbB6/dyR/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599294"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EA00F121DC9;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S2J-3n9N;
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
Subject: [PATCH 16/17] media: ipu6: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:57 +0300
Message-ID: <20260513104358.2252605-17-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: DDE7253196F
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
	TAGGED_FROM(0.00)[bounces-61390-lists,linux-media=lfdr.de];
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
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 7e539a0c6c92..b47f65d7b668 100644
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
@@ -600,11 +601,11 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
 {
 	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
 	struct device *dev = &csi2->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc desc;
+	struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
+		NULL;
 	struct v4l2_subdev *source;
 	struct media_pad *pad;
 	unsigned int i;
-	int ret;
 
 	source = media_entity_to_v4l2_subdev(source_entity);
 	if (!source)
@@ -614,18 +615,14 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
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
+	desc = v4l2_subdev_get_frame_desc(source, pad->index,
+					  V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
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


