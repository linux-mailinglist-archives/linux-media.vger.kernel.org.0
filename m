Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07FE04C0DFA
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 09:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238931AbiBWICv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 03:02:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238925AbiBWICu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 03:02:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D72340D3
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 00:02:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2EC96159A
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 08:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64444C340E7;
        Wed, 23 Feb 2022 08:02:19 +0000 (UTC)
Message-ID: <14aa10ce-8a6c-67b2-2129-96c8fd939000@xs4all.nl>
Date:   Wed, 23 Feb 2022 09:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] v2: De-stage imx7-mipi-csis & some fixes
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

Changes since v1:

- Added hantro and seco patches and an imx fix ('csis: Store pads format separately').

Regards,

	Hans

The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18q

for you to fetch changes up to 0bff66dcbe55cd4b13dfe53abad9268e34d48cbf:

  media: cec: seco: Drop pointless include (2022-02-23 08:53:09 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jacopo Mondi (9):
      media: imx: De-stage imx7-mipi-csis
      media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
      media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
      media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
      media: imx: imx-mipi-csis: Add RGB565_1X16
      media: imx: imx-mipi-csis: Add BGR888
      media: imx: imx-mipi-csis: Add output format
      media: imx: imx8mq-mipi-csi2: Remove YUV422 2X8
      media: imx: csis: Store pads format separately

Jernej Skrabec (1):
      media: hantro: sunxi: Fix VP9 steps

Linus Walleij (1):
      media: cec: seco: Drop pointless include

Nicolas Dufresne (3):
      media: v4l2-core: Initialize h264 scaling matrix
      doc: media: Document MM21 tiled format
      doc: media: Document VP9 reference_mode miss-placement

 Documentation/admin-guide/media/imx7.rst                                        |  2 +-
 .../bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml}          |  2 +-
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst             |  7 +++-
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst                       | 15 +++-----
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst                     |  6 ++++
 MAINTAINERS                                                                     |  4 +--
 drivers/media/cec/platform/seco/seco-cec.c                                      |  3 +-
 drivers/media/platform/Kconfig                                                  |  1 +
 drivers/media/platform/Makefile                                                 |  1 +
 drivers/media/platform/imx/Kconfig                                              | 24 +++++++++++++
 drivers/media/platform/imx/Makefile                                             |  1 +
 .../{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c}  | 73 ++++++++++++++++++++++++++++++++++----
 drivers/media/v4l2-core/v4l2-ctrls-core.c                                       | 10 ++++++
 drivers/staging/media/hantro/sunxi_vpu_hw.c                                     |  4 +--
 drivers/staging/media/imx/Makefile                                              |  1 -
 drivers/staging/media/imx/TODO                                                  | 25 +++++++++++++
 drivers/staging/media/imx/imx7-media-csi.c                                      | 32 ++++++++++++++---
 drivers/staging/media/imx/imx8mq-mipi-csi2.c                                    |  7 ++--
 18 files changed, 183 insertions(+), 35 deletions(-)
 rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
 create mode 100644 drivers/media/platform/imx/Kconfig
 create mode 100644 drivers/media/platform/imx/Makefile
 rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (94%)
