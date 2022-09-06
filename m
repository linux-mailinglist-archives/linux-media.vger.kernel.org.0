Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72AAE5AE620
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 13:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239148AbiIFLCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 07:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiIFLCy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 07:02:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1F412ADF
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 04:02:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E27A9614AD
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 11:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE5EC433D7
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 11:02:50 +0000 (UTC)
Message-ID: <ec5af138-c27a-f58c-5efa-98742a001949@xs4all.nl>
Date:   Tue, 6 Sep 2022 13:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] Various fixes
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

The following changes since commit fbb6c848dd89786fe24856ee6b5e773910ded29c:

  media: destage Hantro VPU driver (2022-08-31 10:23:50 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1l

for you to fetch changes up to 63f23fdcdf69bb920bd69cd00a9563d780ae382e:

  meson: vdec: fix possible refcount leak in vdec_probe() (2022-09-06 13:00:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dan Carpenter (1):
      media: platform: mtk-mdp3: fix error code in mdp_vpu_dev_init()

Daniel Lundberg Pedersen (1):
      media: docs: libv4l-introduction.rst: Fix function signature and link

Hangyu Hua (1):
      meson: vdec: fix possible refcount leak in vdec_probe()

Hans Verkuil (5):
      s5p_cec: limit msg.len to CEC_MAX_MSG_SIZE
      cros-ec-cec: limit msg.len to CEC_MAX_MSG_SIZE
      v4l2-ctrls: drop 'elems' argument from control type ops.
      dvb-frontends/drxk: initialize err to 0
      media: cec: add support for Absolute Volume Control

Jilin Yuan (3):
      usb/msi2500: fix repeated words in comments
      usb/dvb-usb-v2: fix repeated words in comments
      pci/cx18: fix repeated words in comments

Linus Walleij (2):
      media: i2c: isl7998x: Use right include
      media: si4713: Use the right include

Lukas Bulwahn (2):
      media: MAINTAINERS: adjust entry to zoran driver movement
      media: MAINTAINERS: rectify entry in SAA7146 VIDEO4LINUX-2 DRIVER

Ming Qian (1):
      media: amphion: release m2m ctx when releasing vpu instance

Moudy Ho (1):
      media: platform: mtk-mdp3: add pointer checks and use devm_kfree

Philipp Zabel (1):
      media: coda: jpeg: drop coda9_jpeg_dec_huff_setup() return value

Rory Liu (1):
      media: platform: cros-ec: Add Kuldax to the match table

Sun Ke (1):
      media: platform: mtk-mdp3: fix PM reference leak in mdp_comp_clock_on()

ye xingchen (2):
      media: radio-si476x: Remove the unneeded result variable
      media: tuners: Remove the unneeded result variable

 Documentation/userspace-api/media/cec.h.rst.exceptions        |  2 ++
 Documentation/userspace-api/media/v4l/libv4l-introduction.rst |  4 ++--
 MAINTAINERS                                                   |  3 +--
 drivers/media/cec/core/cec-adap.c                             |  1 +
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c              |  4 ++++
 drivers/media/cec/platform/s5p/s5p_cec.c                      |  2 ++
 drivers/media/dvb-frontends/drxk_hard.c                       |  2 +-
 drivers/media/i2c/isl7998x.c                                  |  2 +-
 drivers/media/pci/cx18/cx18-av-core.c                         |  4 ++--
 drivers/media/platform/amphion/vpu_v4l2.c                     | 11 ++++-------
 drivers/media/platform/chips-media/coda-jpeg.c                | 13 +++----------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c          |  2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c          |  7 ++++---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c          |  3 ++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c           |  3 ++-
 drivers/media/platform/nxp/dw100/dw100.c                      |  4 ++--
 drivers/media/radio/radio-si476x.c                            |  5 +----
 drivers/media/radio/si4713/si4713.c                           |  2 +-
 drivers/media/tuners/xc4000.c                                 |  4 +---
 drivers/media/usb/dvb-usb-v2/af9035.c                         |  2 +-
 drivers/media/usb/msi2500/msi2500.c                           |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c                      |  8 ++++----
 drivers/media/v4l2-core/v4l2-ctrls-core.c                     | 19 ++++++++++---------
 drivers/staging/media/meson/vdec/vdec.c                       |  2 ++
 include/media/v4l2-ctrls.h                                    | 28 +++++++++++-----------------
 include/uapi/linux/cec-funcs.h                                | 14 ++++++++++++++
 include/uapi/linux/cec.h                                      |  2 ++
 27 files changed, 82 insertions(+), 73 deletions(-)
