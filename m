Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA0575CAD6
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 17:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjGUPAU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jul 2023 11:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjGUPAT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jul 2023 11:00:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D712E19B6
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 08:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7556D61CD5
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59EBC433C8;
        Fri, 21 Jul 2023 15:00:15 +0000 (UTC)
Message-ID: <af0772c6-7052-ce13-dbf3-d403b06aad02@xs4all.nl>
Date:   Fri, 21 Jul 2023 17:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Irui Wang <irui.wang@mediatek.com>,
        Mingjia Zhang <mingjia.zhang@mediatek.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] Various vcodec fixes and enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 28999781d15f94046e6c23a9a7d92ad28a436abf:

  media: i2c: ov01a10: Switch back to use struct i2c_driver::probe (2023-07-19 12:57:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6g

for you to fetch changes up to c0f7b945ab6c5224a17aeeb08acee8d825472e49:

  media: mediatek: vcodec: Add capture format to support 10bit raster mode (2023-07-21 16:56:51 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dan Carpenter (4):
      media: mediatek: vcodec: fix potential double free
      media: mediatek: vcodec: fix resource leaks in vdec_msg_queue_init()
      media: mediatek: vcodec: Fix potential crash in mtk_vcodec_dbgfs_remove()
      media: mediatek: vcodec: Improve an error message

Irui Wang (1):
      media: mediatek: vcodec: Return NULL if no vdec_fb is found

Mingjia Zhang (2):
      media: mediatek: vcodec: Add capture format to support 10bit tile mode
      media: mediatek: vcodec: Add capture format to support 10bit raster mode

Nícolas F. R. A. Prado (5):
      media: dt-bindings: mediatek,vcodec: Allow single clock for mt8183
      media: dt-bindings: mediatek,vcodec: Don't require assigned-clocks
      media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS register space
      media: mediatek: vcodec: Define address for VDEC_HW_ACTIVE
      media: mediatek: vcodec: Read HW active status from syscon

Xiaoyong Lu (1):
      media: mediatek: vcodec: fix AV1 decode fail for 36bit iova

 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml | 67 ++++++++++++++++++++++-------
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst            | 15 +++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c            | 13 +++---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c          | 77 +++++++++++++++++++++++++++++-----
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c           |  4 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h           |  3 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h              |  2 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c             | 15 +++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h             |  2 +
 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c    | 12 ++++--
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c            | 10 ++---
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c            |  5 ++-
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c              |  6 ++-
 drivers/media/v4l2-core/v4l2-common.c                                |  4 ++
 drivers/media/v4l2-core/v4l2-ioctl.c                                 |  2 +
 include/uapi/linux/videodev2.h                                       |  2 +
 16 files changed, 187 insertions(+), 52 deletions(-)
