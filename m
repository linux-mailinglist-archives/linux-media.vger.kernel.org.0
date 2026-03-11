Return-Path: <linux-media+bounces-55381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHwoMoNdsWl/uQIAu9opvQ
	(envelope-from <linux-media+bounces-55381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA3263813
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15A853023D93
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1049A3B636E;
	Wed, 11 Mar 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jd+4XcBX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028CE3DDDB3;
	Wed, 11 Mar 2026 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231471; cv=none; b=JKTvt2CUMxrw6nIr7nJBaw2yXu3DGs0VCm5KUs4VDwSr5m74h7k720j7Ix3CnZiLZ3GSZbP+gmuuQJzELIHz3FhtnOZ8Oq6/oAPXpcytpGDTsee5kirc/7HCNaCsIfIGy0a/9/5RIhDX+RsLXSX3rrYcPrDa4rpu1RF9EMCosd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231471; c=relaxed/simple;
	bh=e3lYso7dj4B5pgKg5hTM58pUhKDdz29Jk7HP2OmRtwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogAaAwNgIMa7Ll3PMbLyD2nsmg8scNeTCtnGyJq//iwF/77A/KF4FvgDjabVgoXsS7E80yhNfFMKtYqZEevg3QjXS5WcjJKRP0QO1XbLibBxqSIFumIl5Tj+8nq1TRtG3b86L601+aPKE2DC7ik90kZWQ3CnLXOZhYB7cCg+3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jd+4XcBX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A5083DA;
	Wed, 11 Mar 2026 13:16:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773231399;
	bh=e3lYso7dj4B5pgKg5hTM58pUhKDdz29Jk7HP2OmRtwg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jd+4XcBXE7RDlZDM7Re+ocycV5wgYXVveHvgOx8V4y3PdyupyxtfYnwDrN4r6w1HG
	 Bn/OjKqaJYjSf7OYrHDpSDdemX+Z7mxNlIKiOB/mMrZwYnFP0IDV4AFjQikr4A2C//
	 hksNawBmnbXHobenqfMwWjuS2qAtuDX33YoPI34g=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 14:17:19 +0200
Subject: [PATCH v5 1/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-frame-desc-passthrough-v5-1-d59876bbb663@ideasonboard.com>
References: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
In-Reply-To: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5639;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=e3lYso7dj4B5pgKg5hTM58pUhKDdz29Jk7HP2OmRtwg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsV1o7OY+L+vrBN4mi20QzBRTplYHsBtKvRCQd
 Drzhxe/yciJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFdaAAKCRD6PaqMvJYe
 9ebmD/4zq5v6ABjHRZp9FzzLHV2pzrSqBDh3auWipOFn3ydZCQ9tMqjunP3HEBKiwTtM0RjyX3c
 wQfFH31wBNUgiy2nQ7ULDCb4mZCQzktbWJqyr9fbu92Ftlu+N9C629IhbIEeQACSG97/ggMxlcw
 41IOccSe5RwtScYZSadmtPgAUoV1495hSsecEEG/tzurJ9eeehWiqen7JkWW9WcpwpqaUQIR2he
 Y9Wxm0mHMzAEkUMJEvCdyD/MfX+o4bTNauog4v4oh81UZ/BWqnIvf4q7y29T3LKR+DPg9YJ/OAF
 X+V5bhCj4sGu7CSgQoMLBRMXisp8VFM+MKSX/a8lrdIsrZ60LvFHoF43LG16L8jnifB3PQZKcdI
 GJc1GErat6zuTrx3MchMyguQvSTB0e5TKRfFH+7ePZU4WGxmKBh/Bz52V90ht7/+8Whvm7p6kP6
 cxkdukZZx9aoujIggjyuRDG9dfkXzg3R3dnncncnswHMKQ7Jv4DeYltYnZBF8d8AVBru7Y/p+E1
 HWsdtCU1wFNzEev5QBN5xW4gSYpxabS2hEukkWGJIM+YEdQlTb8B5+sR/wMS+hHkhRxg1NpQtQj
 94oq1K8jnFp/fhg5VqM/oPtgShS+kXEMdpktG3OlgHLOAm3KIqZu0B4+q9QD+q8FbA5x49aDWb+
 ioIAFWaL/BnMDCA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 3FCA3263813
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55381-lists,linux-media=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

Add a helper for v4l2_subdev_pad_ops.get_frame_desc operation. The
helper can be used when the subdevice directly passes through the
streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 111 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  28 +++++++++
 2 files changed, 139 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 32e6f60e26c7..2757378c628a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2545,6 +2545,117 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
 
+int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
+					   unsigned int pad,
+					   struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *local_sink_pad;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	struct device *dev = sd->dev;
+	int ret = 0;
+
+	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
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
+			for (unsigned int i = 0; i < source_fd.num_entries; i++) {
+				if (source_fd.entry[i].stream == route->sink_stream) {
+					source_entry = &source_fd.entry[i];
+					break;
+				}
+			}
+
+			if (!source_entry) {
+				dev_dbg(dev,
+					"Failed to find stream %u from source frame desc\n",
+					route->sink_stream);
+				ret = -EPIPE;
+				goto out_unlock;
+			}
+
+			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
+				dev_dbg(dev, "Frame desc entry limit reached\n");
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
index a37d9a847196..23c03ba7f84c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1722,6 +1722,34 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
  */
 int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
 
+/**
+ * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
+ *	get_frame_desc operation in simple passthrough cases
+ * @sd: The subdevice
+ * @pad: The source pad index
+ * @fd: The mbus frame desc
+ *
+ * This helper implements get_frame_desc operation for subdevices that pass
+ * streams through without modification. It can be assigned directly as the
+ * .get_frame_desc callback in &v4l2_subdev_pad_ops.
+ *
+ * The helper iterates over the subdevice's sink pads, calls get_frame_desc on
+ * the remote subdevice connected to each sink pad, and collects the frame desc
+ * entries for streams that are routed to the given source pad according to the
+ * subdevice's routing table. Each entry is copied as-is from the upstream
+ * source, with the exception of the 'stream' field which is remapped to the
+ * source stream ID from the routing table.
+ *
+ * The frame desc type is taken from the first upstream source. If multiple
+ * sink pads are involved and the upstream sources report different frame desc
+ * types, -EPIPE is returned.
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


