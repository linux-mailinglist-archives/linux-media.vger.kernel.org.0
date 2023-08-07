Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2253877253F
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 15:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjHGNQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 09:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbjHGNQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 09:16:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CBDB3
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 06:16:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2CC8D619EC
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 13:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EAFC433C8
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 13:16:16 +0000 (UTC)
Message-ID: <7e90c37e-f11d-90b6-e51d-daade4c15f4b@xs4all.nl>
Date:   Mon, 7 Aug 2023 15:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] Various fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit a0e657a03ffbd26332f316f13c3e5dbc98cb1fca:

  media: mediatek: vcodec: Fix possible invalid memory access for encoder (2023-08-03 08:45:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6j

for you to fetch changes up to a6b6575d4e520bcfb3c7073c0da73a8a86d7f2ed:

  media: firewire: firedtv-avc.c: replace BUG with proper, error return (2023-08-07 15:07:04 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alain Volmat (2):
      media: i2c: st_mipid02: cascade s_stream call to the source subdev
      media: stm32: dcmi: only call s_stream on the source subdev

Hans Verkuil (2):
      media: usb: pvrusb2: fix inconsistent indenting
      media: firewire: firedtv-avc.c: replace BUG with proper, error return

Krzysztof Kozlowski (1):
      media: dt-bindings: drop unneeded status from examples

Mariusz Bialonczyk (1):
      media: cx23885: debug cosmetics

Paul Kocialkowski (3):
      media: doc: dev-encoder: Fixup whitespace before bold asterisks
      media: doc: codec: Rename "Return fields" to "Returned fields" for consistency
      media: doc: dev-encoder: Fixup type for ENUM_FRAMEINTERVALS

Peng Fan (1):
      dt-bindings: media: amphion,vpu: correct node name

Ruan Jinjie (4):
      media: jpeg-core: Remove redundant dev_err()
      media: rcar_jpu: Remove redundant dev_err()
      media: nxp: Remove redundant dev_err()
      media: tegra_cec: fix the return value handle for platform_get_irq()

Yuanjun Gong (1):
      media: dvb: mb86a16: check the return value of mb86a16_read()

 Documentation/devicetree/bindings/media/amphion,vpu.yaml             |  8 ++++----
 Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml |  1 -
 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml       |  1 -
 Documentation/userspace-api/media/v4l/dev-decoder.rst                | 16 +++++++--------
 Documentation/userspace-api/media/v4l/dev-encoder.rst                | 24 +++++++++++-----------
 Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst      |  4 ++--
 drivers/media/cec/platform/tegra/tegra_cec.c                         |  4 ++--
 drivers/media/dvb-frontends/mb86a16.c                                | 10 +++++----
 drivers/media/firewire/firedtv-avc.c                                 |  4 +++-
 drivers/media/i2c/st-mipid02.c                                       | 13 +++++++++++-
 drivers/media/pci/cx23885/cx23885-core.c                             |  6 +++---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                       |  1 -
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c                  |  1 -
 drivers/media/platform/renesas/rcar_jpu.c                            |  4 +---
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c                  |  4 +---
 drivers/media/platform/st/stm32/stm32-dcmi.c                         | 63 +++++++++++++--------------------------------------------
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c                              |  6 ++++--
 17 files changed, 72 insertions(+), 98 deletions(-)
