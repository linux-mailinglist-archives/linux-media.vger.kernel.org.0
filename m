Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB2449F533
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 09:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347313AbiA1Iel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 03:34:41 -0500
Received: from retiisi.eu ([95.216.213.190]:59024 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347335AbiA1Iek (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 03:34:40 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id EAB8C634C96;
        Fri, 28 Jan 2022 10:34:37 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 4/4] v4l: ioctl: Set bus_info in v4l_querycap()
Date:   Fri, 28 Jan 2022 10:33:09 +0200
Message-Id: <20220128083309.213122-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bus_info field is set by most drivers based on the type of the device
bus as well as the name of the device. Do this in v4l_querycap() so
drivers don't need to. This keeps compatibility with non-default and silly
bus_info.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/common/saa7146/saa7146_video.c        | 1 -
 drivers/media/pci/bt8xx/bttv-driver.c               | 2 --
 drivers/media/pci/cx18/cx18-ioctl.c                 | 2 --
 drivers/media/pci/cx88/cx88-blackbird.c             | 1 -
 drivers/media/pci/cx88/cx88-video.c                 | 1 -
 drivers/media/pci/dt3155/dt3155.c                   | 3 ---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c       | 4 ----
 drivers/media/pci/ivtv/ivtv-ioctl.c                 | 1 -
 drivers/media/pci/meye/meye.c                       | 1 -
 drivers/media/pci/saa7134/saa7134-video.c           | 1 -
 drivers/media/pci/saa7164/saa7164-encoder.c         | 1 -
 drivers/media/pci/saa7164/saa7164-vbi.c             | 1 -
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c      | 2 --
 drivers/media/pci/solo6x10/solo6x10-v4l2.c          | 2 --
 drivers/media/pci/sta2x11/sta2x11_vip.c             | 2 --
 drivers/media/pci/tw5864/tw5864-video.c             | 1 -
 drivers/media/pci/tw68/tw68-video.c                 | 3 ---
 drivers/media/pci/tw686x/tw686x-video.c             | 2 --
 drivers/media/platform/allegro-dvt/allegro-core.c   | 5 -----
 drivers/media/platform/davinci/vpbe_display.c       | 2 --
 drivers/media/platform/davinci/vpif_capture.c       | 2 --
 drivers/media/platform/davinci/vpif_display.c       | 2 --
 drivers/media/platform/exynos-gsc/gsc-m2m.c         | 5 -----
 drivers/media/platform/exynos4-is/common.c          | 2 --
 drivers/media/platform/exynos4-is/fimc-lite.c       | 4 ----
 drivers/media/platform/imx-jpeg/mxc-jpeg.c          | 4 ----
 drivers/media/platform/marvell-ccic/cafe-driver.c   | 1 -
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c     | 2 --
 drivers/media/platform/qcom/camss/camss-video.c     | 4 ----
 drivers/media/platform/rcar-vin/rcar-v4l2.c         | 4 ----
 drivers/media/platform/rcar_jpu.c                   | 2 --
 drivers/media/platform/s5p-jpeg/jpeg-core.c         | 2 --
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c        | 2 --
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c        | 2 --
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 4 ----
 drivers/media/platform/ti-vpe/cal-video.c           | 4 ----
 drivers/media/platform/vsp1/vsp1_histo.c            | 2 --
 drivers/media/platform/vsp1/vsp1_video.c            | 2 --
 drivers/media/radio/radio-maxiradio.c               | 2 --
 drivers/media/v4l2-core/v4l2-ioctl.c                | 4 ++++
 40 files changed, 4 insertions(+), 90 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 66215d9106a4..2296765079a4 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -443,7 +443,6 @@ static int vidioc_querycap(struct file *file, void *fh, struct v4l2_capability *
 
 	strscpy((char *)cap->driver, "saa7146 v4l2", sizeof(cap->driver));
 	strscpy((char *)cap->card, dev->ext->name, sizeof(cap->card));
-	sprintf((char *)cap->bus_info, "PCI:%s", pci_name(dev->pci));
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY |
 			    V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_DEVICE_CAPS;
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 8cc9bec43688..c3512299794c 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2435,8 +2435,6 @@ static int bttv_querycap(struct file *file, void  *priv,
 
 	strscpy(cap->driver, "bttv", sizeof(cap->driver));
 	strscpy(cap->card, btv->video_dev.name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "PCI:%s", pci_name(btv->c.pci));
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 			    V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
 	if (no_overlay <= 0)
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index ce3f0141f94e..c8ba7841c720 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -389,8 +389,6 @@ static int cx18_querycap(struct file *file, void *fh,
 
 	strscpy(vcap->driver, CX18_DRIVER_NAME, sizeof(vcap->driver));
 	strscpy(vcap->card, cx->card_name, sizeof(vcap->card));
-	snprintf(vcap->bus_info, sizeof(vcap->bus_info),
-		 "PCI:%s", pci_name(cx->pci_dev));
 	vcap->capabilities = cx->v4l2_cap | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index d5da3bd5695d..c1b41a9283c1 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -796,7 +796,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	struct cx88_core *core = dev->core;
 
 	strscpy(cap->driver, "cx88_blackbird", sizeof(cap->driver));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
 	return cx88_querycap(file, core, cap);
 }
 
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index c17ad9f7d822..d3729be89252 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -808,7 +808,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	struct cx88_core *core = dev->core;
 
 	strscpy(cap->driver, "cx8800", sizeof(cap->driver));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
 	return cx88_querycap(file, core, cap);
 }
 
diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 961f844de99c..548156b199cc 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -292,11 +292,8 @@ static const struct v4l2_file_operations dt3155_fops = {
 static int dt3155_querycap(struct file *filp, void *p,
 			   struct v4l2_capability *cap)
 {
-	struct dt3155_priv *pd = video_drvdata(filp);
-
 	strscpy(cap->driver, DT3155_NAME, sizeof(cap->driver));
 	strscpy(cap->card, DT3155_NAME " frame grabber", sizeof(cap->card));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(pd->pdev));
 	return 0;
 }
 
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index b15fac775e14..0975a069bd38 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1046,12 +1046,8 @@ static const struct vb2_ops cio2_vb2_ops = {
 static int cio2_v4l2_querycap(struct file *file, void *fh,
 			      struct v4l2_capability *cap)
 {
-	struct cio2_device *cio2 = video_drvdata(file);
-
 	strscpy(cap->driver, CIO2_NAME, sizeof(cap->driver));
 	strscpy(cap->card, CIO2_DEVICE_NAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "PCI:%s", pci_name(cio2->pci_dev));
 
 	return 0;
 }
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 0cdf6b3210c2..e5bc581ee464 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -732,7 +732,6 @@ static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vc
 
 	strscpy(vcap->driver, IVTV_DRIVER_NAME, sizeof(vcap->driver));
 	strscpy(vcap->card, itv->card_name, sizeof(vcap->card));
-	snprintf(vcap->bus_info, sizeof(vcap->bus_info), "PCI:%s", pci_name(itv->pdev));
 	vcap->capabilities = itv->v4l2_cap | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
diff --git a/drivers/media/pci/meye/meye.c b/drivers/media/pci/meye/meye.c
index 8944e4bd4638..5d87efd9b95c 100644
--- a/drivers/media/pci/meye/meye.c
+++ b/drivers/media/pci/meye/meye.c
@@ -1012,7 +1012,6 @@ static int vidioc_querycap(struct file *file, void *fh,
 {
 	strscpy(cap->driver, "meye", sizeof(cap->driver));
 	strscpy(cap->card, "meye", sizeof(cap->card));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(meye.mchip_dev));
 	return 0;
 }
 
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 374c8e1087de..013314d6d78b 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -1478,7 +1478,6 @@ int saa7134_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, "saa7134", sizeof(cap->driver));
 	strscpy(cap->card, saa7134_boards[dev->board].name,
 		sizeof(cap->card));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
 	cap->capabilities = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_RADIO | V4L2_CAP_VIDEO_CAPTURE |
 			    V4L2_CAP_VBI_CAPTURE | V4L2_CAP_DEVICE_CAPS;
diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 1d1d32e043f1..c1b6a0596801 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -490,7 +490,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->driver, dev->name, sizeof(cap->driver));
 	strscpy(cap->card, saa7164_boards[dev->board].name,
 		sizeof(cap->card));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 			    V4L2_CAP_TUNER | V4L2_CAP_VBI_CAPTURE |
 			    V4L2_CAP_DEVICE_CAPS;
diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index cb2e09f0841d..a6738baab688 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -201,7 +201,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->driver, dev->name, sizeof(cap->driver));
 	strscpy(cap->card, saa7164_boards[dev->board].name,
 		sizeof(cap->card));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 			    V4L2_CAP_TUNER | V4L2_CAP_VBI_CAPTURE |
 			    V4L2_CAP_DEVICE_CAPS;
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 7766cadb73ea..956b2bbe9b71 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -769,8 +769,6 @@ static int solo_enc_querycap(struct file *file, void  *priv,
 	strscpy(cap->driver, SOLO6X10_NAME, sizeof(cap->driver));
 	snprintf(cap->card, sizeof(cap->card), "Softlogic 6x10 Enc %d",
 		 solo_enc->ch);
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
-		 pci_name(solo_dev->pdev));
 	return 0;
 }
 
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index 24ef0c446bef..f0c0e66a9d58 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -376,8 +376,6 @@ static int solo_querycap(struct file *file, void  *priv,
 
 	strscpy(cap->driver, SOLO6X10_NAME, sizeof(cap->driver));
 	strscpy(cap->card, "Softlogic 6x10", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
-		 pci_name(solo_dev->pdev));
 	return 0;
 }
 
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index 524912f20d9f..9365ffd271c2 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -405,8 +405,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
-		 pci_name(vip->pdev));
 	return 0;
 }
 
diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index 9131265c2b87..197ed8978102 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -604,7 +604,6 @@ static int tw5864_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, "tw5864", sizeof(cap->driver));
 	snprintf(cap->card, sizeof(cap->card), "TW5864 Encoder %d",
 		 input->nr);
-	sprintf(cap->bus_info, "PCI:%s", pci_name(input->root->pci));
 	return 0;
 }
 
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index fe94944d0531..0cbc5b038073 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -712,12 +712,9 @@ static int tw68_s_input(struct file *file, void *priv, unsigned int i)
 static int tw68_querycap(struct file *file, void  *priv,
 					struct v4l2_capability *cap)
 {
-	struct tw68_dev *dev = video_drvdata(file);
-
 	strscpy(cap->driver, "tw68", sizeof(cap->driver));
 	strscpy(cap->card, "Techwell Capture Card",
 		sizeof(cap->card));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
 	return 0;
 }
 
diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index b227e9e78ebd..6344a479119f 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -762,8 +762,6 @@ static int tw686x_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, "tw686x", sizeof(cap->driver));
 	strscpy(cap->card, dev->name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "PCI:%s", pci_name(dev->pci_dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 4a3d06c70e34..2423714afcb9 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3249,13 +3249,8 @@ static int allegro_release(struct file *file)
 static int allegro_querycap(struct file *file, void *fh,
 			    struct v4l2_capability *cap)
 {
-	struct video_device *vdev = video_devdata(file);
-	struct allegro_dev *dev = video_get_drvdata(vdev);
-
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, "Allegro DVT Video Encoder", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(&dev->plat_dev->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index bf3c3e76b921..9ea70817538e 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -630,8 +630,6 @@ static int vpbe_display_querycap(struct file *file, void  *priv,
 
 	snprintf(cap->driver, sizeof(cap->driver), "%s",
 		dev_name(vpbe_dev->pdev));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(vpbe_dev->pdev));
 	strscpy(cap->card, vpbe_dev->cfg->module_name, sizeof(cap->card));
 
 	return 0;
diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 8fe55374c5a3..d4def719b71b 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1067,8 +1067,6 @@ static int vpif_querycap(struct file *file, void  *priv,
 	struct vpif_capture_config *config = vpif_dev->platform_data;
 
 	strscpy(cap->driver, VPIF_DRIVER_NAME, sizeof(cap->driver));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(vpif_dev));
 	strscpy(cap->card, config->card_name, sizeof(cap->card));
 
 	return 0;
diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index 59f6b782e104..dfd4693ce67f 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -585,8 +585,6 @@ static int vpif_querycap(struct file *file, void  *priv,
 	struct vpif_display_config *config = vpif_dev->platform_data;
 
 	strscpy(cap->driver, VPIF_DRIVER_NAME, sizeof(cap->driver));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(vpif_dev));
 	strscpy(cap->card, config->card_name, sizeof(cap->card));
 
 	return 0;
diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index f1cf847d1cc2..b7854ce5fb8e 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -285,13 +285,8 @@ static const struct vb2_ops gsc_m2m_qops = {
 static int gsc_m2m_querycap(struct file *file, void *fh,
 			   struct v4l2_capability *cap)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
-	struct gsc_dev *gsc = ctx->gsc_dev;
-
 	strscpy(cap->driver, GSC_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, GSC_MODULE_NAME " gscaler", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(&gsc->pdev->dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/exynos4-is/common.c b/drivers/media/platform/exynos4-is/common.c
index 944b224eb621..cc1dc620d758 100644
--- a/drivers/media/platform/exynos4-is/common.c
+++ b/drivers/media/platform/exynos4-is/common.c
@@ -38,8 +38,6 @@ void __fimc_vidioc_querycap(struct device *dev, struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	strscpy(cap->card, dev->driver->name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-				"platform:%s", dev_name(dev));
 }
 EXPORT_SYMBOL(__fimc_vidioc_querycap);
 
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index aaa3af0493ce..aaf500bb0cff 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -646,12 +646,8 @@ static void fimc_lite_try_compose(struct fimc_lite *fimc, struct v4l2_rect *r)
 static int fimc_lite_querycap(struct file *file, void *priv,
 					struct v4l2_capability *cap)
 {
-	struct fimc_lite *fimc = video_drvdata(file);
-
 	strscpy(cap->driver, FIMC_LITE_DRV_NAME, sizeof(cap->driver));
 	strscpy(cap->card, FIMC_LITE_DRV_NAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-					dev_name(&fimc->pdev->dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 4ca96cf9def7..4f253d83ef2d 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -1527,12 +1527,8 @@ static int mxc_jpeg_open(struct file *file)
 static int mxc_jpeg_querycap(struct file *file, void *priv,
 			     struct v4l2_capability *cap)
 {
-	struct mxc_jpeg_dev *mxc_jpeg = video_drvdata(file);
-
 	strscpy(cap->driver, MXC_JPEG_NAME " codec", sizeof(cap->driver));
 	strscpy(cap->card, MXC_JPEG_NAME " codec", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(mxc_jpeg->dev));
 	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 
diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
index 03dcf8bf705e..ae97ce4ead98 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -497,7 +497,6 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	mcam->plat_power_up = cafe_ctlr_power_up;
 	mcam->plat_power_down = cafe_ctlr_power_down;
 	mcam->dev = &pdev->dev;
-	snprintf(mcam->bus_info, sizeof(mcam->bus_info), "PCI:%s", pci_name(pdev));
 	/*
 	 * Vmalloc mode for buffers is traditional with this driver.
 	 * We *might* be able to run DMA_contig, especially on a system
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index f332beb06d51..97afa57a165e 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -138,8 +138,6 @@ static int mtk_jpeg_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, jpeg->variant->dev_name, sizeof(cap->driver));
 	strscpy(cap->card, jpeg->variant->dev_name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(jpeg->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index f282275af626..8e7d44248f46 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -574,12 +574,8 @@ static const struct vb2_ops msm_video_vb2_q_ops = {
 static int video_querycap(struct file *file, void *fh,
 			  struct v4l2_capability *cap)
 {
-	struct camss_video *video = video_drvdata(file);
-
 	strscpy(cap->driver, "qcom-camss", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Camera Subsystem", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(video->camss->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 2e60b9fce03b..287fbf2e52b3 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -307,12 +307,8 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 static int rvin_querycap(struct file *file, void *priv,
 			 struct v4l2_capability *cap)
 {
-	struct rvin_dev *vin = video_drvdata(file);
-
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, "R_Car_VIN", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(vin->dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
index 56bb464629ed..776e21491506 100644
--- a/drivers/media/platform/rcar_jpu.c
+++ b/drivers/media/platform/rcar_jpu.c
@@ -670,8 +670,6 @@ static int jpu_querycap(struct file *file, void *priv,
 		strscpy(cap->card, DRV_NAME " decoder", sizeof(cap->card));
 
 	strscpy(cap->driver, DRV_NAME, sizeof(cap->driver));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(ctx->jpu->dev));
 	memset(cap->reserved, 0, sizeof(cap->reserved));
 
 	return 0;
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index a8d9159d5ed8..73d05bc904f2 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -1257,8 +1257,6 @@ static int s5p_jpeg_querycap(struct file *file, void *priv,
 		strscpy(cap->card, S5P_JPEG_M2M_NAME " decoder",
 			sizeof(cap->card));
 	}
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(ctx->jpeg->dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
index c1d3bda8385b..2f41feb07902 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -270,8 +270,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, S5P_MFC_NAME, sizeof(cap->driver));
 	strscpy(cap->card, dev->vfd_dec->name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(&dev->plat_dev->dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
index 1fad99edb091..6678d551ae37 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
@@ -1309,8 +1309,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, S5P_MFC_NAME, sizeof(cap->driver));
 	strscpy(cap->card, dev->vfd_enc->name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(&dev->plat_dev->dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 3872027ed2fa..48702134ccc5 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -53,12 +53,8 @@ const struct sun4i_csi_format *sun4i_csi_find_format(const u32 *fourcc,
 static int sun4i_csi_querycap(struct file *file, void *priv,
 			      struct v4l2_capability *cap)
 {
-	struct sun4i_csi *csi = video_drvdata(file);
-
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, "sun4i-csi", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(csi->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 7799da1cc261..04e9a40061f3 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -47,13 +47,9 @@ static char *fourcc_to_str(u32 fmt)
 static int cal_querycap(struct file *file, void *priv,
 			struct v4l2_capability *cap)
 {
-	struct cal_ctx *ctx = video_drvdata(file);
-
 	strscpy(cap->driver, CAL_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, CAL_MODULE_NAME, sizeof(cap->card));
 
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", dev_name(ctx->cal->dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/vsp1/vsp1_histo.c b/drivers/media/platform/vsp1/vsp1_histo.c
index 5e5013d2cd2a..f22449dd654c 100644
--- a/drivers/media/platform/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/vsp1/vsp1_histo.c
@@ -434,8 +434,6 @@ static int histo_v4l2_querycap(struct file *file, void *fh,
 
 	strscpy(cap->driver, "vsp1", sizeof(cap->driver));
 	strscpy(cap->card, histo->video.name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(histo->entity.vsp1->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index 044eb5778820..497f352e9f8c 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -959,8 +959,6 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 
 	strscpy(cap->driver, "vsp1", sizeof(cap->driver));
 	strscpy(cap->card, video->video.name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(video->vsp1->dev));
 
 	return 0;
 }
diff --git a/drivers/media/radio/radio-maxiradio.c b/drivers/media/radio/radio-maxiradio.c
index de107e2cbcd6..1a5dbae24ef4 100644
--- a/drivers/media/radio/radio-maxiradio.c
+++ b/drivers/media/radio/radio-maxiradio.c
@@ -144,8 +144,6 @@ static int maxiradio_probe(struct pci_dev *pdev,
 	dev->tea.v4l2_dev = v4l2_dev;
 	dev->tea.radio_nr = radio_nr;
 	strscpy(dev->tea.card, "Maxi Radio FM2000", sizeof(dev->tea.card));
-	snprintf(dev->tea.bus_info, sizeof(dev->tea.bus_info),
-			"PCI:%s", pci_name(pdev));
 
 	retval = -ENODEV;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 642cb90f457c..aaa5ef5e706c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -18,6 +18,7 @@
 
 #include <linux/videodev2.h>
 
+#include <media/media-device.h> /* for media_set_bus_info() */
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-ctrls.h>
@@ -1052,6 +1053,9 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
 	cap->device_caps = vfd->device_caps;
 	cap->capabilities = vfd->device_caps | V4L2_CAP_DEVICE_CAPS;
 
+	media_set_bus_info(cap->bus_info, sizeof(cap->bus_info),
+			   vfd->dev_parent);
+
 	ret = ops->vidioc_querycap(file, fh, cap);
 
 	/*
-- 
2.30.2

