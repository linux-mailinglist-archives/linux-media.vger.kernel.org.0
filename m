Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D9E7295AB
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 11:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241822AbjFIJlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 05:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241819AbjFIJlc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 05:41:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7C14C2E
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 02:36:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 798F861FFF
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 09:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3223C433EF;
        Fri,  9 Jun 2023 09:35:41 +0000 (UTC)
Message-ID: <9f27c809-f0ff-44d5-1e9f-ea4a369f5a4f@xs4all.nl>
Date:   Fri, 9 Jun 2023 11:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.5] (v2) Add AV1 stateless decoder support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This PR adds support for the AV1 stateless decoder API. The first patch adds the
public API for this, then AV1 support is added to the verisilicon driver, and the
last patch adds support to the mediatek driver.

Many thanks to Collabora and MediaTek for working on this! Much appreciated!

Regards,

	Hans

Change since v1:

Use v11 instead of v10 of the mediatek patch. Somehow the v10 was pushed to my
branch instead of v10. My mistake.

The following changes since commit be9aac187433af6abba5fcc2e73d91d0794ba360:

  Merge tag 'v6.4-rc5' into media_stage (2023-06-09 10:12:41 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5k

for you to fetch changes up to b41f1ab8cf2af459bc71667f32dc75ea8f41c86e:

  media: mediatek: vcodec: support stateless AV1 decoder (2023-06-09 11:19:28 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (12):
      dt-bindings: media: rockchip-vpu: Add rk3588 vpu compatible
      media: AV1: Make sure that bit depth in correctly initialize
      media: Add NV15_4L4 pixel format
      media: verisilicon: Get bit depth for V4L2_PIX_FMT_NV15_4L4
      media: verisilicon: Add AV1 decoder mode and controls
      media: verisilicon: Check AV1 bitstreams bit depth
      media: verisilicon: Compute motion vectors size for AV1 frames
      media: verisilicon: Add AV1 entropy helpers
      media: verisilicon: Add Rockchip AV1 decoder
      media: verisilicon: Add film grain feature to AV1 driver
      media: verisilicon: Enable AV1 decoder on rk3588
      media: verisilicon: Conditionally ignore native formats

Daniel Almeida (1):
      media: Add AV1 uAPI

Nicolas Dufresne (1):
      v4l2-common: Add support for fractional bpp

Xiaoyong Lu (1):
      media: mediatek: vcodec: support stateless AV1 decoder

 Documentation/devicetree/bindings/media/rockchip-vpu.yaml           |    1 +
 Documentation/userspace-api/media/v4l/biblio.rst                    |    9 +
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 1209 ++++++++++-
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst         |   16 +
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst         |   16 +
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst        |   16 +
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst          |   24 +
 Documentation/userspace-api/media/videodev2.h.rst.exceptions        |    4 +
 drivers/media/platform/mediatek/vcodec/Makefile                     |    1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c   |   47 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h             |    1 +
 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c   | 2207 +++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.c                |    4 +
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.h                |    1 +
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c             |   27 +
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h             |    4 +
 drivers/media/platform/verisilicon/Makefile                         |    3 +
 drivers/media/platform/verisilicon/hantro.h                         |    8 +
 drivers/media/platform/verisilicon/hantro_drv.c                     |   68 +-
 drivers/media/platform/verisilicon/hantro_hw.h                      |  102 +
 drivers/media/platform/verisilicon/hantro_postproc.c                |    9 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c                    |   67 +-
 drivers/media/platform/verisilicon/hantro_v4l2.h                    |    8 +-
 drivers/media/platform/verisilicon/rockchip_av1_entropymode.c       | 4424 ++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/verisilicon/rockchip_av1_entropymode.h       |  272 +++
 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c         |  401 ++++
 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h         |   36 +
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c     | 2232 +++++++++++++++++++
 drivers/media/platform/verisilicon/rockchip_vpu981_regs.h           |  477 ++++
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c                |  134 ++
 drivers/media/v4l2-core/v4l2-common.c                               |  158 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c                           |  263 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                           |   61 +
 drivers/media/v4l2-core/v4l2-ioctl.c                                |    2 +
 include/media/v4l2-common.h                                         |    2 +
 include/media/v4l2-ctrls.h                                          |    8 +
 include/uapi/linux/v4l2-controls.h                                  |  721 +++++++
 include/uapi/linux/videodev2.h                                      |   11 +
 38 files changed, 12950 insertions(+), 104 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_entropymode.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_entropymode.h
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
 create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
