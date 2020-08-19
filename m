Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BB424A591
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgHSSFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgHSSFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:12 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462DEC061342
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:12 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d19so11765804pgl.10
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJOwxZD756f4d3HNd4Hpvhldk4W8KSHk0BSTu8cNd+0=;
        b=Q8MbWudYBHUtf3I/ngwkAVqIdwWbZXLatG/7b18xipE/k+EE9MX36XB+IV6lIDz+Br
         /GBMGIUAA4x5lZac1T1K9pRddO6E413r/7jUX2v8dMTPwpE26Ng2CBrBrGYDzSwmwmor
         0sVjhNbFlZKmDjELnl2QpvUkUvBBEgHpTGUij2FQZF9Veuzx2opfvxfKBkkMm+dcK8gw
         0dKMMeq+H4gqJS7OEXsyk2g5/2dfmwZeVMXRVU+RE27zG20TChgG+dz2GyFq2QKwoDdQ
         v/fUp8xgejoa264sKzFzTYoz5vQc+SMmgvMkPFy5SPIYorMT9c+YMsYc3PTckgfPYQQF
         fDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VJOwxZD756f4d3HNd4Hpvhldk4W8KSHk0BSTu8cNd+0=;
        b=GywzY2u9YNeRFJhf9O2URMlrngG5hRHczrjif1n5wjR/LgcdDj0e6//aCBNijBTJ4Z
         Wf8aAmBxvORw9Sv5aZXbzRyicUQxQ5Dy05z87RBwqH4RxJYmetukUoO5bgCrGiRtLhLl
         rLqqtn4LqS1mCFN1dsadlTmbYpElgpEEf2DuGNWNZQUYe9rLPabP8LkY9eE9bK3iSddq
         n67m0C8Qpg6SD8tlujIhjVXwhsetjGPqfegtGgq8SW7myfP3i7h6ZrE3ZWXZJdtPBh89
         op8DVkGd8QIQBsYjJmbBsQDYO9hPq+LQtnLYTz97OmLMSafqBLVZ/NFkXhqwOcmfrJ7q
         bw3w==
X-Gm-Message-State: AOAM531gNQd7ec7Dim61GttW2MSruHzHdCX+wXtSWMEkcY74QLJJd3US
        RtBCyCw3DueweJMLI23Dh9EdszuVaTV8yQ==
X-Google-Smtp-Source: ABdhPJzApiHr4zA8SCw8Y5N+Yqufm8PMxKzaoF12gzOBA8/fwujbFHlgOpVoA4yf/K9RAqfrd2W/9Q==
X-Received: by 2002:a62:cd8f:: with SMTP id o137mr20689091pfg.241.1597860311717;
        Wed, 19 Aug 2020 11:05:11 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id w16sm29100810pfq.13.2020.08.19.11.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:11 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 3/9] media: vimc: Add usage count to subdevices
Date:   Wed, 19 Aug 2020 23:34:36 +0530
Message-Id: <20200819180442.11630-4-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund@ragnatech.se>

Prepare for multiple video streams from the same sensor by adding a use
counter to vimc_ent_device. The counter is increased for every s_stream(1)
and decremented for every s_stream(0) call.

The subdevice stream is not started or stopped unless the usage count go
from 0 to 1 (started) or from 1 to 0 (stopped). This allows for multiple
s_stream() calls to try to either start or stop the device while only
the first/last call will actually effect the state of the device.

Initialise and increment use_count for capture as well, as use_count
will be used in subsequent patches for starting process_frame as well.

[Kaaira: moved use_count to vimc entity device instead of declaring it
for each subdevice, used use_count for capture as well and rebased
the patch on current HEAD of master to help with the current series]

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 3 +++
 drivers/media/test-drivers/vimc/vimc-common.h  | 2 ++
 drivers/media/test-drivers/vimc/vimc-debayer.c | 7 +++++++
 drivers/media/test-drivers/vimc/vimc-scaler.c  | 7 +++++++
 drivers/media/test-drivers/vimc/vimc-sensor.c  | 6 ++++++
 5 files changed, 25 insertions(+)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index a8cbb8e4d5ba..93418cb5a139 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -243,6 +243,7 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct media_entity *entity = &vcap->vdev.entity;
 	int ret;
 
+	atomic_inc(&vcap->ved.use_count);
 	vcap->sequence = 0;
 
 	/* Start the media pipeline */
@@ -270,6 +271,7 @@ static void vimc_cap_stop_streaming(struct vb2_queue *vq)
 {
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
 
+	atomic_dec(&vcap->ved.use_count);
 	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
 
 	/* Stop the media pipeline */
@@ -424,6 +426,7 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	vcap->vdev.entity.name = vcfg_name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
 	vcap->pad.flags = MEDIA_PAD_FL_SINK;
+	atomic_set(&vcap->ved.use_count, 0);
 	ret = media_entity_pads_init(&vcap->vdev.entity,
 				     1, &vcap->pad);
 	if (ret)
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 287d66edff49..c214f5ec7818 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -85,6 +85,7 @@ struct vimc_pix_map {
  *
  * @dev:		a pointer of the device struct of the driver
  * @ent:		the pointer to struct media_entity for the node
+ * @use_count:		a count to show the number of streams entity is part of
  * @get_frame:		callback that sends a frame processed by the entity
  * @process_frame:	callback that processes a frame
  * @vdev_get_format:	callback that returns the current format a pad, used
@@ -102,6 +103,7 @@ struct vimc_pix_map {
 struct vimc_ent_device {
 	struct device *dev;
 	struct media_entity *ent;
+	atomic_t use_count;
 	void * (*get_frame)(struct vimc_ent_device *ved);
 	int (*process_frame)(struct vimc_ent_device *ved);
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index f61e6e8899ac..60c4c0ec2030 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -343,6 +343,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
+		if (atomic_inc_return(&vdeb->ved.use_count) != 1)
+			return 0;
+
 		if (vdeb->src_frame)
 			return 0;
 
@@ -368,6 +371,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 			return -ENOMEM;
 
 	} else {
+		if (atomic_dec_return(&vdeb->ved.use_count) != 0)
+			return 0;
+
 		if (!vdeb->src_frame)
 			return 0;
 
@@ -608,6 +614,7 @@ static struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	vdeb->ved.get_frame = vimc_deb_get_frame;
 	vdeb->ved.dev = vimc->mdev.dev;
 	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
+	atomic_set(&vdeb->ved.use_count, 0);
 
 	/* Initialize the frame format */
 	vdeb->sink_fmt = sink_fmt_default;
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 347f9cd4a168..d511e1f2152d 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -340,6 +340,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
+		if (atomic_inc_return(&vsca->ved.use_count) != 1)
+			return 0;
+
 		if (vsca->src_frame)
 			return 0;
 
@@ -363,6 +366,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 			return -ENOMEM;
 
 	} else {
+		if (atomic_dec_return(&vsca->ved.use_count) != 0)
+			return 0;
+
 		if (!vsca->src_frame)
 			return 0;
 
@@ -518,6 +524,7 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	vsca->ved.process_frame = vimc_sca_process_frame;
 	vsca->ved.get_frame = vimc_sca_get_frame;
 	vsca->ved.dev = vimc->mdev.dev;
+	atomic_set(&vsca->ved.use_count, 0);
 
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 32a2c39de2cd..ced8ef06b01e 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -256,6 +256,9 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
+		if (atomic_inc_return(&vsen->ved.use_count) != 1)
+			return 0;
+
 		vsen->start_stream_ts = ktime_get_ns();
 
 		/* Calculate the frame size */
@@ -275,6 +278,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 		vimc_sen_tpg_s_format(vsen);
 
 	} else {
+		if (atomic_dec_return(&vsen->ved.use_count) != 0)
+			return 0;
 
 		vfree(vsen->frame);
 		vsen->frame = NULL;
@@ -437,6 +442,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 	vsen->ved.process_frame = vimc_sen_process_frame;
 	vsen->ved.get_frame = vimc_sen_get_frame;
 	vsen->ved.dev = vimc->mdev.dev;
+	atomic_set(&vsen->ved.use_count, 0);
 
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
-- 
2.17.1

