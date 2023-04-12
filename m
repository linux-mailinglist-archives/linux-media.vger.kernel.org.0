Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEEC6DF969
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 17:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjDLPMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 11:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjDLPMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 11:12:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19922729F
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 08:12:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A197D62D19
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 15:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9399CC433EF;
        Wed, 12 Apr 2023 15:12:45 +0000 (UTC)
Message-ID: <a344c5ac-f6d4-a478-977a-b6457bdc4595@xs4all.nl>
Date:   Wed, 12 Apr 2023 17:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] Various fixes
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e18a7e9a2d34a32482e4069fcedf30a7bc9e9ef5:

  media: Use designated initializers for all subdev pad ops (2023-04-12 09:46:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4n

for you to fetch changes up to 03501c0d80dd688a5ce0d66501cb86fb7311b89a:

  media: dt-bindings: media: renesas,vsp1: Document RZ/V2L VSPD bindings (2023-04-12 16:56:32 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Biju Das (2):
      media: dt-bindings: media: renesas,fcp: Document RZ/{G2L,V2L} FCPVD bindings
      media: dt-bindings: media: renesas,vsp1: Document RZ/V2L VSPD bindings

Irui Wang (1):
      media: mediatek: vcodec: Coverity issues in encoder driver

Niklas Söderlund (3):
      media: dt-bindings: media: renesas,isp: Add binding for V4H
      media: dt-bindings: media: renesas,csi2: Add binding for V4H
      media: dt-bindings: media: renesas,vin: Add binding for V4H

Uwe Kleine-König (11):
      staging: media: atmel-sama5d2-isc: Convert to platform remove callback returning void
      staging: media: atmel-sama7g5-isc: Convert to platform remove callback returning void
      staging: media: imx-media-csi: Convert to platform remove callback returning void
      staging: media: imx-media-dev: Convert to platform remove callback returning void
      staging: media: imx6-mipi-csi2: Convert to platform remove callback returning void
      staging: media: imx8mq-mipi-csi2: Convert to platform remove callback returning void
      staging: media: meson: vdec: Convert to platform remove callback returning void
      staging: media: omap4iss: Convert to platform remove callback returning void
      staging: media: rkvdec: Convert to platform remove callback returning void
      staging: media: sunxi: cedrus: Convert to platform remove callback returning void
      staging: media: sun6i-isp: Convert to platform remove callback returning void

Wei Chen (1):
      media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup

Ye Xingchen (1):
      media: hantro: use devm_reset_control_array_get_optional_exclusive()

Yunfei Dong (2):
      media: mediatek: vcodec: fix decoder disable pm crash
      media: mediatek: vcodec: add remove function for decoder platform driver

 Documentation/devicetree/bindings/media/renesas,csi2.yaml   |  1 +
 Documentation/devicetree/bindings/media/renesas,fcp.yaml    | 45 ++++++++++++++++++++++++++++++++++++++++-----
 Documentation/devicetree/bindings/media/renesas,isp.yaml    |  1 +
 Documentation/devicetree/bindings/media/renesas,vin.yaml    |  1 +
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml   | 13 +++++++++----
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c     |  7 +++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c |  3 ++-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c  |  8 ++++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c     |  2 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c | 16 ++++++++++++----
 drivers/media/platform/verisilicon/hantro_drv.c             |  2 +-
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c  |  6 ++----
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c  |  6 ++----
 drivers/staging/media/imx/imx-media-csi.c                   |  6 ++----
 drivers/staging/media/imx/imx-media-dev.c                   |  6 ++----
 drivers/staging/media/imx/imx6-mipi-csi2.c                  |  6 ++----
 drivers/staging/media/imx/imx8mq-mipi-csi2.c                |  6 ++----
 drivers/staging/media/meson/vdec/vdec.c                     |  6 ++----
 drivers/staging/media/omap4iss/iss.c                        |  6 ++----
 drivers/staging/media/rkvdec/rkvdec.c                       |  5 ++---
 drivers/staging/media/sunxi/cedrus/cedrus.c                 |  6 ++----
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c           |  6 ++----
 22 files changed, 105 insertions(+), 59 deletions(-)
