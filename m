Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5D3F6B7B9C
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 16:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCMPMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 11:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCMPMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 11:12:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159176FFF7
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 08:12:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7853C61326
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 15:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC5EC433D2
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 15:12:49 +0000 (UTC)
Message-ID: <a5d6312b-1129-2369-6acf-4d1cce4ee403@xs4all.nl>
Date:   Mon, 13 Mar 2023 16:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] Various fixes and enhancements
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

The following changes since commit 3e62aba8284de0994a669d07983299242e68fe72:

  media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-26 11:21:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4a

for you to fetch changes up to ef1a0b98517d9968f06280bafa12080315f76d96:

  media: docs: vidioc-g-ext-ctrls.rst: Document p_s32 and p_s64 fields (2023-03-13 16:10:20 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Bryan O'Donoghue (1):
      MAINTAINERS: Add myself as CAMSS maintainer

Colin Ian King (1):
      media: platform: exynos4-is: Fix spelling mistake "palne" -> "plane"

Dan Carpenter (1):
      media: av7110: prevent underflow in write_ts_to_decoder()

Daniel Lundberg Pedersen (1):
      media: docs: vidioc-g-ext-ctrls.rst: Document p_s32 and p_s64 fields

Jakub Kicinski (1):
      media: drop unnecessary networking includes

Jiasheng Jiang (2):
      media: bdisp: Add missing check for create_workqueue
      media: platform: mtk-mdp3: Add missing check and free for ida_alloc

Jonathan Neuschäfer (1):
      media: dvb-frontends: Fix a typo ("Unknow sleep mode")

Kees Cook (2):
      media: mxl5005s: Bounds check size used for max array index
      media: imx-jpeg: Bounds check sizeimage access

Kevin Chiu (1):
      media: platform: cros-ec: Add Gladios/Lisbon to the match table

Krzysztof Kozlowski (1):
      media: dt-bindings: silabs,si470x: Convert to DT schema

Marek Vasut (1):
      media: stm32-dcmi: Enable incoherent buffer allocation

Ming Qian (1):
      media: amphion: decoder implement display delay enable

Tom Rix (1):
      media: pvrusb2: VIDEO_PVRUSB2 depends on DVB_CORE to use dvb_* symbols

Yang Li (1):
      media: tc358746: Remove unneeded semicolon

Ye Xingchen (3):
      media: dw100: use devm_platform_get_and_ioremap_resource()
      media: platform: renesas: use devm_platform_get_and_ioremap_resource()
      media: platform: stm32: use devm_platform_get_and_ioremap_resource()

Zoey Wu (1):
      media: platform: cros-ec: Add aurash to the match table

harperchen (3):
      media: cx23885: Fix a null-ptr-deref bug in buffer_prepare() and buffer_finish()
      media: platform: via: Handle error for dma_set_mask
      media: pci: tw68: Fix null-ptr-deref bug in buf prepare and finish

oushixiong (1):
      mtk-jpegenc: Fix a compilation issue

 Documentation/devicetree/bindings/media/si470x.txt           | 26 --------------------------
 Documentation/devicetree/bindings/media/silabs,si470x.yaml   | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 10 ++++++++++
 MAINTAINERS                                                  |  2 ++
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c             |  6 ++++++
 drivers/media/dvb-frontends/drx39xyj/drxj.c                  |  2 +-
 drivers/media/dvb-frontends/drxk_hard.c                      |  2 +-
 drivers/media/i2c/tc358746.c                                 |  4 ++--
 drivers/media/pci/cx23885/cx23885-core.c                     |  4 +++-
 drivers/media/pci/cx23885/cx23885-video.c                    | 13 +++++++------
 drivers/media/pci/ttpci/budget-av.c                          |  1 +
 drivers/media/pci/tw68/tw68-video.c                          | 16 +++++++++-------
 drivers/media/platform/amphion/vdec.c                        | 32 ++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_codec.h                   |  3 ++-
 drivers/media/platform/amphion/vpu_malone.c                  |  4 +++-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c         |  2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c          |  8 +++++++-
 drivers/media/platform/nxp/dw100/dw100.c                     |  4 +---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c               |  5 +++++
 drivers/media/platform/renesas/rcar-isp.c                    |  5 +----
 drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c    |  2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h    |  2 +-
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c             |  2 ++
 drivers/media/platform/st/stm32/dma2d/dma2d.c                |  5 +----
 drivers/media/platform/st/stm32/stm32-dcmi.c                 |  1 +
 drivers/media/platform/via/via-camera.c                      |  4 +++-
 drivers/media/tuners/mxl5005s.c                              | 12 ++++++++----
 drivers/media/usb/dvb-usb/pctv452e.c                         |  2 ++
 drivers/media/usb/pvrusb2/Kconfig                            |  2 +-
 drivers/staging/media/av7110/av7110_av.c                     |  4 ++--
 include/media/dvb_net.h                                      |  6 ++----
 include/media/tveeprom.h                                     |  2 +-
 32 files changed, 167 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/si470x.txt
 create mode 100644 Documentation/devicetree/bindings/media/silabs,si470x.yaml
