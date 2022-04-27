Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF195112CF
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 09:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359029AbiD0Hup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 03:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345247AbiD0Huo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 03:50:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723B620F71
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 00:47:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03C2461B51
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 07:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25501C385A9
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 07:47:32 +0000 (UTC)
Message-ID: <7b63b250-d1c8-4350-0b3b-5b3be8b06c55@xs4all.nl>
Date:   Wed, 27 Apr 2022 09:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] Various fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19d

for you to fetch changes up to 8a248355d3dda82ab3b91fdec26157f8f6913aa0:

  media: rcar-vin: Remove stray blank line (2022-04-27 09:39:37 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (1):
      media: aspeed: Fix an error handling path in aspeed_video_probe()

Colin Ian King (1):
      media: gspca: make the read-only array table static const

Dan Carpenter (2):
      media: bdisp: remove unnecessary IS_ERR() check
      media: davinci: remove unnecessary NULL check

Hangyu Hua (1):
      media: rga: fix possible memory leak in rga_probe

Husni Faiz (2):
      media: av7110: fix switch indentation
      media: av7110: fix prohibited spaces in switch statement

Jacopo Mondi (1):
      media: i2c: rdacm20: Fix format definition

Jiapeng Chong (1):
      media: platform: Remove unused including <linux/version.h>

Laurent Pinchart (2):
      media: v4l2: mem2mem: Fix typos in v4l2_m2m_dev documentation
      media: platform: renesas-ceu: Fix unused variable warning

Laurentiu Palcu (1):
      media: i2c: rdacm2x: properly set subdev entity function

Lukas Bulwahn (5):
      MAINTAINERS: rectify entry for MEDIA DRIVERS FOR NVIDIA TEGRA - VDE
      MAINTAINERS: refurbish MEDIATEK JPEG DRIVER section
      MAINTAINERS: rectify entry for MEDIATEK MEDIA DRIVER
      MAINTAINERS: drop unreachable contact for MEDIATEK JPEG DRIVER
      MAINTAINERS: adjust entries to nxp driver movement in media platform

Miaoqian Lin (4):
      media: exynos4-is: Fix PM disable depth imbalance in fimc_is_probe
      media: st-delta: Fix PM disable depth imbalance in delta_probe
      media: atmel: atmel-isc: Fix PM disable depth imbalance in atmel_isc_probe
      media: exynos4-is: Change clk_disable to clk_disable_unprepare

Ming Qian (5):
      media: imx-jpeg: Refactor function mxc_jpeg_parse
      media: imx-jpeg: Identify and handle precision correctly
      media: imx-jpeg: Propagate the output frame size to the capture side
      media: imx-jpeg: Handle source change in a function
      media: imx-jpeg: Support dynamic resolution change

Mirela Rabulea (1):
      media: imx-jpeg: Fix potential array out of bounds in queue_setup

Niklas Söderlund (2):
      media: rcar-vin: Add check that input interface and format are valid
      media: rcar-vin: Remove stray blank line

Nícolas F. R. A. Prado (1):
      media: dt-bindings: mtk-vcodec-encoder: Add power-domains property

Sebastian Fricke (4):
      staging: media: hantro: Fix typos
      staging: media: hantro: Update TODO list
      staging: media: rkvdec: Update TODO list
      media: docs-rst: Append HEVC specific term

Tom Rix (2):
      media: cec: seco: remove byte handling from smb_word_op
      media: platform: return early if the iface is not handled

 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml |   3 +
 Documentation/userspace-api/media/v4l/dev-decoder.rst                |   9 +-
 MAINTAINERS                                                          |  11 +--
 drivers/media/cec/platform/seco/seco-cec.c                           |  22 +----
 drivers/media/i2c/rdacm20.c                                          |  10 +-
 drivers/media/i2c/rdacm21.c                                          |   2 +-
 drivers/media/platform/aspeed/aspeed-video.c                         |   4 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c                     |   5 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                       | 251 ++++++++++++++++++++++++++++++++++----------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h                       |   4 +
 drivers/media/platform/renesas/rcar-vin/rcar-core.c                  |   1 -
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c                   |  25 +++++
 drivers/media/platform/renesas/renesas-ceu.c                         |   8 +-
 drivers/media/platform/rockchip/rga/rga.c                            |   6 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is.c                  |   6 +-
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c                     |   3 +-
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.h           |   1 -
 drivers/media/platform/st/sti/delta/delta-v4l2.c                     |   6 +-
 drivers/media/platform/ti/davinci/vpif_display.c                     |   3 +-
 drivers/media/platform/ti/omap3isp/ispcsiphy.c                       |   3 +-
 drivers/media/usb/gspca/spca561.c                                    |   2 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c                               |   8 +-
 drivers/staging/media/av7110/av7110_av.c                             |  46 ++++-----
 drivers/staging/media/hantro/TODO                                    |   8 +-
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c                    |   2 +-
 drivers/staging/media/hantro/hantro_hevc.c                           |   2 +-
 drivers/staging/media/rkvdec/TODO                                    |   4 +-
 27 files changed, 289 insertions(+), 166 deletions(-)
