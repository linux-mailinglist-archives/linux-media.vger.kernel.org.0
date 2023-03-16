Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B756BD75A
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 18:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCPRnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 13:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjCPRnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 13:43:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FD9168A9
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 10:43:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 088A9B822BD
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 17:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B00C433D2
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 17:43:02 +0000 (UTC)
Message-ID: <7aafb16c-d6a0-f62d-dfbd-05ef87d0a5e5@xs4all.nl>
Date:   Thu, 16 Mar 2023 18:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] v2: Drop destructive overlay support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See the cover letter for more info:

https://patchwork.linuxtv.org/project/linux-media/cover/20230302125731.1124945-1-hverkuil-cisco@xs4all.nl/

Regards,

	Hans

Changes since v1:

- rebased to 6.3-rc2
- fix an ENUM_FMT regression in bttv where the format index was returned
  instead of 0. Thanks to Deb Brouwer for reporting this!


The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4b

for you to fetch changes up to 4fb898a32be9ce2c0dfbb4ff3b3cb83626d00421:

  Documentation: userspace-api: media: drop clipping, destructive overlays (2023-03-16 17:43:14 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (9):
      saa7146: drop overlay support
      saa7134: drop overlay support
      bttv: drop overlay support
      vivid: drop overlay support
      vivid: drop bitmap and clipping output overlay support
      v4l2-core: drop v4l2_window clipping and bitmap support
      videodev.h: drop V4L2_FBUF_CAP_LIST/BITMAP_CLIPPING
      v4l2-core: zero field base in struct v4l2_framebuffer
      Documentation: userspace-api: media: drop clipping, destructive overlays

 Documentation/userspace-api/media/v4l/dev-overlay.rst   |  10 +-
 Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst |  52 +++----
 drivers/media/common/saa7146/saa7146_fops.c             |  26 +---
 drivers/media/common/saa7146/saa7146_hlp.c              | 296 ----------------------------------------
 drivers/media/common/saa7146/saa7146_video.c            | 326 +-------------------------------------------
 drivers/media/pci/bt8xx/Kconfig                         |   2 +-
 drivers/media/pci/bt8xx/btcx-risc.c                     | 153 ---------------------
 drivers/media/pci/bt8xx/btcx-risc.h                     |   9 --
 drivers/media/pci/bt8xx/bttv-cards.c                    |  15 --
 drivers/media/pci/bt8xx/bttv-driver.c                   | 436 ++---------------------------------------------------------
 drivers/media/pci/bt8xx/bttv-risc.c                     | 131 ------------------
 drivers/media/pci/bt8xx/bttvp.h                         |  28 +---
 drivers/media/pci/saa7134/saa7134-cards.c               |   1 -
 drivers/media/pci/saa7134/saa7134-core.c                |  32 -----
 drivers/media/pci/saa7134/saa7134-video.c               | 411 +------------------------------------------------------
 drivers/media/pci/saa7134/saa7134.h                     |  13 --
 drivers/media/test-drivers/vivid/vivid-core.c           |  49 +------
 drivers/media/test-drivers/vivid/vivid-core.h           |  19 ---
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c    | 131 +-----------------
 drivers/media/test-drivers/vivid/vivid-vid-cap.c        | 272 -------------------------------------
 drivers/media/test-drivers/vivid/vivid-vid-cap.h        |   3 -
 drivers/media/test-drivers/vivid/vivid-vid-out.c        |  74 ----------
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c           |  85 ++----------
 drivers/media/v4l2-core/v4l2-ioctl.c                    |  77 ++++-------
 drivers/staging/media/av7110/av7110_v4l.c               |  17 +--
 include/media/drv-intf/saa7146_vv.h                     |  21 ---
 include/uapi/linux/videodev2.h                          |   2 +
 27 files changed, 92 insertions(+), 2599 deletions(-)
