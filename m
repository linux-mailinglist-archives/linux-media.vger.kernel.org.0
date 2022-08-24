Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010DD59FC32
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 15:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238653AbiHXNsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 09:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238840AbiHXNrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 09:47:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BD798A4A
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 06:42:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1AD2B824C5
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 13:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD29C433D6;
        Wed, 24 Aug 2022 13:42:45 +0000 (UTC)
Message-ID: <f1ae8660-9482-cc2b-5b89-06875b72a512@xs4all.nl>
Date:   Wed, 24 Aug 2022 15:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= 
        <Yunfei.Dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] ti/cal fixes and mediatek/vcodec
 fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


The following changes since commit 1ff8334f0a4e0be693066aafba195d25629d77aa:

  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver (2022-08-21 08:42:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1h

for you to fetch changes up to 07719bcac6cf233300f97f237c3531128faf1a9e:

  media: mediatek: vcodec: Skip non CBR bitrate mode (2022-08-24 15:27:45 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hirokazu Honda (1):
      media: mediatek: vcodec: Skip non CBR bitrate mode

Irui Wang (6):
      media: mediatek: vcodec: Add encoder driver support for 34-bit iova
      dt-bindings: media: mediatek: vcodec: Add encoder dt-bindings for mt8188
      media: mediatek: vcodec: Add mt8188 encoder driver
      media: mediatek: vcodec: Remove encoder driver get IRQ resource
      media: mediatek: vcodec: Fix bitstream crop information error
      media: mediatek: vcodec: Use ctx vb2_queue mutex instead of device mutex

Tomi Valkeinen (5):
      media: ti: cal: fix useless variable init
      media: ti: cal: rename sd_state to state
      media: ti: cal: use CSI-2 frame number for seq number
      media: ti: cal: combine wdma irq handling
      media: ti: cal: fix wdma irq for metadata

Yunfei Dong (3):
      dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for mt8188
      media: mediatek: vcodec: add decoder compatible to support mt8188
      media: mediatek: vcodec: Add mt8188 encoder's chip name

 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml        |   1 +
 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml |   1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c                     |   2 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c                 |   4 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h                     |   6 ++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c                     |  19 ++--
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c                 |  22 ++--
 drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c                  | 200 +++++++++++++++++++++++++++++------
 drivers/media/platform/mediatek/vcodec/venc_ipi_msg.h                       |  24 +++++
 drivers/media/platform/mediatek/vcodec/venc_vpu_if.c                        |  76 ++++++++++++-
 drivers/media/platform/ti/cal/cal-camerarx.c                                |  31 +++---
 drivers/media/platform/ti/cal/cal-video.c                                   |   5 +-
 drivers/media/platform/ti/cal/cal.c                                         | 139 +++++++++++++++++-------
 drivers/media/platform/ti/cal/cal.h                                         |   7 +-
 14 files changed, 430 insertions(+), 107 deletions(-)
