Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA1C554F19
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 17:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359334AbiFVPZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 11:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359338AbiFVPZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 11:25:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC2A39162
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 08:25:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA6CE6163C
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 15:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C667C34114
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 15:25:42 +0000 (UTC)
Message-ID: <d1fbef8e-e573-d9cc-57f2-7bd0fd14a85d@xs4all.nl>
Date:   Wed, 22 Jun 2022 17:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] Various fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 945a9a8e448b65bec055d37eba58f711b39f66f0:

  media: pvrusb2: fix memory leak in pvr_probe (2022-06-20 10:30:37 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20e

for you to fetch changes up to ec34ce15f143aaefebbf54cb2bebe9f2ccf4df6c:

  media: mediatek: vcodec: Report supported bitrate modes (2022-06-22 16:06:19 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ajye Huang (1):
      media: platform: cros-ec: Add kinox to the match table

Arnd Bergmann (1):
      media: sta2x11: remove VIRT_TO_BUS dependency

Chen-Yu Tsai (1):
      media: mediatek: vcodec: Skip SOURCE_CHANGE & EOS events for stateless

Christophe JAILLET (4):
      media: rcar_drif: Remove useless license text when SPDX-License-Identifier is already used
      media: em28xx: Remove useless license text when SPDX-License-Identifier is already used
      media: ddbridge: Remove useless license text when SPDX-License-Identifier is already used
      media: tw686x: Fix an error handling path in tw686x_probe()

Eugen Hristev (1):
      media: atmel: atmel-isc-base: allow wb ctrls to be changed when isc is not configured

Guo Zhengkui (1):
      media: mediatek: vcodec: fix minmax.cocci warning

Hirokazu Honda (1):
      media: mediatek: vcodec: Report supported bitrate modes

Jian Zhang (1):
      driver/nxp/imx-jpeg: fix a unexpected return value problem

Jiang Jian (3):
      media: usb: gspca: aligned '*' each line
      media: saa7164: Remove duplicate 'on' in two places.
      media: av7110: Remove duplicate 'with' in two places.

Justin Green (1):
      mediatek: vcodec: return EINVAL if plane is too small

Lukas Bulwahn (1):
      MAINTAINERS: add include/dt-bindings/media to MEDIA INPUT INFRASTRUCTURE

Marek Vasut (2):
      media: stm32: dcmi: Fill in remaining Bayer formats
      media: stm32: dcmi: Drop always NULL sd_state from dcmi_pipeline_s_fmt()

Miaoqian Lin (1):
      media: tw686x: Fix memory leak in tw686x_video_init

Ming Qian (3):
      media: imx-jpeg: Disable slot interrupt when frame done
      media: amphion: output firmware error message
      media: v4l2-mem2mem: prevent pollerr when last_buffer_dequeued is set

Niels Dossche (1):
      media: hdpvr: fix error value returns in hdpvr_read

Yang Li (1):
      media: mediatek: vcodec: remove unneeded semicolon

Yunfei Dong (7):
      media: mediatek: vcodec: Fix decoder v4l2 bus_info not correctly
      media: mediatek: vcodec: Change decoder v4l2 capability value
      media: mediatek: vcodec: Fix encoder v4l2 bus_info not correctly
      media: mediatek: vcodec: Change encoder v4l2 capability value
      media: mediatek: vcodec: Initialize decoder parameters after getting dec_capability
      MAINTAINERS: add Yunfei Dong as mediatek vcodec driver maintainer
      media: mediatek: vcodec: Fix non subdev architecture open power fail

Zhang Zekun (1):
      media:rkvdec:Remove redundant memset

 MAINTAINERS                                                       |  2 ++
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c                  |  2 ++
 drivers/media/pci/ddbridge/ddbridge-ci.c                          |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-ci.h                          |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-core.c                        |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-hw.c                          |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-hw.h                          | 11 +----------
 drivers/media/pci/ddbridge/ddbridge-i2c.c                         |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-i2c.h                         |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-io.h                          |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-main.c                        |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-max.c                         |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-max.h                         | 11 +----------
 drivers/media/pci/ddbridge/ddbridge-mci.c                         |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-mci.h                         |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-regs.h                        |  9 ---------
 drivers/media/pci/ddbridge/ddbridge-sx8.c                         |  9 ---------
 drivers/media/pci/ddbridge/ddbridge.h                             | 11 +----------
 drivers/media/pci/saa7164/saa7164-api.c                           |  2 +-
 drivers/media/pci/sta2x11/Kconfig                                 |  2 +-
 drivers/media/pci/tw686x/tw686x-core.c                            |  5 ++++-
 drivers/media/pci/tw686x/tw686x-video.c                           |  4 +++-
 drivers/media/platform/amphion/vpu_msgs.c                         |  7 ++++++-
 drivers/media/platform/atmel/atmel-isc-base.c                     |  4 ----
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c           | 37 +++++++++++++++++++++++++++++++------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c       |  4 ++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h           |  1 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c           | 36 +++++++++++++++++++++++++++++++++---
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c |  2 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c                 |  5 +++++
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h                 |  1 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                    | 12 ++++--------
 drivers/media/platform/renesas/rcar_drif.c                        |  5 -----
 drivers/media/platform/st/stm32/stm32-dcmi.c                      | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 drivers/media/usb/em28xx/em28xx-audio.c                           | 10 ----------
 drivers/media/usb/em28xx/em28xx-camera.c                          | 10 ----------
 drivers/media/usb/em28xx/em28xx-cards.c                           | 10 ----------
 drivers/media/usb/em28xx/em28xx-core.c                            | 10 ----------
 drivers/media/usb/em28xx/em28xx-dvb.c                             |  4 ----
 drivers/media/usb/em28xx/em28xx-i2c.c                             | 10 ----------
 drivers/media/usb/em28xx/em28xx-input.c                           | 10 ----------
 drivers/media/usb/em28xx/em28xx-v4l.h                             |  9 ---------
 drivers/media/usb/em28xx/em28xx-vbi.c                             | 10 ----------
 drivers/media/usb/em28xx/em28xx-video.c                           | 10 ----------
 drivers/media/usb/em28xx/em28xx.h                                 | 10 ----------
 drivers/media/usb/gspca/xirlink_cit.c                             |  2 +-
 drivers/media/usb/hdpvr/hdpvr-video.c                             |  2 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c                            |  2 +-
 drivers/staging/media/av7110/av7110.c                             |  2 +-
 drivers/staging/media/rkvdec/rkvdec-vp9.c                         |  2 --
 50 files changed, 155 insertions(+), 292 deletions(-)
