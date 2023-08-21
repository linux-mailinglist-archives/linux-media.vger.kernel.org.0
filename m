Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101EB782557
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 10:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233937AbjHUIYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 04:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjHUIYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 04:24:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA3D98
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 01:24:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6629D62D05
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 08:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A80C433C8;
        Mon, 21 Aug 2023 08:24:40 +0000 (UTC)
Message-ID: <2250c38f-2abf-c712-1352-449ee8d573e0@xs4all.nl>
Date:   Mon, 21 Aug 2023 10:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.7] media: various fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 8ba283f6c929350e97feaef35dee4bdcf20c8909:

  media: v4l: Use correct dependency for camera sensor drivers (2023-08-18 13:11:36 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.7a

for you to fetch changes up to 75aabaf0634a608de4473c644540beff9df7c07b:

  media: imx-jpeg: Remove unused declarations (2023-08-18 16:48:06 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Colin Ian King (2):
      media: bt8xx: make read-only arrays static
      media: mediatek: vcodec: fix spelling mistake "resonable" -> "reasonable"

Hans Verkuil (1):
      media: cx25840: simplify cx23885_dif_setup()

Juerg Haefliger (1):
      media: bttv: Add MODULE_FIRMWARE macro

Krzysztof Kozlowski (3):
      media: dt-bindings: samsung,exynos4212-fimc-is: replace duplicate pmu node with phandle
      media: dt-bindings: samsung,fimc: correct unit addresses in DTS example
      media: exynos4-is: fimc-is: replace duplicate pmu node with phandle

Li Zetao (1):
      media: nxp: Use devm_kmemdup to replace devm_kmalloc + memcpy

Ruan Jinjie (2):
      media: staging: media: sunxi: cedrus: Remove redundant of_match_ptr()
      media: cx231xx: Switch to use kmemdup() helper

Wang Ming (1):
      media: platform: Use dev_err_probe instead of dev_err

Yu Liao (1):
      media: use struct_size() helper

Yue Haibing (1):
      media: imx-jpeg: Remove unused declarations

Zheng Wang (1):
      media: bttv: fix use after free error due to btv->timeout timer

 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml |   15 +-
 Documentation/devicetree/bindings/media/samsung,fimc.yaml               |   27 +-
 drivers/media/common/videobuf2/frame_vector.c                           |    2 +-
 drivers/media/i2c/cx25840/cx25840-core.c                                | 3694 ++++++++-----------------------------
 drivers/media/pci/bt8xx/bttv-cards.c                                    |    1 +
 drivers/media/pci/bt8xx/bttv-driver.c                                   |    1 +
 drivers/media/pci/bt8xx/dvb-bt8xx.c                                     |   14 +-
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c       |    2 +-
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       |    2 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h                       |   11 -
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c                     |    4 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is.c                     |   33 +-
 drivers/media/platform/xilinx/xilinx-dma.c                              |    5 +-
 drivers/media/usb/cx231xx/cx231xx-core.c                                |    3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                             |    2 +-
 15 files changed, 876 insertions(+), 2940 deletions(-)
