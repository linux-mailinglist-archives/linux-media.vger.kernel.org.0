Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9A95B05EF
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 16:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiIGOBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 10:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIGOBE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 10:01:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2D0B1CF
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 07:01:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B7DF61910
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 14:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2415C43470;
        Wed,  7 Sep 2022 14:00:59 +0000 (UTC)
Message-ID: <ba7d0c31-f020-18fa-aee7-6f1fec85f85a@xs4all.nl>
Date:   Wed, 7 Sep 2022 16:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] media: sunxi rework, part 1
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

This contains the RESET_CONTROLLER series:

https://patchwork.linuxtv.org/project/linux-media/cover/20220825102035.419087-1-paul.kocialkowski@bootlin.com/

and patches 1-15 of the CSI rework series:

https://patchwork.linuxtv.org/project/linux-media/cover/20220826183240.604834-1-paul.kocialkowski@bootlin.com/

Regards,

	Hans

The following changes since commit fbb6c848dd89786fe24856ee6b5e773910ded29c:

  media: destage Hantro VPU driver (2022-08-31 10:23:50 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1o

for you to fetch changes up to eabad214e8820ba2ea0cb8a85a9dbd97d35dc16b:

  media: sun6i-csi: Move csi buffer definition to main header file (2022-09-07 15:42:37 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Paul Kocialkowski (22):
      media: sun6i-mipi-csi2: Add a Kconfig dependency on RESET_CONTROLLER
      media: sun8i-a83t-mipi-csi2: Add a Kconfig dependency on RESET_CONTROLLER
      media: sun6i-csi: Add a Kconfig dependency on RESET_CONTROLLER
      media: sun4i-csi: Add a Kconfig dependency on RESET_CONTROLLER
      media: sun8i-di: Add a Kconfig dependency on RESET_CONTROLLER
      media: sun8i-rotate: Add a Kconfig dependency on RESET_CONTROLLER
      media: cedrus: Add a Kconfig dependency on RESET_CONTROLLER
      media: sun6i-csi: Define and use driver name and (reworked) description
      media: sun6i-csi: Refactor main driver data structures
      media: sun6i-csi: Tidy up platform code
      media: sun6i-csi: Always set exclusive module clock rate
      media: sun6i-csi: Define and use variant to get module clock rate
      media: sun6i-csi: Use runtime pm for clocks and reset
      media: sun6i-csi: Tidy up Kconfig
      media: sun6i-csi: Tidy up v4l2 code
      media: sun6i-csi: Tidy up video code
      media: sun6i-csi: Pass and store csi device directly in video code
      media: sun6i-csi: Register the media device after creation
      media: sun6i-csi: Remove controls handler from the driver
      media: sun6i-csi: Add media ops with link notify callback
      media: sun6i-csi: Introduce and use video helper functions
      media: sun6i-csi: Move csi buffer definition to main header file

 drivers/media/platform/sunxi/sun4i-csi/Kconfig            |   2 +-
 drivers/media/platform/sunxi/sun6i-csi/Kconfig            |  12 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c        | 592 ++++++++++++++++++++++++++++++++++++-------------------------
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h        |  64 +++++--
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c      | 592 +++++++++++++++++++++++++++++++++----------------------------
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h      |  23 ++-
 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig      |   2 +-
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig |   2 +-
 drivers/media/platform/sunxi/sun8i-di/Kconfig             |   2 +-
 drivers/media/platform/sunxi/sun8i-rotate/Kconfig         |   2 +-
 drivers/staging/media/sunxi/cedrus/Kconfig                |   1 +
 11 files changed, 735 insertions(+), 559 deletions(-)
