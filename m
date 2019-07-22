Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8C40701E0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 16:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbfGVOGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 10:06:08 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48743 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728405AbfGVOGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 10:06:07 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pYwzhc1q10SBqpYx2hrfx4; Mon, 22 Jul 2019 16:06:04 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Fix device_caps, don't set fmt description
Message-ID: <9064bb69-03f1-02a3-fcc8-5010a506e0e5@xs4all.nl>
Date:   Mon, 22 Jul 2019 16:06:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB6LO6RrEQfDv/HbgKxowNK4W92rJc0FyRwM/zNZbGZgZoiH7uI8/PiM1NLWP+e8AOWPaU86og56OwdwjCnOvdwfEkleT8xKl71HZ03I0e06DN3AcvNq
 IFr8F5OAGNlrnSnq+RsEM8Ni5UpDaaBfgmk1y5y+WfSO1INsMj+gNfENYbNCjdLZFPZVFW54rX1N4w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Contains these two patch series, rebased on top of v5.3-rc1:

https://patchwork.linuxtv.org/project/linux-media/list/?series=240
https://patchwork.linuxtv.org/project/linux-media/list/?series=232

Regards,

	Hans

The following changes since commit 3f98538c7673e5306a126fd3cb7e0a84abc170ee:

  Merge tag 'v5.3-rc1' into patchwork (2019-07-22 07:40:55 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4a2

for you to fetch changes up to 301a12dedf2a4547b2a3d8f5e06e70a15acdd2f6:

  omap3isp: set device_caps in struct video_device (2019-07-22 14:19:57 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (21):
      v4l2-ioctl: add missing pixelformats
      media/usb: don't set description in ENUM_FMT
      media/pci: don't set description for ENUM_FMT
      drivers/staging/media: don't set description for ENUM_FMT
      media/platform: don't set description in ENUM_FMT
      am437x/davinci: set device_caps in struct video_device
      coda: set device_caps in struct video_device
      s3c-camif/s5p-g2d/s5p-jpeg: set device_caps in struct video_device
      fsl-viu: set device_caps in struct video_device
      m2m-deinterlace: set device_caps in struct video_device
      mx2_emmaprp: set device_caps in struct video_device
      marvell-ccic: set device_caps in struct video_device
      pxa_camera: don't set caps in querycap
      bdisp: set device_caps in struct video_device
      via-camera: set device_caps in struct video_device
      xilinx: set device_caps in struct video_device
      sh_veu/sh_vou: set device_caps in struct video_device
      vsp1: set device_caps in struct video_device
      omap_vout: set device_caps in struct video_device
      ti-vpe: set device_caps in struct video_device
      omap3isp: set device_caps in struct video_device

 drivers/media/common/saa7146/saa7146_video.c                  | 16 ++--------------
 drivers/media/dvb-frontends/rtl2832_sdr.c                     |  3 ---
 drivers/media/pci/bt8xx/bttv-driver.c                         | 19 -------------------
 drivers/media/pci/bt8xx/bttv-risc.c                           |  8 ++++----
 drivers/media/pci/bt8xx/bttvp.h                               |  1 -
 drivers/media/pci/cobalt/cobalt-v4l2.c                        |  5 -----
 drivers/media/pci/cx23885/cx23885-417.c                       |  1 -
 drivers/media/pci/cx23885/cx23885-video.c                     |  7 ++-----
 drivers/media/pci/cx23885/cx23885.h                           |  1 -
 drivers/media/pci/cx25821/cx25821-video.c                     |  7 ++-----
 drivers/media/pci/cx25821/cx25821.h                           |  1 -
 drivers/media/pci/cx88/cx88-blackbird.c                       |  2 --
 drivers/media/pci/cx88/cx88-video.c                           | 17 +++--------------
 drivers/media/pci/cx88/cx88.h                                 |  1 -
 drivers/media/pci/dt3155/dt3155.c                             |  1 -
 drivers/media/pci/meye/meye.c                                 |  3 ---
 drivers/media/pci/saa7134/saa7134-empress.c                   |  2 --
 drivers/media/pci/saa7134/saa7134-video.c                     | 28 ++++-----------------------
 drivers/media/pci/saa7134/saa7134.h                           |  1 -
 drivers/media/pci/saa7164/saa7164-encoder.c                   |  1 -
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c                |  7 -------
 drivers/media/pci/solo6x10/solo6x10-v4l2.c                    |  2 --
 drivers/media/pci/sta2x11/sta2x11_vip.c                       |  2 --
 drivers/media/pci/tw68/tw68-video.c                           | 13 -------------
 drivers/media/pci/tw68/tw68.h                                 |  1 -
 drivers/media/platform/am437x/am437x-vpfe.c                   | 24 ++++-------------------
 drivers/media/platform/coda/coda-common.c                     |  4 +---
 drivers/media/platform/davinci/vpbe_display.c                 | 17 +++--------------
 drivers/media/platform/davinci/vpfe_capture.c                 |  3 +--
 drivers/media/platform/davinci/vpif_capture.c                 | 14 +++-----------
 drivers/media/platform/davinci/vpif_display.c                 |  7 +------
 drivers/media/platform/exynos-gsc/gsc-core.c                  | 22 ---------------------
 drivers/media/platform/exynos-gsc/gsc-core.h                  |  2 --
 drivers/media/platform/exynos4-is/fimc-capture.c              |  3 ---
 drivers/media/platform/exynos4-is/fimc-core.c                 | 20 --------------------
 drivers/media/platform/exynos4-is/fimc-isp-video.c            |  1 -
 drivers/media/platform/exynos4-is/fimc-isp.c                  |  3 ---
 drivers/media/platform/exynos4-is/fimc-lite.c                 |  8 --------
 drivers/media/platform/exynos4-is/fimc-m2m.c                  |  1 -
 drivers/media/platform/fsl-viu.c                              |  7 ++-----
 drivers/media/platform/m2m-deinterlace.c                      | 14 +-------------
 drivers/media/platform/marvell-ccic/mcam-core.c               | 15 ++-------------
 drivers/media/platform/mx2_emmaprp.c                          |  7 +------
 drivers/media/platform/omap/omap_vout.c                       | 13 ++-----------
 drivers/media/platform/omap3isp/ispvideo.c                    | 11 +++++++----
 drivers/media/platform/pxa_camera.c                           |  3 ---
 drivers/media/platform/s3c-camif/camif-capture.c              | 16 +++++-----------
 drivers/media/platform/s3c-camif/camif-core.c                 |  6 ------
 drivers/media/platform/s3c-camif/camif-core.h                 |  1 -
 drivers/media/platform/s5p-g2d/g2d.c                          | 13 ++-----------
 drivers/media/platform/s5p-g2d/g2d.h                          |  1 -
 drivers/media/platform/s5p-jpeg/jpeg-core.c                   | 31 ++----------------------------
 drivers/media/platform/s5p-jpeg/jpeg-core.h                   |  2 --
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h               |  1 -
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c                  | 19 +------------------
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c                  | 14 +-------------
 drivers/media/platform/sh_veu.c                               | 23 +++++++++-------------
 drivers/media/platform/sh_vou.c                               | 17 ++++-------------
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c                 |  6 +-----
 drivers/media/platform/ti-vpe/cal.c                           |  5 ++---
 drivers/media/platform/ti-vpe/vpe.c                           | 12 ------------
 drivers/media/platform/via-camera.c                           |  9 ++-------
 drivers/media/platform/vsp1/vsp1_histo.c                      |  3 +--
 drivers/media/platform/vsp1/vsp1_video.c                      | 10 ++++------
 drivers/media/platform/xilinx/xilinx-dma.c                    | 18 +++++++-----------
 drivers/media/platform/xilinx/xilinx-vip.c                    | 16 ++++++++--------
 drivers/media/platform/xilinx/xilinx-vip.h                    |  2 --
 drivers/media/usb/airspy/airspy.c                             |  3 ---
 drivers/media/usb/au0828/au0828-video.c                       |  4 ----
 drivers/media/usb/cpia2/cpia2_v4l.c                           | 23 ++++------------------
 drivers/media/usb/cx231xx/cx231xx-417.c                       |  1 -
 drivers/media/usb/cx231xx/cx231xx-video.c                     |  2 --
 drivers/media/usb/cx231xx/cx231xx.h                           |  1 -
 drivers/media/usb/em28xx/em28xx-video.c                       |  8 --------
 drivers/media/usb/em28xx/em28xx.h                             |  2 --
 drivers/media/usb/go7007/go7007-v4l2.c                        | 11 -----------
 drivers/media/usb/gspca/gspca.c                               |  9 ---------
 drivers/media/usb/hdpvr/hdpvr-video.c                         |  3 ---
 drivers/media/usb/msi2500/msi2500.c                           |  8 --------
 drivers/media/usb/pwc/pwc-v4l.c                               |  5 -----
 drivers/media/usb/s2255/s2255drv.c                            |  8 --------
 drivers/media/usb/stk1160/stk1160-v4l.c                       |  2 --
 drivers/media/usb/stk1160/stk1160.h                           |  1 -
 drivers/media/usb/stkwebcam/stk-webcam.c                      |  5 -----
 drivers/media/usb/tm6000/tm6000-video.c                       |  4 ----
 drivers/media/usb/tm6000/tm6000.h                             |  1 -
 drivers/media/usb/usbtv/usbtv-video.c                         |  2 --
 drivers/media/usb/usbvision/usbvision-video.c                 | 18 ++++++++----------
 drivers/media/usb/usbvision/usbvision.h                       |  1 -
 drivers/media/usb/zr364xx/zr364xx.c                           |  7 +------
 drivers/media/v4l2-core/v4l2-ioctl.c                          | 29 ++++++++++++++++++++++------
 drivers/staging/media/omap4iss/iss_video.c                    | 40 +++++++++++++++++++--------------------
 drivers/staging/media/omap4iss/iss_video.h                    |  2 --
 drivers/staging/media/soc_camera/soc_camera.c                 |  2 --
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 29 ----------------------------
 drivers/staging/vc04_services/bcm2835-camera/mmal-common.h    |  1 -
 include/media/drv-intf/exynos-fimc.h                          |  2 --
 include/media/drv-intf/saa7146_vv.h                           |  1 -
 include/media/drv-intf/soc_mediabus.h                         |  2 --
 99 files changed, 149 insertions(+), 662 deletions(-)
