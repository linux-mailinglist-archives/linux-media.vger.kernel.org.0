Return-Path: <linux-media+bounces-31736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512CAA9DB1
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70A563BA30F
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAE12741B6;
	Mon,  5 May 2025 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aw6LQZ66"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D941E1DE9
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478835; cv=none; b=BEF0cXRXZItc64mlJHtjogC9JJ91lxgJto7l2B4DZQmqfxWjnndDtlVHGC2XhYu26qdveQS8+O+uPVF0El+Zw/HHilkqEzhd+1pYUkTZEMOfI16NNWRC9/6qM02w4rR1V7xKhaafAc4ipzK812D86hg43xzRzd30v0LBlE+erfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478835; c=relaxed/simple;
	bh=ugrvREosHooxy7LWHg7vN5V7UYpSeajZtZWWSKGMDvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqSCW1XK9Cza/LH1pB5kfo0fD0vBvhJxTfMj+GGcQihCIbTZeh3w3Sx4Gk6YQOh3hg+iyDBo9wlV2GdmKFGob7gsCVW/TOydzmkY/Ol+ElPv8lV+PQgwAPmXyD1UDGGalwps1UXbn86rs3jhbn86Gd8J0OEZfFY9NJLIxYnsnMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aw6LQZ66; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746478832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W90I87a/2MRqPGZboswzcvbDplAwBhY1br67/LxiGsI=;
	b=aw6LQZ66PaOragdT95sx6XhbAg34cHpMgjEFdabWhsXvlU1A2NAv0/9HwZJKq5dU7p0AYq
	Te1KMFarBzu+5Tj/YD9fDNlZr8FIAoLGteqUfIaZFrylzA/nobCqv7/fDoO6488Hl0dt0x
	LG9QlE2FNwCESNx12mG77HI2/fTgxNA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-dWoAHtAyPK-iFrM_HD5Crw-1; Mon,
 05 May 2025 17:00:31 -0400
X-MC-Unique: dWoAHtAyPK-iFrM_HD5Crw-1
X-Mimecast-MFC-AGG-ID: dWoAHtAyPK-iFrM_HD5Crw_1746478830
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3BDD1956094;
	Mon,  5 May 2025 21:00:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F2357195608D;
	Mon,  5 May 2025 21:00:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/5] media: atomisp: Fix "stop stream timeout." error
Date: Mon,  5 May 2025 23:00:08 +0200
Message-ID: <20250505210008.152659-6-hdegoede@redhat.com>
In-Reply-To: <20250505210008.152659-1-hdegoede@redhat.com>
References: <20250505210008.152659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Commit c7194b21809e ("media: atomisp: On streamoff wait for buffers owned
by the CSS to be given back") added draining of the CSS buffer queue to
the beginning of atomisp_stop_stream().

But it turns out that when telling the CSS to stop streaming it needs at
least 1 buffer queued, because the CSS firmware waits for a frame to be
completed before stopping and without buffers it cannot complete a frame.

At the end of atomisp_stop_stream() it is always safe to return buffer
ownership to the videobuf2-core. Either atomisp_css_stop() has successfully
stopped the stream; or the atomisp_reset() later on which power-cycles
the ISP will definitely have stopped the stream.

Drop the draining of the CSS buffer queue to fix the "stop stream timeout."
error and move the atomisp_flush_video_pipe() call after atomisp_reset(),
passing false for the warn_on_css_frames flag since some buffers still
being marked as owned by the CSS expected on stream off.

Also increase the timeout in destroy_stream(), since this waits for
the last frame to be completed this can take longer then 40 ms. When e.g.
using a framerate of 15 fps, this could take 66ms, make the timeout 200 ms
to be on the safe side.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note no fixes tag since the code has changed a lot since the original
commit introducing the draining of the buffer queue
---
 .../media/atomisp/pci/atomisp_compat_css20.c  |  2 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |  5 +----
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 20 ++-----------------
 .../media/atomisp/pci/atomisp_subdev.h        |  3 ---
 4 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index bc97fa2c374c..be5f37f4a6fd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -387,7 +387,7 @@ static int __destroy_stream(struct atomisp_sub_device *asd,
 	}
 
 	if (stream_env->stream_state == CSS_STREAM_STARTED) {
-		timeout = jiffies + msecs_to_jiffies(40);
+		timeout = jiffies + msecs_to_jiffies(200);
 		while (1) {
 			if (ia_css_stream_has_stopped(stream_env->stream))
 				break;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 57da7ddb1503..c7aef066f209 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -234,9 +234,6 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 	if (WARN_ON(css_pipe_id >= IA_CSS_PIPE_ID_NUM))
 		return -EINVAL;
 
-	if (pipe->stopping)
-		return -EINVAL;
-
 	space = ATOMISP_CSS_Q_DEPTH - atomisp_buffers_in_css(pipe);
 	while (space--) {
 		struct ia_css_frame *frame;
@@ -367,7 +364,7 @@ static void atomisp_buf_queue(struct vb2_buffer *vb)
 	mutex_lock(&asd->isp->mutex);
 
 	ret = atomisp_pipe_check(pipe, false);
-	if (ret || pipe->stopping) {
+	if (ret) {
 		spin_lock_irqsave(&pipe->irq_lock, irqflags);
 		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
 		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index fecba2588e38..bb8b2f2213b0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -865,22 +865,6 @@ static void atomisp_stop_stream(struct atomisp_video_pipe *pipe,
 	unsigned long flags;
 	int ret;
 
-	/*
-	 * There is no guarantee that the buffers queued to / owned by the ISP
-	 * will properly be returned to the queue when stopping. Set a flag to
-	 * avoid new buffers getting queued and then wait for all the current
-	 * buffers to finish.
-	 */
-	pipe->stopping = true;
-	mutex_unlock(&isp->mutex);
-	/* wait max 1 second */
-	ret = wait_event_timeout(pipe->vb_queue.done_wq,
-				 atomisp_buffers_in_css(pipe) == 0, HZ);
-	mutex_lock(&isp->mutex);
-	pipe->stopping = false;
-	if (ret == 0)
-		dev_warn(isp->dev, "Warning timeout waiting for CSS to return buffers\n");
-
 	spin_lock_irqsave(&isp->lock, flags);
 	asd->streaming = false;
 	spin_unlock_irqrestore(&isp->lock, flags);
@@ -890,8 +874,6 @@ static void atomisp_stop_stream(struct atomisp_video_pipe *pipe,
 
 	atomisp_css_stop(asd, false);
 
-	atomisp_flush_video_pipe(pipe, state, true);
-
 	atomisp_subdev_cleanup_pending_events(asd);
 
 	if (stop_sensor) {
@@ -920,6 +902,8 @@ static void atomisp_stop_stream(struct atomisp_video_pipe *pipe,
 			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
 	atomisp_reset(isp);
 
+	atomisp_flush_video_pipe(pipe, state, false);
+
 	/* Streams were destroyed by atomisp_css_stop(), recreate them. */
 	ret = atomisp_create_pipes_stream(&isp->asd);
 	if (ret)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index bd1a198cda30..e1d0168cb91d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -57,9 +57,6 @@ struct atomisp_video_pipe {
 	/* Filled through atomisp_get_css_frame_info() on queue setup */
 	struct ia_css_frame_info frame_info;
 
-	/* Set from streamoff to disallow queuing further buffers in CSS */
-	bool stopping;
-
 	/*
 	 * irq_lock is used to protect video buffer state change operations and
 	 * also to make activeq and capq operations atomic.
-- 
2.49.0


