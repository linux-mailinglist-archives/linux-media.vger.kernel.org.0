Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DD521B407
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 13:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgGJLcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 07:32:32 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49611 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727932AbgGJLca (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 07:32:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id trGSjmwWkJcNHtrGWjrrU8; Fri, 10 Jul 2020 13:32:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594380748; bh=B49N68aS+3xlTbR4yoiod99TuMHLV20vJihNufQTGg8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s+RGwAPNTn6n8P8QxtGhvpb93eF4irvxOXlCawfZ2phorxIbLmf71lmJllaMC8suo
         mMm+nXGZwXTXJUN3qAHHFFe7PljizsaW4/YvisxoPVphY5s06TZFUGOl7FVURDq3RX
         kav+SQrfNUpe2fSjI5hugyAic5lOg1vpL+hWsH1mp9YyVXtBO5XeYkPtlamMCZktlP
         dTmxq/esuyv0JTTVGzlqxNCpT/rw17d5VlviM5L9YZ9OrcCyf8h4twaMM9KuAIqUd+
         pMqES1BJ5mcVJ5kLTUxDovnTVWnqfUxFt9SJaLY9uDWErbWpDXmEsibUJvDeWeQDdh
         z1MK4H1LoFtgA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Various fixes
Message-ID: <f50d6ee4-91c4-2a10-dfc8-827081cf290a@xs4all.nl>
Date:   Fri, 10 Jul 2020 13:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBr21+zb9CVOzlcm/yIkXZoCv9BiXvE7c1SV3NN4i8fmnxmOzXcxvD90511bu3QY9EK/fwpPZifsYuq8pdjX2JCYlm8OknNItCZC/T3q+Zdy1LZ+PrxR
 d/VfGMXEBJpw+hKK2NEQxOgcZP3lPmf/0re2a086YC+747jDK9mdpQQ0POA1bViAV8UXwgMq1/APQw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6f01dfb760c027d5dd6199d91ee9599f2676b5c6:

  media: cros-ec-cec: do not bail on device_init_wakeup failure (2020-07-04 12:45:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9e

for you to fetch changes up to 6cb653cdf704ab2ca294329466cb0a394c9ef72d:

  gspca: First camera mode is skipped (2020-07-10 13:19:12 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexander A. Klimov (4):
      Replace HTTP links with HTTPS ones: SOFTLOGIC 6x10 MPEG CODEC
      TI DAVINCI SERIES MEDIA DRIVER: Replace HTTP links with HTTPS ones
      GSPCA USB WEBCAM DRIVER: Replace HTTP links with HTTPS ones
      PVRUSB2 VIDEO4LINUX DRIVER: Replace HTTP links with HTTPS ones

Christophe JAILLET (1):
      media: s5p-g2d: Fix a memory leak in an error handling path in 'g2d_probe()'

Colin Ian King (1):
      media: gspca: remove redundant initialization of variable status

Dmitry Osipenko (3):
      media: staging: tegra-vde: Runtime PM is always available on Tegra
      media: staging: tegra-vde: Turn ON power domain on shutdown
      media: staging: tegra-vde: Power-cycle hardware on probe

Eugen Hristev (1):
      media: atmel: atmel-isc: rework component offsets

Ezequiel Garcia (2):
      v4l2-core: Print control name in VIDIOC_S/G_(EXT)_CTRL(S)
      media: Add V4L2_TYPE_IS_CAPTURE helper

Flavio Suligoi (1):
      media: pci: dt3155: fix spelling mistake

Florin Tudorache (1):
      gspca: First camera mode is skipped

Hans Verkuil (5):
      cec-api: prevent leaking memory through hole in structure
      include/media/v4l2-subdev.h: fix typo
      sunxi-csi: fill in bus_info of media device
      sun4i-csi: drop read/write, enable VB2_DMABUF
      sun4i-csi: call _vb2_fop_release instead of v4l2_fh_release

Oliver Neukum (1):
      go7007: add sanity checking for endpoints

Randy Dunlap (1):
      Documentation: userspace-api/media: drop doubled words

 Documentation/driver-api/media/drivers/pvrusb2.rst       |  2 +-
 Documentation/userspace-api/media/dvb/fe-get-info.rst    |  3 +--
 Documentation/userspace-api/media/v4l/buffer.rst         |  4 ++--
 Documentation/userspace-api/media/v4l/dev-osd.rst        |  2 +-
 Documentation/userspace-api/media/v4l/dev-sdr.rst        |  2 +-
 Documentation/userspace-api/media/v4l/hist-v4l2.rst      |  4 ++--
 Documentation/userspace-api/media/v4l/vidioc-dqevent.rst |  2 +-
 drivers/media/cec/core/cec-api.c                         |  8 ++++++-
 drivers/media/common/videobuf2/videobuf2-v4l2.c          |  4 ++--
 drivers/media/pci/dt3155/dt3155.c                        |  2 +-
 drivers/media/pci/dt3155/dt3155.h                        |  2 +-
 drivers/media/pci/solo6x10/solo6x10-core.c               |  2 +-
 drivers/media/pci/solo6x10/solo6x10-disp.c               |  2 +-
 drivers/media/pci/solo6x10/solo6x10-eeprom.c             |  2 +-
 drivers/media/pci/solo6x10/solo6x10-enc.c                |  2 +-
 drivers/media/pci/solo6x10/solo6x10-g723.c               |  2 +-
 drivers/media/pci/solo6x10/solo6x10-gpio.c               |  2 +-
 drivers/media/pci/solo6x10/solo6x10-i2c.c                |  2 +-
 drivers/media/pci/solo6x10/solo6x10-jpeg.h               |  2 +-
 drivers/media/pci/solo6x10/solo6x10-offsets.h            |  2 +-
 drivers/media/pci/solo6x10/solo6x10-p2m.c                |  2 +-
 drivers/media/pci/solo6x10/solo6x10-regs.h               |  2 +-
 drivers/media/pci/solo6x10/solo6x10-tw28.c               |  2 +-
 drivers/media/pci/solo6x10/solo6x10-tw28.h               |  2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c           |  2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c               |  2 +-
 drivers/media/pci/solo6x10/solo6x10.h                    |  2 +-
 drivers/media/platform/atmel/atmel-isc-base.c            | 60 +++++++++++++++++++++------------------------------
 drivers/media/platform/atmel/atmel-isc-regs.h            |  2 --
 drivers/media/platform/atmel/atmel-isc.h                 |  2 +-
 drivers/media/platform/davinci/vpbe_display.c            |  2 +-
 drivers/media/platform/davinci/vpif.c                    |  2 +-
 drivers/media/platform/davinci/vpif.h                    |  2 +-
 drivers/media/platform/davinci/vpif_display.c            |  2 +-
 drivers/media/platform/davinci/vpif_display.h            |  2 +-
 drivers/media/platform/exynos-gsc/gsc-core.c             |  2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c              |  2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c          |  2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c             |  7 +++---
 drivers/media/platform/rcar_jpu.c                        |  2 +-
 drivers/media/platform/s5p-g2d/g2d.c                     | 28 +++++++++++++-----------
 drivers/media/platform/sti/hva/hva-v4l2.c                |  2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c       |  2 ++
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c       |  2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c      |  5 ++---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c       |  2 ++
 drivers/media/platform/ti-vpe/vpe.c                      |  2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c        |  6 +++---
 drivers/media/usb/go7007/go7007-usb.c                    | 11 +++++++++-
 drivers/media/usb/gspca/gspca.c                          |  2 +-
 drivers/media/usb/gspca/ov534.c                          |  2 +-
 drivers/media/usb/gspca/sn9c2028.c                       |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                     | 14 ++++++++----
 drivers/media/v4l2-core/v4l2-mem2mem.c                   |  6 +++---
 drivers/staging/media/hantro/hantro_v4l2.c               |  2 +-
 drivers/staging/media/rkvdec/rkvdec.c                    |  2 +-
 drivers/staging/media/tegra-vde/vde.c                    | 41 ++++++++++++++++++++++-------------
 include/media/davinci/vpbe_display.h                     |  2 +-
 include/media/v4l2-subdev.h                              |  2 +-
 include/uapi/linux/videodev2.h                           |  2 ++
 60 files changed, 158 insertions(+), 135 deletions(-)
