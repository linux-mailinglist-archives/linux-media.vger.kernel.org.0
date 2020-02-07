Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5941558F1
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 15:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgBGOAz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 09:00:55 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48361 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726798AbgBGOAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Feb 2020 09:00:55 -0500
Received: from [IPv6:2001:420:44c1:2577:ad43:7060:21a6:befc]
 ([IPv6:2001:420:44c1:2577:ad43:7060:21a6:befc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 04BdjqUnCVuxO04BgjenrH; Fri, 07 Feb 2020 15:00:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581084052; bh=OStuwrTATu7fyz7VjZHi7srjXEKQmp4WkacN5PVnf8k=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=d1p1IvR6I/VSJ+knQDgcjg64aX6edvC+TcvZa/GFhZEvkHEgSBWfkqpN+AZG/C9DU
         eTMK91Fn2V50CMGULG/DhToogPS+qHKLO1HrkJwv3d0heRd8chpKZd2r/CoNHr9Xxs
         8kdiX1ywYSqIomkxX1nxsHKkwqeEVhhKW1K0iGO6ItmLcj9LuOZT/D/4cGvydq2X3u
         MhK1m/kfq2+ERTp9QS0jmX1xtwaZuFkk554Rs99cRjWIhNN7dwi1DkneIH+H9uXEyl
         mg+IEAPSNiv1emMjS610jh1ofmL6uSKKbQWKcZxhYO1BtGCKT1OtuijSpz1ogZM8PW
         LqguMUttb6OOA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Rename VFL_TYPE_GRABBER to _VIDEO
Message-ID: <ff5b3536-840d-4227-1990-897b0b6402b6@xs4all.nl>
Date:   Fri, 7 Feb 2020 15:00:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEAWzTiKWe/5mCiKDadj+XdSGQ2H5d0UBU8FZ7wZ3YD38XOE3rPcU3MAPohXjl9+Eu/Snlx4H5iruExMxSZ6yEQLUTtJSMDECuH51bTxkgbo6LfNA0TG
 8eGLY3k+QQvuhcM+gBFz/xioLmL1QuAW5Rna7as7zpr24GTELb8iRPLmbLWPFrbU8znr3tU+2YXNfLO1cPCm0RwolxU/EHb3a2c24tx/OApVeF/mmLk1LtgA
 gzw5TcOzI2BF8swWRBmsc8cWshCEwY46++Hc1WgWoLoIsbYtZk8y0xVRPJHPmGKo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 1697d98124819aab09b86602978bd4f50e101e2d:

  media: staging/intel-ipu3: remove TODO item about acronyms (2020-01-23 15:50:53 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7a

for you to fetch changes up to 73ff515a28f376d3cdb45f34db49b720f967e9ad:

  v4l2-dev.h: remove VFL_TYPE_GRABBER (2020-02-07 14:14:39 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (11):
      media: rename VFL_TYPE_GRABBER to _VIDEO
      gadget: uvc: rename VFL_TYPE_GRABBER to _VIDEO
      bcm2835-camera: rename VFL_TYPE_GRABBER to _VIDEO
      staging/media: rename VFL_TYPE_GRABBER to _VIDEO
      staging/most: rename VFL_TYPE_GRABBER to _VIDEO
      media/usb: rename VFL_TYPE_GRABBER to _VIDEO
      media/common/saa7146: rename VFL_TYPE_GRABBER to _VIDEO
      media/i2c/video-i2c: rename VFL_TYPE_GRABBER to _VIDEO
      media/pci: rename VFL_TYPE_GRABBER to _VIDEO
      media/platform: rename VFL_TYPE_GRABBER to _VIDEO
      v4l2-dev.h: remove VFL_TYPE_GRABBER

 Documentation/media/kapi/v4l2-dev.rst                           |  4 ++--
 Documentation/translations/zh_CN/video4linux/v4l2-framework.txt |  4 ++--
 drivers/media/common/saa7146/saa7146_fops.c                     | 10 +++++-----
 drivers/media/i2c/video-i2c.c                                   |  2 +-
 drivers/media/pci/bt8xx/bttv-driver.c                           |  4 ++--
 drivers/media/pci/cobalt/cobalt-v4l2.c                          |  2 +-
 drivers/media/pci/cx18/cx18-streams.c                           | 12 ++++++------
 drivers/media/pci/cx23885/cx23885-417.c                         |  2 +-
 drivers/media/pci/cx23885/cx23885-video.c                       |  2 +-
 drivers/media/pci/cx25821/cx25821-video.c                       |  2 +-
 drivers/media/pci/cx88/cx88-blackbird.c                         |  2 +-
 drivers/media/pci/cx88/cx88-video.c                             |  2 +-
 drivers/media/pci/dt3155/dt3155.c                               |  2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c                        |  2 +-
 drivers/media/pci/ivtv/ivtv-streams.c                           | 12 ++++++------
 drivers/media/pci/meye/meye.c                                   |  2 +-
 drivers/media/pci/saa7134/saa7134-core.c                        |  2 +-
 drivers/media/pci/saa7134/saa7134-empress.c                     |  2 +-
 drivers/media/pci/saa7146/hexium_gemini.c                       |  2 +-
 drivers/media/pci/saa7146/hexium_orion.c                        |  2 +-
 drivers/media/pci/saa7146/mxb.c                                 |  2 +-
 drivers/media/pci/saa7164/saa7164-encoder.c                     |  2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c                  |  2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c                      |  2 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c                         |  2 +-
 drivers/media/pci/ttpci/av7110_v4l.c                            |  2 +-
 drivers/media/pci/ttpci/budget-av.c                             |  2 +-
 drivers/media/pci/tw5864/tw5864-video.c                         |  2 +-
 drivers/media/pci/tw68/tw68-video.c                             |  2 +-
 drivers/media/pci/tw686x/tw686x-video.c                         |  2 +-
 drivers/media/platform/am437x/am437x-vpfe.c                     |  2 +-
 drivers/media/platform/aspeed-video.c                           |  4 ++--
 drivers/media/platform/atmel/atmel-isc-base.c                   |  2 +-
 drivers/media/platform/atmel/atmel-isi.c                        |  2 +-
 drivers/media/platform/coda/coda-common.c                       |  2 +-
 drivers/media/platform/davinci/vpbe_display.c                   |  2 +-
 drivers/media/platform/davinci/vpfe_capture.c                   |  2 +-
 drivers/media/platform/davinci/vpif_capture.c                   |  2 +-
 drivers/media/platform/davinci/vpif_display.c                   |  2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c                     |  2 +-
 drivers/media/platform/exynos4-is/fimc-capture.c                |  2 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c              |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c                   |  2 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c                    |  2 +-
 drivers/media/platform/fsl-viu.c                                |  2 +-
 drivers/media/platform/imx-pxp.c                                |  2 +-
 drivers/media/platform/m2m-deinterlace.c                        |  2 +-
 drivers/media/platform/marvell-ccic/mcam-core.c                 |  2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c                 |  2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c                    |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c          |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c          |  2 +-
 drivers/media/platform/mx2_emmaprp.c                            |  2 +-
 drivers/media/platform/omap/omap_vout.c                         |  2 +-
 drivers/media/platform/omap3isp/ispvideo.c                      |  4 ++--
 drivers/media/platform/pxa_camera.c                             |  2 +-
 drivers/media/platform/qcom/camss/camss-video.c                 |  2 +-
 drivers/media/platform/qcom/venus/vdec.c                        |  2 +-
 drivers/media/platform/qcom/venus/venc.c                        |  2 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c                     |  2 +-
 drivers/media/platform/rcar_fdp1.c                              |  2 +-
 drivers/media/platform/rcar_jpu.c                               |  4 ++--
 drivers/media/platform/renesas-ceu.c                            |  2 +-
 drivers/media/platform/rockchip/rga/rga.c                       |  2 +-
 drivers/media/platform/s3c-camif/camif-capture.c                |  2 +-
 drivers/media/platform/s5p-g2d/g2d.c                            |  2 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c                     |  4 ++--
 drivers/media/platform/s5p-mfc/s5p_mfc.c                        |  4 ++--
 drivers/media/platform/sh_veu.c                                 |  2 +-
 drivers/media/platform/sh_vou.c                                 |  2 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c                   |  2 +-
 drivers/media/platform/sti/delta/delta-v4l2.c                   |  2 +-
 drivers/media/platform/sti/hva/hva-v4l2.c                       |  2 +-
 drivers/media/platform/stm32/stm32-dcmi.c                       |  2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c             |  2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c            |  4 ++--
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c                |  2 +-
 drivers/media/platform/ti-vpe/cal.c                             |  2 +-
 drivers/media/platform/ti-vpe/vpe.c                             |  2 +-
 drivers/media/platform/via-camera.c                             |  2 +-
 drivers/media/platform/vicodec/vicodec-core.c                   |  2 +-
 drivers/media/platform/vim2m.c                                  |  2 +-
 drivers/media/platform/vimc/vimc-capture.c                      |  2 +-
 drivers/media/platform/vivid/vivid-core.c                       | 10 +++++-----
 drivers/media/platform/vsp1/vsp1_histo.c                        |  4 ++--
 drivers/media/platform/vsp1/vsp1_video.c                        |  4 ++--
 drivers/media/platform/xilinx/xilinx-dma.c                      |  4 ++--
 drivers/media/usb/au0828/au0828-video.c                         |  4 ++--
 drivers/media/usb/cpia2/cpia2_v4l.c                             |  2 +-
 drivers/media/usb/cx231xx/cx231xx-417.c                         |  2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c                       |  2 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c                        | 12 ++++++------
 drivers/media/usb/em28xx/em28xx-video.c                         |  4 ++--
 drivers/media/usb/go7007/go7007-v4l2.c                          |  2 +-
 drivers/media/usb/gspca/gspca.c                                 |  2 +-
 drivers/media/usb/hdpvr/hdpvr-video.c                           |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                        |  4 ++--
 drivers/media/usb/pwc/pwc-if.c                                  |  2 +-
 drivers/media/usb/s2255/s2255drv.c                              |  4 ++--
 drivers/media/usb/stk1160/stk1160-v4l.c                         |  2 +-
 drivers/media/usb/stkwebcam/stk-webcam.c                        |  2 +-
 drivers/media/usb/tm6000/tm6000-video.c                         |  4 ++--
 drivers/media/usb/usbtv/usbtv-video.c                           |  2 +-
 drivers/media/usb/usbvision/usbvision-video.c                   |  2 +-
 drivers/media/usb/uvc/uvc_driver.c                              |  2 +-
 drivers/media/usb/zr364xx/zr364xx.c                             |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c                              | 10 +++++-----
 drivers/media/v4l2-core/v4l2-ioctl.c                            |  4 ++--
 drivers/staging/media/allegro-dvt/allegro-core.c                |  2 +-
 drivers/staging/media/hantro/hantro_drv.c                       |  2 +-
 drivers/staging/media/imx/imx-media-capture.c                   |  2 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c                |  2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c                          |  2 +-
 drivers/staging/media/meson/vdec/vdec.c                         |  2 +-
 drivers/staging/media/omap4iss/iss_video.c                      |  4 ++--
 drivers/staging/media/rkisp1/rkisp1-capture.c                   |  2 +-
 drivers/staging/media/rkisp1/rkisp1-params.c                    |  2 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c                     |  2 +-
 drivers/staging/media/soc_camera/soc_camera.c                   |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                     |  2 +-
 drivers/staging/most/video/video.c                              |  4 ++--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c   |  2 +-
 drivers/usb/gadget/function/f_uvc.c                             |  2 +-
 include/media/v4l2-dev.h                                        |  4 ++--
 samples/v4l/v4l2-pci-skeleton.c                                 |  2 +-
 125 files changed, 173 insertions(+), 173 deletions(-)
