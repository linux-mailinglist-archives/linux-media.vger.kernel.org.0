Return-Path: <linux-media+bounces-61379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLGoHllWBGqMHAIAu9opvQ
	(envelope-from <linux-media+bounces-61379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E10825318F0
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F176C30D3ADD
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C62B3FA5C7;
	Wed, 13 May 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6jfuUwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936843E7157
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669048; cv=none; b=DFVOvkWeFy/3XI5gB5VqjsZOJ3S4avOWWeKMiI0Rhq1aCZTEotvt95usqhT+Tf7r7EJg60hdlzscnC4kK0xEThratEMZ6bLOLPN7xFXrV+0G5+cz4COMkFwuKKpEmBVHjGo7IamoMIBCQ6po8FioJXJaZO0v22SMamoelPfd4Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669048; c=relaxed/simple;
	bh=tGxoyBoEwXIJMa9rFb8C5p/Afu0SHyabvfzCouLDMZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RcO4XsR/Fl+dlnOtLjERuGOVCEK7uqz236gE3h4ecJA9/1cm79cc1ERhX5ErE7m96tFYUaimK88h0aVSZozP02ZM7ebEMXy+F+Et7yWCHRjBOILFZeEzEc1hdDKkptXDuBN7FWXirlxMvduAClVZ0FTGu7SrYFw73kyYq7L+OF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6jfuUwJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669047; x=1810205047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tGxoyBoEwXIJMa9rFb8C5p/Afu0SHyabvfzCouLDMZQ=;
  b=D6jfuUwJHVf3+u/R15P9YwEUHSipkTa3YakD2hQggDqnMv4dNYBLV16D
   a7FiMFU4cxiBaj26YNgU7xTcKGYsooLOc6PAmXGeDugoxT/+U6R7muRLC
   0Sr+Z/FlVuvxP1eaLIqoHVNg4eCuNlLz5adcUVyZAh0iOqZmGFl2SH/1v
   BogG+u8JeFw37NsjSta+IxbbgTvJCYT4+DAkhhyS13omkbqKaCRyRbzb0
   jb3zKEfpU7xbKDUB6BHwzNfgbXk3s61a7Nc7XsvprF8mCa7RN440uiapt
   +uxpaySUgtTOtRzop6KmvqFwGL3Av2+tzsgMaY28qSaf5IHagCq2Iugy4
   Q==;
X-CSE-ConnectionGUID: IDKeVeHzRAmVD/esy3u4vA==
X-CSE-MsgGUID: mnnNAxtkSh2ERriOGk1/XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464450"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:04 -0700
X-CSE-ConnectionGUID: heuzOXJpRuy6AAmawCYFsw==
X-CSE-MsgGUID: 9zoq8CJoQM6g3F9qOhhXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599244"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C5000121CE2;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1K-355B;
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
Subject: [PATCH 04/17] media: v4l2-subdev: Allocate frame descriptors based on the need
Date: Wed, 13 May 2026 13:43:45 +0300
Message-ID: <20260513104358.2252605-5-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: E10825318F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61379-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Frame descriptors entries require a small amount of memory per entry (20
bytes), but if the number of entries in a frame descriptor is large, an
unreasonably large amount of memory would need to be allocated in the
stack. Therefore the number of entries has been limited to 8.

Support larger frame descriptors by allocating as much memory as required.
The get_frame_desc() op can now set the num_entries to a number larger
than V4L2_FRAME_BUS_ENTRY_MAX and return -ENOSPC. The caller,
v4l2_subdev_get_frame_desc(), will then allocate memory for that amount of
memory and call the get_frame_desc() op again.

The caller is also responsible for releasing the allocated memory by
calling v4l2_subdev_free_frame_desc().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 49 +++++++++++++++++++++------
 include/media/v4l2-subdev.h           | 44 +++++++++++++++++++-----
 2 files changed, 74 insertions(+), 19 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b8acce8f9c33..012ff6fb2988 100644
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
 
@@ -362,16 +359,38 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EOPNOTSUPP;
 #endif
 
+	type = fd->type;
 	memset(fd, 0, sizeof(*fd));
+	if (!fd->entry) {
+		fd->entry = fd->entry_mem;
+		fd->len_entries = ARRAY_SIZE(fd->entry_mem);
+	}
 
 	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
+	if (ret == -ENOSPC) {
+		if (fd->num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC &&
+		    fd->num_entries < V4L2_FRAME_DESC_ENTRY_MAX) {
+			fd->entry = kzalloc_objs(*fd->entry, fd->num_entries,
+						 GFP_KERNEL);
+			if (!fd->entry)
+				return -ENOMEM;
+
+			fd->len_entries = fd->num_entries;
+			fd->num_entries = 0;
+
+			ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
+		} else {
+			return -E2BIG;
+		}
+	}
 	if (ret)
 		return ret;
 
 	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
-		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
-		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
-		"unknown");
+		type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
+		type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" : "unknown");
+
+	fd->type = type;
 
 	for (i = 0; i < fd->num_entries; i++) {
 		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
@@ -1086,9 +1105,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
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
@@ -2638,7 +2657,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				return -EPIPE;
 			}
 
-			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
+			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
 				return -E2BIG;
 			}
@@ -2730,6 +2749,16 @@ int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
 
+void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
+{
+	if (desc->entry != desc->entry_mem)
+		kfree(desc->entry);
+
+	desc->entry = NULL;
+	desc->len_entries = desc->num_entries = 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_free_frame_desc);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c9e74566c85a..bd97510c7024 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -365,11 +365,13 @@ struct v4l2_mbus_frame_desc_entry {
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
@@ -392,13 +394,17 @@ enum v4l2_mbus_frame_desc_type {
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
@@ -780,7 +786,13 @@ struct v4l2_subdev_state {
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
+ *		    shall return -ENOSPC.
  *
  * @set_frame_desc: set the low level media bus frame parameters, @fd array
  *                  may be adjusted by the subdev driver to device capabilities.
@@ -1793,11 +1805,25 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
  *
  * The caller is required to set @desc->type to the expected bus type.
  *
+ * The entries in the frame descriptor are allocated based on the need. The
+ * caller is required to release the memory of the frame descriptor entries for
+ * each frame descriptor obtained by calling this function using
+ * v4l2_subdev_free_frame_desc().
+ *
  * Return: %0 on success or negative error code on failure.
  */
 int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_mbus_frame_desc *desc);
 
+/**
+ * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
+ * @desc: A pointer to a frame descriptor
+ *
+ * Release the frame descriptor entries in a frame descriptor. The number of
+ * entries in the descriptor are set to 0 again.
+ */
+void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.47.3


