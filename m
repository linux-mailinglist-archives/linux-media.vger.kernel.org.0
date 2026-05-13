Return-Path: <linux-media+bounces-61385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAqcAydWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA633531881
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0FEB30616E4
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFD63FBEC9;
	Wed, 13 May 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdLxUVpt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BE3FB040
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669051; cv=none; b=egqJEREV11SAvjLlyZgw08my6HJzg2E8sczHuztOc3/KIpzfilUwti2dlifRhi2HO/2Tg5d3ocJyK0u2hdJpG/D1LssDaXxBQ46reIcihGmEsyKsvY89LZWZepuGKfJO3YIMkC/1n52kFJ/ABYdKsynPhsCYTWV95be/QjcsM4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669051; c=relaxed/simple;
	bh=uOPQQ2e0B1gCTFdac1MOtSeOsuDZ99Y3XzIL1EFrVLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WG28ALY/gr+qdeNzRyU7Lp+EWDg1vIRJh1/+Cu/63lc8j1gpcXYbLPJy8zrnsXXS7biXH3sp79c7YqsqcgzNBq9nygf2czilOdv6Nc/n+oYe0EfY/LnRiUgrMsXQMAsd3NxZTA0VwTyPTOFbRZC+s0O0ogz0bKGdj7lPaPwVmcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdLxUVpt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669050; x=1810205050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uOPQQ2e0B1gCTFdac1MOtSeOsuDZ99Y3XzIL1EFrVLc=;
  b=cdLxUVptMaTN+x8VKb2jy5wqDAVSL77GPdOPAFx4TxNnhC9vqR4TQ46n
   xSB8rTNtWDYmdB99HShxVo4+u46HTME5Wd10Hd1X1Vf1NOxlNUa6x1LX2
   KwdOem7++4Ab1bGzFq0bQpRZZ/cXDqO1d3T7gl4h8SjXbhJ4eJhIFPEEw
   xoGpO/kEw6ZNmpYQ7LcoTmnBM/n+EN+9AppR8pkSpeddEiWSGicnPVV6x
   Xi35/jQaKM3BHHK4X8LQyVC48vATU+UrkaX7yvbh6BJ5f+UTk79XMzv7j
   V/3vhrcCaXxwhEkEDvTkyPTyIUf501lO8kZFfnv/uUBsQSISdDPB+BaGQ
   g==;
X-CSE-ConnectionGUID: zzKGzc0WR5Gi7chO6LRgWA==
X-CSE-MsgGUID: 1Px0OGPdRhmFvhOwqBvj4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464468"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:07 -0700
X-CSE-ConnectionGUID: 5N/247O9Q2WWdJuU+Mk8pg==
X-CSE-MsgGUID: T8L0BYFrRAyvQo6xV9XTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599257"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C6DD6121CE4;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1O-38fV;
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
Subject: [PATCH 05/17] media: v4l2-subdev: Provide a cleanup-friendly get_frame_desc
Date: Wed, 13 May 2026 13:43:46 +0300
Message-ID: <20260513104358.2252605-6-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: BA633531881
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61385-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Provide a cleanup-friendly get_frame_desc() API function that returns a
frame descriptor that can be automatically released using __free().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 36 ++++++++++++++++++++++++---
 include/media/v4l2-subdev.h           | 22 +++++++++++-----
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 012ff6fb2988..a49aaad595af 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2691,8 +2691,8 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
 
-int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-			       struct v4l2_mbus_frame_desc *desc)
+static int __v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+					struct v4l2_mbus_frame_desc *desc)
 {
 	struct v4l2_subdev_format subdev_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -2747,9 +2747,33 @@ int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	return 0;
 }
+
+struct v4l2_mbus_frame_desc *
+v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			   enum v4l2_mbus_frame_desc_type type)
+{
+	struct v4l2_mbus_frame_desc *desc;
+	int ret;
+
+	desc = kzalloc_obj(*desc, GFP_KERNEL);
+	if (!desc)
+		return ERR_PTR(-ENOMEM);
+
+	desc->type = type;
+	desc->entry = desc->entry_mem;
+	desc->len_entries = ARRAY_SIZE(desc->entry_mem);
+
+	ret = __v4l2_subdev_get_frame_desc(sd, pad, desc);
+	if (ret) {
+		kfree(desc);
+		return ERR_PTR(ret);
+	}
+
+	return desc;
+}
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
 
-void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
+static void __v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
 {
 	if (desc->entry != desc->entry_mem)
 		kfree(desc->entry);
@@ -2757,6 +2781,12 @@ void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
 	desc->entry = NULL;
 	desc->len_entries = desc->num_entries = 0;
 }
+
+void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
+{
+	__v4l2_subdev_free_frame_desc(desc);
+	kfree(desc);
+}
 EXPORT_SYMBOL_GPL(v4l2_subdev_free_frame_desc);
 
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index bd97510c7024..6e40420c2fcc 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -8,6 +8,7 @@
 #ifndef _V4L2_SUBDEV_H
 #define _V4L2_SUBDEV_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/v4l2-subdev.h>
 #include <media/media-entity.h>
@@ -1794,7 +1795,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
  * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
  * @sd: The sub-device
  * @pad: The number of the pad in @sd from which to obtain the frame descriptor
- * @desc: A pointer to a frame descriptor, with its type field set
+ * @type: The type of the frame descriptor
  *
  * Obtain a frame descriptor from a sub-device. If the sub-device supports the
  * get_frame_desc pad operation, its result is returned, just like calling it
@@ -1810,20 +1811,29 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
  * each frame descriptor obtained by calling this function using
  * v4l2_subdev_free_frame_desc().
  *
- * Return: %0 on success or negative error code on failure.
+ * Use __free() to release the frame descriptor automatically:
+ *
+ * struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
+ *	v4l2_subdev_get_frame_desc(sd, pad, desc);
+ *
+ * Return: The frame descriptor on success or a negative error code on failure.
  */
-int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-			       struct v4l2_mbus_frame_desc *desc);
+struct v4l2_mbus_frame_desc *
+v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			   enum v4l2_mbus_frame_desc_type type);
 
 /**
  * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
  * @desc: A pointer to a frame descriptor
  *
- * Release the frame descriptor entries in a frame descriptor. The number of
- * entries in the descriptor are set to 0 again.
+ * Release the frame descriptor entries and the frame descriptor itself.
  */
 void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
 
+DEFINE_FREE(v4l2_subdev_free_frame_desc, struct v4l2_mbus_frame_desc *, \
+	    if (!IS_ERR_OR_NULL(_T))					\
+		    v4l2_subdev_free_frame_desc(_T))
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.47.3


