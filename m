Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB9D24A58F
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgHSSF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgHSSFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563ECC061383
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:07 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d22so12078194pfn.5
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+Hr38lItu4eVpChslvtYRcigjDMNh3B0lnEZweg9dnU=;
        b=lQk7Q038l0jssNstKbz+77SuBmA+tpST+f6F8/Np9AW1MszdzTbQ2lDiJYHBRL6JYH
         vDa790mumNZnckVLgI7yC+WS4M+Kzu4j3w2zfX5qD8xIOUTc80OcIlgrghkve+MT/7ox
         Z2HrbU8nAHBqUzmKThYHT1K5UrQV2oZla8kc+AKkS1tEFFZdL9GKTX+A173uOPD69EF2
         nGn9m7GrLqlLBZFi0NCqLYDFRwwBTprHg/fe4Ey6vIqdFi4+r8ovpaBUyeHb1AniVYCK
         cocQE3z1Abw88Y8+dMS4r6YCdTGRN+3u5JadplNlr+oyv7Qts0FPLguPdaily1IvM8GP
         sWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+Hr38lItu4eVpChslvtYRcigjDMNh3B0lnEZweg9dnU=;
        b=ofu/hQbhCMal2VRbSoDyaxvUiYI4/zhcRLo2PmWBi0oEs2JhO61dRJVE1UlZ6+qTpC
         xdSfu1wyn9b6FoHypdhQHm5/26lBmbcyMJrSgO4i0NCTNk/pTh28kRu6ubvpl6Us50mJ
         XlnPr4Ciy7+jt2DuUDU4N/DMrIM+WSmKmuluMnspXzHvlvNxx47O0mFoTXa3p0gQd2Lo
         pWabFp9YIFFaE199UeKZFQBHKYklaczrwhl4oU3unS4CfMIyYjg5OuhCk7+n/gbfjFEn
         oaPqZ9hkIpyfPY1VSIXriDN08CxQwwSQ5r1rcrvv3OmOCXhVhcepDYrXnV5Zweb1vuJS
         eS7w==
X-Gm-Message-State: AOAM532lSJ/xFVQKdqB5jM7i/74XP7t5a/rJwwo0hiQnmHWVj4/Qo6fa
        kCAC0NNLToXoEvgQfg2pTn0VUw==
X-Google-Smtp-Source: ABdhPJzrNXPBOT6f36UuHk1yHy/wZKcrDFdhp9P+sNWEBR0eqWdGATwfEX1e0Njxvc0BxFym+f/HJQ==
X-Received: by 2002:a62:ee06:: with SMTP id e6mr19575083pfi.313.1597860306768;
        Wed, 19 Aug 2020 11:05:06 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id u65sm29095245pfb.102.2020.08.19.11.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:06 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 2/9] media: vimc: Add get_frame callback
Date:   Wed, 19 Aug 2020 23:34:35 +0530
Message-Id: <20200819180442.11630-3-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the process of making vimc compatible for multiple streams, we need
to create a frame passing process such that two different entities can
get the frame from a common entity. This isn't possible currently without
calling process_frame twice for the common entity, as process_frames
returns the frame which gets passed on.

So, to take care of this, add a get_frame callback to vimc device and
use it to get the frames for an entity from previous entity instead of
returning and passing the frames as an argument in process_frame.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 .../media/test-drivers/vimc/vimc-capture.c    | 18 +++++++++++++++---
 drivers/media/test-drivers/vimc/vimc-common.h |  7 ++++---
 .../media/test-drivers/vimc/vimc-debayer.c    | 19 ++++++++++++++++---
 drivers/media/test-drivers/vimc/vimc-scaler.c | 18 +++++++++++++++---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 11 +++++++++--
 .../media/test-drivers/vimc/vimc-streamer.c   | 10 ++++++----
 6 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index c63496b17b9a..a8cbb8e4d5ba 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -355,12 +355,13 @@ static void vimc_cap_unregister(struct vimc_ent_device *ved)
 	video_unregister_device(&vcap->vdev);
 }
 
-static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
-				    const void *frame)
+static int vimc_cap_process_frame(struct vimc_ent_device *ved)
 {
 	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
 						    ved);
 	struct vimc_cap_buffer *vimc_buf;
+	struct v4l2_subdev *sd;
+	const void *frame;
 	void *vbuf;
 
 	spin_lock(&vcap->qlock);
@@ -370,7 +371,7 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 					    typeof(*vimc_buf), list);
 	if (!vimc_buf) {
 		spin_unlock(&vcap->qlock);
-		return ERR_PTR(-EAGAIN);
+		return -EAGAIN;
 	}
 
 	/* Remove this entry from the list */
@@ -385,12 +386,22 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 
 	vbuf = vb2_plane_vaddr(&vimc_buf->vb2.vb2_buf, 0);
 
+	sd = media_entity_to_v4l2_subdev(vimc_get_source_entity(ved->ent));
+	ved = v4l2_get_subdevdata(sd);
+	frame = ved->get_frame(ved);
+
 	memcpy(vbuf, frame, vcap->format.sizeimage);
 
 	/* Set it as ready */
 	vb2_set_plane_payload(&vimc_buf->vb2.vb2_buf, 0,
 			      vcap->format.sizeimage);
 	vb2_buffer_done(&vimc_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
+
+	return 0;
+}
+
+static void *vimc_cap_get_frame(struct vimc_ent_device *ved)
+{
 	return NULL;
 }
 
@@ -455,6 +466,7 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	vcap->ved.ent = &vcap->vdev.entity;
 	vcap->ved.process_frame = vimc_cap_process_frame;
 	vcap->ved.vdev_get_format = vimc_cap_get_format;
+	vcap->ved.get_frame = vimc_cap_get_frame;
 	vcap->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the video_device struct */
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 4c580d854007..287d66edff49 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -85,7 +85,8 @@ struct vimc_pix_map {
  *
  * @dev:		a pointer of the device struct of the driver
  * @ent:		the pointer to struct media_entity for the node
- * @process_frame:	callback send a frame to that node
+ * @get_frame:		callback that sends a frame processed by the entity
+ * @process_frame:	callback that processes a frame
  * @vdev_get_format:	callback that returns the current format a pad, used
  *			only when is_media_entity_v4l2_video_device(ent) returns
  *			true
@@ -101,8 +102,8 @@ struct vimc_pix_map {
 struct vimc_ent_device {
 	struct device *dev;
 	struct media_entity *ent;
-	void * (*process_frame)(struct vimc_ent_device *ved,
-				const void *frame);
+	void * (*get_frame)(struct vimc_ent_device *ved);
+	int (*process_frame)(struct vimc_ent_device *ved);
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
 			      struct v4l2_pix_format *fmt);
 };
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index c3f6fef34f68..f61e6e8899ac 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -491,17 +491,22 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
 	}
 }
 
-static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
-				    const void *sink_frame)
+static int vimc_deb_process_frame(struct vimc_ent_device *ved)
 {
 	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
 						    ved);
 	unsigned int rgb[3];
 	unsigned int i, j;
+	struct v4l2_subdev *sd;
+	const void *sink_frame;
 
 	/* If the stream in this node is not active, just return */
 	if (!vdeb->src_frame)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
+
+	sd = media_entity_to_v4l2_subdev(vimc_get_source_entity(ved->ent));
+	ved = v4l2_get_subdevdata(sd);
+	sink_frame = ved->get_frame(ved);
 
 	for (i = 0; i < vdeb->sink_fmt.height; i++)
 		for (j = 0; j < vdeb->sink_fmt.width; j++) {
@@ -509,6 +514,13 @@ static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
 			vdeb->set_rgb_src(vdeb, i, j, rgb);
 		}
 
+	return 0;
+}
+
+static void *vimc_deb_get_frame(struct vimc_ent_device *ved)
+{
+	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
+						    ved);
 	return vdeb->src_frame;
 }
 
@@ -593,6 +605,7 @@ static struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 		goto err_free_hdl;
 
 	vdeb->ved.process_frame = vimc_deb_process_frame;
+	vdeb->ved.get_frame = vimc_deb_get_frame;
 	vdeb->ved.dev = vimc->mdev.dev;
 	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
 
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 121fa7d62a2e..347f9cd4a168 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -455,18 +455,29 @@ static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
 			vimc_sca_scale_pix(vsca, i, j, sink_frame);
 }
 
-static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
-				    const void *sink_frame)
+static int vimc_sca_process_frame(struct vimc_ent_device *ved)
 {
 	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
 						    ved);
+	const void *sink_frame;
+	struct v4l2_subdev *sd;
 
 	/* If the stream in this node is not active, just return */
 	if (!vsca->src_frame)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
+	sd = media_entity_to_v4l2_subdev(vimc_get_source_entity(ved->ent));
+	ved = v4l2_get_subdevdata(sd);
+	sink_frame = ved->get_frame(ved);
 	vimc_sca_fill_src_frame(vsca, sink_frame);
 
+	return 0;
+};
+
+static void *vimc_sca_get_frame(struct vimc_ent_device *ved)
+{
+	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
+						    ved);
 	return vsca->src_frame;
 };
 
@@ -505,6 +516,7 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	}
 
 	vsca->ved.process_frame = vimc_sca_process_frame;
+	vsca->ved.get_frame = vimc_sca_get_frame;
 	vsca->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the frame format */
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index ba5db5a150b4..32a2c39de2cd 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -190,8 +190,7 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
 	.set_fmt		= vimc_sen_set_fmt,
 };
 
-static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
-				    const void *sink_frame)
+static int vimc_sen_process_frame(struct vimc_ent_device *ved)
 {
 	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
 						    ved);
@@ -238,6 +237,13 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
 		break;
 	}
 
+	return 0;
+}
+
+static void *vimc_sen_get_frame(struct vimc_ent_device *ved)
+{
+	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
+						    ved);
 	return vsen->frame;
 }
 
@@ -429,6 +435,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 		goto err_free_tpg;
 
 	vsen->ved.process_frame = vimc_sen_process_frame;
+	vsen->ved.get_frame = vimc_sen_get_frame;
 	vsen->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the frame format */
diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index 4f8384246042..c1644d69686d 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -125,7 +125,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 static int vimc_streamer_thread(void *data)
 {
 	struct vimc_stream *stream = data;
-	u8 *frame = NULL;
+	struct vimc_ent_device *ved;
+	int ret;
 	int i;
 
 	set_freezable();
@@ -136,9 +137,10 @@ static int vimc_streamer_thread(void *data)
 			break;
 
 		for (i = stream->pipe_size - 1; i >= 0; i--) {
-			frame = stream->ved_pipeline[i]->process_frame(
-					stream->ved_pipeline[i], frame);
-			if (!frame || IS_ERR(frame))
+			ved = stream->ved_pipeline[i];
+			ret = ved->process_frame(ved);
+
+			if (ret)
 				break;
 		}
 		//wait for 60hz
-- 
2.17.1

