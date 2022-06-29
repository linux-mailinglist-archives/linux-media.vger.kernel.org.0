Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D339560002
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 14:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbiF2Mev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 08:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbiF2Mev (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 08:34:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918EC26124
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 05:34:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 391A261CC5
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 12:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31913C34114;
        Wed, 29 Jun 2022 12:34:48 +0000 (UTC)
Message-ID: <c894bf0f-d61a-13ea-82a0-c078286d702a@xs4all.nl>
Date:   Wed, 29 Jun 2022 14:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] Various fixes, Allwinner A31/A83T CSI driver
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

The following changes since commit d8e8aa866ed8636fd6c1017c3d9453eab2922496:

  media: mediatek: vcodec: Report supported bitrate modes (2022-06-27 09:31:41 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20f

for you to fetch changes up to f34a9ffc3788274a3ba1365b00f27ae00fb5a940:

  media: sunxi: Add support for the A83T MIPI CSI-2 controller (2022-06-29 14:25:06 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment

Jiang Jian (4):
      cx18: Fix typo in comments
      media: gspca: drop unexpected word 'is' in the comments
      media: ti: drop unexpected word 'a' in comments
      media: pvrusb2: drop unexpected word 'a' in comments

Marek Vasut (2):
      media: v4l2-ctrls: Fix missing newline in examples
      media: docs: Fix VIVIOC typo

Ming Qian (1):
      media: amphion: release core lock before reset vpu core

Nicolas Frattaroli (2):
      media: dt-binding: media: Add rk3568-vepu binding
      media: hantro: Add support for RK356x encoder

Paul Kocialkowski (6):
      dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2 input port
      dt-bindings: media: Add Allwinner A31 MIPI CSI-2 bindings documentation
      media: sunxi: Add support for the A31 MIPI CSI-2 controller
      MAINTAINERS: Add entry for the Allwinner A31 MIPI CSI-2 bridge driver
      dt-bindings: media: Add Allwinner A83T MIPI CSI-2 bindings documentation
      media: sunxi: Add support for the A83T MIPI CSI-2 controller

Sebastian Fricke (1):
      media: Fix incorrect P010 chroma order description

 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml         |  58 ++-
 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml   | 137 +++++++
 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml  | 125 ++++++
 Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml            |  69 ++++
 Documentation/userspace-api/media/v4l/control.rst                            |   4 +-
 Documentation/userspace-api/media/v4l/mmap.rst                               |   2 +-
 MAINTAINERS                                                                  |   9 +
 drivers/media/pci/cx18/cx18-av-core.c                                        |   2 +-
 drivers/media/platform/amphion/vpu_core.c                                    |   7 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h                            |   2 +
 drivers/media/platform/sunxi/Kconfig                                         |   2 +
 drivers/media/platform/sunxi/Makefile                                        |   2 +
 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig                         |  14 +
 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile                        |   4 +
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c               | 749 ++++++++++++++++++++++++++++++++++
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h               |  52 +++
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h           |  76 ++++
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig                    |  12 +
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile                   |   4 +
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c          |  72 ++++
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h          |  39 ++
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c     | 815 +++++++++++++++++++++++++++++++++++++
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h     |  55 +++
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2_reg.h | 151 +++++++
 drivers/media/platform/ti/cal/cal-camerarx.c                                 |   2 +-
 drivers/media/usb/gspca/spca501.c                                            |   2 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c                                      |   2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                                         |   2 +-
 drivers/staging/media/hantro/hantro_drv.c                                    |   1 +
 drivers/staging/media/hantro/hantro_hw.h                                     |   1 +
 drivers/staging/media/hantro/rockchip_vpu_hw.c                               |  25 ++
 31 files changed, 2474 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2_reg.h
