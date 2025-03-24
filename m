Return-Path: <linux-media+bounces-28605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19DA6D5AF
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4057D18934C9
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB90425D1ED;
	Mon, 24 Mar 2025 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="paIRsMG6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9109B1F92A;
	Mon, 24 Mar 2025 08:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803252; cv=none; b=pjv+1xAfbw4m7qXAp/zYmv328D6Oq6OYLS6CZtjbuMOmdhemUi8cXis0GO92aMCIeqmVSB8dmtFVKD/X1RNtcvL8XJLkKCEcEJ7eAL7goLcgm9et0jWeLJTSjWqEdO651rKxV5SIDFx9IMW1yxKX8QwqcODNUDkNdrGbg+u5GDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803252; c=relaxed/simple;
	bh=2AgGgd3+UZKSFw+Wwgnhw/YNDPJkEftVNvUe4+/jQ4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Al7O3ZyBE+N6PnLJamrAr49qXjVDi0FLX/Zg+22AeUV3hNibqHr28J024M+MDaGz5Mu7yXcVxOXknYeXijI0eCYqtOZ1nimuFo2ckVUGnMxLjBj2Upenh8HGwbEsBgGqDjyQBNOWZ3rFJEK94zXs9ekHc+JPuxivRJbKXAyVcQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=paIRsMG6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AB83A8F;
	Mon, 24 Mar 2025 08:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742803136;
	bh=2AgGgd3+UZKSFw+Wwgnhw/YNDPJkEftVNvUe4+/jQ4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=paIRsMG6NroOs3zc/2H6ExtjfZt/eGvi1p+4WT7UJzIZFMCbZ4X6+G7I8iOGoDBaV
	 rwg0uetQXIaDtzYxyzHPSpYEltMfgsLRHny80Qj7GzKsMA/cnPrhmXLjqa4JtdrXtf
	 OE3lTmhgIMkKIrOIL5XwvP8phgmiEbnQ+tcZB9A8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 10:00:11 +0200
Subject: [PATCH v3 1/3] media: subdev: Add v4l2_get_frame_desc_passthrough
 helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-frame-desc-passthrough-v3-1-993839a1f9b3@ideasonboard.com>
References: <20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com>
In-Reply-To: <20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5389;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=2AgGgd3+UZKSFw+Wwgnhw/YNDPJkEftVNvUe4+/jQ4w=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGfhESjIh3dE9y8BZItwtvDHZhpBwYAg3TJ0T4hRp2MmZ8TDq
 4kCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJn4REoAAoJEPo9qoy8lh71vBkP/RK6
 oNsERLugfCBEueXhSIRdJHo+QA4RsWvOpJoBsDsWfpcsUkVxdnXzbNTIMpLL05/bg8E9Hf9QP39
 VmzyviX55zUYw8DNC+gsLlF3c/O+XAmd2+XU3xLlf/clcGrfdYhLt9EqxpZi07tKT8yqh2z1/qc
 peICiw7Mz1sLGMW5BcRiCML7KYNOAvoHc9P/KJoA2A6R8I012rvzRoOAHScLd5fvxvbBbXHPzAV
 3yNqz0Vv/EK1a4yIJ7+hekJ1UK00NGYmbh+bL1uakVSZlYI1PEAG7ZeqMnhCjnQ2CKumgS2G3ci
 4nJLRqv/YkB2Ri+wVEHETjEu/REPuOPfbUe6iOf2al/QdFhB2MY6ZhC03CJXdLQk8Nm+4Y1eF6c
 im7RaDRabGC9WWmxRPDL3gDF9wm3mm2gtP/DHlAcMO7W+6OeOTIhXypP0H3WN28vRXOGy1Bi89f
 cAfwGq/WI4dyS4bpRWJuMR2AedZlST11q5v+nwLSpbZh9mSOhrIWwgXJucbsClQMVcSqUJJiTqL
 kPTbw5S+AMC0ISpPYLZS908BZmw2Jrba29ezlVWRM6ybHA4TOONS/BOlR5SPHxxc1oyQQdWZGzC
 qkpFL0L88roBmCbyeemwTdpvudQvigfYjAulyuUNO0M5br5X4275m/1ihydUyfyVjgXhCDzqVId
 Po7nQ
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add a helper for v4l2_subdev_pad_ops.v4l2_get_frame_desc operation. The
helper can be used when the subdevice directly passes through the
streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 113 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  22 +++++++
 2 files changed, 135 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a3074f469b15..a415d3234ca6 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2502,6 +2502,119 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
 
+int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
+					   unsigned int pad,
+					   struct v4l2_mbus_frame_desc *fd)
+{
+	const struct media_pad *pads = sd->entity.pads;
+	struct media_pad *local_sink_pad;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	struct device *dev = sd->dev;
+	int ret = 0;
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
+			struct media_pad *remote_source_pad;
+			struct v4l2_subdev *remote_sd;
+			unsigned int i;
+
+			if (route->source_pad != pad ||
+			    route->sink_pad != local_sink_pad->index)
+				continue;
+
+			if (!have_source_fd) {
+				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
+				if (!remote_source_pad) {
+					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
+						local_sink_pad->index);
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
+				if (ret) {
+					dev_err(dev,
+						"Failed to get frame desc from remote subdev %s\n",
+						remote_sd->name);
+					goto out_unlock;
+				}
+
+				have_source_fd = true;
+
+				if (fd->num_entries == 0) {
+					fd->type = source_fd.type;
+				} else if (fd->type != source_fd.type) {
+					dev_err(dev,
+						"Frame desc type mismatch: %u != %u\n",
+						fd->type, source_fd.type);
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
+				dev_dbg(sd->dev,
+					"Failed to find stream %u from source frame desc\n",
+					route->sink_stream);
+				ret = -EPIPE;
+				goto out_unlock;
+			}
+
+			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
+				dev_dbg(sd->dev, "Frame desc entry limit reached\n");
+				ret = -ENOSPC;
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
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 57f2bcb4eb16..7dc8625b131e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1748,6 +1748,28 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
  */
 int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
 
+/**
+ * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
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
+int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
+					   unsigned int pad,
+					   struct v4l2_mbus_frame_desc *fd);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */

-- 
2.43.0


