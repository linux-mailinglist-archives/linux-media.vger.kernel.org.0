Return-Path: <linux-media+bounces-26336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93939A3BADB
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660FC3A8116
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060E41B4F0C;
	Wed, 19 Feb 2025 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tQaHyekA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC211C173D;
	Wed, 19 Feb 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958270; cv=none; b=Xu7XmZkXErIMmmQkbDfabWuxV0eNg2cxAtiIJQhyRYM9GLq0Z80QjI/v09V35TMNZYjcCK6H/ewkRkvZ/EcLGFXUS8Vy6Dwd5h9xCMP0TrBFc64r/okfgizWWpIxakMxZw3k1LrNr3mqonpknlQ/zILuhLjoaCSfQ2URRwC0pT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958270; c=relaxed/simple;
	bh=gncnU/AtYxkwKrIf/446yLEgI4yxVWNbl8XMX/HLsKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJlexko0u2YjoqetHzev91VKTtB8JQxtXRq2PIXigaKWbsZvwOAkVVcGXCwNRB6FBI7ANBLMPV6UMw7plHbuc3S3IJA95MlFjdVuwFAV5LqEof3LXc80dqAGeIIRqv2RTOALGpNEZNpLcjgaau94HkDpmhXGb0LeeXCnyc3b+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tQaHyekA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DDF1514;
	Wed, 19 Feb 2025 10:43:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739958183;
	bh=gncnU/AtYxkwKrIf/446yLEgI4yxVWNbl8XMX/HLsKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tQaHyekATzbCkuAAPqI5c7NmqNADxYdheTXX2TBMybaqoJIFSFs0qiO8dqNQ0gXC5
	 Lq9bFRbg86siBe+URybpbky6ebnoWQCnASLvjySrFX1XuNxBJc7uVvQqyrtOM9SkNZ
	 72m/xqqHbodpTqlMsOM9u8IcFhx+goZT+UxFKWL4=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 11:44:07 +0200
Subject: [PATCH v2 1/3] media: subdev: Add v4l2_get_frame_desc_passthrough
 helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-frame-desc-passthrough-v2-1-5135d57ecd6a@ideasonboard.com>
References: <20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com>
In-Reply-To: <20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4819;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=gncnU/AtYxkwKrIf/446yLEgI4yxVWNbl8XMX/HLsKc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBntaf4V/65ak5LTln4Hu8UZEX9EACZbKp/pcYuc
 GDlRKMu25mJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7Wn+AAKCRD6PaqMvJYe
 9VHcD/90CuGfB5YqCSbY87PA9anGgdZGbpBIYdpSu++br7fL08Wne35jsLx/Gam92MpPHaTBMv0
 IZP5LqSmo04j1XaqCgymoM9flpEDmTHEQU6KSjRIlzsuQmGjpKCU12tLFx4NzU1wXAaPnf0hzV0
 lkTpLAmInF+XDgc4Uie4bj6Xg67fAW93hk1Yj7Wq6+QrlTs1RgpNGN66m5dCs5TZFtQ3D+7jBsY
 8enTCPJ48cWaxYVJTmUZX99XEH/qB/sMNye4OsXSdByqIcygnjSza+Zlp/Dmws5tWrQEEQbLvmz
 UB8AGjO63R8DcUl7AYPeRaxN/m36kAFTNCQkpSQ54xt0f3KIhWiQ3UZL7/xclhiOstPMfzXzShE
 yesWYwlvhc2DqXPxgoSw9qNnC1mvH9Yuc48mzaRzD0wdMEjX/C9OcwWWZSIUg84LQNT8K6lbrUy
 gTU5ZGUd392s9Bgzhxr8aQeWJb0/igpux3MxcLx1KP3LYWy2+7Cwda8ua3l/58qoyy9+XCQqTkR
 zw2DleYEWe1EiuPcWFVkS58nRFD8dnmIQ4oyCIxMrLgBqXgr6mZknYPV0JrWDTayX92HjumnxpX
 UauR+r0GEJd+9i8d4PVd6XDDCOKeG4Ab3a0kFSq/W33ZZQnPYeA1BX9QFsTRNuTyjqC1r3Qho1k
 G3uqBtbqbgi/wjQ==
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
index cde1774c9098..978037b84de4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2500,6 +2500,102 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
 
+int v4l2_get_frame_desc_passthrough(struct v4l2_subdev *sd, unsigned int pad,
+				    struct v4l2_mbus_frame_desc *fd)
+{
+	const struct media_pad *pads = sd->entity.pads;
+	struct media_pad *local_sink_pad;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
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


