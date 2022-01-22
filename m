Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF94496CF2
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 17:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiAVQkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 11:40:25 -0500
Received: from retiisi.eu ([95.216.213.190]:36988 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230459AbiAVQkZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 11:40:25 -0500
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::e1:3])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id F23C2634C96;
        Sat, 22 Jan 2022 18:40:22 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 3/3] v4l: ioctl: Set bus_info in v4l_querycap()
Date:   Sat, 22 Jan 2022 18:36:56 +0200
Message-Id: <20220122163656.168440-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
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
 drivers/media/pci/dt3155/dt3155.c                   | 1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c       | 2 --
 drivers/media/pci/ivtv/ivtv-ioctl.c                 | 1 -
 drivers/media/pci/meye/meye.c                       | 1 -
 drivers/media/pci/saa7134/saa7134-go7007.c          | 1 -
 drivers/media/pci/saa7134/saa7134-video.c           | 1 -
 drivers/media/pci/saa7164/saa7164-encoder.c         | 1 -
 drivers/media/pci/saa7164/saa7164-vbi.c             | 1 -
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c      | 2 --
 drivers/media/pci/solo6x10/solo6x10-v4l2.c          | 2 --
 drivers/media/pci/sta2x11/sta2x11_vip.c             | 2 --
 drivers/media/pci/tw5864/tw5864-video.c             | 1 -
 drivers/media/pci/tw68/tw68-video.c                 | 1 -
 drivers/media/pci/tw686x/tw686x-video.c             | 2 --
 drivers/media/platform/allegro-dvt/allegro-core.c   | 2 --
 drivers/media/platform/davinci/vpbe_display.c       | 2 --
 drivers/media/platform/davinci/vpif_capture.c       | 2 --
 drivers/media/platform/davinci/vpif_display.c       | 2 --
 drivers/media/platform/exynos-gsc/gsc-m2m.c         | 2 --
 drivers/media/platform/exynos4-is/common.c          | 2 --
 drivers/media/platform/exynos4-is/fimc-lite.c       | 2 --
 drivers/media/platform/imx-jpeg/mxc-jpeg.c          | 2 --
 drivers/media/platform/marvell-ccic/cafe-driver.c   | 1 -
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c     | 2 --
 drivers/media/platform/qcom/camss/camss-video.c     | 2 --
 drivers/media/platform/rcar-vin/rcar-v4l2.c         | 2 --
 drivers/media/platform/rcar_jpu.c                   | 2 --
 drivers/media/platform/s5p-jpeg/jpeg-core.c         | 2 --
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c        | 2 --
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c        | 2 --
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 2 --
 drivers/media/platform/ti-vpe/cal-video.c           | 2 --
 drivers/media/platform/vsp1/vsp1_histo.c            | 2 --
 drivers/media/platform/vsp1/vsp1_video.c            | 2 --
 drivers/media/radio/radio-maxiradio.c               | 2 --
 drivers/media/v4l2-core/v4l2-ioctl.c                | 3 +++
 41 files changed, 3 insertions(+), 67 deletions(-)

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
index 961f844de99c..3ad72a53f2a5 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -296,7 +296,6 @@ static int dt3155_querycap(struct file *filp, void *p,
 
 	strscpy(cap->driver, DT3155_NAME, sizeof(cap->driver));
 	strscpy(cap->card, DT3155_NAME " frame grabber", sizeof(cap->card));
-	sprintf(cap->bus_info, "PCI:%s", pci_name(pd->pdev));
 	return 0;
 }
 
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index b15fac775e14..de8cbacba793 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1050,8 +1050,6 @@ static int cio2_v4l2_querycap(struct file *file, void *fh,
 
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
 
diff --git a/drivers/media/pci/saa7134/saa7134-go7007.c b/drivers/media/pci/saa7134/saa7134-go7007.c
index da83893ffee9..c0985ae2a05b 100644
--- a/drivers/media/pci/saa7134/saa7134-go7007.c
+++ b/drivers/media/pci/saa7134/saa7134-go7007.c
@@ -421,7 +421,6 @@ static int saa7134_go7007_init(struct saa7134_dev *dev)
 	}
 
 	go->board_id = GO7007_BOARDID_PCI_VOYAGER;
-	snprintf(go->bus_info, sizeof(go->bus_info), "PCI:%s", pci_name(dev->pci));
 	strscpy(go->name, saa7134_boards[dev->board].name, sizeof(go->name));
 	go->hpi_ops = &saa7134_go7007_hpi_ops;
 	go->hpi_context = saa;
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
index fe94944d0531..6013ff4f33ac 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -717,7 +717,6 @@ static int tw68_querycap(struct file *file, void  *priv,
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
index 4a3d06c70e34..b023a38c0ff4 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3254,8 +3254,6 @@ static int allegro_querycap(struct file *file, void *fh,
 
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
index f1cf847d1cc2..b6f54a513256 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -290,8 +290,6 @@ static int gsc_m2m_querycap(struct file *file, void *fh,
 
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
index aaa3af0493ce..d077e2e2f1f3 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -650,8 +650,6 @@ static int fimc_lite_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, FIMC_LITE_DRV_NAME, sizeof(cap->driver));
 	strscpy(cap->card, FIMC_LITE_DRV_NAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-					dev_name(&fimc->pdev->dev));
 	return 0;
 }
 
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 4ca96cf9def7..812bfa79df27 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -1531,8 +1531,6 @@ static int mxc_jpeg_querycap(struct file *file, void *priv,
 
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
index f282275af626..a1dc4d9c7215 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -578,8 +578,6 @@ static int video_querycap(struct file *file, void *fh,
 
 	strscpy(cap->driver, "qcom-camss", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Camera Subsystem", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(video->camss->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 2e60b9fce03b..4be2aff89d40 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -311,8 +311,6 @@ static int rvin_querycap(struct file *file, void *priv,
 
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
index 3872027ed2fa..adffedce5e4b 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -57,8 +57,6 @@ static int sun4i_csi_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, "sun4i-csi", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 dev_name(csi->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 7799da1cc261..2efb1ba97695 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -52,8 +52,6 @@ static int cal_querycap(struct file *file, void *priv,
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
index 642cb90f457c..81ebf6cca522 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -18,6 +18,7 @@
 
 #include <linux/videodev2.h>
 
+#include <media/media-device.h> /* for media_set_bus_info() */
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-ctrls.h>
@@ -1069,6 +1070,8 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
 	cap->capabilities |= V4L2_CAP_EXT_PIX_FORMAT;
 	cap->device_caps |= V4L2_CAP_EXT_PIX_FORMAT;
 
+	media_set_bus_info(cap->bus_info, vfd->dev_parent);
+
 	return ret;
 }
 
-- 
2.30.2

