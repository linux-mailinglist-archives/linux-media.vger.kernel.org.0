Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137F15F0D83
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 16:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbiI3O2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 10:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbiI3O2g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 10:28:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A071A10A2
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 07:28:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 546E36233F
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 14:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA023C433D6;
        Fri, 30 Sep 2022 14:28:33 +0000 (UTC)
Message-ID: <e7fb9a40-9ff9-266a-6797-47503d4fd5ea@xs4all.nl>
Date:   Fri, 30 Sep 2022 16:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     "kyrie.wu" <kyrie.wu@mediatek.com>, Ming Qian <ming.qian@nxp.com>,
        Irui Wang <irui.wang@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2] imx-jpeg & mtk-jpeg: fixes and enhancements
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

The following changes since commit d67614f276c1499ad939fa5c1aadd35498cc6b34:

  Merge fixes into media_stage (2022-09-27 10:27:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2b

for you to fetch changes up to 9e492cac560b206eae80c87ab12de2fd99881166:

  mtk-jpegdec: add stop cmd interface for jpgdec (2022-09-30 15:56:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jason Wang (1):
      media: imx-jpeg: Remove unnecessary memset() after dma_alloc_coherent()

Jianhua Lin (2):
      dt-bindings: media: mediatek-jpeg-decoder: Add MT8188 compatible string
      dt-bindings: media: mediatek-jpeg-encoder: Add MT8188 compatible string

Ming Qian (5):
      media: imx-jpeg: Add a timeout mechanism for each frame
      media: imx-jpeg: Don't clear stop state in handling dynamic resolution change
      media: imx-jpeg: Implement g_selection and s_selection
      media: imx-jpeg: Support contiguous and non contiguous format
      media: imx-jpeg: Disable useless interrupt to avoid kernel panic

kyrie wu (15):
      dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
      mtk-jpegenc: export jpeg encoder functions
      mtk-jpegenc: support jpegenc multi-hardware
      mtk-jpegenc: add jpegenc timeout func interface
      mtk-jpegenc: add jpeg encode worker interface
      mtk-jpegenc: add output pic reorder interface
      mtk-jpegenc: add stop cmd interface for jpgenc
      dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
      media: mtk-jpegdec: export jpeg decoder functions
      media: mtk-jpegdec: support jpegdec multi-hardware
      media: mtk-jpegdec: add jpegdec timeout func interface
      media: mtk-jpegdec: add jpeg decode worker interface
      media: mtk-jpegdec: add output pic reorder interface
      media: mtk-jpegdec: refactor jpegdec func interface
      mtk-jpegdec: add stop cmd interface for jpgdec

 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml | 168 ++++++++++++++++++
 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml | 147 ++++++++++++++++
 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml   |   1 +
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml   |   1 +
 drivers/media/platform/mediatek/jpeg/Makefile                        |  14 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c                 | 490 +++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h                 | 169 ++++++++++++++++--
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c               | 315 +++++++++++++++++++++++++++++++---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h               |   6 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h              |   1 +
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c               | 255 ++++++++++++++++++++++++++++
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c                    |   4 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                       | 604 ++++++++++++++++++++++++++++++++++++++++++++++-------------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h                       |  10 +-
 14 files changed, 1928 insertions(+), 257 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
