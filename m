Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97151333ABD
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 11:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhCJKyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 05:54:10 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51695 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231790AbhCJKx7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 05:53:59 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id JwTSlFQlAOruFJwTVlWfse; Wed, 10 Mar 2021 11:53:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615373638; bh=Qb/zRclsnwlq6lCxUA0wramNGOSPuNmyPdcMzFdaUJY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CM4TTtSs7ENVTftcOvXFn1HOtQ7OhcWKxWE9f7hhRb752UxlbMx9nvRS/jDoA/JG4
         +UMTYVuQRPiuAfFi3FzfXDw3COnGY2orDWVHhbZD93R3F0rixwl7aJhdb1EQ7ZuQXo
         r/Vkmb8nvAnBZL/MlkzH7f3yPyCqiNjNhfxpncZDY3vdymUzFlcubcRhQxacunVA+/
         I36n1bwYIJ83tKrqjqofb1eNAPdAsFQXE0dqj7jErN0TrwDLEbeiIyxS+8gIn1foRx
         tkiEmCXEuzWjltDw4kFEGJgIPgfwPdtDJuynxkFGBwxgnygGEzV5XLUcWs3T/9NZOR
         nK5aLCxRy9SNA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes/enhancements
Message-ID: <3b7dc580-add6-e8e9-7128-d78c128b8050@xs4all.nl>
Date:   Wed, 10 Mar 2021 11:53:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAU9chjbQzhb9oDvb2bKUJAmmzaNO307ZdnpoHeAueVebJiDvYN4OVTXTNJJFeQLp4oquhk0eYkbjjUC4hDBDetgzWUWuvx509AfhPDcfTkdADUzI+ph
 u36aBs5xikxO5XLjcG+GTCeF0CCV9VVH6BWsiJo9u/CgpSzsPYiDg6XIbbptdAyQLip+3X/Xc2AOOfYCZ5XcixdwUljvz0gyNGg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39:

  Merge tag 'v5.12-rc2' into patchwork (2021-03-07 17:46:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13f

for you to fetch changes up to 5dc2231e0fa26c6424ccff303c742736cae77de9:

  cec/core/cec-notifier: use IS_REACHABLE(CONFIG_I2C) (2021-03-10 11:09:33 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (8):
      vim2m: initialize the media device earlier
      ext-ctrls-codec.rst: clarify V4L2_CID_MPEG_VIDEO_BITRATE
      media: core headers: fix kernel-doc warnings
      media/pci: fix kerneldoc issues in two headers
      media/i2c: fix kerneldoc issues for media i2c headers
      vpbe_osd.h/uvcvideo.h includes: fix trivial kernel-doc warnings
      media tuner headers: fix kernel-doc warnings
      cec/core/cec-notifier: use IS_REACHABLE(CONFIG_I2C)

Jia-Ju Bai (3):
      media: platform: xilinx: fix error return code of xvip_graph_init()
      media: platform: sunxi: sun6i-csi: fix error return code of sun6i_video_start_streaming()
      media: tuners: fix error return code of hybrid_tuner_request_state()

Julia Lawall (1):
      media: flexcop-usb: delete unneeded return

Laurent Pinchart (1):
      media: ti-vpe: cal: Implement media controller centric API

Tomi Valkeinen (2):
      media: ti-vpe: cal: remove unneeded assignment
      media: ti-vpe: cal: fix subdev mbus_code enumeration

Wei Yongjun (1):
      media: m88ds3103: fix return value check in m88ds3103_probe()

Yang Li (1):
      media: exynos4-is: add missing call to of_node_put()

Zhang Yunkai (1):
      media:vidtv: remove duplicate include in vidtv_psi

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst |   2 +-
 drivers/media/cec/core/cec-notifier.c                     |   2 +-
 drivers/media/dvb-frontends/m88ds3103.c                   |   4 +-
 drivers/media/i2c/adv748x/adv748x.h                       |  10 +-
 drivers/media/i2c/m5mols/m5mols.h                         |   4 +-
 drivers/media/i2c/tvp514x_regs.h                          |   6 +-
 drivers/media/pci/sta2x11/sta2x11_vip.h                   |   2 +
 drivers/media/pci/tw686x/tw686x.h                         |  10 +-
 drivers/media/platform/Kconfig                            |  14 ++
 drivers/media/platform/exynos4-is/media-dev.c             |   4 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c      |   4 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c              |   1 +
 drivers/media/platform/ti-vpe/cal-video.c                 | 332 ++++++++++++++++++++++++++++++++++--------
 drivers/media/platform/ti-vpe/cal.c                       |  16 +-
 drivers/media/platform/ti-vpe/cal.h                       |   2 +
 drivers/media/platform/xilinx/xilinx-vipp.c               |   1 +
 drivers/media/test-drivers/vidtv/vidtv_psi.c              |   1 -
 drivers/media/test-drivers/vim2m.c                        |  14 +-
 drivers/media/tuners/it913x.h                             |   2 +-
 drivers/media/tuners/qt1010.h                             |   8 +-
 drivers/media/tuners/tda827x.h                            |  10 +-
 drivers/media/tuners/tuner-i2c.h                          |   4 +-
 drivers/media/usb/b2c2/flexcop-usb.c                      |   1 -
 include/media/cec.h                                       |   2 +-
 include/media/davinci/vpbe_osd.h                          |   6 +-
 include/media/i2c/adv7343.h                               |   2 +-
 include/media/i2c/mt9t112.h                               |   2 +-
 include/media/i2c/noon010pc30.h                           |   1 +
 include/media/i2c/ov772x.h                                |   2 +-
 include/media/i2c/s5c73m3.h                               |   1 +
 include/media/i2c/s5k4ecgx.h                              |   6 +-
 include/media/i2c/s5k6aa.h                                |   1 +
 include/media/i2c/tvp514x.h                               |  11 +-
 include/media/i2c/tw9910.h                                |   8 +-
 include/media/v4l2-h264.h                                 |   6 +-
 include/media/v4l2-jpeg.h                                 |   2 +
 include/uapi/linux/cec.h                                  |   3 +-
 include/uapi/linux/uvcvideo.h                             |  10 +-
 include/uapi/linux/v4l2-subdev.h                          |  12 +-
 include/uapi/linux/videodev2.h                            |  15 +-
 40 files changed, 405 insertions(+), 139 deletions(-)
