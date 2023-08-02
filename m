Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE69176D250
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 17:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbjHBPlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 11:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbjHBPlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 11:41:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFAD103
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 08:41:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1ECD961A0C
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 15:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0841C433C8;
        Wed,  2 Aug 2023 15:41:16 +0000 (UTC)
Message-ID: <970c5f07-f18b-cb0d-0f5d-49c69b2e070e@xs4all.nl>
Date:   Wed, 2 Aug 2023 17:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Mingjia Zhang <mingjia.zhang@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] mediatek vcodec rework and add 10 bit support
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

The following changes since commit 4fa89c318e5b93f784ca85f92e245bbf7b5749db:

  media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler warning (2023-08-01 12:12:35 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6h

for you to fetch changes up to 98eb892dc0513d8018d5df6bccd1923e47949892:

  media: mediatek: vcodec: Fix possible invalid memory access for encoder (2023-08-02 17:04:14 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Mingjia Zhang (3):
      media: mediatek: vcodec: Add capture format to support 10bit tile mode
      media: mediatek: vcodec: Add capture format to support 10bit raster mode
      media: mediatek: vcodec: Add driver to support 10bit

Yunfei Dong (13):
      media: mediatek: vcodec: remove unused parameter
      media: mediatek: vcodec: align fw interface
      media: mediatek: vcodec: Removing struct 'mtk_vcodec_ctx/dev' for shared interface
      media: mediatek: vcodec: Removing useless debug log
      media: mediatek: vcodec: remove the dependency of vcodec debug log
      media: mediatek: vcodec: replace pr_* with dev_* for v4l2 debug message
      media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'
      media: mediatek: vcodec: separate struct mtk_vcodec_dev
      media: mediatek: vcodec: fix unreasonable parameter definition and style
      media: mediatek: vcodec: remove unused include header
      media: mediatek: vcodec: separate decoder and encoder
      media: mediatek: vcodec: Fix possible invalid memory access for decoder
      media: mediatek: vcodec: Fix possible invalid memory access for encoder

 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst                          |  13 +
 drivers/media/platform/mediatek/vcodec/Makefile                                    |  55 +----
 drivers/media/platform/mediatek/vcodec/common/Makefile                             |  21 ++
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h                 | 147 +++++++++++
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_dbgfs.c             |  55 +++--
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_dbgfs.h             |  24 +-
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw.c                |  21 +-
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw.h                |   8 +-
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_priv.h           |  14 +-
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_scp.c            |  26 +-
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_vpu.c            |  72 ++++--
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c                    |  68 ++++++
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_intr.h              |   6 +-
 drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_util.c              |  71 +++---
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h                    |  75 ++++++
 drivers/media/platform/mediatek/vcodec/decoder/Makefile                            |  25 ++
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec.c              | 204 ++++++++--------
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec.h              |  10 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_drv.c          |  87 +++----
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h                | 324 +++++++++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_hw.c           |  19 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_hw.h           |   6 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_pm.c           |  38 ++-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_pm.h           |   6 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_stateful.c     | 176 +++++++-------
 drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_stateless.c    | 235 ++++++++++++++----
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_av1_req_lat_if.c    | 158 ++++++------
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_if.c           |  79 +++---
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_common.c   |   4 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_common.h   |   6 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_if.c       |  75 +++---
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_multi_if.c | 155 ++++++------
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_hevc_req_multi_if.c | 129 +++++-----
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp8_if.c            |  70 +++---
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp8_req_if.c        |  81 +++----
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp9_if.c            | 132 +++++-----
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp9_req_lat_if.c    | 129 +++++-----
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_base.h               |   2 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_if.c                 |  12 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_if.h                 |  10 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_ipi_msg.h                |   0
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_msg_queue.c              |  64 +++--
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_msg_queue.h              |  14 +-
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_vpu_if.c                 | 138 ++++++-----
 drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_vpu_if.h                 |   6 +-
 drivers/media/platform/mediatek/vcodec/encoder/Makefile                            |  11 +
 drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc.c              | 296 ++++++++++-------------
 drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc.h              |  12 +-
 drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_drv.c          |  73 +++---
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h                | 248 +++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_pm.c           |  12 +-
 drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_pm.h           |   4 +-
 drivers/media/platform/mediatek/vcodec/{ => encoder}/venc/venc_h264_if.c           | 110 ++++-----
 drivers/media/platform/mediatek/vcodec/{ => encoder}/venc/venc_vp8_if.c            |  69 ++----
 drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_base.h               |   4 +-
 drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_if.c                 |  10 +-
 drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_if.h                 |  11 +-
 drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_ipi_msg.h                |   0
 drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_vpu_if.c                 | 110 +++++----
 drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_vpu_if.h                 |   3 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h                            | 550 ------------------------------------------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c                           |  43 ----
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h                           |  85 -------
 drivers/media/v4l2-core/v4l2-common.c                                              |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c                                               |   2 +
 include/uapi/linux/videodev2.h                                                     |   2 +
 66 files changed, 2503 insertions(+), 2226 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/Makefile
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_dbgfs.c (77%)
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_dbgfs.h (62%)
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw.c (75%)
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw.h (86%)
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_priv.h (75%)
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_scp.c (70%)
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_vpu.c (58%)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_intr.h (68%)
 rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_util.c (56%)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/Makefile
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec.c (82%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec.h (91%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_drv.c (84%)
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_hw.c (91%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_hw.h (92%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_pm.c (81%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_pm.h (61%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_stateful.c (73%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_stateless.c (67%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_av1_req_lat_if.c (93%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_if.c (84%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_common.c (98%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_common.h (97%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_if.c (86%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_multi_if.c (85%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_hevc_req_multi_if.c (90%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp8_if.c (88%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp8_req_if.c (81%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp9_if.c (87%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp9_req_lat_if.c (94%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_base.h (95%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_if.c (86%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_if.h (89%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_ipi_msg.h (100%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_msg_queue.c (82%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_msg_queue.h (95%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_vpu_if.c (67%)
 rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_vpu_if.h (97%)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/Makefile
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc.c (82%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc.h (78%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_drv.c (86%)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_pm.c (83%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_pm.h (78%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc/venc_h264_if.c (88%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc/venc_vp8_if.c (88%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_base.h (94%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_if.c (86%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_if.h (94%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_ipi_msg.h (100%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_vpu_if.c (75%)
 rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_vpu_if.h (96%)
 delete mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
 delete mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c
 delete mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
