Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBD6112C90
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 14:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbfLDN2f convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 4 Dec 2019 08:28:35 -0500
Received: from proofpoint-cluster.metrocast.net ([65.175.128.136]:53682 "EHLO
        proofpoint-cluster.metrocast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727530AbfLDN2f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Dec 2019 08:28:35 -0500
X-Greylist: delayed 2030 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Dec 2019 08:28:34 EST
Received: from [192.168.100.35] (static-72-9-14-85.md.cpe.atlanticbb.net [72.9.14.85])
        (authenticated bits=0)
        by huckleberry.metrocast.net (8.14.7/8.14.4) with ESMTP id xB4Csapv028917;
        Wed, 4 Dec 2019 12:54:37 GMT
Date:   Wed, 04 Dec 2019 07:54:35 -0500
User-Agent: K-9 Mail for Android
In-Reply-To: <09ed5e97-084d-17a2-e22f-0817527ebcdc@xs4all.nl>
References: <09ed5e97-084d-17a2-e22f-0817527ebcdc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH] ivtv/cx18: remove ivtvdriver.org references
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Andy Walls <awalls@md.metrocast.net>
Message-ID: <980C85A2-AD15-46C3-AAB2-3AA719D4DBD4@md.metrocast.net>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:6.0.95,18.0.572,0.0.0000
 definitions=2019-12-04_03:2019-12-04,2019-12-04,1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=7.0.1-1810110000 definitions=main-1912040105
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On December 4, 2019 6:57:10 AM EST, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>That URL is no longer valid, so either remove references to it or
>replace it with linuxtv.org.
>
>Rather than updating the URL I've just dropped the cx18.rst driver
>documentation since it was really out of date.
>
>Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>---
> .../media/uapi/v4l/pixfmt-reserved.rst        |  3 +-
> Documentation/media/v4l-drivers/cx18.rst      | 39 -------------------
> Documentation/media/v4l-drivers/index.rst     |  1 -
> MAINTAINERS                                   |  6 +--
> drivers/media/pci/cx18/cx18-cards.c           |  8 ++--
> drivers/media/pci/cx18/cx18-driver.c          |  2 +-
> drivers/media/pci/ivtv/Kconfig                |  5 +--
> drivers/media/pci/ivtv/ivtv-driver.c          |  3 +-
> drivers/media/pci/ivtv/ivtv-driver.h          |  1 -
> 9 files changed, 10 insertions(+), 58 deletions(-)
> delete mode 100644 Documentation/media/v4l-drivers/cx18.rst
>
>diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>index b2cd155e691b..7d98a7bf9f1f 100644
>--- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>+++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>@@ -55,8 +55,7 @@ please make a proposal on the linux-media mailing
>list.
>
>       - ``V4L2_PIX_FMT_HM12``
>       - 'HM12'
>-      - YUV 4:2:0 format used by the IVTV driver,
>-	`http://www.ivtvdriver.org/ <http://www.ivtvdriver.org/>`__
>+      - YUV 4:2:0 format used by the IVTV driver.
>
> 	The format is documented in the kernel sources in the file
> 	``Documentation/media/v4l-drivers/cx2341x.rst``
>diff --git a/Documentation/media/v4l-drivers/cx18.rst
>b/Documentation/media/v4l-drivers/cx18.rst
>deleted file mode 100644
>index 16895a734bae..000000000000
>--- a/Documentation/media/v4l-drivers/cx18.rst
>+++ /dev/null
>@@ -1,39 +0,0 @@
>-.. SPDX-License-Identifier: GPL-2.0
>-
>-The cx18 driver
>-===============
>-
>-.. note::
>-
>-   This documentation is outdated.
>-
>-Some notes regarding the cx18 driver for the Conexant CX23418 MPEG
>-encoder chip:
>-
>-1) Currently supported are:
>-
>-	- Hauppauge HVR-1600
>-	- Compro VideoMate H900
>-	- Yuan MPC718
>-	- Conexant Raptor PAL/SECAM devkit
>-
>-2) Some people have problems getting the i2c bus to work.
>-   The symptom is that the eeprom cannot be read and the card is
>-   unusable. This is probably fixed, but if you have problems
>-   then post to the video4linux or ivtv-users mailing list.
>-
>-3) VBI (raw or sliced) has not yet been implemented.
>-
>-4) MPEG indexing is not yet implemented.
>-
>-5) The driver is still a bit rough around the edges, this should
>-   improve over time.
>-
>-
>-Firmware:
>-
>-You can obtain the firmware files here:
>-
>-http://dl.ivtvdriver.org/ivtv/firmware/cx18-firmware.tar.gz
>-
>-Untar and copy the .fw files to your firmware directory.
>diff --git a/Documentation/media/v4l-drivers/index.rst
>b/Documentation/media/v4l-drivers/index.rst
>index c4c78a28654c..b41fea23fe5d 100644
>--- a/Documentation/media/v4l-drivers/index.rst
>+++ b/Documentation/media/v4l-drivers/index.rst
>@@ -38,7 +38,6 @@ For more details see the file COPYING in the source
>distribution of Linux.
> 	bttv
> 	cafe_ccic
> 	cpia2
>-	cx18
> 	cx2341x
> 	cx88
> 	davinci-vpbe
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 37a977cbac6f..dcf45a59a183 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -4398,13 +4398,10 @@ F:	drivers/net/wireless/st/cw1200/
>
> CX18 VIDEO4LINUX DRIVER
> M:	Andy Walls <awalls@md.metrocast.net>
>-L:	ivtv-devel@ivtvdriver.org (subscribers-only)
> L:	linux-media@vger.kernel.org
> T:	git git://linuxtv.org/media_tree.git
> W:	https://linuxtv.org
>-W:	http://www.ivtvdriver.org/index.php/Cx18
> S:	Maintained
>-F:	Documentation/media/v4l-drivers/cx18*
> F:	drivers/media/pci/cx18/
> F:	include/uapi/linux/ivtv*
>
>@@ -8752,10 +8749,9 @@ F:	drivers/media/tuners/it913x*
>
> IVTV VIDEO4LINUX DRIVER
> M:	Andy Walls <awalls@md.metrocast.net>
>-L:	ivtv-devel@ivtvdriver.org (subscribers-only)
> L:	linux-media@vger.kernel.org
> T:	git git://linuxtv.org/media_tree.git
>-W:	http://www.ivtvdriver.org
>+W:	https://linuxtv.org
> S:	Maintained
> F:	Documentation/media/v4l-drivers/ivtv*
> F:	drivers/media/pci/ivtv/
>diff --git a/drivers/media/pci/cx18/cx18-cards.c
>b/drivers/media/pci/cx18/cx18-cards.c
>index cf118760d124..ecbe76f1ca63 100644
>--- a/drivers/media/pci/cx18/cx18-cards.c
>+++ b/drivers/media/pci/cx18/cx18-cards.c
>@@ -245,7 +245,7 @@ static const struct cx18_card cx18_card_mpc718 = {
> 	.type = CX18_CARD_YUAN_MPC718,
> 	.name = "Yuan MPC718 MiniPCI DVB-T/Analog",
> 	.comment = "Experimenters needed for device to work well.\n"
>-		  "\tTo help, mail the ivtv-devel list (www.ivtvdriver.org).\n",
>+		  "\tTo help, mail the linux-media list (www.linuxtv.org).\n",
> 	.v4l2_capabilities = CX18_CAP_ENCODER,
> 	.hw_audio_ctrl = CX18_HW_418_AV,
> 	.hw_muxer = CX18_HW_GPIO_MUX,
>@@ -305,7 +305,7 @@ static const struct cx18_card
>cx18_card_gotview_dvd3 = {
> 	.type = CX18_CARD_GOTVIEW_PCI_DVD3,
> 	.name = "GoTView PCI DVD3 Hybrid",
> 	.comment = "Experimenters needed for device to work well.\n"
>-		  "\tTo help, mail the ivtv-devel list (www.ivtvdriver.org).\n",
>+		  "\tTo help, mail the linux-media list (www.linuxtv.org).\n",
> 	.v4l2_capabilities = CX18_CAP_ENCODER,
> 	.hw_audio_ctrl = CX18_HW_418_AV,
> 	.hw_muxer = CX18_HW_GPIO_MUX,
>@@ -419,7 +419,7 @@ static const struct cx18_card
>cx18_card_toshiba_qosmio_dvbt = {
> 	.type = CX18_CARD_TOSHIBA_QOSMIO_DVBT,
> 	.name = "Toshiba Qosmio DVB-T/Analog",
>	.comment = "Experimenters and photos needed for device to work
>well.\n"
>-		  "\tTo help, mail the ivtv-devel list (www.ivtvdriver.org).\n",
>+		  "\tTo help, mail the linux-media list (www.linuxtv.org).\n",
> 	.v4l2_capabilities = CX18_CAP_ENCODER,
> 	.hw_audio_ctrl = CX18_HW_418_AV,
> 	.hw_all = CX18_HW_418_AV | CX18_HW_TUNER | CX18_HW_GPIO_RESET_CTRL,
>@@ -462,7 +462,7 @@ static const struct cx18_card
>cx18_card_leadtek_pvr2100 = {
> 	.type = CX18_CARD_LEADTEK_PVR2100,
> 	.name = "Leadtek WinFast PVR2100",
>	.comment = "Experimenters and photos needed for device to work
>well.\n"
>-		  "\tTo help, mail the ivtv-devel list (www.ivtvdriver.org).\n",
>+		  "\tTo help, mail the linux-media list (www.linuxtv.org).\n",
> 	.v4l2_capabilities = CX18_CAP_ENCODER,
> 	.hw_audio_ctrl = CX18_HW_418_AV,
> 	.hw_muxer = CX18_HW_GPIO_MUX,
>diff --git a/drivers/media/pci/cx18/cx18-driver.c
>b/drivers/media/pci/cx18/cx18-driver.c
>index fd47bd07ffd8..16119f4e9404 100644
>--- a/drivers/media/pci/cx18/cx18-driver.c
>+++ b/drivers/media/pci/cx18/cx18-driver.c
>@@ -676,7 +676,7 @@ static void cx18_process_options(struct cx18 *cx)
> 			 cx->pci_dev->subsystem_device);
> 		CX18_ERR("Defaulting to %s card\n", cx->card->name);
>		CX18_ERR("Please mail the vendor/device and subsystem vendor/device
>IDs and what kind of\n");
>-		CX18_ERR("card you have to the ivtv-devel mailinglist
>(www.ivtvdriver.org)\n");
>+		CX18_ERR("card you have to the linux-media mailinglist
>(www.linuxtv.org)\n");
> 		CX18_ERR("Prefix your subject line with [UNKNOWN CX18 CARD].\n");
> 	}
> 	cx->v4l2_cap = cx->card->v4l2_capabilities;
>diff --git a/drivers/media/pci/ivtv/Kconfig
>b/drivers/media/pci/ivtv/Kconfig
>index 36c089103cf9..c729e54692c4 100644
>--- a/drivers/media/pci/ivtv/Kconfig
>+++ b/drivers/media/pci/ivtv/Kconfig
>@@ -24,7 +24,7 @@ config VIDEO_IVTV
> 	  PCI personal video recorder devices.
>
> 	  This is used in devices such as the Hauppauge PVR-150/250/350/500
>-	  cards. There is a driver homepage at <http://www.ivtvdriver.org>.
>+	  cards.
>
> 	  To compile this driver as a module, choose M here: the
> 	  module will be called ivtv.
>@@ -67,8 +67,7 @@ config VIDEO_FB_IVTV
> 	  This is a framebuffer driver for the Conexant cx23415 MPEG
> 	  encoder/decoder.
>
>-	  This is used in the Hauppauge PVR-350 card. There is a driver
>-	  homepage at <http://www.ivtvdriver.org>.
>+	  This is used in the Hauppauge PVR-350 card.
>
> 	  To compile this driver as a module, choose M here: the
> 	  module will be called ivtvfb.
>diff --git a/drivers/media/pci/ivtv/ivtv-driver.c
>b/drivers/media/pci/ivtv/ivtv-driver.c
>index 3f3f40ea890b..88dec72f29dc 100644
>--- a/drivers/media/pci/ivtv/ivtv-driver.c
>+++ b/drivers/media/pci/ivtv/ivtv-driver.c
>@@ -23,7 +23,6 @@
>  * Driver for the Conexant CX23415/CX23416 chip.
>  * Author: Kevin Thayer (nufan_wfk at yahoo.com)
>  * License: GPL
>- * http://www.ivtvdriver.org
>  *
>  * -----
>  * MPG600/MPG160 support by  T.Adachi <tadachi@tadachi-net.com>
>@@ -723,7 +722,7 @@ static void ivtv_process_options(struct ivtv *itv)
> 		IVTV_ERR("              %s based\n", chipname);
> 		IVTV_ERR("Defaulting to %s card\n", itv->card->name);
>		IVTV_ERR("Please mail the vendor/device and subsystem vendor/device
>IDs and what kind of\n");
>-		IVTV_ERR("card you have to the ivtv-devel mailinglist
>(www.ivtvdriver.org)\n");
>+		IVTV_ERR("card you have to the linux-media mailinglist
>(www.linuxtv.org)\n");
> 		IVTV_ERR("Prefix your subject line with [UNKNOWN IVTV CARD].\n");
> 	}
> 	itv->v4l2_cap = itv->card->v4l2_capabilities;
>diff --git a/drivers/media/pci/ivtv/ivtv-driver.h
>b/drivers/media/pci/ivtv/ivtv-driver.h
>index cafba6b1055d..e5efe525ad7b 100644
>--- a/drivers/media/pci/ivtv/ivtv-driver.h
>+++ b/drivers/media/pci/ivtv/ivtv-driver.h
>@@ -28,7 +28,6 @@
>  * Driver for the cx23415/6 chip.
>  * Author: Kevin Thayer (nufan_wfk at yahoo.com)
>  * License: GPL
>- * http://www.ivtvdriver.org
>  *
>  * -----
>  * MPG600/MPG160 support by  T.Adachi <tadachi@tadachi-net.com>

Acked-By: awalls@md.metrocast.net 
