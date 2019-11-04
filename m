Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F6FEE2ED
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 15:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfKDO4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 09:56:17 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35662 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDO4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 09:56:16 -0500
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:a4c8::376f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3634328E8D9;
        Mon,  4 Nov 2019 14:56:13 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        andre.almeida@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH] media: vimc: crash fix - add refcount to vimc entities
Date:   Mon,  4 Nov 2019 15:55:58 +0100
Message-Id: <20191104145558.19750-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a kref field to the struct vimc_ent_device
and initialize it upon creation.
The kref is incremented before streaming
and is decremented when stopping the streaming and
when calling the release callback of the
v4l2 subdevice.
This fixes a crash that somtimes happens when
unbinding the device while streaming.
In this fix the vimc entities will be released
only after streaming is over.

The commands that cause the crash:

media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
v4l2-ctl --stream-mmap --stream-count=1000 -d /dev/video2 &
sleep 2
echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind

The crash log:
[  569.472444] device: 'v4l-subdev0': device_unregister
[  569.475125] device: 'v4l-subdev1': device_unregister
[  569.477611] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  569.480922] #PF: supervisor read access in kernel mode
[  569.483097] #PF: error_code(0x0000) - not-present page
[  569.485170] PGD 0 P4D 0
[  569.486097] Oops: 0000 [#1] SMP PTI
[  569.487328] CPU: 0 PID: 1326 Comm: vimc-streamer t Not tainted 5.4.0-rc1+ #38
[  569.489688] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
[  569.492413] RIP: 0010:memcpy_erms+0x6/0x10
[  569.493789] Code: 90 90 90 90 eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 f3 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 <f3> a4 c3 0f 1f 80 00 00 00 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
[  569.499655] RSP: 0018:ffff9645825f3de8 EFLAGS: 00010293
[  569.500814] RAX: ffff964582735000 RBX: 0000000000000000 RCX: 0000000000000280
[  569.502377] RDX: 0000000000000280 RSI: 0000000000000000 RDI: ffff964582735000
[  569.503891] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
[  569.505200] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8addc5e28160
[  569.506364] R13: ffff964582735000 R14: 0000000000000000 R15: 0000000000000000
[  569.507582] FS:  0000000000000000(0000) GS:ffff8addc7800000(0000) knlGS:0000000000000000
[  569.508923] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  569.509803] CR2: 0000000000000000 CR3: 00000000065f4006 CR4: 0000000000360ef0
[  569.510750] Call Trace:
[  569.511081]  tpg_fill_plane_buffer+0x97c/0xda0 [v4l2_tpg]
[  569.511783]  ? vimc_streamer_pipeline_terminate+0x90/0x90 [vimc]
[  569.512551]  vimc_sen_process_frame+0x1b/0x30 [vimc]
[  569.513197]  vimc_streamer_thread+0x7c/0xe0 [vimc]
[  569.513820]  kthread+0x10d/0x130
[  569.514244]  ? kthread_park+0x80/0x80
[  569.514672]  ret_from_fork+0x35/0x40
[  569.515059] Modules linked in: vimc videobuf2_vmalloc videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_common videodev mc
[  569.516240] CR2: 0000000000000000
[  569.516603] ---[ end trace 3a3e01dfd71f334c ]---
[  569.517139] RIP: 0010:memcpy_erms+0x6/0x10
[  569.517597] Code: 90 90 90 90 eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 f3 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 <f3> a4 c3 0f 1f 80 00 00 00 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
[  569.519710] RSP: 0018:ffff9645825f3de8 EFLAGS: 00010293
[  569.520259] RAX: ffff964582735000 RBX: 0000000000000000 RCX: 0000000000000280
[  569.521002] RDX: 0000000000000280 RSI: 0000000000000000 RDI: ffff964582735000
[  569.521751] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
[  569.522497] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8addc5e28160
[  569.523244] R13: ffff964582735000 R14: 0000000000000000 R15: 0000000000000000
[  569.523955] FS:  0000000000000000(0000) GS:ffff8addc7800000(0000) knlGS:0000000000000000
[  569.524844] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  569.525452] CR2: 0000000000000000 CR3: 00000000065f4006 CR4: 0000000000360ef0

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-capture.c | 30 +++++++++++-----
 drivers/media/platform/vimc/vimc-common.c  |  1 +
 drivers/media/platform/vimc/vimc-common.h  |  2 ++
 drivers/media/platform/vimc/vimc-debayer.c | 40 ++++++++++++++--------
 drivers/media/platform/vimc/vimc-scaler.c  | 38 +++++++++++++-------
 drivers/media/platform/vimc/vimc-sensor.c  | 32 +++++++++++------
 6 files changed, 96 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index a5d79fb25dff..6f7bbfc4446d 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -239,6 +239,7 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
 		return ret;
 	}
+	kref_get(&vcap->ved.ref);
 
 	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
 	if (ret) {
@@ -250,6 +251,24 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 }
 
+static void vimc_cap_free(struct kref *kref)
+{
+	struct vimc_cap_device *vcap = container_of(kref, struct vimc_cap_device, ved.ref);
+
+	pr_debug("freeing capture: '%s'\n", vcap->vdev.name);
+	kfree(vcap);
+}
+
+static void vimc_cap_release(struct video_device *vdev)
+{
+	struct vimc_cap_device *vcap =
+		container_of(vdev, struct vimc_cap_device, vdev);
+
+	media_entity_cleanup(vcap->ved.ent);
+	kref_put(&vcap->ved.ref, vimc_cap_free);
+}
+
+
 /*
  * Stop the stream engine. Any remaining buffers in the stream queue are
  * dequeued and passed on to the vb2 framework marked as STATE_ERROR.
@@ -265,6 +284,7 @@ static void vimc_cap_stop_streaming(struct vb2_queue *vq)
 
 	/* Release all active buffers */
 	vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_ERROR);
+	kref_put(&vcap->ved.ref, vimc_cap_free);
 }
 
 static void vimc_cap_buf_queue(struct vb2_buffer *vb2_buf)
@@ -325,15 +345,6 @@ static const struct media_entity_operations vimc_cap_mops = {
 	.link_validate		= vimc_link_validate,
 };
 
-static void vimc_cap_release(struct video_device *vdev)
-{
-	struct vimc_cap_device *vcap =
-		container_of(vdev, struct vimc_cap_device, vdev);
-
-	media_entity_cleanup(vcap->ved.ent);
-	kfree(vcap);
-}
-
 void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 {
 	struct vimc_cap_device *vcap;
@@ -467,6 +478,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 		goto err_release_queue;
 	}
 
+	kref_init(&vcap->ved.ref);
 	return &vcap->ved;
 
 err_release_queue:
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 2a0c40e9ae88..9d93c3c40d3c 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -351,6 +351,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 			name, ret);
 		goto err_clean_m_ent;
 	}
+	kref_init(&ved->ref);
 
 	return 0;
 
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index c75401a36312..a8699ac0a783 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -85,6 +85,7 @@ struct vimc_pix_map {
  * @vdev_get_format:	callback that returns the current format a pad, used
  *			only when is_media_entity_v4l2_video_device(ent) returns
  *			true
+ * @kref		ref count
  *
  * Each node of the topology must create a vimc_ent_device struct. Depending on
  * the node it will be of an instance of v4l2_subdev or video_device struct
@@ -101,6 +102,7 @@ struct vimc_ent_device {
 				const void *frame);
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
 			      struct v4l2_pix_format *fmt);
+	struct kref ref;
 };
 
 /**
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 5d1b67d684bb..8860ca3bf400 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -298,6 +298,30 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(struct vimc_deb_device *vdeb,
 		vdeb->src_frame[index + i] = rgb[i];
 }
 
+static void vimc_deb_free(struct kref *kref)
+{
+	struct vimc_deb_device *vdeb = container_of(kref, struct vimc_deb_device, ved.ref);
+
+	pr_debug("freeing debayer '%s'", vdeb->sd.name);
+	kfree(vdeb);
+}
+
+static void vimc_deb_release(struct v4l2_subdev *sd)
+{
+	struct vimc_deb_device *vdeb =
+		container_of(sd, struct vimc_deb_device, sd);
+
+	dev_dbg(vdeb->ved.dev, "release: put debayer '%s'\n", vdeb->sd.name);
+	media_entity_cleanup(vdeb->ved.ent);
+	kref_put(&vdeb->ved.ref, vimc_deb_free);
+}
+
+
+static const struct v4l2_subdev_internal_ops vimc_deb_int_ops = {
+	.release = vimc_deb_release,
+};
+
+
 static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
@@ -329,6 +353,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 		vdeb->src_frame = vmalloc(frame_size);
 		if (!vdeb->src_frame)
 			return -ENOMEM;
+		kref_get(&vdeb->ved.ref);
 
 	} else {
 		if (!vdeb->src_frame)
@@ -336,6 +361,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 
 		vfree(vdeb->src_frame);
 		vdeb->src_frame = NULL;
+		kref_put(&vdeb->ved.ref, vimc_deb_free);
 	}
 
 	return 0;
@@ -494,20 +520,6 @@ static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
 	.s_ctrl = vimc_deb_s_ctrl,
 };
 
-static void vimc_deb_release(struct v4l2_subdev *sd)
-{
-	struct vimc_deb_device *vdeb =
-				container_of(sd, struct vimc_deb_device, sd);
-
-	v4l2_ctrl_handler_free(&vdeb->hdl);
-	media_entity_cleanup(vdeb->ved.ent);
-	kfree(vdeb);
-}
-
-static const struct v4l2_subdev_internal_ops vimc_deb_int_ops = {
-	.release = vimc_deb_release,
-};
-
 void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 {
 	struct vimc_deb_device *vdeb;
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 2f88a7d9d67b..cb04408834b5 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -197,6 +197,29 @@ static const struct v4l2_subdev_pad_ops vimc_sca_pad_ops = {
 	.set_fmt		= vimc_sca_set_fmt,
 };
 
+static void vimc_sca_free(struct kref *kref)
+{
+	struct vimc_sca_device *vsca = container_of(kref, struct vimc_sca_device, ved.ref);
+
+	pr_debug("freeing scaler '%s'", vsca->sd.name);
+	kfree(vsca);
+}
+
+static void vimc_sca_release(struct v4l2_subdev *sd)
+{
+	struct vimc_sca_device *vsca =
+		container_of(sd, struct vimc_sca_device, sd);
+
+	dev_dbg(vsca->ved.dev, "release: put scaler '%s'\n", vsca->sd.name);
+	media_entity_cleanup(vsca->ved.ent);
+	kref_put(&vsca->ved.ref, vimc_sca_free);
+}
+
+static const struct v4l2_subdev_internal_ops vimc_sca_int_ops = {
+	.release = vimc_sca_release,
+};
+
+
 static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
@@ -227,12 +250,14 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 		if (!vsca->src_frame)
 			return -ENOMEM;
 
+		kref_get(&vsca->ved.ref);
 	} else {
 		if (!vsca->src_frame)
 			return 0;
 
 		vfree(vsca->src_frame);
 		vsca->src_frame = NULL;
+		kref_put(&vsca->ved.ref, vimc_sca_free);
 	}
 
 	return 0;
@@ -331,19 +356,6 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
 	return vsca->src_frame;
 };
 
-static void vimc_sca_release(struct v4l2_subdev *sd)
-{
-	struct vimc_sca_device *vsca =
-				container_of(sd, struct vimc_sca_device, sd);
-
-	media_entity_cleanup(vsca->ved.ent);
-	kfree(vsca);
-}
-
-static const struct v4l2_subdev_internal_ops vimc_sca_int_ops = {
-	.release = vimc_sca_release,
-};
-
 void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 {
 	struct vimc_sca_device *vsca;
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 25ee89a067f7..f137ff23b892 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -193,6 +193,25 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
 	return vsen->frame;
 }
 
+static void vimc_sen_free(struct kref *kref)
+{
+	struct vimc_sen_device *vsen = container_of(kref, struct vimc_sen_device, ved.ref);
+
+	pr_debug("freeing sensor '%s'", vsen->sd.name);
+	v4l2_ctrl_handler_free(&vsen->hdl);
+	tpg_free(&vsen->tpg);
+	kfree(vsen);
+}
+
+static void vimc_sen_release(struct v4l2_subdev *sd)
+{
+	struct vimc_sen_device *vsen =
+		container_of(sd, struct vimc_sen_device, sd);
+
+	dev_dbg(vsen->ved.dev, "release: put sensor '%s'\n", vsen->sd.name);
+	kref_put(&vsen->ved.ref, vimc_sen_free);
+}
+
 static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct vimc_sen_device *vsen =
@@ -221,11 +240,13 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 
 		/* configure the test pattern generator */
 		vimc_sen_tpg_s_format(vsen);
+		kref_get(&vsen->ved.ref);
 
 	} else {
 
 		vfree(vsen->frame);
 		vsen->frame = NULL;
+		kref_put(&vsen->ved.ref, vimc_sen_free);
 	}
 
 	return 0;
@@ -284,17 +305,6 @@ static const struct v4l2_ctrl_ops vimc_sen_ctrl_ops = {
 	.s_ctrl = vimc_sen_s_ctrl,
 };
 
-static void vimc_sen_release(struct v4l2_subdev *sd)
-{
-	struct vimc_sen_device *vsen =
-				container_of(sd, struct vimc_sen_device, sd);
-
-	v4l2_ctrl_handler_free(&vsen->hdl);
-	tpg_free(&vsen->tpg);
-	media_entity_cleanup(vsen->ved.ent);
-	kfree(vsen);
-}
-
 static const struct v4l2_subdev_internal_ops vimc_sen_int_ops = {
 	.release = vimc_sen_release,
 };
-- 
2.20.1

