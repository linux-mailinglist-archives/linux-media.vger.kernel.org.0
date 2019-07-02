Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74B3F5D36E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfGBPtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:49:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58382 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727168AbfGBPtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 11:49:12 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:c7f4:61e7:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 30796289C8A;
        Tue,  2 Jul 2019 16:49:07 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 4/7] media: vimc: Send null buffer through the pipeline
Date:   Tue,  2 Jul 2019 12:47:49 -0300
Message-Id: <20190702154752.14939-5-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702154752.14939-1-andrealmeid@collabora.com>
References: <20190702154752.14939-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Send a NULL buffer through the video pipeline. If the Capture device
gets a NULL buffer, it uses it default fallback frame. Make the capture
device behave more like real devices when there's no frame to show.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 drivers/media/platform/vimc/vimc-capture.c  | 15 +++++++++++++++
 drivers/media/platform/vimc/vimc-debayer.c  |  3 +++
 drivers/media/platform/vimc/vimc-scaler.c   |  3 +++
 drivers/media/platform/vimc/vimc-streamer.c |  2 +-
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index e80fa1ee3dc1..4c65bf73530f 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -37,6 +37,15 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	vcap->sequence = 0;
 
+	/* this is a fallback frame, it will be used if the pipeline
+	 * is sending NULL frames
+	 */
+	vcap->frame = vmalloc(vcap->format.sizeimage);
+	if (!vcap->frame) {
+		vimc_vid_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
+		return -ENOMEM;
+	}
+
 	/* Start the media pipeline */
 	ret = media_pipeline_start(entity, &vcap->stream.pipe);
 	if (ret) {
@@ -65,6 +74,9 @@ void vimc_cap_stop_streaming(struct vb2_queue *vq)
 
 	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
 
+	vfree(vcap->frame);
+	vcap->frame = NULL;
+
 	media_pipeline_stop(&vcap->vdev.entity);
 
 	vimc_vid_return_all_buffers(vcap, VB2_BUF_STATE_ERROR);
@@ -96,6 +108,9 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 	struct vimc_vid_buffer *vimc_buf;
 	void *vbuf;
 
+	if (!frame)
+		frame = &vcap->frame;
+
 	spin_lock(&vcap->qlock);
 
 	/* Get the first entry of the list */
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 9e0c7c2c3c72..d5f370f94573 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -483,6 +483,9 @@ static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
 	unsigned int rgb[3];
 	unsigned int i, j;
 
+	if (!sink_frame)
+		return NULL;
+
 	/* If the stream in this node is not active, just return */
 	if (!vdeb->src_frame)
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 2c3e486a29c0..9edad3b14526 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -320,6 +320,9 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
 	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
 						    ved);
 
+	if (!sink_frame)
+		return NULL;
+
 	/* If the stream in this node is not active, just return */
 	if (!ved->stream)
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index fd330415ac38..f06c9308a41b 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -133,7 +133,7 @@ static int vimc_streamer_thread(void *data)
 		for (i = stream->pipe_size - 1; i >= 0; i--) {
 			frame = stream->ved_pipeline[i]->process_frame(
 					stream->ved_pipeline[i], frame);
-			if (!frame || IS_ERR(frame))
+			if (IS_ERR(frame))
 				break;
 		}
 
-- 
2.22.0

