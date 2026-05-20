Return-Path: <linux-media+bounces-62235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEcSHKiIDWrBygUAu9opvQ
	(envelope-from <linux-media+bounces-62235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:10:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC04D58B6B3
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4947305F085
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDB83C2BAF;
	Wed, 20 May 2026 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5C+ltdQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177B3D47BD;
	Wed, 20 May 2026 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271580; cv=none; b=dL/qTyFyqHdJ7xmJGErhxqcDKDzJ4MJwjPjHk54dJQNzjG8VrhIqc8Is1tg9hLxsmY7GCQoGzOE4MFIwZwXwmd+I+/SJH3407Kkq+06BrpghHoYh6UzJlCB3+euo3qReKr/bYivuAof1OPLpvgyMymhoCc0oJ1OzrkmHF37ViU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271580; c=relaxed/simple;
	bh=2XTuY4WQFg1yE+alU+n4fPiYKY1hm6hed38GIC5mPio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfa/PxXyHyTfvLDt54DHMtmM8snsBPkJsFIAsLXlVWVKiXeIZxrGUDy3Ef27uoCyzxJGVB11px7Is7G3eusyOZRIyWUc5PUwaNAVdEG6uOEWkthTABsz3z4hTs4T9lfjLhm3YKlIN9ejMMzxUe0Z0TC4hcpZY9lGEWxZKusU70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5C+ltdQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B1E1F00893;
	Wed, 20 May 2026 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271576;
	bh=tQNdIfyc+XsckweYif30VsXjlB9TtEyaoe4FnMptanA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W5C+ltdQy31Z3KhUSxZbwEOz84BeSZupOaMLVL04Q8X5i4Izc4BT79JWplqGe8b0z
	 ob37LZYMdXBW6pi8YTWYiP6b6lVWMxM+B3cp8HyoapNNtlgF6o0C/iVWOeG69EfvI2
	 0Zzsx71b2uSMmEaegzsCWt0GBi/Y50RcBItVkp7ziUy35rYoS3fnHIBJLFQ2us41NU
	 qFinh3GFYrWWn6sMzvpTpSIR8WWYKf1fPWqvX0pSPZq8qBQzwuKEcMNyxN4Epi22yi
	 Gl3c2a/o6oOzcc3frnX5ZKdJdugtYqD+ykBn3YeCghECRwdU5yyfM27w4+qX1SsFnx
	 36u+mCM4z2iQA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	stable@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 1/2] media: vivid: add vivid_update_reduced_fps()
Date: Wed, 20 May 2026 10:36:21 +0200
Message-ID: <f641f5393c2d9bc7893dd224a646d34c4e042660.1779266182.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779266182.git.hverkuil+cisco@kernel.org>
References: <cover.1779266182.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62235-lists,linux-media=lfdr.de,cisco];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EC04D58B6B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Don't call vivid_update_format_cap() when switching to/from reduced fps
for HDMI inputs: that will also reset the format, which is overkill for
this.

Make a new vivid_update_reduced_fps() function that just updates the
dev->timeperframe_vid_cap.

Fixes: c79aa6aeadb0 ("[media] vivid-capture: add control for reduced frame rate")
Cc: stable@vger.kernel.org
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    |  3 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 32 +++++++++++--------
 .../media/test-drivers/vivid/vivid-vid-cap.h  |  1 +
 3 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f94c15ff84f7..1077445f5772 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -609,7 +609,8 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case VIVID_CID_REDUCED_FPS:
 		dev->reduced_fps = ctrl->val;
-		vivid_update_format_cap(dev, true);
+		if (dev->input_type[dev->input] == HDMI)
+			vivid_update_reduced_fps(dev);
 		break;
 	case VIVID_CID_HAS_CROP_CAP:
 		dev->has_crop_cap = ctrl->val;
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index b95f06a9b5ae..76e0b161c049 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -364,6 +364,24 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
 	return TPG_PIXEL_ASPECT_SQUARE;
 }
 
+void vivid_update_reduced_fps(struct vivid_dev *dev)
+{
+	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
+	unsigned int size = V4L2_DV_BT_FRAME_WIDTH(bt) * V4L2_DV_BT_FRAME_HEIGHT(bt);
+	u64 pixelclock;
+
+	if (dev->reduced_fps && can_reduce_fps(bt)) {
+		pixelclock = div_u64(bt->pixelclock * 1000, 1001);
+		bt->flags |= V4L2_DV_FL_REDUCED_FPS;
+	} else {
+		pixelclock = bt->pixelclock;
+		bt->flags &= ~V4L2_DV_FL_REDUCED_FPS;
+	}
+	dev->timeperframe_vid_cap = (struct v4l2_fract) {
+		size / 100, (u32)pixelclock / 100
+	};
+}
+
 /*
  * Called whenever the format has to be reset which can occur when
  * changing inputs, standard, timings, etc.
@@ -372,8 +390,6 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 {
 	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
 	u32 dims[V4L2_CTRL_MAX_DIMS] = {};
-	unsigned size;
-	u64 pixelclock;
 
 	switch (dev->input_type[dev->input]) {
 	case WEBCAM:
@@ -402,17 +418,7 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 	case HDMI:
 		dev->src_rect.width = bt->width;
 		dev->src_rect.height = bt->height;
-		size = V4L2_DV_BT_FRAME_WIDTH(bt) * V4L2_DV_BT_FRAME_HEIGHT(bt);
-		if (dev->reduced_fps && can_reduce_fps(bt)) {
-			pixelclock = div_u64(bt->pixelclock * 1000, 1001);
-			bt->flags |= V4L2_DV_FL_REDUCED_FPS;
-		} else {
-			pixelclock = bt->pixelclock;
-			bt->flags &= ~V4L2_DV_FL_REDUCED_FPS;
-		}
-		dev->timeperframe_vid_cap = (struct v4l2_fract) {
-			size / 100, (u32)pixelclock / 100
-		};
+		vivid_update_reduced_fps(dev);
 		if (bt->interlaced)
 			dev->field_cap = V4L2_FIELD_ALTERNATE;
 		else
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.h b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
index 38a99f7e038e..d08a85927510 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
@@ -9,6 +9,7 @@
 #define _VIVID_VID_CAP_H_
 
 void vivid_update_quality(struct vivid_dev *dev);
+void vivid_update_reduced_fps(struct vivid_dev *dev);
 void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls);
 void vivid_update_outputs(struct vivid_dev *dev);
 void vivid_update_connected_outputs(struct vivid_dev *dev);
-- 
2.53.0


