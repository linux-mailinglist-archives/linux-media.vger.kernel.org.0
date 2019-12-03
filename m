Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E22D7111E39
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 00:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730497AbfLCW45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 17:56:57 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39649 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730489AbfLCW44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 17:56:56 -0500
Received: by mail-qt1-f193.google.com with SMTP id g1so5641469qtj.6;
        Tue, 03 Dec 2019 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n5+qoXSnokXRH1Wb0gGRdVGsCiKpQZhWS65K3ZxKxC4=;
        b=e9SW1lFpZa3ltMUqiKqPSuzwBywavBFvm2MaK/aBrFcuAgJZBhLuU5gKXa/PoQ7gB3
         jG1u7R5T65dfXJBpn5cpY5zZyliJF1n5bGaOOGZmwoKVRkV4XzQZ+w0+5MLrwzf9L/Rn
         lF4PNMrUWdauGysxrLvjfZDt/RDztJaFEbTs1s/ULH/og8SpTUv26LEfwtAUxc8ILPPS
         GK5SKlQdyxz4sxEi8T0fpiRSkT/ZGvIfxJbanFdOgk4mDJ8P3t5WyHquN++WQMtnStyU
         aFsldF3LPK+vB0aBOTQupfjiub6T8vjMPAdI+W3l0zzgkXHtTs0xEgmPkwz6Gb5z4gTN
         9vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n5+qoXSnokXRH1Wb0gGRdVGsCiKpQZhWS65K3ZxKxC4=;
        b=nsfk+z4/FjU81u117+7NoFHVPZCoCGLyoiQ/hc0QzVufDDfDZ0EPTlFBZr3RHWJogH
         ZycVEHhvDi2UOoz50FAgnB9zMCiJSlH4XmuZIo0QpMNrL8cW+ROkMD/4FWvOiUxmXl+Y
         Oy/v47hiSOWSxfRK17k7ztzinECX3G5fua1N7J6X0MeCO1vt8Bo0qdF8rN15JXPHwcfJ
         WRIZWssHOacVM2kP7d/7L7jvHa0eKZz6gdaWplYkrXGjlIO9MZX9NlWJY6/82KHOyRfS
         FvjAc2z9MR7U66lg8c+NVIkNO46cREqrfH0WBFXMC5hKRgGEw/MSGBNgHroRLWF3kCle
         HY/Q==
X-Gm-Message-State: APjAAAUaUVc24yH2wEJc4seNR3qA60hPLAJwayr1KI0A/2eVHaUQuDRS
        4iZZtXc3QuL26PV4G7XVsd4v0KXDKW8=
X-Google-Smtp-Source: APXvYqzwdOT2sKJyqysrBhar/9EtPUaozf4AfpjPsAowILQ9I4Omg1Q+mo4A2fjR2e5mSWhhbyShIw==
X-Received: by 2002:ac8:2245:: with SMTP id p5mr7819741qtp.55.1575413815222;
        Tue, 03 Dec 2019 14:56:55 -0800 (PST)
Received: from localhost.localdomain ([187.74.34.131])
        by smtp.gmail.com with ESMTPSA id c80sm2602447qkb.35.2019.12.03.14.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 14:56:54 -0800 (PST)
From:   =?UTF-8?q?Lucas=20A=2E=20M=2E=20Magalh=C3=A3es?= 
        <lucmaga@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, lkcamp@lists.libreplanetbr.org,
        "Lucas A. M. Magalhaes" <lucmaga@gmail.com>
Subject: [RFC PATCH] media: vimc: Add optimized mode
Date:   Tue,  3 Dec 2019 19:56:49 -0300
Message-Id: <20191203225649.2132-1-lucmaga@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Lucas A. M. Magalhaes" <lucmaga@gmail.com>

Adds an optimized mode for vimc to generate the frame on the capture
device with the expected configuration.

It adds new set of processor functions that propagates a struct tpg_data
instead of a frame. This struct is used at the end of the pipeline to
generate the expected frame.

It adds the vimc-opt-mode parameter that is used to activate the change
previously explained.

Signed-off-by: Lucas A. M. Magalhães <lucmaga@gmail.com>
---

Hi, I'm finally sending a patch for an optimized patch for vimc.

Helen and Hans, please note that this is still an RFC. I would like to
know if this is more like what you expect for the optimized mode.

Thanks!

 drivers/media/platform/vimc/vimc-capture.c  | 57 ++++++++++++++++++++-
 drivers/media/platform/vimc/vimc-common.h   |  9 +++-
 drivers/media/platform/vimc/vimc-core.c     |  6 +++
 drivers/media/platform/vimc/vimc-debayer.c  | 27 ++++++++--
 drivers/media/platform/vimc/vimc-scaler.c   | 35 +++++++++++--
 drivers/media/platform/vimc/vimc-sensor.c   | 24 +++++++--
 drivers/media/platform/vimc/vimc-streamer.c |  2 +-
 7 files changed, 144 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 76c015898cfd..7e127cbbc806 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -8,6 +8,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
+#include <media/tpg/v4l2-tpg.h>
 
 #include "vimc-common.h"
 #include "vimc-streamer.h"
@@ -18,6 +19,7 @@ struct vimc_cap_device {
 	struct v4l2_pix_format format;
 	struct vb2_queue queue;
 	struct list_head buf_list;
+	struct v4l2_mbus_framefmt mbus_format;
 	/*
 	 * NOTE: in a real driver, a spin lock must be used to access the
 	 * queue because the frames are generated from a hardware interruption
@@ -30,6 +32,7 @@ struct vimc_cap_device {
 	u32 sequence;
 	struct vimc_stream stream;
 	struct media_pad pad;
+	u8 *frame;
 };
 
 static const struct v4l2_pix_format fmt_default = {
@@ -344,7 +347,7 @@ void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 }
 
 static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
-				    const void *frame)
+				    void *frame)
 {
 	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
 						    ved);
@@ -382,6 +385,45 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 	return NULL;
 }
 
+static void *vimc_cap_process_tpg(struct vimc_ent_device *ved,
+				  void *sink_tpg)
+{
+	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
+						    ved);
+	struct vimc_cap_buffer *vimc_buf;
+	void *vbuf;
+
+	spin_lock(&vcap->qlock);
+
+	/* Get the first entry of the list */
+	vimc_buf = list_first_entry_or_null(&vcap->buf_list,
+					    typeof(*vimc_buf), list);
+	if (!vimc_buf) {
+		spin_unlock(&vcap->qlock);
+		return ERR_PTR(-EAGAIN);
+	}
+
+	/* Remove this entry from the list */
+	list_del(&vimc_buf->list);
+
+	spin_unlock(&vcap->qlock);
+
+	/* Fill the buffer */
+	vimc_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
+	vimc_buf->vb2.sequence = vcap->sequence++;
+	vimc_buf->vb2.field = vcap->format.field;
+
+	vbuf = vb2_plane_vaddr(&vimc_buf->vb2.vb2_buf, 0);
+
+	tpg_fill_plane_buffer((struct tpg_data *)sink_tpg, 0, 0, vbuf);
+
+	/* Set it as ready */
+	vb2_set_plane_payload(&vimc_buf->vb2.vb2_buf, 0,
+			      vcap->format.sizeimage);
+	vb2_buffer_done(&vimc_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
+	return NULL;
+}
+
 struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 				     const char *vcfg_name)
 {
@@ -441,7 +483,18 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	/* Fill the vimc_ent_device struct */
 	vcap->ved.ent = &vcap->vdev.entity;
-	vcap->ved.process_frame = vimc_cap_process_frame;
+
+	switch(vimc_op_mode) {
+		case VIMC_OP_MODE_FRAME:
+			vcap->ved.process_data = vimc_cap_process_frame;
+			break;
+		case VIMC_OP_MODE_OPTMIZED:
+			vcap->ved.process_data = vimc_cap_process_tpg;
+			break;
+		default:
+			vcap->ved.process_data = vimc_cap_process_frame;
+			break;
+	}
 	vcap->ved.vdev_get_format = vimc_cap_get_format;
 	vcap->ved.dev = &vimc->pdev.dev;
 
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 87eb8259c2a8..9b48b2f34f34 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -15,6 +15,11 @@
 
 #define VIMC_PDEV_NAME "vimc"
 
+#define VIMC_OP_MODE_FRAME 1
+#define VIMC_OP_MODE_OPTMIZED 2
+
+extern unsigned int vimc_op_mode;
+
 /* VIMC-specific controls */
 #define VIMC_CID_VIMC_BASE		(0x00f00000 | 0xf000)
 #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
@@ -97,8 +102,8 @@ struct vimc_pix_map {
 struct vimc_ent_device {
 	struct device *dev;
 	struct media_entity *ent;
-	void * (*process_frame)(struct vimc_ent_device *ved,
-				const void *frame);
+	void * (*process_data)(struct vimc_ent_device *ved,
+			       void *data);
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
 			      struct v4l2_pix_format *fmt);
 };
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 97a272f3350a..9acf006c7b26 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -23,6 +23,10 @@
 	.flags = link_flags,					\
 }
 
+unsigned int vimc_op_mode = VIMC_OP_MODE_FRAME;
+module_param(vimc_op_mode, uint, 0000);
+MODULE_PARM_DESC(vimc_op_mode, " the operation mode");
+
 /* Structure which describes links between entities */
 struct vimc_ent_link {
 	unsigned int src_ent;
@@ -275,6 +279,8 @@ static int vimc_probe(struct platform_device *pdev)
 	media_device_init(&vimc->mdev);
 
 	ret = vimc_register_devices(vimc);
+	dev_err(&pdev->dev, "OP MODE %d", vimc_op_mode);
+
 	if (ret) {
 		media_device_cleanup(&vimc->mdev);
 		return ret;
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 5d1b67d684bb..793953dd499b 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -12,6 +12,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-subdev.h>
+#include <media/tpg/v4l2-tpg.h>
 
 #include "vimc-common.h"
 
@@ -455,7 +456,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
 }
 
 static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
-				    const void *sink_frame)
+				    void *sink_frame)
 {
 	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
 						    ved);
@@ -494,6 +495,14 @@ static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
 	.s_ctrl = vimc_deb_s_ctrl,
 };
 
+static void *vimc_deb_process_tpg(struct vimc_ent_device *ved,
+				  void *sink_tpg)
+{
+	//TODO: I dont know what to do here actually
+	((struct tpg_data *)sink_tpg)->color_enc = TGP_COLOR_ENC_RGB;
+	return sink_tpg;
+}
+
 static void vimc_deb_release(struct v4l2_subdev *sd)
 {
 	struct vimc_deb_device *vdeb =
@@ -568,9 +577,19 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	if (ret)
 		goto err_free_hdl;
 
-	vdeb->ved.process_frame = vimc_deb_process_frame;
-	vdeb->ved.dev = &vimc->pdev.dev;
-	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
+	vdeb->ved.process_data = vimc_deb_process_frame;
+	switch(vimc_op_mode) {
+		case VIMC_OP_MODE_FRAME:
+			vdeb->ved.process_data = vimc_deb_process_frame;
+			break;
+		case VIMC_OP_MODE_OPTMIZED:
+			vdeb->ved.process_data = vimc_deb_process_tpg;
+			break;
+		default:
+			vdeb->ved.process_data = vimc_deb_process_frame;
+			break;
+	}
+	vdeb->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
 	vdeb->sink_fmt = sink_fmt_default;
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 2f88a7d9d67b..eed35400090d 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -9,6 +9,7 @@
 #include <linux/vmalloc.h>
 #include <linux/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
+#include <media/tpg/v4l2-tpg.h>
 
 #include "vimc-common.h"
 
@@ -317,7 +318,7 @@ static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
 }
 
 static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
-				    const void *sink_frame)
+				    void *sink_frame)
 {
 	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
 						    ved);
@@ -331,10 +332,26 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
 	return vsca->src_frame;
 };
 
+static void *vimc_sca_process_tpg(struct vimc_ent_device *ved,
+				  void *sink_tpg)
+{
+	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
+						    ved);
+	const struct vimc_pix_map *vpix =
+				vimc_pix_map_by_code(vsca->sink_fmt.code);
+	struct tpg_data *tpg = (struct tpg_data *)sink_tpg;
+	tpg_reset_source(tpg, vsca->sink_fmt.width*sca_mult,
+			 vsca->sink_fmt.height*sca_mult, vsca->sink_fmt.field);
+	tpg_s_bytesperline(tpg, 0, vsca->sink_fmt.width * vpix->bpp * sca_mult);
+	tpg_s_buf_height(tpg, tpg->src_height * sca_mult);
+	tpg_s_fourcc(tpg, vpix->pixelformat);
+	return sink_tpg;
+}
+
 static void vimc_sca_release(struct v4l2_subdev *sd)
 {
 	struct vimc_sca_device *vsca =
-				container_of(sd, struct vimc_sca_device, sd);
+			       container_of(sd, struct vimc_sca_device, sd);
 
 	media_entity_cleanup(vsca->ved.ent);
 	kfree(vsca);
@@ -378,8 +395,18 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 		return NULL;
 	}
 
-	vsca->ved.process_frame = vimc_sca_process_frame;
-	vsca->ved.dev = &vimc->pdev.dev;
+	switch(vimc_op_mode) {
+		case VIMC_OP_MODE_FRAME:
+			vsca->ved.process_data = vimc_sca_process_frame;
+			break;
+		case VIMC_OP_MODE_OPTMIZED:
+			vsca->ved.process_data = vimc_sca_process_tpg;
+			break;
+		default:
+			vsca->ved.process_data = vimc_sca_process_frame;
+			break;
+	}
+	vsca->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 32380f504591..0305e2c693c6 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -183,7 +183,7 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
 };
 
 static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
-				    const void *sink_frame)
+				    void *sink_frame)
 {
 	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
 						    ved);
@@ -192,6 +192,14 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
 	return vsen->frame;
 }
 
+static void *vimc_sen_process_tpg(struct vimc_ent_device *ved,
+				  void *sink_tpg)
+{
+	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
+						    ved);
+	return &vsen->tpg;
+}
+
 static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct vimc_sen_device *vsen =
@@ -369,8 +377,18 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 	if (ret)
 		goto err_free_tpg;
 
-	vsen->ved.process_frame = vimc_sen_process_frame;
-	vsen->ved.dev = &vimc->pdev.dev;
+	switch(vimc_op_mode) {
+		case VIMC_OP_MODE_FRAME:
+			vsen->ved.process_data = vimc_sen_process_frame;
+			break;
+		case VIMC_OP_MODE_OPTMIZED:
+			vsen->ved.process_data = vimc_sen_process_tpg;
+			break;
+		default:
+			vsen->ved.process_data = vimc_sen_process_frame;
+			break;
+	}
+	vsen->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index cd6b55433c9e..5fcf77391434 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -159,7 +159,7 @@ static int vimc_streamer_thread(void *data)
 			break;
 
 		for (i = stream->pipe_size - 1; i >= 0; i--) {
-			frame = stream->ved_pipeline[i]->process_frame(
+			frame = stream->ved_pipeline[i]->process_data(
 					stream->ved_pipeline[i], frame);
 			if (!frame || IS_ERR(frame))
 				break;
-- 
2.24.0

