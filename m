Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F823496CF3
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 17:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234113AbiAVQk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 11:40:27 -0500
Received: from retiisi.eu ([95.216.213.190]:36992 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230459AbiAVQk1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 11:40:27 -0500
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::e1:3])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id F0986634C93;
        Sat, 22 Jan 2022 18:40:21 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 0/3] Set bus_info field in framework
Date:   Sat, 22 Jan 2022 18:36:53 +0200
Message-Id: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This innocious-looking patchset moves setting the bus_info fields in
struct media_device and struct v4l2_capability from drivers to the
framework for PCI and platform devices. USB and I²C devices are possible,
too, but not yet implemented. Using this is optional so that drivers which
have special requirements or archaic bugs are unaffected.

If people like this, I'll see if the same could be done to the driver
fields.

Sakari Ailus (3):
  media: Provide a helper for setting bus_info field
  media: Set bus_info in media_device_init()
  v4l: ioctl: Set bus_info in v4l_querycap()

 drivers/media/common/saa7146/saa7146_video.c  |  1 -
 drivers/media/mc/mc-device.c                  |  2 ++
 drivers/media/pci/bt8xx/bttv-driver.c         |  2 --
 drivers/media/pci/cx18/cx18-ioctl.c           |  2 --
 drivers/media/pci/cx88/cx88-blackbird.c       |  1 -
 drivers/media/pci/cx88/cx88-video.c           |  1 -
 drivers/media/pci/dt3155/dt3155.c             |  1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  4 ---
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  1 -
 drivers/media/pci/meye/meye.c                 |  1 -
 drivers/media/pci/saa7134/saa7134-go7007.c    |  1 -
 drivers/media/pci/saa7134/saa7134-video.c     |  1 -
 drivers/media/pci/saa7164/saa7164-encoder.c   |  1 -
 drivers/media/pci/saa7164/saa7164-vbi.c       |  1 -
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |  2 --
 drivers/media/pci/solo6x10/solo6x10-v4l2.c    |  2 --
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  2 --
 drivers/media/pci/tw5864/tw5864-video.c       |  1 -
 drivers/media/pci/tw68/tw68-video.c           |  1 -
 drivers/media/pci/tw686x/tw686x-video.c       |  2 --
 .../media/platform/allegro-dvt/allegro-core.c |  2 --
 drivers/media/platform/davinci/vpbe_display.c |  2 --
 drivers/media/platform/davinci/vpif_capture.c |  2 --
 drivers/media/platform/davinci/vpif_display.c |  2 --
 drivers/media/platform/exynos-gsc/gsc-m2m.c   |  2 --
 drivers/media/platform/exynos4-is/common.c    |  2 --
 drivers/media/platform/exynos4-is/fimc-lite.c |  2 --
 drivers/media/platform/imx-jpeg/mxc-jpeg.c    |  2 --
 .../media/platform/marvell-ccic/cafe-driver.c |  1 -
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  2 --
 .../media/platform/qcom/camss/camss-video.c   |  2 --
 drivers/media/platform/rcar-vin/rcar-core.c   |  2 --
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  2 --
 drivers/media/platform/rcar_jpu.c             |  2 --
 drivers/media/platform/s5p-jpeg/jpeg-core.c   |  2 --
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |  2 --
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |  2 --
 drivers/media/platform/stm32/stm32-dcmi.c     |  2 --
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  2 --
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  2 --
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  2 --
 drivers/media/platform/ti-vpe/cal-video.c     |  2 --
 drivers/media/platform/ti-vpe/cal.c           |  2 --
 drivers/media/platform/vsp1/vsp1_drv.c        |  2 --
 drivers/media/platform/vsp1/vsp1_histo.c      |  2 --
 drivers/media/platform/vsp1/vsp1_video.c      |  2 --
 drivers/media/radio/radio-maxiradio.c         |  2 --
 drivers/media/v4l2-core/v4l2-ioctl.c          |  3 ++
 include/media/media-device.h                  | 30 +++++++++++++++++--
 49 files changed, 32 insertions(+), 84 deletions(-)

-- 
2.30.2

