Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD0349F536
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 09:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347325AbiA1Ien (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 03:34:43 -0500
Received: from retiisi.eu ([95.216.213.190]:59030 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347356AbiA1Ien (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 03:34:43 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B8343634C91;
        Fri, 28 Jan 2022 10:34:37 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 0/4] Set bus_info field in framework
Date:   Fri, 28 Jan 2022 10:33:05 +0200
Message-Id: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This innocuous-looking patchset moves setting the bus_info fields in
struct media_device and struct v4l2_capability from drivers to the
framework for PCI and platform devices. USB and I²C devices are possible,
too, but not yet implemented. Using this is optional so that drivers which
have special requirements or archaic bugs are unaffected.

If people like this, I'll see if the same could be done to the driver
fields.

I have patches for USB, too, but those require changes in USB core
(namely exporting the relevant functions).

since v1:

- Make media_set_bus_info() a function, pass field size as an argument.

- Drop a few bad driver changes. Remove now-redundant local variables.

- Document the functionality for media_device_init(), V4L2 side doesn't
  have a proper place for documentation and I don't think it's something
  that should go to this set.

- Remove redundant kerneldoc in mc-device.c.

- Set bus_info in querycap unconditionally, before calling driver callback
  that can override it.

Sakari Ailus (4):
  mc: Remove redundant documentation
  mc: Provide a helper for setting bus_info field
  mc: Set bus_info in media_device_init()
  v4l: ioctl: Set bus_info in v4l_querycap()

 drivers/media/common/saa7146/saa7146_video.c  |  1 -
 drivers/media/mc/mc-device.c                  | 19 ++--------
 drivers/media/pci/bt8xx/bttv-driver.c         |  2 -
 drivers/media/pci/cx18/cx18-ioctl.c           |  2 -
 drivers/media/pci/cx88/cx88-blackbird.c       |  1 -
 drivers/media/pci/cx88/cx88-video.c           |  1 -
 drivers/media/pci/dt3155/dt3155.c             |  3 --
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  6 ---
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  1 -
 drivers/media/pci/meye/meye.c                 |  1 -
 drivers/media/pci/saa7134/saa7134-video.c     |  1 -
 drivers/media/pci/saa7164/saa7164-encoder.c   |  1 -
 drivers/media/pci/saa7164/saa7164-vbi.c       |  1 -
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |  2 -
 drivers/media/pci/solo6x10/solo6x10-v4l2.c    |  2 -
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  2 -
 drivers/media/pci/tw5864/tw5864-video.c       |  1 -
 drivers/media/pci/tw68/tw68-video.c           |  3 --
 drivers/media/pci/tw686x/tw686x-video.c       |  2 -
 .../media/platform/allegro-dvt/allegro-core.c |  5 ---
 drivers/media/platform/davinci/vpbe_display.c |  2 -
 drivers/media/platform/davinci/vpif_capture.c |  2 -
 drivers/media/platform/davinci/vpif_display.c |  2 -
 drivers/media/platform/exynos-gsc/gsc-m2m.c   |  5 ---
 drivers/media/platform/exynos4-is/common.c    |  2 -
 drivers/media/platform/exynos4-is/fimc-lite.c |  4 --
 drivers/media/platform/imx-jpeg/mxc-jpeg.c    |  4 --
 .../media/platform/marvell-ccic/cafe-driver.c |  1 -
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  2 -
 .../media/platform/qcom/camss/camss-video.c   |  4 --
 drivers/media/platform/rcar-vin/rcar-core.c   |  2 -
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  4 --
 drivers/media/platform/rcar_jpu.c             |  2 -
 drivers/media/platform/s5p-jpeg/jpeg-core.c   |  2 -
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |  2 -
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |  2 -
 drivers/media/platform/stm32/stm32-dcmi.c     |  2 -
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  2 -
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  4 --
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  2 -
 drivers/media/platform/ti-vpe/cal-video.c     |  4 --
 drivers/media/platform/ti-vpe/cal.c           |  2 -
 drivers/media/platform/vsp1/vsp1_drv.c        |  2 -
 drivers/media/platform/vsp1/vsp1_histo.c      |  2 -
 drivers/media/platform/vsp1/vsp1_video.c      |  2 -
 drivers/media/radio/radio-maxiradio.c         |  2 -
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 ++
 include/media/media-device.h                  | 37 ++++++++++++++++---
 48 files changed, 39 insertions(+), 125 deletions(-)

-- 
2.30.2

