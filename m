Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F372A0406
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgJ3LWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3LWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:22:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D201C0613CF;
        Fri, 30 Oct 2020 04:22:37 -0700 (PDT)
Received: from floko.floko.floko (unknown [IPv6:2804:14c:483:7e3e::1005])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E8EE21F45EBC;
        Fri, 30 Oct 2020 11:22:32 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, kernel@collabora.com, hverkuil-cisco@xs4all.nl,
        dafna.hirschfeld@collabora.com, zhengsq@rock-chips.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, tfiga@chromium.org, ribalda@google.com
Subject: [PATCH v2 0/3] destage Rockchip ISP1 driver
Date:   Fri, 30 Oct 2020 08:22:21 -0300
Message-Id: <20201030112225.2095909-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,


Changes in v2:
- New patch updating MAINTAINERS file
- No changes in other patches


I think it is time to move this driver out of staging.

Thanks all who contributed, specially to Dafna, who put a lot of
effort addressing all the items in the TODO list, fixing bugs,
cleaning the code, addressing past comments and testing.

Please, review the driver, see if there is any other thing that should
be addressed before this change.

> media-ctl -p
http://ix.io/2Cso

> media-ctl --print-dot
http://ix.io/2Csp

> v4l2-compliance -m0
http://ix.io/2Csk

> v4l2-compliance -v -d /dev/video0 -s10
http://ix.io/2Csq

> v4l2-compliance -v -d /dev/video1 -s10
http://ix.io/2Css

This patch depends on the following series:

* media: staging: rkisp1: uapi: add "WITH Linux-syscall-note"
  https://patchwork.linuxtv.org/project/linux-media/patch/20201020132514.26651-1-dafna.hirschfeld@collabora.com/

* [0/2] media: staging: rkisp1: Fix formats for metadata pads
  https://patchwork.linuxtv.org/project/linux-media/cover/20200325212704.29862-1-dafna.hirschfeld@collabora.com/

* [v2,1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media bus format.
  [v2,2/2] media: staging: rkisp1: isp: set metadata pads to MEDIA_BUS_FMT_METADATA_FIXED
  https://patchwork.linuxtv.org/project/linux-media/patch/20201020154522.654-1-dafna.hirschfeld@collabora.com/

* [0/6] media: staging: rkisp1: improvements
  https://patchwork.linuxtv.org/project/linux-media/cover/20201002184222.7094-1-dafna.hirschfeld@collabora.com/

* [0/4] media: staging: rkisp1: send cleanups and checkpatch fixes
  https://patchwork.linuxtv.org/project/linux-media/cover/20201019205956.6980-1-dafna.hirschfeld@collabora.com/

* media: staging: rkisp1: capture: set default quantization on 'set_fmt'
  https://patchwork.linuxtv.org/project/linux-media/patch/20201026162848.18310-1-dafna.hirschfeld@collabora.com/

* media: staging: rkisp1: remove TODO item to document quantization handling
  https://patchwork.linuxtv.org/project/linux-media/patch/20200928152809.27490-1-dafna.hirschfeld@collabora.com/

* [v2] media: staging: rkisp1: cap: refactor enable/disable stream to allow multistreaming
  https://patchwork.linuxtv.org/project/linux-media/patch/20201019160434.877568-1-helen.koike@collabora.com/

* [v6,0/9] move Rockchip ISP bindings out of staging / add ISP DT nodes for RK3399
  https://patchwork.linuxtv.org/project/linux-media/patch/20201020193850.1460644-2-helen.koike@collabora.com/

You can also see all of them applied in this branch:

    https://gitlab.collabora.com/koike/linux/-/tree/rockchip/isp/destage

Thanks
Helen

Helen Koike (2):
  media: rockchip: rkisp1: destage Rockchip ISP1 driver
  media: MAINTAINERS: Update rkisp1 files with new location

Shunqian Zheng (1):
  media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format

 .../media/v4l/pixfmt-meta-rkisp1.rst          |  2 +-
 MAINTAINERS                                   |  3 ++-
 drivers/media/platform/Kconfig                | 18 ++++++++++++++++++
 drivers/media/platform/Makefile               |  1 +
 .../platform/rockchip}/rkisp1/Makefile        |  0
 .../rockchip}/rkisp1/rkisp1-capture.c         |  0
 .../platform/rockchip}/rkisp1/rkisp1-common.c |  0
 .../platform/rockchip}/rkisp1/rkisp1-common.h |  2 +-
 .../platform/rockchip}/rkisp1/rkisp1-dev.c    |  0
 .../platform/rockchip}/rkisp1/rkisp1-isp.c    |  0
 .../platform/rockchip}/rkisp1/rkisp1-params.c |  0
 .../platform/rockchip}/rkisp1/rkisp1-regs.h   |  0
 .../rockchip}/rkisp1/rkisp1-resizer.c         |  0
 .../platform/rockchip}/rkisp1/rkisp1-stats.c  |  0
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
 drivers/staging/media/Kconfig                 |  2 --
 drivers/staging/media/Makefile                |  1 -
 drivers/staging/media/rkisp1/Kconfig          | 19 -------------------
 drivers/staging/media/rkisp1/TODO             |  6 ------
 .../uapi/linux}/rkisp1-config.h               |  4 ----
 include/uapi/linux/videodev2.h                |  4 ++++
 21 files changed, 29 insertions(+), 35 deletions(-)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/Makefile (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-capture.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.h (99%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-dev.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-isp.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-params.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-regs.h (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-resizer.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-stats.c (100%)
 delete mode 100644 drivers/staging/media/rkisp1/Kconfig
 delete mode 100644 drivers/staging/media/rkisp1/TODO
 rename {drivers/staging/media/rkisp1/uapi => include/uapi/linux}/rkisp1-config.h (99%)

-- 
2.28.0

