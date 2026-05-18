Return-Path: <linux-media+bounces-62030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA72MPVCC2qsFAUAu9opvQ
	(envelope-from <linux-media+bounces-62030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:48:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F05712F2
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 478BA308213C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD6048BD2F;
	Mon, 18 May 2026 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrKTudP8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27D3C9EFE
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122604; cv=none; b=HY9kLEfETGISzryjbmoXel75KxyvzuN+iFSd6aafflVXqncqBJTxHPzCw4csQHn8bTiw+Mpi2vQBTgzbhqNhcWwUqIWjsywPR3BlFUKq44S6h6MgKQi1isAIqxYlzcAK60u9ZBBKsV6v5UAVfEr88LkTSX1LstyytS66+Z4DS8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122604; c=relaxed/simple;
	bh=1f0w7iwFPDaE5evIEoAzup4/vniUJPl96CTddoW4bHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riq7dlyXJXEoou72cmsVlnbe7viwE4ZabovkLnbWfQZB2ofBb1nwLUlKMqFIhJoEd0/BhzMT/EGwauj+fflkwYZoR/5MxQoN8RJvO0AazrhV6ClWzyCf3St8mdkUOJJ0zWyU5Pwno4zKQQI/J7PNldI9CYB3iO72RLu28MUKuwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrKTudP8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122603; x=1810658603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1f0w7iwFPDaE5evIEoAzup4/vniUJPl96CTddoW4bHY=;
  b=ZrKTudP8w47l6MGhIRNeJDUWosEsc586u0tS9vYaNNOMoMoVpo3rYAUL
   HZUZNjNXGhudE0CBLPWzhlojVqd1wfiop0u5NnyjBARqyrH0TO5tEiKrs
   xxHKOk75XaRPPPW5yvBc2anlIs6xZSC87mlWlmAGigiOEjD+w3f1hdrTx
   LWLB/xR+TPi3OED8AOpX8AyDkaAVFZVjSWpdXQBdK7Ce6DKGe0jJ4/2qG
   DKHKoVC/TSRRMX7LiueiY9OMi+VnkKz+RfW4gdF66U/qIn5oTlAKrudEH
   ADXgX5cyH+pg9AmpscYCOWxoey2i7LJbTYgabQvYNM9VtPf8/UF6aseju
   g==;
X-CSE-ConnectionGUID: ddspYjdLSeGXVLx/+ItlZg==
X-CSE-MsgGUID: mfySuT55TmuwKIxKh5szvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413823"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413823"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:20 -0700
X-CSE-ConnectionGUID: rliA7+UoQA67MIHPMtjQng==
X-CSE-MsgGUID: /tn5Kmy+QcCP4rW0EHabaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019134"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2908E121CD5;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E89h-0PZX;
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
Subject: [PATCH v2 03/17] media: v4l2-subdev: Prepare for changes in getting frame descriptors
Date: Mon, 18 May 2026 19:43:03 +0300
Message-ID: <20260518164318.3367888-4-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62030-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E7F05712F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce v4l2_subdev_alloc_frame_desc() and v4l2_subdev_free_frame_desc()
to both facilitate implementing drivers that need frame descriptors as
well as prepare for having a larger number of frame descriptors.
If the remote sub-device does not support frame descriptors,
v4l2_subdev_get_frame_desc() creates one (with a single entry)
opportunistically, thus avoiding the need to add frame descriptor support
to sensor drivers the device for which only generates a single stream, or
managing the situation on the caller side.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 75 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 34 ++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d93ed50255ed..489c2ba0956f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -20,6 +20,7 @@
 #include <linux/version.h>
 #include <linux/videodev2.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -2671,6 +2672,80 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
 
+struct v4l2_mbus_frame_desc *
+v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			   enum v4l2_mbus_frame_desc_type type)
+{
+	struct v4l2_subdev_format subdev_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = pad,
+	};
+	int ret;
+
+	if (type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
+	    type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return ERR_PTR(-EINVAL);
+
+	struct v4l2_mbus_frame_desc *desc = kzalloc_obj(*desc, GFP_KERNEL);
+	if (!desc)
+		return ERR_PTR(-ENOMEM);
+
+	desc->type = type;
+
+	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
+		unsigned int type = desc->type;
+
+		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
+		if (ret < 0)
+			goto err_free;
+
+		if (desc->type != type) {
+			dev_dbg(sd->dev,
+				"wrong type of frame descriptor for pad %d (got %u, expected %u)\n",
+				pad, desc->type, type);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
+		return desc;
+	}
+
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_lock_and_get_active_state(sd);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
+	v4l2_subdev_unlock_state(state);
+	if (ret < 0)
+		goto err_free;
+
+	struct v4l2_mbus_frame_desc_entry *entry = &desc->entry[0];
+
+	entry->pixelcode = subdev_fmt.format.code;
+
+	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		ret = media_bus_fmt_to_csi2_dt(subdev_fmt.format.code);
+		if (ret < 0)
+			goto err_free;
+
+		entry->bus.csi2.dt = ret;
+	}
+
+	desc->num_entries = 1;
+
+	return desc;
+
+err_free:
+	v4l2_subdev_free_frame_desc(desc);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
+
+void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
+{
+	kfree(desc);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_free_frame_desc);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f84..e7127953ac22 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -8,6 +8,7 @@
 #ifndef _V4L2_SUBDEV_H
 #define _V4L2_SUBDEV_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/v4l2-subdev.h>
 #include <media/media-entity.h>
@@ -1778,6 +1779,39 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					   unsigned int pad,
 					   struct v4l2_mbus_frame_desc *fd);
 
+/**
+ * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
+ * @sd: The sub-device
+ * @pad: The number of the pad in @sd from which to obtain the frame descriptor
+ * @type: The type of the frame descriptor
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
+ * The caller is required to release the memory of the frame descriptor entries
+ * for each frame descriptor obtained by calling this function using
+ * v4l2_subdev_free_frame_desc().
+ *
+ * Return: The frame descriptor on success or a negative error code on failure.
+ */
+struct v4l2_mbus_frame_desc *
+v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			   enum v4l2_mbus_frame_desc_type type);
+
+/**
+ * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
+ * @desc: A pointer to a frame descriptor
+ *
+ * Release the frame descriptor.
+ */
+void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.47.3


