Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B052A637CFF
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 16:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiKXP27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 10:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiKXP26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 10:28:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18E3BE85F
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 07:28:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6F731B8284C
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 15:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D46C433D6;
        Thu, 24 Nov 2022 15:28:53 +0000 (UTC)
Message-ID: <51f9534a-7bf7-ba8c-2401-1770a79d6c25@xs4all.nl>
Date:   Thu, 24 Nov 2022 16:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ming Qian <ming.qian@nxp.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Yunfei Dong <yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2] Various fixes and enhancements
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

The following changes since commit b9fbe29c59065c24df9e9fb3153db36403d45e2d:

  Merge tag 'br-v6.2d' of git://linuxtv.org/hverkuil/media_tree into media_stage (2022-11-15 12:11:46 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2h

for you to fetch changes up to debeddab26adefb61c767aa2f1de5ea2d326ba0f:

  media: s5p-mfc: Add variant data for MFC v7 hardware for Exynos 3250 SoC (2022-11-24 14:23:44 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aakarsh Jain (2):
      media: dt-bindings: s5p-mfc: Add new compatible string for Exynos3250 SoC
      media: s5p-mfc: Add variant data for MFC v7 hardware for Exynos 3250 SoC

Deming Wang (1):
      media: vivid.rst: fix TV and S-Video Inputs section

Irui Wang (1):
      dt-bindings: mediatek: vcodec: Add the platform compatible to schema

Ming Qian (7):
      media: add nv12_8l128 and nv12_10be_8l128 video format.
      media: amphion: tell and handle contiguous and non contiguous format
      media: amphion: decoder add support for contiguous planes
      media: amphion: encoder add support for contiguous planes
      media: amphion: try to wakeup vpu core to avoid failure
      media: amphion: cancel vpu before release instance
      media: amphion: lock and check m2m_ctx in event handler

Niklas Söderlund (3):
      media: rcar-vin: Do not cache remote rectangle
      media: rcar-vin: Store scaler in a function pointer
      media: rcar-vin: Add support for Gen3 UDS (Up Down Scaler)

Paul Kocialkowski (4):
      media: sun6i-mipi-csi2: Require both pads to be connected for streaming
      media: sun8i-a83t-mipi-csi2: Require both pads to be connected for streaming
      media: sun6i-mipi-csi2: Register async subdev with no sensor attached
      media: sun8i-a83t-mipi-csi2: Register async subdev with no sensor attached

Peter Robinson (1):
      Add dependency on ARCH_ASPEED

Xiu Jianfeng (1):
      media: v4l: Use memset_after() helper

Yunfei Dong (5):
      media: mediatek: vcodec: Fix getting NULL pointer for dst buffer
      media: mediatek: vcodec: Can't set dst buffer to done when lat decode error
      media: mediatek: vcodec: Fix h264 set lat buffer error
      media: mediatek: vcodec: Setting lat buf to lat_list when lat decode error
      media: mediatek: vcodec: Core thread depends on core_list

 Documentation/admin-guide/media/vivid.rst                                |   2 +-
 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml     |  12 ++-
 Documentation/devicetree/bindings/media/s5p-mfc.txt                      |  10 ++-
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst              |   8 ++
 drivers/media/platform/amphion/vdec.c                                    | 203 ++++++++++++++++++++++++++--------------------
 drivers/media/platform/amphion/venc.c                                    |  41 +++++-----
 drivers/media/platform/amphion/vpu.h                                     |   5 +-
 drivers/media/platform/amphion/vpu_cmds.c                                |  39 ++++++++-
 drivers/media/platform/amphion/vpu_dbg.c                                 |   8 +-
 drivers/media/platform/amphion/vpu_helpers.c                             |  45 ++++++++--
 drivers/media/platform/amphion/vpu_helpers.h                             |   2 +
 drivers/media/platform/amphion/vpu_malone.c                              |   4 +-
 drivers/media/platform/amphion/vpu_msgs.c                                |   2 +
 drivers/media/platform/amphion/vpu_v4l2.c                                | 188 +++++++++++++++++++++++++++++++-----------
 drivers/media/platform/amphion/vpu_v4l2.h                                |   3 +-
 drivers/media/platform/amphion/vpu_windsor.c                             |   9 +-
 drivers/media/platform/aspeed/Kconfig                                    |   1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c        |  13 +--
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c     |  28 ++++---
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c        |  15 ++--
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c                  |   2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c                      |  22 ++++-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c                       | 104 +++++++++++++++++++++---
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c                      |  93 ++++++++++++++++-----
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h                       |   9 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                         |  17 +++-
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c           |  23 ++++--
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c |  23 ++++--
 drivers/media/v4l2-core/v4l2-ioctl.c                                     |  86 ++++++++++----------
 include/uapi/linux/videodev2.h                                           |   2 +
 30 files changed, 721 insertions(+), 298 deletions(-)
