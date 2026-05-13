Return-Path: <linux-media+bounces-61391-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIraKLZWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61391-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:47:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE0531976
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0804630FC870
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D443FE670;
	Wed, 13 May 2026 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Np7/q6Ef"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A603FCB1F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669054; cv=none; b=n3ekQYWfa/U4SrA1ovv4yWcTZP93zQJCcgXIVT4T5eOYYA+AMhzNQGTtTn4iHOjNUPHT2YvzYoihn/U6zfk6sKWOGmB7OiNsc9AS4wurTqm5nCilwnB8iSTbQ9Q2DYBAUDiN1MG1+HfxgD+tNwLR308vCXJkopdYXVulKgvPPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669054; c=relaxed/simple;
	bh=7p7k643r5Rz+M8RPUIqqvyB9PUohinV4VFwG5+UmvB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6l50J0R6VDCYp7PCtbBlBPDyjj7o4jP2aC9rc7aKNYRY0nHBOx/Z8jApgXdy/zz/Dp515YYreyQWYWqoOfWfxHZnbyqfBy7tC/jgikS0D2yPwg+7ah4CBEqRSsIkEPKc6T8tG+6nVvf7FiiFHNXE9Wy9bt97X0xDtsg4YuUuq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Np7/q6Ef; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669053; x=1810205053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7p7k643r5Rz+M8RPUIqqvyB9PUohinV4VFwG5+UmvB0=;
  b=Np7/q6EfxytAxL61YlILcsH3PZ6Nr7jyyn7UpxkhOzr031SISdYL9M25
   WS1AKm45mWdhcfWokUdQVTf+Hn1reuWNfgIws0ssfLUmfTNK4xm+vOdA1
   MY5RgpvDgLmxiFc99Vu59Eu3oM/VxQwvnKPhV5hAGIR9EW6/dQ1tyye1k
   pRRTiGDPqnULhffElhvEiXYYvsAKrp1GSyn9dBb8+WAD/aslTtz3TBD2Q
   SipXTOZyvbEZRWr1rQlF/1qIMZknJxbSqaiv1qCp4L4qQBJQ8VkjLIrzH
   cq8iH2JlH1O21H9Nvql38UksH7ITW8US3lLXdU/nk85xFbCxZKPaRAkz5
   g==;
X-CSE-ConnectionGUID: RZjhDIF5Q06mJVOZrHfOBg==
X-CSE-MsgGUID: ELqhZjuSR3CeB8Tr1quPEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464495"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:12 -0700
X-CSE-ConnectionGUID: cd+MDVk4R/SUWSVyPYgDdg==
X-CSE-MsgGUID: 5RJcylrKRH+eFv+5VyiiwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599293"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ED571121DCB;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S2O-3qf8;
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
Subject: [PATCH 17/17] staging: media: ipu7: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:58 +0300
Message-ID: <20260513104358.2252605-18-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: 58DE0531976
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
	TAGGED_FROM(0.00)[bounces-61391-lists,linux-media=lfdr.de];
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
 .../staging/media/ipu7/ipu7-isys-csi-phy.c    | 16 ++++++--------
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   | 22 +++++++++----------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index 3f15af3b4c79..75ac77e1b782 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/bug.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/iopoll.h>
@@ -300,7 +301,8 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
 {
 	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
 	struct device *dev = &csi2->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc desc;
+	struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
+		NULL;
 	struct v4l2_subdev *ext_sd;
 	struct media_pad *pad;
 	unsigned int i;
@@ -318,17 +320,13 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
 		 pad->entity->name))
 		return -ENODEV;
 
-	ret = v4l2_subdev_call(ext_sd, pad, get_frame_desc, pad->index, &desc);
+	desc = v4l2_subdev_get_frame_desc(ext_sd, pad->index,
+					  V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
 	if (ret)
 		return ret;
 
-	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_warn(dev, "Unsupported frame descriptor type\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < desc.num_entries; i++) {
-		desc_entry = &desc.entry[i];
+	for (i = 0; i < desc->num_entries; i++) {
+		desc_entry = &desc->entry[i];
 		if (desc_entry->bus.csi2.vc < IPU7_NR_OF_CSI2_VC) {
 			ret = __dids_config(csi2, id, desc_entry->bus.csi2.vc,
 					    desc_entry->bus.csi2.dt);
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index f34eabfe8a98..5a4a53ae1104 100644
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
@@ -491,7 +492,8 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
 {
 	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
 	struct device *dev = &csi2->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc desc;
+	struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
+		NULL;
 	struct v4l2_subdev *source;
 	struct media_pad *pad;
 	unsigned int i;
@@ -505,18 +507,14 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
 	if (!pad)
 		return -EPIPE;
 
-	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
+	desc = v4l2_subdev_get_frame_desc(source, pad->index,
+					  V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
 	if (ret)
 		return ret;
 
-	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(dev, "Unsupported frame descriptor type\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < desc.num_entries; i++) {
-		if (source_stream == desc.entry[i].stream) {
-			desc_entry = &desc.entry[i];
+	for (i = 0; i < desc->num_entries; i++) {
+		if (source_stream == desc->entry[i].stream) {
+			desc_entry = &desc->entry[i];
 			break;
 		}
 	}
@@ -534,8 +532,8 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
 
 	*entry = *desc_entry;
 
-	for (i = 0; i < desc.num_entries; i++) {
-		if (desc_entry->bus.csi2.vc == desc.entry[i].bus.csi2.vc)
+	for (i = 0; i < desc->num_entries; i++) {
+		if (desc_entry->bus.csi2.vc == desc->entry[i].bus.csi2.vc)
 			(*nr_queues)++;
 	}
 
-- 
2.47.3


