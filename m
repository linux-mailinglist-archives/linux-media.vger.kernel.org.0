Return-Path: <linux-media+bounces-62039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFdxExtDC2qsFAUAu9opvQ
	(envelope-from <linux-media+bounces-62039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:49:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0AA57130F
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C3303090381
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C84C48C3FE;
	Mon, 18 May 2026 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nS7/Zi6b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF548BD3E
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122614; cv=none; b=RwY3hZTA+QouXXRTYs1qX8P1KJCHWGTxf+/9wwF1QnbhYyoCZDWpAgAv2k4xr5BjWlHeJY8qFn7jOBD0W51F+eARwHHRKMoZK6h8LK74Ga+r5VptKydMbjIzYYjGETSqwdMJR2+FfYs7ist+mhN/IhP3h4xMMyPnQsi5h90b4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122614; c=relaxed/simple;
	bh=Q890LSvhEYf4gYeG+6Qonnwf1F9gOIklCciwEstPisU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8T54MxYVW5sXoL229BLhx0Df2McBGybWz39XvulB+goBSrue36mIyx0/CDvciG4OUl4sSvgzl4EkymoVkKiNUq+TK0yhPs+kO8ioWw7HVUkumNA2QBqF+YFqey03TLbC1uJOu2zfRmP2GNYpSQtRJqwu/f9LKZCyB0NijGAwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nS7/Zi6b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122612; x=1810658612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q890LSvhEYf4gYeG+6Qonnwf1F9gOIklCciwEstPisU=;
  b=nS7/Zi6bOJTKmtkOqh7tgSuOKlnNMBQm0t7ig9cNH/UHzJ1kbWS9R6YU
   dFlMogzFIIYIm2PjbOl6u8L0bhAZou8x/b+UhTVFWpodIRDnufzqrHmIJ
   u7D9J4H2nVkkL32eYU/PYDEGU5mE7PZgqwZZnI0TRNEL1SL90E4su9fB1
   TuwkoBacfhuqBLEcPDMYcYxSbjyiCx8qpmD44bO6dd0SdyzmRCsozxVRd
   eJCEQ8dBm3Z6W84f+bjcRHKVa2CQB2BDA8dGDURdOPtViyJ7k60vifRa/
   I2WLDeLK7SVLjD1n9wSCGXbA0GPzg6SjPaE6u40V/RoBKR1ZOHbi+RJmb
   w==;
X-CSE-ConnectionGUID: tLYm+7IOS9yBc2TK2hw3Dg==
X-CSE-MsgGUID: 22nvBKyWRYC1Jr4GtYdGaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413853"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413853"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:29 -0700
X-CSE-ConnectionGUID: YEb02433Rqy14iE53SXLLg==
X-CSE-MsgGUID: 84zBbH6mRmyjAWDhb7TuFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019212"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:23 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2FF9C121CEA;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E89p-0XlF;
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
Subject: [PATCH v2 05/17] media: v4l2-subdev: Allocate frame descriptors based on the need
Date: Mon, 18 May 2026 19:43:05 +0300
Message-ID: <20260518164318.3367888-6-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-62039-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC0AA57130F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Frame descriptors entries require a small amount of memory per entry (20
bytes), but if the number of entries in a frame descriptor is large, an
unreasonably large amount of memory would need to be allocated in the
stack. Therefore the number of entries has been limited to 8.

Support larger frame descriptors by allocating as much memory as required.
The get_frame_desc() op can now set the num_entries to a number larger
than V4L2_FRAME_BUS_ENTRY_PREALLOC and return -ENOSPC. The caller,
v4l2_subdev_get_frame_desc(), will then allocate memory for that amount of
memory and call the get_frame_desc() op again.

The caller is also responsible for releasing the allocated memory by
calling v4l2_subdev_free_frame_desc().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 60 +++++++++++++++++++++------
 include/media/v4l2-subdev.h           | 39 +++++++++++------
 2 files changed, 75 insertions(+), 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 489c2ba0956f..da8464dfb265 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -63,10 +63,6 @@ static bool v4l2_subdev_enable_streams_api;
 /*
  * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
  * of streams.
- *
- * Note that V4L2_FRAME_DESC_ENTRY_MAX is related: V4L2_FRAME_DESC_ENTRY_MAX
- * restricts the total number of streams in a pad, although the stream ID is
- * not restricted.
  */
 #define V4L2_SUBDEV_MAX_STREAM_ID 63
 
@@ -354,6 +350,7 @@ static int call_set_frame_interval(struct v4l2_subdev *sd,
 static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_mbus_frame_desc *fd)
 {
+	unsigned int type;
 	unsigned int i;
 	int ret;
 
@@ -362,16 +359,41 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EOPNOTSUPP;
 #endif
 
-	memset(fd, 0, sizeof(*fd));
+	type = fd->type;
+	memset_after(fd, 0, type);
+	fd->entry = fd->entry_mem;
+	fd->len_entries = ARRAY_SIZE(fd->entry_mem);
 
 	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
+	if (ret == -ENOSPC) {
+		if (fd->num_entries <= V4L2_FRAME_DESC_ENTRY_PREALLOC ||
+		    fd->num_entries > V4L2_FRAME_DESC_ENTRY_MAX)
+			return -E2BIG;
+
+		fd->entry = kzalloc_objs(*fd->entry, fd->num_entries,
+					 GFP_KERNEL);
+		if (!fd->entry)
+			return -ENOMEM;
+
+		fd->len_entries = fd->num_entries;
+		fd->num_entries = 0;
+
+		ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
+	}
 	if (ret)
 		return ret;
 
+	if (type == V4L2_MBUS_FRAME_DESC_TYPE_UNDEFINED) {
+		type = fd->type;
+	} else if (type != fd->type) {
+		dev_dbg(sd->dev, "Expected frame descriptor type %u, got %u\n",
+			type, fd->type);
+		return -EINVAL;
+	}
+
 	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
-		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
-		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
-		"unknown");
+		type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
+		type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" : "unknown");
 
 	for (i = 0; i < fd->num_entries; i++) {
 		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
@@ -1086,9 +1108,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		 * descriptor accordingly, with up to one entry per route. Until
 		 * the frame descriptors entries get allocated dynamically,
 		 * limit the number of active routes to
-		 * V4L2_FRAME_DESC_ENTRY_MAX.
+		 * V4L2_FRAME_DESC_ENTRY_PREALLOC.
 		 */
-		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_PREALLOC)
 			return -E2BIG;
 
 		/*
@@ -2638,7 +2660,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				return -EPIPE;
 			}
 
-			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
+			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
 				return -E2BIG;
 			}
@@ -2707,6 +2729,14 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			goto err_free;
 		}
 
+		if (desc->num_entries > desc->len_entries) {
+			dev_dbg(sd->dev,
+				"too many frame descriptors; got %u, expected at most %u\n",
+				desc->num_entries, desc->len_entries);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
 		return desc;
 	}
 
@@ -2717,7 +2747,10 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (ret < 0)
 		goto err_free;
 
-	struct v4l2_mbus_frame_desc_entry *entry = &desc->entry[0];
+	desc->entry = desc->entry_mem;
+	desc->len_entries = ARRAY_SIZE(desc->entry_mem);
+
+	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
 
 	entry->pixelcode = subdev_fmt.format.code;
 
@@ -2742,6 +2775,9 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
 
 void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
 {
+	if (desc->entry != desc->entry_mem)
+		kfree(desc->entry);
+
 	kfree(desc);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_free_frame_desc);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c10ca3f5d979..f9b121eefa92 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -366,11 +366,13 @@ struct v4l2_mbus_frame_desc_entry {
 	} bus;
 };
 
- /*
-  * If this number is too small, it should be dropped altogether and the
-  * API switched to a dynamic number of frame descriptor entries.
-  */
-#define V4L2_FRAME_DESC_ENTRY_MAX	8
+/* Size of the statically allocated frame descriptor array. */
+#define V4L2_FRAME_DESC_ENTRY_PREALLOC	8
+/*
+ * Maximum number of dynamically allocated frame descriptors. Note that
+ * V4L2_SUBDEV_MAX_STREAM_ID is related to this limit as well.
+ */
+#define V4L2_FRAME_DESC_ENTRY_MAX	64
 
 /**
  * enum v4l2_mbus_frame_desc_type - media bus frame description type
@@ -393,13 +395,17 @@ enum v4l2_mbus_frame_desc_type {
 /**
  * struct v4l2_mbus_frame_desc - media bus data frame description
  * @type: type of the bus (enum v4l2_mbus_frame_desc_type)
- * @entry: frame descriptors array
- * @num_entries: number of entries in @entry array
+ * @entry_mem: memory for the frame descriptors (@entry)
+ * @entry: pointer to the frame descriptors
+ * @num_entries: number of entries in @entry
+ * @len_entries: number of entries allocated for @entry
  */
 struct v4l2_mbus_frame_desc {
 	enum v4l2_mbus_frame_desc_type type;
-	struct v4l2_mbus_frame_desc_entry entry[V4L2_FRAME_DESC_ENTRY_MAX];
+	struct v4l2_mbus_frame_desc_entry entry_mem[V4L2_FRAME_DESC_ENTRY_PREALLOC];
+	struct v4l2_mbus_frame_desc_entry *entry;
 	unsigned short num_entries;
+	unsigned short len_entries;
 };
 
 /**
@@ -781,7 +787,14 @@ struct v4l2_subdev_state {
  * @link_validate: used by the media controller code to check if the links
  *		   that belongs to a pipeline can be used for stream.
  *
- * @get_frame_desc: get the current low level media bus frame parameters.
+ * @get_frame_desc: get the current low level media bus frame parameters. The
+ *		    callback is required to update the num_entries field to the
+ *		    total number of entries in the frame descriptor. The
+ *		    callback shall fill the first entries array up to
+ *		    len_entries, which signifies the number of entries
+ *		    allocated. If num_entries exceeds len_entries, the callback
+ *		    shall return -ENOSPC. Never call this directly in drivers,
+ *		    use v4l2_subdev_get_frame_desc() instead.
  *
  * @set_frame_desc: set the low level media bus frame parameters, @fd array
  *                  may be adjusted by the subdev driver to device capabilities.
@@ -1794,8 +1807,9 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
  *
  * The caller is required to set @desc->type to the expected bus type.
  *
- * The caller is required to release the memory of the frame descriptor entries
- * for each frame descriptor obtained by calling this function using
+ * The entries in the frame descriptor are allocated based on the need. The
+ * caller is required to release the memory of the frame descriptor entries for
+ * each frame descriptor obtained by calling this function using
  * v4l2_subdev_free_frame_desc().
  *
  * Use __free() to release the frame descriptor automatically::
@@ -1813,7 +1827,8 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
  * @desc: A pointer to a frame descriptor
  *
- * Release the frame descriptor.
+ * Release the frame descriptor entries in a frame descriptor as well as the
+ * frame descriptor itself.
  */
 void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
 
-- 
2.47.3


