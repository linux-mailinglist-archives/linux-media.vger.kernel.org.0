Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A504E4BB74F
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 11:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbiBRKy6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 05:54:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234175AbiBRKy5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 05:54:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1121F4606
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 02:54:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6E4CDB825CA
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 10:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05F2C340E9;
        Fri, 18 Feb 2022 10:54:36 +0000 (UTC)
Message-ID: <49e455a5-2468-b45e-4449-4db4c2821bdd@xs4all.nl>
Date:   Fri, 18 Feb 2022 11:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Adam Ford <aford173@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ettore Chimenti <ettore.chimenti@udoo.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] Various fixes/enhancements
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

Besides assorted fixes this also adds support for i.MX8MM Hantro-G1,
a performance speed up for stk1160 and camss improvements.

Regards,

	Hans

The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18m

for you to fetch changes up to 2f82b80414b5f626b9069f9a803000facb8af66b:

  media: mtk-vcodec: Remove duplicated include in mtk_vcodec_enc_drv.c (2022-02-18 11:25:32 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Adam Ford (4):
      dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes
      media: hantro: Allow i.MX8MQ G1 and G2 to run independently
      dt-bindings: media: nxp, imx8mq-vpu: Add support for G1 on imx8mm
      media: hantro: Add support for i.MX8MM Hantro-G1

Bryan O'Donoghue (6):
      media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845
      media: dt-bindings: media: camss: Add vdda supply declarations sm8250
      media: camss: Add regulator_bulk support
      media: camss: Set unused regulators to the empty set
      media: camss: Point sdm845 at the correct vdda regulators
      media: camss: Point sm8250 at the correct vdda regulators

Dafna Hirschfeld (4):
      media: stk1160: fix number of buffers in case not all buffers are created
      media: stk1160: If start stream fails, return buffers with VB2_BUF_STATE_QUEUED
      media: stk1160: move transfer_buffer and urb to same struct 'stk1160_urb'
      media: stk1160: use dma_alloc_noncontiguous API

Dongliang Mu (1):
      media: hdpvr: initialize dev->worker at hdpvr_register_videodev

Ettore Chimenti (1):
      media: cec: seco: add newlines in debug messages

Jiasheng Jiang (1):
      media: vidtv: Check for null return of vzalloc

Lad Prabhakar (1):
      media: davinci: vpif: Use platform_get_irq_optional() to get the interrupt

Pavel Skripkin (1):
      Revert "media: em28xx: add missing em28xx_close_extension"

Sergey Senozhatsky (1):
      media: videobuf2-dma-contig: Invalidate vmap range before DMA range

Xu Wang (1):
      media: mtk-mdp: Remove redundant 'flush_workqueue()' calls

Yang Li (1):
      media: mtk-vcodec: Remove duplicated include in mtk_vcodec_enc_drv.c

 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml    |  68 ++++++++++++---------------
 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml |  14 ++++--
 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml |  13 ++++++
 drivers/media/cec/platform/seco/seco-cec.c                     |  54 ++++++++++-----------
 drivers/media/common/videobuf2/videobuf2-dma-contig.c          |  12 ++---
 drivers/media/platform/davinci/vpif.c                          |  18 ++++---
 drivers/media/platform/davinci/vpif_capture.c                  |  27 ++++++-----
 drivers/media/platform/davinci/vpif_display.c                  |  24 ++++++----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c                  |   2 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c         |   1 -
 drivers/media/platform/qcom/camss/camss-csid.c                 |  45 ++++++++++++------
 drivers/media/platform/qcom/camss/camss-csid.h                 |   3 +-
 drivers/media/platform/qcom/camss/camss.c                      |  94 ++++++++++++++++++-------------------
 drivers/media/platform/qcom/camss/camss.h                      |   2 +-
 drivers/media/test-drivers/vidtv/vidtv_s302m.c                 |  17 +++++--
 drivers/media/usb/em28xx/em28xx-cards.c                        |   5 +-
 drivers/media/usb/hdpvr/hdpvr-video.c                          |   4 +-
 drivers/media/usb/stk1160/stk1160-core.c                       |   2 +-
 drivers/media/usb/stk1160/stk1160-v4l.c                        |  16 ++++---
 drivers/media/usb/stk1160/stk1160-video.c                      | 142 ++++++++++++++++++++++++++++++--------------------------
 drivers/media/usb/stk1160/stk1160.h                            |  23 ++++++---
 drivers/staging/media/hantro/hantro_drv.c                      |  11 +++++
 drivers/staging/media/hantro/hantro_hw.h                       |   2 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c                    |  62 +++++++++++++++++++------
 24 files changed, 390 insertions(+), 271 deletions(-)
