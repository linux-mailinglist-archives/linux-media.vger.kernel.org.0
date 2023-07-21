Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CB375C2A5
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 11:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjGUJL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jul 2023 05:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbjGUJLx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jul 2023 05:11:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874C130C0
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 02:11:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 651B461716
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0B0C433C7;
        Fri, 21 Jul 2023 09:10:56 +0000 (UTC)
Message-ID: <5329bd92-f72e-062f-7c2b-af08fd479613@xs4all.nl>
Date:   Fri, 21 Jul 2023 11:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Martin Kepplinger <martink@posteo.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] Various fixes and enhancements
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

The following changes since commit 28999781d15f94046e6c23a9a7d92ad28a436abf:

  media: i2c: ov01a10: Switch back to use struct i2c_driver::probe (2023-07-19 12:57:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6c

for you to fetch changes up to 64eaae1858c2adc4ab30df774ed9b373596d4c05:

  media: pci: saa7164: replace BUG with error return (2023-07-21 10:39:18 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andy Shevchenko (1):
      media: drxk: Use %*ph for printing hexdump of a small buffer

Hans Verkuil (5):
      media: tuners: qt1010: replace BUG_ON with a regular error
      staging: media: sun6i-isp: drop of_match_ptr for ID table
      staging: media: tegra-video: include video.h header
      media: pci: cx23885: replace BUG with error return
      media: pci: saa7164: replace BUG with error return

Martin Kepplinger (1):
      media: imx: Unstage the imx8mq-mipi-csi2 driver

Ming Qian (1):
      MAINTAINERS: update amphion vpu driver entry

Nikolay Kyx (1):
      staging: media: ipu3: code style fix - avoid multiple line dereference

Thomas Zimmermann (1):
      media: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers

Tomi Valkeinen (5):
      media: ti: cal: Clean up mbus formats uses
      media: ti: cal: Fix cal_camerarx_create() error handling
      media: ti: cal: Use subdev state
      media: ti: cal: Implement get_frame_desc for camera-rx
      media: i2c: ds90ub913: Fix a warning about use of uninitialized variable

 MAINTAINERS                                                          |   7 +-
 drivers/media/dvb-frontends/drxk_hard.c                              |  29 +----
 drivers/media/i2c/ds90ub913.c                                        |   2 +-
 drivers/media/pci/cx23885/cx23885-video.c                            |   2 +-
 drivers/media/pci/ivtv/ivtvfb.c                                      |   1 -
 drivers/media/pci/saa7164/saa7164-encoder.c                          |   2 +-
 drivers/media/platform/nxp/Kconfig                                   |  11 ++
 drivers/media/platform/nxp/Makefile                                  |   1 +
 drivers/{staging/media/imx => media/platform/nxp}/imx8mq-mipi-csi2.c |   0
 drivers/media/platform/ti/cal/cal-camerarx.c                         | 206 +++++++++++++--------------------
 drivers/media/platform/ti/cal/cal-video.c                            |  23 +++-
 drivers/media/platform/ti/cal/cal.c                                  |  66 +++--------
 drivers/media/platform/ti/cal/cal.h                                  |  10 --
 drivers/media/test-drivers/vivid/vivid-osd.c                         |   1 -
 drivers/media/tuners/qt1010.c                                        |  11 +-
 drivers/staging/media/imx/Kconfig                                    |  10 --
 drivers/staging/media/imx/Makefile                                   |   2 -
 drivers/staging/media/ipu3/ipu3-css.c                                |  14 +--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c                    |   2 +-
 drivers/staging/media/tegra-video/vip.c                              |   1 +
 20 files changed, 154 insertions(+), 247 deletions(-)
 rename drivers/{staging/media/imx => media/platform/nxp}/imx8mq-mipi-csi2.c (100%)
