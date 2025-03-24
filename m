Return-Path: <linux-media+bounces-28609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC2A6D5D0
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52D7916EB71
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC02F25D21F;
	Mon, 24 Mar 2025 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l6wgHDvx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D32505C3;
	Mon, 24 Mar 2025 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803506; cv=none; b=GYqXcUrtRnB3D42eQlvw6NVGOEd2e/NBZb0+X2TQq6CwQXNRZM9lCb+yKhzIfOxmRsWj/T+CL7fyElJSXNawDgIu+awtlSXQ+CiXCDWpXvCijaI3dRE9uJ8/oS7JzvOwZ4dsNSjM7i5ZLF0c2OBsqKzZELUBjFLq+JlZsA+ZrPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803506; c=relaxed/simple;
	bh=2AgGgd3+UZKSFw+Wwgnhw/YNDPJkEftVNvUe4+/jQ4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MD8hF/AXJt2lUQZqoZNjpOW0AljYtDPT+t5dMeyBgp77OpTz28jd/Mfjj80MxeuvIWof1mJDrFzc+TLpWMaZeJ+J9vVFSx1KP/52G5w+/FgFuIaiN2CUNtZzvV5lGi7niOG5XxMyKHcjg7KqnIKd/rfbqcaDdBV2CnSbRI6KOUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l6wgHDvx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8CCFA8F;
	Mon, 24 Mar 2025 09:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742803396;
	bh=2AgGgd3+UZKSFw+Wwgnhw/YNDPJkEftVNvUe4+/jQ4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l6wgHDvx4uZIdF10djav+nPWJd8iUHTbLfg4oqZl8PTk91ozwzCAmRTiz8yDxauV1
	 gzjeE07zrimlWEUFu2a0MhBh3G/Ldd+3Lzzky0u8Tur0gO/T7M1n96Bj2xruSPDx2t
	 uRTX8Tr9JcQU16UmBrpmvVE24QGHnAXSebzRYMtc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 10:04:44 +0200
Subject: [PATCH v4 1/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-frame-desc-passthrough-v4-1-dbe2412297cc@ideasonboard.com>
References: <20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com>
In-Reply-To: <20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5389;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=2AgGgd3+UZKSFw+Wwgnhw/YNDPJkEftVNvUe4+/jQ4w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4RIsw3YEQ6HvroWnZ4Su+6GFv5+FPGD92O/6M
 WntCCh6TomJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+ESLAAKCRD6PaqMvJYe
 9ZIHEACcdCg/na0iXeZuRbUHETP8yH5r4wEwDWySplTwDCzmopah5bOg1BorQ4VRCch71u/jZ0o
 SD6oz8bY4japqQj5Sbd948QdLYvaNQvKSIbrk/idSH63Umw9sAc4Ebn09RbIHMANEtKRpwDduNx
 MIRyrUspsQl6lBRZJuH39H7kLzAL/nvrhayDXeJvhFcySolnIviC85Tf/c+JKcsXtLqWbxlTY8y
 qPz+CizZJC2GV+AjGmUuH3weD0kjDW11tjkzuKecC7AazYLdDTy78NR6RypxawWEbn58MsAXx9T
 Q/ItvfX3cKrtb7FMgbneZP5aeQwknMUmCvXsDAkNDWenIyGQulB82ITFeyb3N/GqbXNFqzu5Sos
 o4G3d4/Wd3i272Nqy+2WIBt6myW1Mj/yUlPzo9VA+Ro6OWFu2QQebHvJOoD6iLyA7w9vOfd+k8t
 HfAOwbsDw1uq3x8JWzt+MjCN58v9guWM1noR5S+DF+sffUjT61XXppME9V9w8hcQv75jaVfSAHc
 WufS+uLLfmbDsafz+VQd5EMZ20Us8anWy5NyKR6DPqFKipraJ5J8BISnv0mnVl5iLZHkpxBr0SB
 NzwhcMsChbP+5roYo31T6OFd5jfScOsfkGo+VkPdVdwmhCKGPZ1QHGSu2YmWX+IrYcDaHx0W/mU
 fgLzNXgRJ5/ZYOQ==
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


