Return-Path: <linux-media+bounces-61177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK3PKOBaAmosrgEAu9opvQ
	(envelope-from <linux-media+bounces-61177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 00:40:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988F517087
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 00:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B340930580A6
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 22:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC37356761;
	Mon, 11 May 2026 22:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o3Pc9umN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C0538331E;
	Mon, 11 May 2026 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539119; cv=none; b=aEwaTMoXkHqJUiusqBY05CIby22sQkx8CTuDnGK63UeEm9Kkke8p50unEeC1OUsp8raEvR3MjwMhk0YA3a/cZCDhyybDBVsA6upyWL1FJoalc1pTiBK5PSrl2RNOYKge5XfxbxjshDljcsfEmedVpSY/6ndkmKQ7kBE+CIvO1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539119; c=relaxed/simple;
	bh=iMsaIOMg3NDQ9OV4wA0W2qxxjEwTQbto4JT7m84YR0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0s+tpLobRCqXSj4iA5vLcVzgwKYLFtVJ+CwPrg+Kf+6E5ErYi2QzHnRiweTvTAf/368VaRtlvxVfp8ovy44QHwhpPdbsnB8yXCDosoYe1lVfqc94YTuIKxRUtnl/isTtdk0UQlaT18kQV5nxwFVzEmhlTHdVkswpn20KHnIDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o3Pc9umN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 404CB838;
	Tue, 12 May 2026 00:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778539106;
	bh=iMsaIOMg3NDQ9OV4wA0W2qxxjEwTQbto4JT7m84YR0Y=;
	h=From:To:Cc:Subject:Date:From;
	b=o3Pc9umN42ds1FS3/WWZzYWlXN48n3Br7b1XlhmMaCJ6E1kkxqw2M8x2Hx3eF6Rl1
	 u2G8uInTt2n5w8A2W0qzMhIpOtLSRld1bZKnUEMfTYgln2738yXBYbjQP1G5d+oKmq
	 vqZ3hG4W7obPB5y8Pv+NdsgXnQtlZ4JhsgB6bSyA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	stable@vger.kernel.org
Subject: [PATCH] media: renesas: vsp1: Fix race condition when stopping display pipeline
Date: Tue, 12 May 2026 01:38:32 +0300
Message-ID: <20260511223832.3385049-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3988F517087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61177-lists,linux-media=lfdr.de,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

When stopping a display pipeline, the vsp1_du_setup_lif() function first
stops the hardware by calling vsp1_pipeline_stop(), and then resets
drm_pipe->du_complete to NULL. Stopping the hardware ensures no new
interrupt is generated, but does not wait for completion of any running
interrupt handler. This creates a race with vsp1_du_pipeline_frame_end()
which tests drm_pipe->du_complete before calling the function pointer.
If the drm_pipe->du_complete pointer is reset to NULL between those two
operations, a NULL pointer derefence will occur.

Fix this by setting pipe->state to STOPPING before stopping the
hardware, and avoid calling the frame end handler if the state is not
RUNNING. Condition the latter to the display pipeline, as the other
pipeline use a different stop procedure that waits for the frame end
handler to set the state to STOPPED.

The state check needs to be protected by the pipe->irqlock. The lock is
used by the video and vspx completion handlers already, so move it one
level up to vsp1_pipeline_frame_end().

Fixes: d7ade201ae7f ("v4l: vsp1: Extend VSP1 module API to allow DRM callbacks")
Cc: stable@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---

I have noticed this race condition while debugging a separate issue and
adding printk() statements in the display pipeline frame end. I have
tested the fix with the DU test suite and VSP test suite, exercising
both the display and video pipelines. I'm fairly confident that the VSPX
pipeline won't be negatively affected, but it would be good to
double-check that. Jacopo, Niklas, would you be able to give test it ?

---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c  | 12 ++++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_video.c |  5 -----
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c  | 13 +++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 5d769cc42fe1..aaec1aa15091 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -509,6 +509,10 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
 		 * When using display lists in continuous frame mode the only
 		 * way to stop the pipeline is to reset the hardware.
 		 */
+		scoped_guard(spinlock_irqsave, &pipe->irqlock) {
+			pipe->state = VSP1_PIPELINE_STOPPING;
+		}
+
 		ret = vsp1_reset_wpf(vsp1, pipe->output->entity.index);
 		if (ret == 0) {
 			spin_lock_irqsave(&pipe->irqlock, flags);
@@ -583,8 +587,12 @@ void vsp1_pipeline_frame_end(struct vsp1_pipeline *pipe)
 	 * Regardless of frame completion we still need to notify the pipe
 	 * frame_end to account for vblank events.
 	 */
-	if (pipe->frame_end)
-		pipe->frame_end(pipe, flags);
+	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
+		if (pipe->state == VSP1_PIPELINE_RUNNING || !pipe->lif) {
+			if (pipe->frame_end)
+				pipe->frame_end(pipe, flags);
+		}
+	}
 
 	pipe->sequence++;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index fe1dac11d4ae..a8db94bdb670 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -325,14 +325,11 @@ static void vsp1_video_pipeline_frame_end(struct vsp1_pipeline *pipe,
 {
 	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
 	enum vsp1_pipeline_state state;
-	unsigned long flags;
 	unsigned int i;
 
 	/* M2M Pipelines should never call here with an incomplete frame. */
 	WARN_ON_ONCE(!(completion & VSP1_DL_FRAME_END_COMPLETED));
 
-	spin_lock_irqsave(&pipe->irqlock, flags);
-
 	/* Complete buffers on all video nodes. */
 	for (i = 0; i < vsp1->info->rpf_count; ++i) {
 		if (!pipe->inputs[i])
@@ -354,8 +351,6 @@ static void vsp1_video_pipeline_frame_end(struct vsp1_pipeline *pipe,
 		wake_up(&pipe->wq);
 	else if (vsp1_pipeline_ready(pipe))
 		vsp1_video_pipeline_run(pipe);
-
-	spin_unlock_irqrestore(&pipe->irqlock, flags);
 }
 
 static int vsp1_video_pipeline_build_branch(struct vsp1_pipeline *pipe,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
index 1673479be0ff..26c477708858 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
@@ -176,14 +176,11 @@ static void vsp1_vspx_pipeline_frame_end(struct vsp1_pipeline *pipe,
 {
 	struct vsp1_vspx_pipeline *vspx_pipe = to_vsp1_vspx_pipeline(pipe);
 
-	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
-		/*
-		 * Operating the vsp1_pipe in singleshot mode requires to
-		 * manually set the pipeline state to stopped when a transfer
-		 * is completed.
-		 */
-		pipe->state = VSP1_PIPELINE_STOPPED;
-	}
+	/*
+	 * Operating the vsp1_pipe in singleshot mode requires to manually set
+	 * the pipeline state to stopped when a transfer is completed.
+	 */
+	pipe->state = VSP1_PIPELINE_STOPPED;
 
 	if (vspx_pipe->vspx_frame_end)
 		vspx_pipe->vspx_frame_end(vspx_pipe->frame_end_data);

base-commit: bc1ba628e37c93cf2abeb2c79716f49087f8a024
-- 
Regards,

Laurent Pinchart


