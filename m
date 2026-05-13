Return-Path: <linux-media+bounces-61378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIlOJQ1WBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6B53184C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 848BA305B74D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517063F7A86;
	Wed, 13 May 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lo8NAwa5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EFC3EF646
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669047; cv=none; b=pF8RWEGYnuezlOVDZaN2Atcy5+zBKYPPKZRrtvXenqXzdFWbszzUNHRU0xSzPLDhKU0gByN0qAGNfccVWK/Ub9BS7YodRD59qSSLWXHL/HXOPWQgM7dFFzykL6UjMpIncdOeSMs5PN3r86vJk8UBGFhF6AWMwUthf9gxoKaWXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669047; c=relaxed/simple;
	bh=sbw7P4dOfVztnB5138yqFs0JyklDMlB0mSdW42fFuS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTlJUwwrxln03YiwJTJhGLSGUm0OAT5zerthX6zk4CIGGMPzBQTvGaIi2aMPRbFM770pVLgRHT+J+N8F9g3plu+FgLMhcNNwoa3hEAuha/oYXJ4hLqnO+5zinZrBVa7vgNRJUN9sjATftfL4XwUEqrfNHbKwHroG8C3DbyeGGWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lo8NAwa5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669047; x=1810205047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sbw7P4dOfVztnB5138yqFs0JyklDMlB0mSdW42fFuS8=;
  b=lo8NAwa5gKdXBic12NRIbYsOOSXkrGyI3KsN61wro5xWOUOYC7KYWOJW
   pL6cuVQ/nI8e8OqELveGH/nLTh8NzLCKbpoXumVauaRsoiZnGznI2FIbV
   X9ydvDAoI7guuKqwzxU+NUI+FAr358MPYwgqXzLjBK3YeN4nbNomJayw2
   TjRhvmt5uuaQabiGBSzrWNFxLPdVuHtzsbv2enkAlTZevaanzXByq9Wyt
   RMwnxGBlPQ0oqv9nE89UKNIM+0A73okeovw/bhVQ/fGq5x8xSzeVXSAt3
   aALZ4KxIb9jBf8uGj78clgotT6ti2kwaLS2KOtpE4MSoudNdasLZqHWgi
   g==;
X-CSE-ConnectionGUID: q2vDnePvQsmwsk3IDrI2qg==
X-CSE-MsgGUID: 3+sOtNGgTqGcM+dOvD5ZUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464448"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464448"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:04 -0700
X-CSE-ConnectionGUID: WFeYf58GSFeCe3ZgI0rPuQ==
X-CSE-MsgGUID: YfRtfjAQT5WJysOiY1lnuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599241"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BF90E121CA4;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1G-30ga;
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
Subject: [PATCH 03/17] media: v4l2-subdev: Prepare for changes in getting frame descriptors
Date: Wed, 13 May 2026 13:43:44 +0300
Message-ID: <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: 76B6B53184C
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
	TAGGED_FROM(0.00)[bounces-61378-lists,linux-media=lfdr.de];
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

Introduce v4l2_subdev_alloc_frame_desc() and v4l2_subdev_free_frame_desc()
to both facilitate implementing drivers that need frame descriptors as
well as prepare for having a larger number of frame descriptors.
If the remote sub-device does not support frame descriptors,
v4l2_subdev_get_frame_desc() creates one (with a single entry)
opportunistically, thus avoiding the need to add frame descriptor support
to sensor drivers the device for which only generates a single stream, or
managing the situation on the caller side.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 20 +++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d93ed50255ed..b8acce8f9c33 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -20,6 +20,7 @@
 #include <linux/version.h>
 #include <linux/videodev2.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -2671,6 +2672,64 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
 
+int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_frame_desc *desc)
+{
+	struct v4l2_subdev_format subdev_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = pad,
+	};
+	int ret;
+
+	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
+		unsigned int type = desc->type;
+
+		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
+		if (ret)
+			return ret;
+
+		if (desc->type != type) {
+			dev_dbg(sd->dev,
+				"wrong type of frame descriptor for pad %d (got %u, expected %u)\n",
+				pad, desc->type, type);
+			return -EINVAL;
+		}
+
+		return ret;
+	}
+
+	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
+	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_lock_and_get_active_state(sd);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
+	v4l2_subdev_unlock_state(state);
+	if (ret)
+		return ret;
+
+	struct v4l2_mbus_frame_desc_entry entry = {
+		.pixelcode = subdev_fmt.format.code,
+	};
+
+	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		int dt;
+
+		dt = mipi_csi2_dt_for_mbus(subdev_fmt.format.code);
+		if (dt < 0)
+			return dt;
+
+		entry.bus.csi2.dt = dt;
+	}
+
+	desc->entry[0] = entry;
+	desc->num_entries = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f84..c9e74566c85a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1778,6 +1778,26 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					   unsigned int pad,
 					   struct v4l2_mbus_frame_desc *fd);
 
+/**
+ * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
+ * @sd: The sub-device
+ * @pad: The number of the pad in @sd from which to obtain the frame descriptor
+ * @desc: A pointer to a frame descriptor, with its type field set
+ *
+ * Obtain a frame descriptor from a sub-device. If the sub-device supports the
+ * get_frame_desc pad operation, its result is returned, just like calling it
+ * directly using v4l2_subdev_call(). If the sub-device driver does not support
+ * it, then a frame descriptor containing a single entry is created using the
+ * information from the sub-device format for types
+ * V4L2_MBUS_FRAME_DESC_TYPE_CSI2 and V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL.
+ *
+ * The caller is required to set @desc->type to the expected bus type.
+ *
+ * Return: %0 on success or negative error code on failure.
+ */
+int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_frame_desc *desc);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.47.3


