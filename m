Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711DF619C5E
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 17:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiKDQAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 12:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbiKDQAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 12:00:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DF8317C6
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 09:00:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 696E6B82C12
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 16:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4114FC433D7;
        Fri,  4 Nov 2022 16:00:01 +0000 (UTC)
Message-ID: <b1edab86-bf05-c675-7235-8242bfd1915c@xs4all.nl>
Date:   Fri, 4 Nov 2022 16:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jammy Huang <jammy_huang@aspeedtech.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Moudy Ho <moudy.ho@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2] Various fixed and enhancements
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

The following changes since commit de547896aac606a00435a219757a940ece142bf0:

  media: vivid.rst: loop_video is set on the capture devnode (2022-10-25 16:43:54 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2e

for you to fetch changes up to d668c0a73e2c1a39ee7046d4e0f49b9f805f804f:

  media: davinci/vpbe: Fix a typo ("defualt_mode") (2022-11-04 16:56:47 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andrzej Pietrasiewicz (1):
      media: rkvdec: Add required padding

Colin Ian King (2):
      media: rkisp1: make const arrays ae_wnd_num and hist_wnd_num static
      media: dvb-core: remove variable n, turn for-loop to while-loop

Jammy Huang (5):
      media: v4l: Add definition for the Aspeed JPEG format
      media: v4l2-ctrls: Reserve controls for ASPEED
      media: Documentation: aspeed-video: Add user documentation for the aspeed-video driver
      media: aspeed: Support aspeed mode to reduce compressed data
      media: aspeed: Extend debug message

Jernej Skrabec (9):
      media: cedrus: remove superfluous call
      media: cedrus: Add format reset helpers
      media: cedrus: use helper to set default formats
      media: cedrus: Add helper for checking capabilities
      media: cedrus: Filter controls based on capability
      media: cedrus: set codec ops immediately
      media: cedrus: Remove cedrus_codec enum
      media: cedrus: prefer untiled capture format
      media: cedrus: initialize controls a bit later

Jonathan Neuschäfer (1):
      media: davinci/vpbe: Fix a typo ("defualt_mode")

Laurent Pinchart (1):
      media: Documentation: Drop deprecated bytesused == 0

Liu Shixin (1):
      media: vivid: fix compose size exceed boundary

Luca Ceresoli (2):
      staging: media: tegra-video: fix chan->mipi value on error
      staging: media: tegra-video: fix device_node use after free

Moudy Ho (4):
      media: platform: mtk-mdp3: extend shared memory structure to 4-byte aligned
      media: platform: mtk-mdp3: fix error handling in mdp_cmdq_send()
      media: platform: mtk-mdp3: fix error handling about components clock_on
      media: platform: mtk-mdp3: fix error handling in mdp_probe()

Takashi Iwai (1):
      media: dvb-core: Fix UAF due to refcount races at releasing

Yang Li (1):
      media: sun6i-csi: Remove unnecessary print function dev_err()

Yang Yingliang (1):
      media: platform: exynos4-is: fix return value check in fimc_md_probe()

 Documentation/userspace-api/media/drivers/aspeed-video.rst |  65 +++++++++++++
 Documentation/userspace-api/media/drivers/index.rst        |   1 +
 Documentation/userspace-api/media/v4l/buffer.rst           |  11 +--
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst  |  17 ++++
 drivers/media/dvb-core/dmxdev.c                            |   8 ++
 drivers/media/dvb-core/dvb_demux.c                         |   4 +-
 drivers/media/platform/aspeed/aspeed-video.c               | 316 ++++++++++++++++++++++++++++++++++++++++++++++++++----------
 drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h         |  76 +++++++--------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c       |  51 +++++-----
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c       |  24 +++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c       |  15 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c     |   4 +-
 drivers/media/platform/samsung/exynos4-is/media-dev.c      |   2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c         |   1 -
 drivers/media/test-drivers/vivid/vivid-vid-cap.c           |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c                       |   1 +
 drivers/staging/media/rkvdec/rkvdec-vp9.c                  |   3 +
 drivers/staging/media/sunxi/cedrus/cedrus.c                |  81 +++++++---------
 drivers/staging/media/sunxi/cedrus/cedrus.h                |  19 ++--
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c            |   4 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c           |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c           |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c             |  18 ++--
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h             |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c          |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c          | 178 ++++++++++++++++++----------------
 drivers/staging/media/sunxi/cedrus/cedrus_video.h          |   2 +
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c            |   2 +-
 drivers/staging/media/tegra-video/csi.c                    |   4 +-
 drivers/staging/media/tegra-video/csi.h                    |   2 +-
 include/media/davinci/vpbe.h                               |   2 +-
 include/uapi/linux/aspeed-video.h                          |  14 +++
 include/uapi/linux/v4l2-controls.h                         |   6 ++
 include/uapi/linux/videodev2.h                             |   1 +
 34 files changed, 641 insertions(+), 300 deletions(-)
 create mode 100644 Documentation/userspace-api/media/drivers/aspeed-video.rst
 create mode 100644 include/uapi/linux/aspeed-video.h
