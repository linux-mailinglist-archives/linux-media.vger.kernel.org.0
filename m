Return-Path: <linux-media+bounces-56056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNmzMPVEuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:11:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82E2A998A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C9F83024A03
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD923BD23F;
	Tue, 17 Mar 2026 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H0U4AvRp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420623BC674;
	Tue, 17 Mar 2026 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749401; cv=none; b=QFtgmI28MJfugoyqd3bpjZUxDCQ3oIi8qzQuQhWjJvtZpF2vlAsKD40J1IwkYS+YbeVSupYY2u9JbsawYMvR0WKUmAmZg6upJV8LAthQnhJn/UkwMRhp625lKVmlrldCQCY2weQj23tLEOwmql6GSt1v+LRXvMZxmpDh4yXAngk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749401; c=relaxed/simple;
	bh=cWXO8R44lS302LlLp0FBwxZcXLjXHWDn8I6yXfunBBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXuXdv3Ow94GDpEgzy89Q6owCqdn3rOlXp3z7xlrDD7cU7JwkQDLFEVzAtuGtoP8YJNFzK0HAczMcx6yNVBPrAf7CZB0ImKUuA5zHzk+GizlQjMJFznV5TSPyefzr1j3v/98d3uJeEDAk8djrgoxiCHeaMMkshs2ZbXz6LJBhWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H0U4AvRp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A32AC6C;
	Tue, 17 Mar 2026 13:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773749324;
	bh=cWXO8R44lS302LlLp0FBwxZcXLjXHWDn8I6yXfunBBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H0U4AvRpelfkBPuuy1zHgTPQWa2X23wKgHzXeUFOCtycfRqBEBetS0gs1jSvBsjbm
	 1H6W1IQ73oSwbXO/rTkpOv7YwL+uFJx09kdzT+oHJ7um1U7dtbCOdpaUUBNrqaMO6E
	 x4OC8ngXRleYJq1x2Yry5kiNhk9dvVa4Z5Jnv6q4=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 17 Mar 2026 14:09:42 +0200
Subject: [PATCH v2 3/3] media: subdev: Split
 v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-frame-desc-passthrough-impro-v2-3-0c93b437d85d@ideasonboard.com>
References: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
In-Reply-To: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8102;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=cWXO8R44lS302LlLp0FBwxZcXLjXHWDn8I6yXfunBBs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpuUSRGvmnJGgDzn7WbiYXoE1AiHTYQLsLIkL6F
 0RoLvFWKI+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCablEkQAKCRD6PaqMvJYe
 9cP9EACcldRYRHtx3Jdro4a1h89CLNGpjtHGFAjo+Wa7Sab2APDWPTC/E0w4UHhnWWnaQnmrNY+
 7qL8yVrfEZCtzcsBWih9zPD5M+mTCSYhDovQG6eyQVw32xjh8f2Xq0d95wp9mUDUTVugfCQ27RK
 a3SzPM5cW6AxC2smH0eX/BaourxwEH7vMzx5JW85lmsFQlSO7+R99zPIJYpD08uDPTxajoXIs4X
 cx0O+CDSnXDQmICxqU94RynkpzTjTLoWwTJQqMFLyqH2SregxtpPvi2c6c0MzALMcyJCJaSQzV+
 oAenADPJZeAL+8/5tFGpyO28+UMcN0bPG9tjH9l9S5F4K5UtZZfbUnlZCOidJ9E8vzZgQjfT5/b
 VcAonvtOpolDZQi2/wuCYLIvFntzYHHDXA3brQZZpMcQbEZ/Op9Ir43rPjb19/pSXJBV32GvZ2l
 NzF4xCtpFXim8xEm4DOMLZOzL4NqDYt4s3up2rd+hMeuO/mqlaTNG3tDkmrVdMXo8A+/VSP9kVH
 MMBKayNSUy73LYOPp03xgJBynF4Hh4XK02Nlr11XYMpHb1KHfrgdLoSyLMEqxH17CoG2cBqruFE
 aoSvDCO2lFrrMlcxC7ezSV1Bi7X7JskLeK58k4GcQK3bWS64AsXu67iTfx3aSeo0/J1RaWvs2Q5
 LQ3aiZScGU1msLg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56056-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: CB82E2A998A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The recently added v4l2_subdev_get_frame_desc_passthrough() can be used
directly as an implementation for .get_frame_desc subdev op. However, in
some cases the drivers may want to add some customizations, while the
bulk of the work is still identical to what
v4l2_subdev_get_frame_desc_passthrough() does. Current locking scheme
makes this impossible to do properly.

Split v4l2_subdev_get_frame_desc_passthrough() into two functions:

__v4l2_subdev_get_frame_desc_passthrough(), which takes a locked subdev
state as a parameter, instead of locking and getting the active state
internally. Other than that, it does the same as
v4l2_subdev_get_frame_desc_passthrough() used to do.

v4l2_subdev_get_frame_desc_passthrough(), which locks the active state
and calls __v4l2_subdev_get_frame_desc_passthrough().

In other words, v4l2_subdev_get_frame_desc_passthrough() works as
before, but drivers can now alternatively add custom .get_frame_desc
code and call v4l2_subdev_get_frame_desc_passthrough().

An example use case is with DS90UB953 serializer: in normal use the
serializer passes through everything, but when test-pattern-generator
(TPG) is used, an internal TPG source is used. After this commit, the
UB953 get_frame_desc() can lock the state, look at the routing table to
see if we're in normal or TPG mode, then either call
__v4l2_subdev_get_frame_desc_passthrough() if in normal mode, or
construct a TPG frame desc if in TPG mode.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 48 ++++++++++++++++++++---------------
 include/media/v4l2-subdev.h           | 38 +++++++++++++++++++++++----
 2 files changed, 61 insertions(+), 25 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2757378c628a..b73ccd1c83d2 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2545,21 +2545,21 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
 
-int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
-					   unsigned int pad,
-					   struct v4l2_mbus_frame_desc *fd)
+int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
+					     struct v4l2_subdev_state *state,
+					     unsigned int pad,
+					     struct v4l2_mbus_frame_desc *fd)
 {
 	struct media_pad *local_sink_pad;
 	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
 	struct device *dev = sd->dev;
 	int ret = 0;
 
+	lockdep_assert_held(state->lock);
+
 	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
 		return -EINVAL;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
 	/* Iterate over sink pads */
 	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
 		struct v4l2_mbus_frame_desc source_fd;
@@ -2586,15 +2586,12 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				if (!remote_source_pad) {
 					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
 						local_sink_pad->index);
-					ret = -EINVAL;
-					goto out_unlock;
+					return -EINVAL;
 				}
 
 				remote_sd = media_entity_to_v4l2_subdev(remote_source_pad->entity);
-				if (!remote_sd) {
-					ret = -EINVAL;
-					goto out_unlock;
-				}
+				if (!remote_sd)
+					return -EINVAL;
 
 				ret = v4l2_subdev_call(remote_sd, pad,
 						       get_frame_desc,
@@ -2604,7 +2601,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					dev_err(dev,
 						"Failed to get frame desc from remote subdev %s\n",
 						remote_sd->name);
-					goto out_unlock;
+					return ret;
 				}
 
 				have_source_fd = true;
@@ -2615,8 +2612,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					dev_err(dev,
 						"Frame desc type mismatch: %u != %u\n",
 						fd->type, source_fd.type);
-					ret = -EPIPE;
-					goto out_unlock;
+					return -EPIPE;
 				}
 			}
 
@@ -2631,14 +2627,12 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				dev_dbg(dev,
 					"Failed to find stream %u from source frame desc\n",
 					route->sink_stream);
-				ret = -EPIPE;
-				goto out_unlock;
+				return -EPIPE;
 			}
 
 			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
-				ret = -ENOSPC;
-				goto out_unlock;
+				return -ENOSPC;
 			}
 
 			fd->entry[fd->num_entries] = *source_entry;
@@ -2649,7 +2643,21 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 		}
 	}
 
-out_unlock:
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
+
+int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
+					   unsigned int pad,
+					   struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	ret = __v4l2_subdev_get_frame_desc_passthrough(sd, state, pad, fd);
+
 	v4l2_subdev_unlock_state(state);
 
 	return ret;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 23c03ba7f84c..d256b7ec8f84 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1723,15 +1723,15 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
 
 /**
- * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
- *	get_frame_desc operation in simple passthrough cases
+ * __v4l2_subdev_get_frame_desc_passthrough - Helper to implement the
+ *	subdev get_frame_desc operation in simple passthrough cases
  * @sd: The subdevice
+ * @state: The locked subdevice active state
  * @pad: The source pad index
  * @fd: The mbus frame desc
  *
- * This helper implements get_frame_desc operation for subdevices that pass
- * streams through without modification. It can be assigned directly as the
- * .get_frame_desc callback in &v4l2_subdev_pad_ops.
+ * This helper implements the get_frame_desc operation for subdevices that pass
+ * streams through without modification.
  *
  * The helper iterates over the subdevice's sink pads, calls get_frame_desc on
  * the remote subdevice connected to each sink pad, and collects the frame desc
@@ -1744,6 +1744,34 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
  * sink pads are involved and the upstream sources report different frame desc
  * types, -EPIPE is returned.
  *
+ * The caller must hold the subdevice's active state lock. This variant is
+ * intended for drivers that need to perform additional work around the
+ * passthrough frame descriptor collection. Drivers that do not need any
+ * customization should use v4l2_subdev_get_frame_desc_passthrough() instead.
+ *
+ * Return: 0 on success, or a negative error code otherwise.
+ */
+int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
+					     struct v4l2_subdev_state *state,
+					     unsigned int pad,
+					     struct v4l2_mbus_frame_desc *fd);
+
+/**
+ * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
+ *	get_frame_desc operation in simple passthrough cases
+ * @sd: The subdevice
+ * @pad: The source pad index
+ * @fd: The mbus frame desc
+ *
+ * This function locks the subdevice's active state, calls
+ * __v4l2_subdev_get_frame_desc_passthrough(), and unlocks the state.
+ *
+ * This function can be assigned directly as the .get_frame_desc callback in
+ * &v4l2_subdev_pad_ops for subdevices that pass streams through without
+ * modification. Drivers that need to perform additional work should use
+ * __v4l2_subdev_get_frame_desc_passthrough() in their custom
+ * .get_frame_desc implementation instead.
+ *
  * Return: 0 on success, or a negative error code otherwise.
  */
 int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,

-- 
2.43.0


