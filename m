Return-Path: <linux-media+bounces-26298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7ECA3A255
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 17:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 764987A2F4E
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 16:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAD826E651;
	Tue, 18 Feb 2025 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t2AoU1Tn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB831ABEC5;
	Tue, 18 Feb 2025 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739895361; cv=none; b=Yp26J+jbHrVFs4KCuPopvgUFqgRu7D7jhUYYdwC/z49DjDjx9pdiHcafGRHqJz6H7hg45FcdOWNSolo65hmhMr+YL/emMN+1UzGy/zIz7SgLoy3Sn3N0rlIwIfEaODZlUj1uDnEWA9nW2phJ35jMj3emQcZIX+7fp8rX4H2UYoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739895361; c=relaxed/simple;
	bh=xm1LX+Al9kkNJP4WHSG1A4aBX5Q0NSz2MZYYWtl1FHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8GVhpLNmdt+fd8Ldx8nmJ7UHUvFWPPUl6UOMC9xO7pBsRG5gOgv8YJeCjAfoo8RK6BXMac6AzSOz1pSbWazeTyb+3ncXt1silWlnspzHOzZ+CSQrzU7f58jrxC3i3KjSUmmLDvWjD4DuGNPtxMx/A1DhpgBjF6Vo4aeifux9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t2AoU1Tn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4966763F;
	Tue, 18 Feb 2025 17:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739895269;
	bh=xm1LX+Al9kkNJP4WHSG1A4aBX5Q0NSz2MZYYWtl1FHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t2AoU1TnXCJyIOSUffiwdbRpyxXGzdwiQg1kqxAOWp4tEUGMp9apbLbp98jg56JCm
	 P7QXS3ag5jRgQozzblEhHDi1O+iHpHZCwQkKsxbTr2nMknhWLagfbKyu1KPSh40/2e
	 qR3hBOqUSkJVTRwSp/m0//7T+btxj1ksmcFZrbJk=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 18 Feb 2025 18:15:43 +0200
Subject: [PATCH 1/3] media: subdev: Add v4l2_get_frame_desc_passthrough
 helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-frame-desc-passthrough-v1-1-a32458f53714@ideasonboard.com>
References: <20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com>
In-Reply-To: <20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4815;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=xm1LX+Al9kkNJP4WHSG1A4aBX5Q0NSz2MZYYWtl1FHA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBntLI19ZAUPpNwW08wW7t26oiO+kPyaU0APgQq2
 tKLQgg7+GmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7SyNQAKCRD6PaqMvJYe
 9WyxD/9ywjre62km7nzShd7wd2p/76C37ufemY+je01FsD7WCKT/sBMayDugvFQsq+cUFb+LyUu
 7RVbTnrXyLMavZXfmO0TWEZKQgQjObDkuxjfAQt22NVpgajvfd9HbS3Ghy4J37Za+RheDBbtVRU
 d2mZtgFVDm4hiEXioCWCAin5LbgWSU0UkOzsH3hcvUdmY5b6CInSXOmo2oNHCq8aykyNrpmOPPc
 cbI0eQyOrYyoPNesO9sAu/ZjniQ/rKbaR4giVNzsDEWEu/4pXIylExvTh/i8QaA8YtXcuxZTe2G
 d1yqyYl+ZZSqzWsymxslbBmDPMiIeFVprpQ8kzq8xDagrS3teXqaq0K+ml0m4TxIxgYFrQct8YS
 Nkq4/dWjfhk3St+4CtD+iqlXDEZokoCb0YkEu27O7mS0cnnCFecHs+0KB8EjWuxRtvw2/web+od
 k8Wuv+268bz/a29IGQcbiCcinV5ha1fNVnI78L9/VbatuFJ8D+hjlzBuG9KaoNtmxk00F7R3o4h
 72IUZqz0+3gngC/pb5RM1mKGqsItAiifMvkv1TRcqRztg0mpEXni40+VJObC51qysQhsOmeB7WP
 yaOb7Zs6/QJE9v46iEqIAsDY0iSZq0wF6AcENlriViJOJ8L+Sp+49pVFeiVxW43R7KNk/K7Lfza
 zfJGFAt5SlR7eDw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add a helper for v4l2_subdev_pad_ops.v4l2_get_frame_desc operation. The
helper can be used when the subdevice directly passes through the
streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 21 ++++++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index cde1774c9098..f04de851d777 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2500,6 +2500,102 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
 
+int v4l2_get_frame_desc_passthrough(struct v4l2_subdev *sd, unsigned int pad,
+				    struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret;
+	const struct media_pad *pads = sd->entity.pads;
+	struct media_pad *local_sink_pad;
+
+	if (WARN_ON(!(pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	/* Iterate over sink pads */
+	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
+		struct v4l2_mbus_frame_desc source_fd;
+		bool have_source_fd = false;
+
+		if (!(local_sink_pad->flags & MEDIA_PAD_FL_SINK))
+			continue;
+
+		/*
+		 * Copy frame desc entries for the streams going from the sink
+		 * pad to the requested pad
+		 */
+		for_each_active_route(&state->routing, route) {
+			struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+			unsigned int i;
+			struct media_pad *remote_source_pad;
+			struct v4l2_subdev *remote_sd;
+
+			if (route->source_pad != pad ||
+			    route->sink_pad != local_sink_pad->index)
+				continue;
+
+			if (!have_source_fd) {
+				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
+				if (!remote_source_pad) {
+					ret = -EINVAL;
+					goto out_unlock;
+				}
+
+				remote_sd = media_entity_to_v4l2_subdev(remote_source_pad->entity);
+				if (!remote_sd) {
+					ret = -EINVAL;
+					goto out_unlock;
+				}
+
+				ret = v4l2_subdev_call(remote_sd, pad,
+						       get_frame_desc,
+						       remote_source_pad->index,
+						       &source_fd);
+				if (ret)
+					goto out_unlock;
+
+				have_source_fd = true;
+
+				if (fd->num_entries == 0) {
+					fd->type = source_fd.type;
+				} else if (fd->type != source_fd.type) {
+					ret = -EPIPE;
+					goto out_unlock;
+				}
+			}
+
+			for (i = 0; i < source_fd.num_entries; i++) {
+				if (source_fd.entry[i].stream == route->sink_stream) {
+					source_entry = &source_fd.entry[i];
+					break;
+				}
+			}
+
+			if (!source_entry) {
+				dev_err(sd->dev,
+					"Failed to find stream %u from source frame desc\n",
+					route->sink_stream);
+				ret = -EPIPE;
+				goto out_unlock;
+			}
+
+			fd->entry[fd->num_entries] = *source_entry;
+
+			fd->entry[fd->num_entries].stream = route->source_stream;
+
+			fd->num_entries++;
+		}
+	}
+
+out_unlock:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_get_frame_desc_passthrough);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2f2200875b03..d42fb3f55515 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1746,6 +1746,27 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
  */
 int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
 
+/**
+ * v4l2_get_frame_desc_passthrough() - Helper to implement the subdev
+ *	v4l2_get_frame_desc operation in simple passthrough cases
+ * @sd: The subdevice
+ * @pad: The source pad index
+ * @fd: The mbus frame desc
+ *
+ * Subdevice drivers that only pass through the streams can use this helper
+ * to implement the &v4l2_subdev_pad_ops.v4l2_get_frame_desc operation.
+ *
+ * The helper will call get_frame_desc on the subdevice's sources, create a new
+ * frame desc which contains only the streams on the given source pad. The data
+ * for each frame desc entry is copied directly from the data provided from the
+ * calls to the subdevice's sources, with the exception of the 'stream' field
+ * which is set according to the subdevice's routing table.
+ *
+ * Return: 0 on success, or a negative error code otherwise.
+ */
+int v4l2_get_frame_desc_passthrough(struct v4l2_subdev *sd, unsigned int pad,
+				    struct v4l2_mbus_frame_desc *fd);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */

-- 
2.43.0


