Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB274BFDDF
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 16:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233802AbiBVP5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 10:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbiBVP5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 10:57:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A67E0C3
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 07:57:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9ED92616EB
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 15:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC94C340E8;
        Tue, 22 Feb 2022 15:57:11 +0000 (UTC)
Message-ID: <234e557c-69b9-b4fe-44c4-7995739cd6ed@xs4all.nl>
Date:   Tue, 22 Feb 2022 16:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] De-stage imx7-mipi-csis & some fixes
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

The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18q

for you to fetch changes up to d889819d68088a5c02e0d51625fead9b18902795:

  doc: media: Document VP9 reference_mode miss-placement (2022-02-22 16:51:35 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jacopo Mondi (8):
      media: imx: De-stage imx7-mipi-csis
      media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
      media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
      media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
      media: imx: imx-mipi-csis: Add RGB565_1X16
      media: imx: imx-mipi-csis: Add BGR888
      media: imx: imx-mipi-csis: Add output format
      media: imx: imx8mq-mipi-csi2: Remove YUV422 2X8

Nicolas Dufresne (3):
      media: v4l2-core: Initialize h264 scaling matrix
      doc: media: Document MM21 tiled format
      doc: media: Document VP9 reference_mode miss-placement

 Documentation/admin-guide/media/imx7.rst                                                  |  2 +-
 .../devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml}         |  2 +-
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst                       |  7 ++++-
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst                                 | 15 +++-------
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst                               |  6 ++++
 MAINTAINERS                                                                               |  4 +--
 drivers/media/platform/Kconfig                                                            |  1 +
 drivers/media/platform/Makefile                                                           |  1 +
 drivers/media/platform/imx/Kconfig                                                        | 24 ++++++++++++++++
 drivers/media/platform/imx/Makefile                                                       |  1 +
 drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c}        | 67 ++++++++++++++++++++++++++++++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c                                                 | 10 +++++++
 drivers/staging/media/imx/Makefile                                                        |  1 -
 drivers/staging/media/imx/TODO                                                            | 25 +++++++++++++++++
 drivers/staging/media/imx/imx7-media-csi.c                                                | 32 +++++++++++++++++++---
 drivers/staging/media/imx/imx8mq-mipi-csi2.c                                              |  7 +++--
 16 files changed, 177 insertions(+), 28 deletions(-)
 rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
 create mode 100644 drivers/media/platform/imx/Kconfig
 create mode 100644 drivers/media/platform/imx/Makefile
 rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (94%)
