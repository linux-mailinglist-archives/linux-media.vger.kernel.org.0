Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC8BB4F430
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 09:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfFVHmy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 03:42:54 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38009 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726092AbfFVHmx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 03:42:53 -0400
Received: from [IPv6:2001:983:e9a7:1:c087:883d:6305:97f] ([IPv6:2001:983:e9a7:1:c087:883d:6305:97f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id eafihVAuH7KeZeafjhQqfO; Sat, 22 Jun 2019 09:42:51 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Various fixes/improvements
Message-ID: <4be267d3-c5f0-d865-0889-8b08b70f9171@xs4all.nl>
Date:   Sat, 22 Jun 2019 09:42:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPbCi0GGuINa9bvPQX1IQ/2mgrUXcFHeye1FQROnpWMMdUchGRIcXIBbIxuboj7pOouo82fY+WXhPUwqM39fRLPiXF4XIlCn3BwpLbglu+3QiKE1snwn
 l/8x25mGvrqxrcATz688hGliBtlMERlDW7UgHLuTI5K9kYE0/sObYkIqPlYjjMTBuG2HP4Ws5iMgAht7ZD7AvjjdNwbwudr4XwfnFrrs1BAFORs92EFxAkCm
 3hJDuqLLSHu/oMKtQj7x7SKpaENmg+BMwUI+GeLbROE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3a959dcd11a4b1f55bbb4a37d3bac685c4e106b1:

  media: mt9m111: add regulator support (2019-06-21 17:56:39 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3s

for you to fetch changes up to 0fda628d1a97aec51e2120115f1a2adb7c56be5e:

  hdpvr: fix locking and a missing msleep (2019-06-22 09:31:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
André Almeida (1):
      media: vimc: cap: check v4l2_fill_pixfmt return value

Boris Brezillon (1):
      media: v4l2: Test type instead of cfg->type in v4l2_ctrl_new_custom()

Dmitry Osipenko (2):
      staging: media: tegra-vde: Add IOMMU support
      staging: media: tegra-vde: Defer dmabuf's unmapping

Eugen Hristev (1):
      media: atmel: atmel-isc: fix i386 build error

Ezequiel Garcia (2):
      media: hantro: Use vb2_get_buffer
      media: v4l2-ctrl: Move compound control initialization

Hans Verkuil (2):
      media/pci: set device_caps in struct video_device
      hdpvr: fix locking and a missing msleep

Janusz Krzysztofik (3):
      media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
      media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
      media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument

Puranjay Mohan (1):
      media: pci: cx88: Change the type of 'missed' to u64

 drivers/media/common/saa7146/saa7146_fops.c            |   9 +++
 drivers/media/common/saa7146/saa7146_video.c           |  18 +----
 drivers/media/pci/bt8xx/bttv-driver.c                  |  50 ++++++------
 drivers/media/pci/cobalt/cobalt-v4l2.c                 |  14 ++--
 drivers/media/pci/cx18/cx18-ioctl.c                    |   5 +-
 drivers/media/pci/cx18/cx18-streams.c                  |   1 +
 drivers/media/pci/cx23885/cx23885-417.c                |  13 ++--
 drivers/media/pci/cx23885/cx23885-video.c              |  22 +++---
 drivers/media/pci/cx25821/cx25821-video.c              |  14 ++--
 drivers/media/pci/cx88/cx88-blackbird.c                |   4 +
 drivers/media/pci/cx88/cx88-input.c                    |   4 +-
 drivers/media/pci/cx88/cx88-video.c                    |  32 ++++----
 drivers/media/pci/dt3155/dt3155.c                      |   5 +-
 drivers/media/pci/ivtv/ivtv-cards.h                    |   3 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                    |   7 --
 drivers/media/pci/ivtv/ivtv-streams.c                  |  14 +++-
 drivers/media/pci/ivtv/ivtvfb.c                        |  10 +++
 drivers/media/pci/meye/meye.c                          |   6 +-
 drivers/media/pci/saa7134/saa7134-core.c               |  15 ++++
 drivers/media/pci/saa7134/saa7134-empress.c            |   4 +
 drivers/media/pci/saa7134/saa7134-video.c              |  46 ++---------
 drivers/media/pci/saa7164/saa7164-encoder.c            |  15 ++--
 drivers/media/pci/saa7164/saa7164-vbi.c                |  15 ++--
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c         |   5 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c             |   5 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c                |   6 +-
 drivers/media/pci/tw68/tw68-video.c                    |   8 +-
 drivers/media/pci/tw686x/tw686x-video.c                |   5 +-
 drivers/media/platform/atmel/atmel-isc-base.c          |   4 +-
 drivers/media/platform/atmel/atmel-isc.h               |   4 -
 drivers/media/platform/vimc/vimc-capture.c             |   5 +-
 drivers/media/usb/hdpvr/hdpvr-video.c                  |  17 ++--
 drivers/media/v4l2-core/v4l2-ctrls.c                   |  46 ++++++-----
 drivers/media/v4l2-core/v4l2-subdev.c                  | 268 +++++++++++++++++++++++++++++++++++++++++++--------------------
 drivers/staging/media/hantro/hantro_drv.c              |   8 +-
 drivers/staging/media/tegra-vde/Kconfig                |   1 +
 drivers/staging/media/tegra-vde/Makefile               |   1 +
 drivers/staging/media/tegra-vde/dmabuf-cache.c         | 226 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra-vde/iommu.c                | 149 +++++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra-vde/trace.h                |   2 +
 drivers/staging/media/tegra-vde/{tegra-vde.c => vde.c} | 199 +++++++++++++++--------------------------------
 drivers/staging/media/tegra-vde/vde.h                  | 105 +++++++++++++++++++++++++
 include/media/v4l2-subdev.h                            |   6 ++
 43 files changed, 942 insertions(+), 454 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/dmabuf-cache.c
 create mode 100644 drivers/staging/media/tegra-vde/iommu.c
 rename drivers/staging/media/tegra-vde/{tegra-vde.c => vde.c} (88%)
 create mode 100644 drivers/staging/media/tegra-vde/vde.h
