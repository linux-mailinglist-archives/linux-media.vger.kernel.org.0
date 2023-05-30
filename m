Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2136B715BF8
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 12:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjE3Kk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 06:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjE3KkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 06:40:24 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496908F
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:40:23 -0700 (PDT)
X-KPN-MessageId: 60686fa7-fed6-11ed-889d-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 60686fa7-fed6-11ed-889d-005056abbe64;
        Tue, 30 May 2023 12:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=tcG2bdzOKf63d/9WjqVRxY8Wju3tAgvEE3hHo+p2jQg=;
        b=VKcKtf1YYGkR9XSIWEOCuw+oKE+2FQpg/MhY5Jd+ao9wODVl6hW5/l8Eg9v8X5V27YK0rHEnnUoAS
         ck9ACVXKEyTrYf5d9hEoBe+XffPtrBd99fDhsis5Fs3Wgn7I9bkEPcWtbEIcuYkTMMoEQ2whtKG5Fa
         vmE/qghozAtDzbo2NjdJzTKn5EMk2/xa7wt0+2ZkF51CkXFdXU/rt5rGaf6a4B/72VfBF1P5yDMizV
         ZjyXD/zly79oNkXswE7DAZzoSbA+7mE6dH3i5Lf52VaSHymK21/mVAzny02zkVPz2CJdOuRE9MeOkh
         gkOCnWT0ArOkC/EMg7wgsSpHJUjybnQ==
X-KPN-MID: 33|e92WvISQ1xmEBjENfKZBvhYoefsW7opmiA1a94WosoF7DDsSjBIediy1JjXdIfa
 mVDcc55cbs7E31bzv4nJDyivaed6p70QQeZCbV3v+Pok=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|1PGKFjey8Az12vHtDjoDokUdG/vrGLkdx21UnWT25qs/ez1YnkNMghHpcYKLTra
 QspJxGYNUgasI9NXMYCzCKQ==
X-Originating-IP: 173.38.220.44
Received: from [10.47.77.214] (unknown [173.38.220.44])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 600c18e7-fed6-11ed-b2e8-005056ab7584;
        Tue, 30 May 2023 12:40:21 +0200 (CEST)
Message-ID: <52a82b66-a068-80eb-9e40-d4c61cb0272d@xs4all.nl>
Date:   Tue, 30 May 2023 12:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.5] Add AV1 stateless decoder support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

The following changes since commit aafeeaf3d2a8a91a5407c774c578abec79dcff00:

  media: video-mux: update driver to active state (2023-05-26 10:58:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5c

for you to fetch changes up to d50739a417aba71e47bc48598d920ec692e1c6a8:

  media: mediatek: vcodec: support stateless AV1 decoder (2023-05-26 12:58:12 +0200)

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
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 1209 +++++++++++++++++++++++-
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst         |   16 +
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst         |   16 +
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst        |   16 +
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst          |   24 +
 Documentation/userspace-api/media/videodev2.h.rst.exceptions        |    4 +
 drivers/media/platform/mediatek/vcodec/Makefile                     |    1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c   |   42 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h             |    1 +
 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c   | 2207 +++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.c                |    4 +
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.h                |    1 +
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c             |   27 +
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h             |    4 +
 drivers/media/platform/verisilicon/Makefile                         |    3 +
 drivers/media/platform/verisilicon/hantro.h                         |    8 +
 drivers/media/platform/verisilicon/hantro_drv.c                     |   68 +-
 drivers/media/platform/verisilicon/hantro_hw.h                      |  102 ++
 drivers/media/platform/verisilicon/hantro_postproc.c                |    9 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c                    |   67 +-
 drivers/media/platform/verisilicon/hantro_v4l2.h                    |    8 +-
 drivers/media/platform/verisilicon/rockchip_av1_entropymode.c       | 4424 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/verisilicon/rockchip_av1_entropymode.h       |  272 ++++++
 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c         |  401 ++++++++
 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h         |   36 +
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c     | 2232 +++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/verisilicon/rockchip_vpu981_regs.h           |  477 ++++++++++
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c                |  134 +++
 drivers/media/v4l2-core/v4l2-common.c                               |  158 ++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c                           |  263 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                           |   61 ++
 drivers/media/v4l2-core/v4l2-ioctl.c                                |    2 +
 include/media/v4l2-common.h                                         |    2 +
 include/media/v4l2-ctrls.h                                          |    8 +
 include/uapi/linux/v4l2-controls.h                                  |  721 ++++++++++++++
 include/uapi/linux/videodev2.h                                      |   11 +
 38 files changed, 12946 insertions(+), 103 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_entropymode.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_entropymode.h
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
 create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
