Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5342109D89
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 13:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbfKZMIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 07:08:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49518 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728219AbfKZMIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 07:08:37 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 66102283C02
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        dafna3@gmail.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com
Subject: [PATCH v3 3/3] media: vimc: crash fix - release vimc in the v4l_device release
Date:   Tue, 26 Nov 2019 13:08:22 +0100
Message-Id: <20191126120822.11451-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126120822.11451-1-dafna.hirschfeld@collabora.com>
References: <20191126120822.11451-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

move the release of the vimc entities and vimc_device to the
release callback of v4l2_device. This fixes a crash that
sometimes happens when unbinding the device while streaming.
The .rm callback of vimc_ent_config is replaced by two callbacks:
.unregister - this is called upon removing the device and
it unregisters the entity.
.release - this is called from the release callback of v4l2_device
and it frees the entity.
This ensures that the entities will be released when the last fh
of any of the devices is closed.

The commands that cause the crash and the crash log:

media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
v4l2-ctl --stream-mmap --stream-count=1000 -d /dev/video2 &
sleep 1
echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind

[   28.583149] general protection fault: 0000 [#1] SMP PTI
[   28.583949] CPU: 0 PID: 185 Comm: trash.sh Not tainted 5.4.0-rc1+ #55
[   28.585130] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
[   28.587071] RIP: 0010:vimc_streamer_pipeline_terminate.part.5.cold.6+0x3f/0x9c [vimc]
[   28.588969] Code: 01 00 00 48 89 ee e8 02 28 6a ea 8b 83 a0 01 00 00 48 c7 84 c3 20 01 00 00 00 00 00 00 48 8b 7d 08 48 85 ff 0f 84 cf d6 ff ff <83> 7f 28 02 75 15 48 8b 87 a8 00 00 00 48 8b 40 18 48 85 c0 75 0a
[   28.592920] RSP: 0018:ffff9a464021bd50 EFLAGS: 00010202
[   28.594058] RAX: 0000000000000002 RBX: ffff89167bd47820 RCX: ffffffffabc53e78
[   28.595650] RDX: 0000000000000000 RSI: 0000000000000092 RDI: 2f73656369766564
[   28.597226] RBP: ffff89167bfd2800 R08: 00000000000002e0 R09: 000000000000002c
[   28.598719] R10: 0000000000000000 R11: ffff9a464021bc08 R12: ffff89167bd47590
[   28.600173] R13: ffff89167c5efa40 R14: ffff9a464021bf08 R15: ffff89167bdc9aa0
[   28.601531] FS:  00007f589f3c6740(0000) GS:ffff89167da00000(0000) knlGS:0000000000000000
[   28.603054] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.604153] CR2: 00007f589f5857f0 CR3: 000000007bd8a005 CR4: 0000000000360ef0
[   28.605598] Call Trace:
[   28.606718]  vimc_streamer_s_stream+0x6d/0x230 [vimc]
[   28.607994]  vimc_cap_stop_streaming+0x16/0x30 [vimc]
[   28.609641]  __vb2_queue_cancel+0x3c/0x2d0 [videobuf2_common]
[   28.611690]  vb2_core_queue_release+0x19/0x40 [videobuf2_common]
[   28.612951]  vimc_cap_rm+0x10/0x20 [vimc]
[   28.613809]  vimc_rm_subdevs+0x37/0x50 [vimc]
[   28.614765]  vimc_remove+0x1a/0x60 [vimc]
[   28.615609]  platform_drv_remove+0x1d/0x40
[   28.616291]  device_release_driver_internal+0xe0/0x1c0
[   28.617232]  unbind_store+0xeb/0x120
[   28.617913]  kernfs_fop_write+0x103/0x180
[   28.618574]  vfs_write+0xa0/0x1a0
[   28.619072]  ksys_write+0x54/0xd0
[   28.619701]  do_syscall_64+0x43/0x110
[   28.620383]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   28.621132] RIP: 0033:0x7f589f4b3504
[   28.621642] Code: 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b3 0f 1f 80 00 00 00 00 48 8d 05 f9 61 0d 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 41 54 49 89 d4 55 48 89 f5 53
[   28.624485] RSP: 002b:00007ffd93697958 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[   28.625639] RAX: ffffffffffffffda RBX: 0000000000000006 RCX: 00007f589f4b3504
[   28.626727] RDX: 0000000000000006 RSI: 00005597b0c42270 RDI: 0000000000000001
[   28.627821] RBP: 00005597b0c42270 R08: 00007f589f5868c0 R09: 00007f589f3c6740
[   28.628788] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f589f585760
[   28.629831] R13: 0000000000000006 R14: 00007f589f580760 R15: 0000000000000006
[   28.631014] Modules linked in: vimc videobuf2_vmalloc videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_common videodev mc [last unloaded: videobuf2_memops]
[   28.633383] ---[ end trace 2cd0a232e2bb24bb ]---
[   28.634134] RIP: 0010:vimc_streamer_pipeline_terminate.part.5.cold.6+0x3f/0x9c [vimc]
[   28.635392] Code: 01 00 00 48 89 ee e8 02 28 6a ea 8b 83 a0 01 00 00 48 c7 84 c3 20 01 00 00 00 00 00 00 48 8b 7d 08 48 85 ff 0f 84 cf d6 ff ff <83> 7f 28 02 75 15 48 8b 87 a8 00 00 00 48 8b 40 18 48 85 c0 75 0a
[   28.639077] RSP: 0018:ffff9a464021bd50 EFLAGS: 00010202
[   28.640151] RAX: 0000000000000002 RBX: ffff89167bd47820 RCX: ffffffffabc53e78
[   28.641492] RDX: 0000000000000000 RSI: 0000000000000092 RDI: 2f73656369766564
[   28.642760] RBP: ffff89167bfd2800 R08: 00000000000002e0 R09: 000000000000002c
[   28.644010] R10: 0000000000000000 R11: ffff9a464021bc08 R12: ffff89167bd47590
[   28.645291] R13: ffff89167c5efa40 R14: ffff9a464021bf08 R15: ffff89167bdc9aa0
[   28.646665] FS:  00007f589f3c6740(0000) GS:ffff89167da00000(0000) knlGS:0000000000000000
[   28.648126] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.649210] CR2: 00007f589f5857f0 CR3: 000000007bd8a005 CR4: 0000000000360ef0

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-capture.c | 12 ++--
 drivers/media/platform/vimc/vimc-common.c  |  2 -
 drivers/media/platform/vimc/vimc-common.h  | 28 +++++----
 drivers/media/platform/vimc/vimc-core.c    | 68 ++++++++++++++++------
 drivers/media/platform/vimc/vimc-debayer.c | 17 ++----
 drivers/media/platform/vimc/vimc-scaler.c  | 17 ++----
 drivers/media/platform/vimc/vimc-sensor.c  | 16 ++---
 7 files changed, 90 insertions(+), 70 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 9a78bb7826a8..c5a645f98c66 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -325,20 +325,20 @@ static const struct media_entity_operations vimc_cap_mops = {
 	.link_validate		= vimc_vdev_link_validate,
 };
 
-static void vimc_cap_release(struct video_device *vdev)
+void vimc_cap_release(struct vimc_ent_device *ved)
 {
 	struct vimc_cap_device *vcap =
-		container_of(vdev, struct vimc_cap_device, vdev);
+		container_of(ved, struct vimc_cap_device, ved);
 
 	media_entity_cleanup(vcap->ved.ent);
 	kfree(vcap);
 }
 
-void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+void vimc_cap_unregister(struct vimc_ent_device *ved)
 {
-	struct vimc_cap_device *vcap;
+	struct vimc_cap_device *vcap =
+		container_of(ved, struct vimc_cap_device, ved);
 
-	vcap = container_of(ved, struct vimc_cap_device, ved);
 	vb2_queue_release(&vcap->queue);
 	video_unregister_device(&vcap->vdev);
 }
@@ -449,7 +449,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	vdev = &vcap->vdev;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	vdev->entity.ops = &vimc_cap_mops;
-	vdev->release = vimc_cap_release;
+	vdev->release = video_device_release_empty;
 	vdev->fops = &vimc_cap_fops;
 	vdev->ioctl_ops = &vimc_cap_ioctl_ops;
 	vdev->lock = &vcap->lock;
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 16ce9f3b7c75..c95c17c048f2 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -327,7 +327,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 			 u32 function,
 			 u16 num_pads,
 			 struct media_pad *pads,
-			 const struct v4l2_subdev_internal_ops *sd_int_ops,
 			 const struct v4l2_subdev_ops *sd_ops)
 {
 	int ret;
@@ -337,7 +336,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 
 	/* Initialize the subdev */
 	v4l2_subdev_init(sd, sd_ops);
-	sd->internal_ops = sd_int_ops;
 	sd->entity.function = function;
 	sd->entity.ops = &vimc_ent_sd_mops;
 	sd->owner = THIS_MODULE;
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 1b6ef7196f3c..99beb2134d40 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -125,16 +125,18 @@ struct vimc_device {
  * @name			entity name
  * @ved				pointer to vimc_ent_device (a node in the
  *					topology)
- * @add				subdev add hook - initializes and registers
- *					subdev called from vimc-core
- * @rm				subdev rm hook - unregisters and frees
- *					subdev called from vimc-core
+ * @add				initializes and registers
+ *					vim entity - called from vimc-core
+ * @unregister			unregisters vimc entity - called from vimc-core
+ * @release			releases vimc entity - called from the v4l2_dev
+ *					release callback
  */
 struct vimc_ent_config {
 	const char *name;
 	struct vimc_ent_device *(*add)(struct vimc_device *vimc,
 				       const char *vcfg_name);
-	void (*rm)(struct vimc_device *vimc, struct vimc_ent_device *ved);
+	void (*unregister)(struct vimc_ent_device *ved);
+	void (*release)(struct vimc_ent_device *ved);
 };
 
 /**
@@ -145,22 +147,26 @@ struct vimc_ent_config {
  */
 bool vimc_is_source(struct media_entity *ent);
 
-/* prototypes for vimc_ent_config add and rm hooks */
+/* prototypes for vimc_ent_config hooks */
 struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
-void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+void vimc_cap_unregister(struct vimc_ent_device *ved);
+void vimc_cap_release(struct vimc_ent_device *ved);
 
 struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
-void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+void vimc_deb_unregister(struct vimc_ent_device *ved);
+void vimc_deb_release(struct vimc_ent_device *ved);
 
 struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
-void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+void vimc_sca_unregister(struct vimc_ent_device *ved);
+void vimc_sca_release(struct vimc_ent_device *ved);
 
 struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
-void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+void vimc_sen_unregister(struct vimc_ent_device *ved);
+void vimc_sen_release(struct vimc_ent_device *ved);
 
 /**
  * vimc_pix_map_by_index - get vimc_pix_map struct by its index
@@ -195,7 +201,6 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
  * @num_pads:	number of pads to initialize
  * @pads:	the array of pads of the entity, the caller should set the
 		flags of the pads
- * @sd_int_ops:	pointer to &struct v4l2_subdev_internal_ops
  * @sd_ops:	pointer to &struct v4l2_subdev_ops.
  *
  * Helper function initialize and register the struct vimc_ent_device and struct
@@ -208,7 +213,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 			 u32 function,
 			 u16 num_pads,
 			 struct media_pad *pads,
-			 const struct v4l2_subdev_internal_ops *sd_int_ops,
 			 const struct v4l2_subdev_ops *sd_ops);
 
 /**
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 1c55e0382f09..9d4e8bc89620 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -48,48 +48,57 @@ static struct vimc_ent_config ent_config[] = {
 	{
 		.name = "Sensor A",
 		.add = vimc_sen_add,
-		.rm = vimc_sen_rm,
+		.unregister = vimc_sen_unregister,
+		.release = vimc_sen_release,
 	},
 	{
 		.name = "Sensor B",
 		.add = vimc_sen_add,
-		.rm = vimc_sen_rm,
+		.unregister = vimc_sen_unregister,
+		.release = vimc_sen_release,
 	},
 	{
 		.name = "Debayer A",
 		.add = vimc_deb_add,
-		.rm = vimc_deb_rm,
+		.unregister = vimc_deb_unregister,
+		.release = vimc_deb_release,
 	},
 	{
 		.name = "Debayer B",
 		.add = vimc_deb_add,
-		.rm = vimc_deb_rm,
+		.unregister = vimc_deb_unregister,
+		.release = vimc_deb_release,
 	},
 	{
 		.name = "Raw Capture 0",
 		.add = vimc_cap_add,
-		.rm = vimc_cap_rm,
+		.unregister = vimc_cap_unregister,
+		.release = vimc_cap_release,
 	},
 	{
 		.name = "Raw Capture 1",
 		.add = vimc_cap_add,
-		.rm = vimc_cap_rm,
+		.unregister = vimc_cap_unregister,
+		.release = vimc_cap_release,
 	},
 	{
 		/* TODO: change this to vimc-input when it is implemented */
 		.name = "RGB/YUV Input",
 		.add = vimc_sen_add,
-		.rm = vimc_sen_rm,
+		.unregister = vimc_sen_unregister,
+		.release = vimc_sen_release,
 	},
 	{
 		.name = "Scaler",
 		.add = vimc_sca_add,
-		.rm = vimc_sca_rm,
+		.unregister = vimc_sca_unregister,
+		.release = vimc_sca_release,
 	},
 	{
 		.name = "RGB/YUV Capture",
 		.add = vimc_cap_add,
-		.rm = vimc_cap_rm,
+		.unregister = vimc_cap_unregister,
+		.release = vimc_cap_release,
 	},
 };
 
@@ -175,13 +184,34 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
 	return 0;
 }
 
-static void vimc_rm_subdevs(struct vimc_device *vimc)
+static void vimc_release_subdevs(struct vimc_device *vimc)
 {
 	unsigned int i;
 
 	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
 		if (vimc->ent_devs[i])
-			vimc->pipe_cfg->ents[i].rm(vimc, vimc->ent_devs[i]);
+			vimc->pipe_cfg->ents[i].release(vimc->ent_devs[i]);
+}
+
+
+static void vimc_unregister_subdevs(struct vimc_device *vimc)
+{
+	unsigned int i;
+
+	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
+		if (vimc->ent_devs[i])
+			vimc->pipe_cfg->ents[i].unregister(vimc->ent_devs[i]);
+}
+
+static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
+{
+	struct vimc_device *vimc =
+		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
+
+	vimc_release_subdevs(vimc);
+	media_device_cleanup(&vimc->mdev);
+	kfree(vimc->ent_devs);
+	kfree(vimc);
 }
 
 static int vimc_register_devices(struct vimc_device *vimc)
@@ -195,7 +225,6 @@ static int vimc_register_devices(struct vimc_device *vimc)
 			"v4l2 device register failed (err=%d)\n", ret);
 		return ret;
 	}
-
 	/* allocate ent_devs */
 	vimc->ent_devs = kcalloc(vimc->pipe_cfg->num_ents,
 				 sizeof(*vimc->ent_devs), GFP_KERNEL);
@@ -236,9 +265,9 @@ static int vimc_register_devices(struct vimc_device *vimc)
 
 err_mdev_unregister:
 	media_device_unregister(&vimc->mdev);
-	media_device_cleanup(&vimc->mdev);
 err_rm_subdevs:
-	vimc_rm_subdevs(vimc);
+	vimc_unregister_subdevs(vimc);
+	vimc_release_subdevs(vimc);
 	kfree(vimc->ent_devs);
 err_v4l2_unregister:
 	v4l2_device_unregister(&vimc->v4l2_dev);
@@ -248,11 +277,9 @@ static int vimc_register_devices(struct vimc_device *vimc)
 
 static void vimc_unregister(struct vimc_device *vimc)
 {
+	vimc_unregister_subdevs(vimc);
 	media_device_unregister(&vimc->mdev);
-	media_device_cleanup(&vimc->mdev);
 	v4l2_device_unregister(&vimc->v4l2_dev);
-	kfree(vimc->ent_devs);
-	kfree(vimc);
 }
 
 static int vimc_probe(struct platform_device *pdev)
@@ -285,7 +312,12 @@ static int vimc_probe(struct platform_device *pdev)
 		kfree(vimc);
 		return ret;
 	}
+	/*
+	 * the release cb is set only after successful registration.
+	 * if the registration fails, we release directly from probe
+	 */
 
+	vimc->v4l2_dev.release = vimc_v4l2_dev_release;
 	platform_set_drvdata(pdev, vimc);
 	return 0;
 }
@@ -296,8 +328,8 @@ static int vimc_remove(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "remove");
 
-	vimc_rm_subdevs(vimc);
 	vimc_unregister(vimc);
+	v4l2_device_put(&vimc->v4l2_dev);
 
 	return 0;
 }
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 34b98b235880..3beec7f95b47 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -494,25 +494,21 @@ static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
 	.s_ctrl = vimc_deb_s_ctrl,
 };
 
-static void vimc_deb_release(struct v4l2_subdev *sd)
+void vimc_deb_release(struct vimc_ent_device *ved)
 {
 	struct vimc_deb_device *vdeb =
-				container_of(sd, struct vimc_deb_device, sd);
+		container_of(ved, struct vimc_deb_device, ved);
 
 	v4l2_ctrl_handler_free(&vdeb->hdl);
 	media_entity_cleanup(vdeb->ved.ent);
 	kfree(vdeb);
 }
 
-static const struct v4l2_subdev_internal_ops vimc_deb_int_ops = {
-	.release = vimc_deb_release,
-};
-
-void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+void vimc_deb_unregister(struct vimc_ent_device *ved)
 {
-	struct vimc_deb_device *vdeb;
+	struct vimc_deb_device *vdeb =
+		container_of(ved, struct vimc_deb_device, ved);
 
-	vdeb = container_of(ved, struct vimc_deb_device, ved);
 	v4l2_device_unregister_subdev(&vdeb->sd);
 }
 
@@ -563,8 +559,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
 				   vcfg_name,
 				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
-				   vdeb->pads,
-				   &vimc_deb_int_ops, &vimc_deb_ops);
+				   vdeb->pads, &vimc_deb_ops);
 	if (ret)
 		goto err_free_hdl;
 
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index ecdbec5824c8..2d1415b97ff8 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -331,24 +331,20 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
 	return vsca->src_frame;
 };
 
-static void vimc_sca_release(struct v4l2_subdev *sd)
+void vimc_sca_release(struct vimc_ent_device *ved)
 {
 	struct vimc_sca_device *vsca =
-				container_of(sd, struct vimc_sca_device, sd);
+		container_of(ved, struct vimc_sca_device, ved);
 
 	media_entity_cleanup(vsca->ved.ent);
 	kfree(vsca);
 }
 
-static const struct v4l2_subdev_internal_ops vimc_sca_int_ops = {
-	.release = vimc_sca_release,
-};
-
-void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+void vimc_sca_unregister(struct vimc_ent_device *ved)
 {
-	struct vimc_sca_device *vsca;
+	struct vimc_sca_device *vsca =
+		container_of(ved, struct vimc_sca_device, ved);
 
-	vsca = container_of(ved, struct vimc_sca_device, ved);
 	v4l2_device_unregister_subdev(&vsca->sd);
 }
 
@@ -371,8 +367,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
 				   vcfg_name,
 				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
-				   vsca->pads,
-				   &vimc_sca_int_ops, &vimc_sca_ops);
+				   vsca->pads, &vimc_sca_ops);
 	if (ret) {
 		kfree(vsca);
 		return NULL;
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 9788fe291193..14eeaf461e93 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -279,10 +279,10 @@ static const struct v4l2_ctrl_ops vimc_sen_ctrl_ops = {
 	.s_ctrl = vimc_sen_s_ctrl,
 };
 
-static void vimc_sen_release(struct v4l2_subdev *sd)
+void vimc_sen_release(struct vimc_ent_device *ved)
 {
 	struct vimc_sen_device *vsen =
-				container_of(sd, struct vimc_sen_device, sd);
+		container_of(ved, struct vimc_sen_device, ved);
 
 	v4l2_ctrl_handler_free(&vsen->hdl);
 	tpg_free(&vsen->tpg);
@@ -290,15 +290,11 @@ static void vimc_sen_release(struct v4l2_subdev *sd)
 	kfree(vsen);
 }
 
-static const struct v4l2_subdev_internal_ops vimc_sen_int_ops = {
-	.release = vimc_sen_release,
-};
-
-void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+void vimc_sen_unregister(struct vimc_ent_device *ved)
 {
-	struct vimc_sen_device *vsen;
+	struct vimc_sen_device *vsen =
+		container_of(ved, struct vimc_sen_device, ved);
 
-	vsen = container_of(ved, struct vimc_sen_device, ved);
 	v4l2_device_unregister_subdev(&vsen->sd);
 }
 
@@ -365,7 +361,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 	ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
 				   vcfg_name,
 				   MEDIA_ENT_F_CAM_SENSOR, 1, &vsen->pad,
-				   &vimc_sen_int_ops, &vimc_sen_ops);
+				   &vimc_sen_ops);
 	if (ret)
 		goto err_free_tpg;
 
-- 
2.20.1

