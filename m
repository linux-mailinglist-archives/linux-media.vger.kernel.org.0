Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A293F446DCE
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 13:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbhKFMJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 08:09:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:39322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232950AbhKFMJC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Nov 2021 08:09:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F95561266;
        Sat,  6 Nov 2021 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636200381;
        bh=Mg0z1ibHmm42Iu1qcKyelNXmwwXddybaIqthcUrSF+M=;
        h=From:To:Cc:Subject:Date:From;
        b=sEmiSkXcQ/82VFDUGE2cteb5H7VSVesqpljFR1JdhRuAGKI25uHyIsY9A10yHiil0
         WKCxEU9qrCoW4HBMjszB1VPgaYuOg/LLCzyLu8RZvIgj17VZHI8owyQcIeG5Y06yJQ
         y3lq2pmeJV6SrdUc8Eesn0pshHlGJncpdRa38E0r+1j6OxbrgqferFyiV70Umhxlrs
         pSGoXNXrxIwRgdrUP/MEh/x3m76LoUp+zxkL5sUczhCnOf3LnWIPQw8pCGG7V+Wgr5
         2LDjcm4L5gXX5JviUxK4MEnwEsqJNFTdjcpAHry2zrblCxeu7l/8LWtUDV43n+KaxA
         5Cj2hiu5Z++AQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mjKSg-0006rF-7M; Sat, 06 Nov 2021 12:06:18 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Alan <alan@linux.intel.com>, Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Baokun Li <libaokun1@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: get rid of ISP2401_NEW_INPUT_SYSTEM
Date:   Sat,  6 Nov 2021 12:06:17 +0000
Message-Id: <1885b71956770c4fab463fd338165ae3670da0c1.1636200371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All ISP2401 devices use the new input system. So, get rid
of the remaining definitions, replacing them by runtime
checks for BYT/CHT when applicable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile        |  2 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 19 +++++++++++--------
 .../media/atomisp/pci/atomisp_compat_css20.c  |  4 ++--
 .../staging/media/atomisp/pci/atomisp_fops.c  |  4 +---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 14 ++------------
 5 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index a23c04cf7f34..a98204e9b20f 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -319,7 +319,7 @@ ifeq ($(CONFIG_VIDEO_ATOMISP_ISP2401),y)
 atomisp-objs += \
 	$(obj-cht) \
 	pci/runtime/isys/src/ibuf_ctrl_rmgr.o
-DEFINES += -DISP2401 -DISP2401_NEW_INPUT_SYSTEM
+DEFINES += -DISP2401
 endif
 
 ccflags-y += $(INCLUDES) $(DEFINES) -fno-common
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 0ddee36cdcd7..4ef5d728cd2f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5156,11 +5156,11 @@ static int css_input_resolution_changed(struct atomisp_sub_device *asd,
 	dev_dbg(asd->isp->dev, "css_input_resolution_changed to %ux%u\n",
 		ffmt->width, ffmt->height);
 
-#if defined(ISP2401_NEW_INPUT_SYSTEM)
-	atomisp_css_input_set_two_pixels_per_clock(asd, false);
-#else
-	atomisp_css_input_set_two_pixels_per_clock(asd, true);
-#endif
+	if (IS_ISP2401)
+		atomisp_css_input_set_two_pixels_per_clock(asd, false);
+	else
+		atomisp_css_input_set_two_pixels_per_clock(asd, true);
+
 	if (asd->continuous_mode->val) {
 		/* Note for all checks: ffmt includes pad_w+pad_h */
 		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
@@ -5494,9 +5494,14 @@ static void atomisp_get_dis_envelop(struct atomisp_sub_device *asd,
 static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
 				    int source_pad, struct v4l2_pix_format *f)
 {
-#if defined(ISP2401_NEW_INPUT_SYSTEM)
 	struct v4l2_mbus_framefmt *sink, *src;
 
+	if (!IS_ISP2401) {
+		/* Only used for the new input system */
+		asd->copy_mode = false;
+		return;
+	}
+
 	sink = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
 				       V4L2_SUBDEV_FORMAT_ACTIVE, ATOMISP_SUBDEV_PAD_SINK);
 	src = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
@@ -5510,8 +5515,6 @@ static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
 	      sensor[asd->sensor_curr].stream_num > 1)))
 		asd->copy_mode = true;
 	else
-#endif
-		/* Only used for the new input system */
 		asd->copy_mode = false;
 
 	dev_dbg(asd->isp->dev, "copy_mode: %d\n", asd->copy_mode);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index a8972b231e06..da177a8e78e3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -972,7 +972,7 @@ int atomisp_css_irq_translate(struct atomisp_device *isp,
 void atomisp_css_rx_get_irq_info(enum mipi_port_id port,
 				 unsigned int *infos)
 {
-#ifndef ISP2401_NEW_INPUT_SYSTEM
+#ifndef IS_ISP2401
 	ia_css_isys_rx_get_irq_info(port, infos);
 #else
 	*infos = 0;
@@ -982,7 +982,7 @@ void atomisp_css_rx_get_irq_info(enum mipi_port_id port,
 void atomisp_css_rx_clear_irq_info(enum mipi_port_id port,
 				   unsigned int infos)
 {
-#ifndef ISP2401_NEW_INPUT_SYSTEM
+#ifndef IS_ISP2401
 	ia_css_isys_rx_clear_irq_info(port, infos);
 #endif
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 4a7e5f2fe436..036a265502fe 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -464,13 +464,11 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 		css_capture_pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 	}
 
-#ifdef ISP2401_NEW_INPUT_SYSTEM
-	if (asd->copy_mode) {
+	if (IS_ISP2401 && asd->copy_mode) {
 		css_capture_pipe_id = IA_CSS_PIPE_ID_COPY;
 		css_preview_pipe_id = IA_CSS_PIPE_ID_COPY;
 		css_video_pipe_id = IA_CSS_PIPE_ID_COPY;
 	}
-#endif
 
 	if (asd->yuvpp_mode) {
 		capture_pipe = &asd->video_out_capture;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index bbef485ee15c..0223e3dd95a6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1635,12 +1635,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		pdev->d3cold_delay = 0;
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_ANN:
-		isp->media_dev.hw_revision = (
-#ifdef ISP2401_NEW_INPUT_SYSTEM
-						 ATOMISP_HW_REVISION_ISP2401
-#else
-						 ATOMISP_HW_REVISION_ISP2401_LEGACY
-#endif
+		isp->media_dev.hw_revision = (	 ATOMISP_HW_REVISION_ISP2401
 						 << ATOMISP_HW_REVISION_SHIFT);
 		isp->media_dev.hw_revision |= pdev->revision < 2 ?
 					      ATOMISP_HW_STEPPING_A0 : ATOMISP_HW_STEPPING_B0;
@@ -1648,12 +1643,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		isp->hpll_freq = HPLL_FREQ_1600MHZ;
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_CHT:
-		isp->media_dev.hw_revision = (
-#ifdef ISP2401_NEW_INPUT_SYSTEM
-						 ATOMISP_HW_REVISION_ISP2401
-#else
-						 ATOMISP_HW_REVISION_ISP2401_LEGACY
-#endif
+		isp->media_dev.hw_revision = (	 ATOMISP_HW_REVISION_ISP2401
 						 << ATOMISP_HW_REVISION_SHIFT);
 		isp->media_dev.hw_revision |= pdev->revision < 2 ?
 					      ATOMISP_HW_STEPPING_A0 : ATOMISP_HW_STEPPING_B0;
-- 
2.33.1

