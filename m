Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBEAE59F99C
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 14:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237211AbiHXMTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 08:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237362AbiHXMTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 08:19:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E657694B
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 05:19:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79C2F61964
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 12:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984D7C433D6
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 12:19:06 +0000 (UTC)
Message-ID: <c370f027-09cc-cefa-05d8-aa0f866ca15d@xs4all.nl>
Date:   Wed, 24 Aug 2022 14:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] Various fixes/enhancements
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



The following changes since commit 1ff8334f0a4e0be693066aafba195d25629d77aa:

  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver (2022-08-21 08:42:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1g

for you to fetch changes up to 689b5f07c8142bb1897fe372008fa3f3632a23bc:

  tc358743: limit msg.len to CEC_MAX_MSG_SIZE (2022-08-24 14:07:54 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (1):
      media: dw100: Fix an error handling path in dw100_probe()

Daniel Lee Kruse (1):
      media: cx23885: reset DMA on AMD Renior/Cezanne IOMMU due to RiSC engine stall

Deborah Brouwer (1):
      media: v4l2-ctrls: Fix typo in VP8 comment

Dongliang Mu (1):
      media: airspy: fix memory leak in airspy probe

Hans Verkuil (4):
      videodev2.h: drop V4L2_CAP_ASYNCIO
      MAINTAINERS: change tc358743 maintainer
      media/cec: use CEC_MAX_MSG_SIZE instead of hardcoded 16
      tc358743: limit msg.len to CEC_MAX_MSG_SIZE

Liang He (1):
      media: exynos4-is: fimc-is: Add of_node_put() when breaking out of loop

Ondrej Jirman (1):
      media: rockchip: rga: Fix probe rga_parse_dt bugs

Zeng Jingxiang (1):
      tm6000: Fix unused value in vidioc_try_fmt_vid_cap()

Zheyu Ma (1):
      media: cx88: Fix a null-ptr-deref bug in buffer_prepare()

 Documentation/userspace-api/media/v4l/async.rst           |  9 ---------
 Documentation/userspace-api/media/v4l/dev-raw-vbi.rst     |  2 +-
 Documentation/userspace-api/media/v4l/dev-sdr.rst         |  2 +-
 Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst  |  2 +-
 Documentation/userspace-api/media/v4l/hist-v4l2.rst       |  2 +-
 Documentation/userspace-api/media/v4l/io.rst              |  4 +---
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst |  3 ---
 MAINTAINERS                                               |  3 ++-
 drivers/media/cec/platform/sti/stih-cec.c                 |  4 ++--
 drivers/media/i2c/adv7511-v4l2.c                          |  4 ++--
 drivers/media/i2c/adv7604.c                               |  4 ++--
 drivers/media/i2c/adv7842.c                               |  4 ++--
 drivers/media/i2c/tc358743.c                              |  2 ++
 drivers/media/pci/cx23885/cx23885-core.c                  |  3 +++
 drivers/media/pci/cx88/cx88-vbi.c                         |  9 ++++-----
 drivers/media/pci/cx88/cx88-video.c                       | 43 ++++++++++++++++++++++---------------------
 drivers/media/platform/nxp/dw100/dw100.c                  |  1 +
 drivers/media/platform/rockchip/rga/rga.c                 |  2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is.c       |  1 +
 drivers/media/usb/airspy/airspy.c                         |  4 ++++
 drivers/media/usb/tm6000/tm6000-video.c                   |  2 --
 include/uapi/linux/v4l2-controls.h                        |  2 +-
 include/uapi/linux/videodev2.h                            |  6 +++++-
 23 files changed, 59 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/v4l/async.rst
