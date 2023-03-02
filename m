Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D02C6A82F5
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 13:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjCBM6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 07:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjCBM6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 07:58:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3909B4ECCA
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 04:57:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E4812B811E7
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 12:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A70C433D2
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 12:57:34 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/9] Remove destructive video overlay and clipping
Date:   Thu,  2 Mar 2023 13:57:22 +0100
Message-Id: <20230302125731.1124945-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Destructive video overlay support relies on userspace passing the address of
the framebuffer to the driver with VIDIOC_S_FBUF. The PCI driver can then DMA
the captured frame straight into the framebuffer. This was useful 20 years ago,
but today not so much.

Typically userspace would get the address from the /dev/fbX device using the
FBIOGET_FSCREENINFO ioctl.

But drm_fb_helper.c sets the smem_start field explicitly to 0 unless:

1) CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is set, and
2) CONFIG_EXPERT is set, and
3) set the drm_kms_helper module parameter drm_leak_fbdev_smem to 1.

Effectively destructive overlay support is dead today.

This patch series removes it from the remaining drivers.

As a result the support for clipping using clipping rectangles or
a bitmap can now also be removed.

Regards,

	Hans

Changes since the RFC:

- dropped 'RFC' :-)
- Removed V4L2_CAP_VIDEO_OVERLAY that I missed in saa7146
- Dropped unused variable in get_v4l2_framebuffer32
- I'm pretty sure there were a few more unused variables that I
  dropped, but I didn't keep track of that :-(

Hans Verkuil (9):
  saa7146: drop overlay support
  saa7134: drop overlay support
  bttv: drop overlay support
  vivid: drop overlay support
  vivid: drop bitmap and clipping output overlay support
  v4l2-core: drop v4l2_window clipping and bitmap support
  videodev.h: drop V4L2_FBUF_CAP_LIST/BITMAP_CLIPPING
  v4l2-core: zero field base in struct v4l2_framebuffer
  Documentation: userspace-api: media: drop clipping, destructive
    overlays

 .../userspace-api/media/v4l/dev-overlay.rst   |  10 +-
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst |  52 +--
 drivers/media/common/saa7146/saa7146_fops.c   |  26 +-
 drivers/media/common/saa7146/saa7146_hlp.c    | 296 ------------
 drivers/media/common/saa7146/saa7146_video.c  | 326 +------------
 drivers/media/pci/bt8xx/Kconfig               |   2 +-
 drivers/media/pci/bt8xx/btcx-risc.c           | 153 ------
 drivers/media/pci/bt8xx/btcx-risc.h           |   9 -
 drivers/media/pci/bt8xx/bttv-cards.c          |  15 -
 drivers/media/pci/bt8xx/bttv-driver.c         | 436 +-----------------
 drivers/media/pci/bt8xx/bttv-risc.c           | 131 ------
 drivers/media/pci/bt8xx/bttvp.h               |  28 +-
 drivers/media/pci/saa7134/saa7134-cards.c     |   1 -
 drivers/media/pci/saa7134/saa7134-core.c      |  32 --
 drivers/media/pci/saa7134/saa7134-video.c     | 411 +----------------
 drivers/media/pci/saa7134/saa7134.h           |  13 -
 drivers/media/test-drivers/vivid/vivid-core.c |  49 +-
 drivers/media/test-drivers/vivid/vivid-core.h |  19 -
 .../test-drivers/vivid/vivid-kthread-cap.c    | 131 +-----
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 272 -----------
 .../media/test-drivers/vivid/vivid-vid-cap.h  |   3 -
 .../media/test-drivers/vivid/vivid-vid-out.c  |  74 ---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  85 +---
 drivers/media/v4l2-core/v4l2-ioctl.c          |  77 +---
 drivers/staging/media/av7110/av7110_v4l.c     |  17 +-
 include/media/drv-intf/saa7146_vv.h           |  21 -
 include/uapi/linux/videodev2.h                |   2 +
 27 files changed, 92 insertions(+), 2599 deletions(-)

-- 
2.39.1

