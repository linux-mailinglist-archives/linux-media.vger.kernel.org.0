Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1302A0977
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 16:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgJ3PUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 11:20:10 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59155 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727070AbgJ3PUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 11:20:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YWCAkpNlXWvjMYWCEkHzkE; Fri, 30 Oct 2020 16:20:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604071206; bh=BnhdCPMOAyDxutP2KexUSxU9thSG8sA8LAdBOAiKSuc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Qlf6ahgqfj2RpU6vMG6TacILbiUDDone6XLy4bkIwTjOUlSIwel+LRMlAq2MiG1el
         QpssD8z1XcUAqsKGeuH4aq2QS9oDCsgHQEdRZ+fIs5IECkxcQ390LmUnyaYW4LNsR8
         9NM7McSoQyDYd0xj9LMhG99nA7y67mwj6trZQAgpVbVW4xPZ7eFLsOekfPUj7Dwjqo
         5J+V/2/ILprk60hI2YZUZQWhToRoyYwZv8J1XTT5vnA7sXyKa9gz8Wl4BHWqh/+TBE
         DXVh1xuFid9flBl9RIsQ23UkzXPzqCBo8rZRfnUcF0GzQf/n0bq6APRQyrpHW4ceMT
         KOTHtDBrLkcqQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] (v2) Various fixes
Message-ID: <c635ef64-55e6-1c8e-a6c9-c11666b0144d@xs4all.nl>
Date:   Fri, 30 Oct 2020 16:20:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPWy1q4KypkdPlAxa4JQ+S7DN1CYeJhbMqGm/VlE35WBCIy6gApY/DLHCiB/W04UCFKvsM0y/08/qeKgELt+Qwvd50UBrx+6xcXM07rIEw1JMx74Oe/s
 GcpG3RaSSxpXgQ3n8IDa96Cy8IUQBf2Z+VWh6PnVhnefYQZ+fW5BEx04wHQDQOSHiTTyV5HHSE1h4Rv/poLKzIEzCaJMyViZAg4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change since v1: dropped "media: cedrus: h264: Fix check for presence of scaling matrix"

(that patch needs to go to v5.10)

Regards,

	Hans

The following changes since commit dfe3d19bd092cefb184c6e65b881602c793edd33:

  Merge tag 'v5.10-rc1' into patchwork (2020-10-29 09:03:21 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11c

for you to fetch changes up to 247f4f5c609453bdbb8d04b205d3c3382de3417f:

  media: staging: rkisp1: rsz: make const array static, makes object smaller (2020-10-30 11:38:12 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Colin Ian King (2):
      media: tm6000: Fix sizeof() mismatches
      media: staging: rkisp1: rsz: make const array static, makes object smaller

Deepak R Varma (2):
      staging: media: imx: remove commented code
      staging: media: imx: remove unnecessary variable use

Gustavo A. R. Silva (1):
      media: pxa_camera: Use fallthrough pseudo-keyword

Hans Verkuil (2):
      cec-core.rst/cec-ioc-g-mode.rst: fix typos in monitor-all description
      cec-core: first mark device unregistered, then wake up fhs

Lukas Bulwahn (1):
      MAINTAINERS: rectify ZR36067 VIDEO FOR LINUX DRIVER section

Niklas Söderlund (5):
      rcar-vin: Use scratch buffer when not in running state
      rcar-vin: Remove handling of user-space buffers when stopping
      rcar-vin: Cache the CSI-2 channel selection value
      rcar-vin: Break out hardware start and stop to new methods
      rcar-vin: Add support for suspend and resume

Robert Foss (1):
      MAINTAINERS: camss: Add Robert Foss as co-maintainer

Thomas Gleixner (3):
      media: Bulk remove BUG_ON(in_interrupt())
      media: au0828: Consolidate dmesg output
      media: cx231xx: Consolidate dmesg output

Tom Rix (1):
      media: remove unneeded break

Yu Kuai (5):
      media: platform: add missing put_device() call in mtk_jpeg_clk_init()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_dec_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_dec_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_enc_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_enc_pm()

 Documentation/driver-api/media/cec-core.rst              |   2 +-
 Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst |   2 +-
 MAINTAINERS                                              |  15 ++---
 drivers/media/cec/core/cec-core.c                        |   4 +-
 drivers/media/common/saa7146/saa7146_fops.c              |   2 -
 drivers/media/dvb-frontends/drx39xyj/drxj.c              |   7 ---
 drivers/media/dvb-frontends/drxd_hard.c                  |   1 -
 drivers/media/dvb-frontends/nxt200x.c                    |  16 ------
 drivers/media/dvb-frontends/si21xx.c                     |   2 -
 drivers/media/pci/bt8xx/bttv-risc.c                      |   1 -
 drivers/media/pci/cx23885/cx23885-core.c                 |   1 -
 drivers/media/pci/cx25821/cx25821-core.c                 |   1 -
 drivers/media/platform/fsl-viu.c                         |   2 -
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c          |   1 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c    |  19 +++++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c    |  28 +++++++---
 drivers/media/platform/pxa_camera.c                      |   4 +-
 drivers/media/platform/rcar-vin/rcar-core.c              |  51 +++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-dma.c               | 129 +++++++++++++++++++++++--------------------
 drivers/media/platform/rcar-vin/rcar-vin.h               |  15 +++--
 drivers/media/tuners/mt2063.c                            |   1 -
 drivers/media/usb/au0828/au0828-video.c                  |   5 +-
 drivers/media/usb/cx231xx/cx231xx-core.c                 |  10 ++--
 drivers/media/usb/cx231xx/cx231xx-vbi.c                  |   5 +-
 drivers/media/usb/tm6000/tm6000-video.c                  |   7 +--
 drivers/media/usb/zr364xx/zr364xx.c                      |   2 -
 drivers/staging/media/imx/imx-media-csi.c                |  10 +---
 drivers/staging/media/rkisp1/rkisp1-resizer.c            |   6 +-
 28 files changed, 196 insertions(+), 153 deletions(-)
