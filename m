Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E453056791
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 13:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfFZL1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 07:27:54 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:50987 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbfFZL1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 07:27:54 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g65chWtPYSfvXg65ghKPLx; Wed, 26 Jun 2019 13:27:52 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/5] media: let v4l2-ioctl set the format description
Date:   Wed, 26 Jun 2019 13:27:43 +0200
Message-Id: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMKOgTtT8UA5CseeUhsW7bKYG0DGOBH9K5CcM7QLizq6uJ/XU75aFy1DzPREDKwcsgFfkazqGuvsJOfxRAPoXpKBK8awLab+V5+cZ7pAT4MnL5xnr04n
 3sMz5rdinuE6edfY1JKkhQgWi5kI9UWYbiGwo44KulFYpHHs2aaxt16c5AKXwciKedbWafRFL131gg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l_fill_fmtdesc() function in v4l2-ioctl.c fills in the format
description and the format flags. But a lot of drivers still manually
set the description/flags. Since the description names are all over
the place it is far better to let the core handle this.

This series converts 99% of all drivers.

While working on this I discovered that some of the newer pixelformats
weren't added to v4l_fill_fmtdesc(), so add those first.

Next are the patches that update the usb, pci, staging and platform
media drivers.

Regards,

	Hans

Hans Verkuil (5):
  v4l2-ioctl: add missing pixelformats
  media/usb: don't set description in ENUM_FMT
  media/pci: don't set description for ENUM_FMT
  drivers/staging/media: don't set description for ENUM_FMT
  media/platform: don't set description in ENUM_FMT

 drivers/media/common/saa7146/saa7146_video.c  | 16 +-------
 drivers/media/dvb-frontends/rtl2832_sdr.c     |  3 --
 drivers/media/pci/bt8xx/bttv-driver.c         | 19 ---------
 drivers/media/pci/bt8xx/bttv-risc.c           |  8 ++--
 drivers/media/pci/bt8xx/bttvp.h               |  1 -
 drivers/media/pci/cobalt/cobalt-v4l2.c        |  5 ---
 drivers/media/pci/cx23885/cx23885-417.c       |  1 -
 drivers/media/pci/cx23885/cx23885-video.c     |  7 +---
 drivers/media/pci/cx23885/cx23885.h           |  1 -
 drivers/media/pci/cx25821/cx25821-video.c     |  7 +---
 drivers/media/pci/cx25821/cx25821.h           |  1 -
 drivers/media/pci/cx88/cx88-blackbird.c       |  2 -
 drivers/media/pci/cx88/cx88-video.c           | 17 ++------
 drivers/media/pci/cx88/cx88.h                 |  1 -
 drivers/media/pci/dt3155/dt3155.c             |  1 -
 drivers/media/pci/meye/meye.c                 |  3 --
 drivers/media/pci/saa7134/saa7134-empress.c   |  2 -
 drivers/media/pci/saa7134/saa7134-video.c     | 28 ++-----------
 drivers/media/pci/saa7134/saa7134.h           |  1 -
 drivers/media/pci/saa7164/saa7164-encoder.c   |  1 -
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |  7 ----
 drivers/media/pci/solo6x10/solo6x10-v4l2.c    |  2 -
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  2 -
 drivers/media/pci/tw68/tw68-video.c           | 13 ------
 drivers/media/pci/tw68/tw68.h                 |  1 -
 drivers/media/platform/am437x/am437x-vpfe.c   | 18 +--------
 drivers/media/platform/davinci/vpbe_display.c | 14 +------
 drivers/media/platform/davinci/vpif_capture.c | 11 +----
 drivers/media/platform/davinci/vpif_display.c |  4 --
 drivers/media/platform/exynos-gsc/gsc-core.c  | 22 ----------
 drivers/media/platform/exynos-gsc/gsc-core.h  |  2 -
 .../media/platform/exynos4-is/fimc-capture.c  |  3 --
 drivers/media/platform/exynos4-is/fimc-core.c | 20 ----------
 .../platform/exynos4-is/fimc-isp-video.c      |  1 -
 drivers/media/platform/exynos4-is/fimc-isp.c  |  3 --
 drivers/media/platform/exynos4-is/fimc-lite.c |  8 ----
 drivers/media/platform/exynos4-is/fimc-m2m.c  |  1 -
 drivers/media/platform/m2m-deinterlace.c      |  4 --
 .../media/platform/marvell-ccic/mcam-core.c   | 10 -----
 drivers/media/platform/mx2_emmaprp.c          |  4 --
 drivers/media/platform/omap/omap_vout.c       |  7 ----
 .../media/platform/s3c-camif/camif-capture.c  | 11 ++---
 drivers/media/platform/s3c-camif/camif-core.c |  6 ---
 drivers/media/platform/s3c-camif/camif-core.h |  1 -
 drivers/media/platform/s5p-g2d/g2d.c          |  6 ---
 drivers/media/platform/s5p-g2d/g2d.h          |  1 -
 drivers/media/platform/s5p-jpeg/jpeg-core.c   | 27 -------------
 drivers/media/platform/s5p-jpeg/jpeg-core.h   |  2 -
 .../media/platform/s5p-mfc/s5p_mfc_common.h   |  1 -
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  | 15 -------
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  | 10 -----
 drivers/media/platform/sh_veu.c               | 19 ++++-----
 drivers/media/platform/sh_vou.c               | 12 +-----
 drivers/media/platform/ti-vpe/vpe.c           | 12 ------
 drivers/media/platform/via-camera.c           |  4 --
 drivers/media/platform/xilinx/xilinx-dma.c    |  2 -
 drivers/media/platform/xilinx/xilinx-vip.c    | 16 ++++----
 drivers/media/platform/xilinx/xilinx-vip.h    |  2 -
 drivers/media/usb/airspy/airspy.c             |  3 --
 drivers/media/usb/au0828/au0828-video.c       |  4 --
 drivers/media/usb/cpia2/cpia2_v4l.c           | 23 ++---------
 drivers/media/usb/cx231xx/cx231xx-417.c       |  1 -
 drivers/media/usb/cx231xx/cx231xx-video.c     |  2 -
 drivers/media/usb/cx231xx/cx231xx.h           |  1 -
 drivers/media/usb/em28xx/em28xx-video.c       |  8 ----
 drivers/media/usb/em28xx/em28xx.h             |  2 -
 drivers/media/usb/go7007/go7007-v4l2.c        | 11 -----
 drivers/media/usb/gspca/gspca.c               |  9 -----
 drivers/media/usb/hdpvr/hdpvr-video.c         |  3 --
 drivers/media/usb/msi2500/msi2500.c           |  8 ----
 drivers/media/usb/pwc/pwc-v4l.c               |  5 ---
 drivers/media/usb/s2255/s2255drv.c            |  8 ----
 drivers/media/usb/stk1160/stk1160-v4l.c       |  2 -
 drivers/media/usb/stk1160/stk1160.h           |  1 -
 drivers/media/usb/stkwebcam/stk-webcam.c      |  5 ---
 drivers/media/usb/tm6000/tm6000-video.c       |  4 --
 drivers/media/usb/tm6000/tm6000.h             |  1 -
 drivers/media/usb/usbtv/usbtv-video.c         |  2 -
 drivers/media/usb/usbvision/usbvision-video.c | 18 ++++-----
 drivers/media/usb/usbvision/usbvision.h       |  1 -
 drivers/media/usb/zr364xx/zr364xx.c           |  7 +---
 drivers/media/v4l2-core/v4l2-ioctl.c          | 29 +++++++++++---
 drivers/staging/media/omap4iss/iss_video.c    | 40 +++++++++----------
 drivers/staging/media/omap4iss/iss_video.h    |  2 -
 drivers/staging/media/soc_camera/soc_camera.c |  2 -
 .../bcm2835-camera/bcm2835-camera.c           | 29 --------------
 .../bcm2835-camera/mmal-common.h              |  1 -
 include/media/drv-intf/exynos-fimc.h          |  2 -
 include/media/drv-intf/saa7146_vv.h           |  1 -
 include/media/drv-intf/soc_mediabus.h         |  2 -
 90 files changed, 100 insertions(+), 566 deletions(-)

-- 
2.20.1

