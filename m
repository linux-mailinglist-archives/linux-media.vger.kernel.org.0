Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71DB22CCE5
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfE1RDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:03:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45844 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:03:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 68018263952
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v6 00/16] Add MPEG-2 decoding to Rockchip VPU
Date:   Tue, 28 May 2019 14:02:16 -0300
Message-Id: <20190528170232.2091-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series introduces the decoding infrastructure that will be
used to add support for other codecs such as VP8, VP9 and H.264.

The driver is exposes two video device nodes, the encoder being
/dev/video0, and decoder /dev/video1. Both devices are associated
to a single memory-to-memory queue, and same media device /dev/media0.

This work has been possible thanks to Jonas Karlman, who did
the initial MPEG-2 decoding work and also got mpv+ffmpeg working using
the Request API.

Patchset applies cleanly on top of:

git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3c

For those wanting to test, please find a branch here:

http://git.infradead.org/users/ezequielg/linux/shortlog/refs/heads/vpu-mpeg2-v6

Future plans
------------

Once this series is merged the plan is to rename the driver to Hantro
VPU, and add support to i.MX8, and then add VP8 and H264 decoding
support.

v6:
 * Change fill_fmt() helpers to accept only user-defined sizeimage,
   but not bytesperline.
 * Add RK3328 support, contributed by Jonas Karlman.

v5:
 * Add helper to clamp height/width based on frmsize
 * Modify fill_fmt() helpers to keep user-defined sizeimage/bytesperline
   when they're big enough
 * Fixed a bunch of problems reported by Hans (see per-patch changelog
   for more details)

v4:
 * Fix issues in the probe/remove path preventing the driver from being
   unloaded/reloaded (Jonas)
 * Rework the media controller registration code to simplify the
   error/remove path (Boris)
 * Split the MPEG2 patches (one adding the generic code and one patch
   per platform)

v3:
  * Share more code between the encoder/decoder logic (VB2/V4L2
    interface implementation)
  * Add a patch to support MPEG2 decoding on RK3288 (Jonas)
  * Several fixes/improvements all over the place (see changelog
    in each patch for more details)

v2:
  * Fixed some minor issues brought up by v4l2-compliance.
  * Fixed bytesused wrongly assigned 0 on the MPEG-2 decoder.
  * Addressed comments from Hans and Tomasz on the pixel format
    helpers.

Boris Brezillon (8):
  media: v4l2-common: Fix v4l2_fill_pixfmt[_mp]() prototypes
  media: v4l2-common: Add an helper to apply frmsize constraints
  media: v4l2-common: Support custom imagesize in fill_pixfmt()
  rockchip/vpu: Use v4l2_apply_frmsize_constraints() where appropriate
  rockchip/vpu: Rename rockchip_vpu_common.h into rockchip_vpu_v4l2.h
  rockchip/vpu: Move encoder logic to a common place
  rockchip/vpu: Provide a helper to reset both src and dst formats
  rockchip/vpu: Prepare things to support decoders

Ezequiel Garcia (4):
  rockchip/vpu: Open-code media controller register
  rockchip/vpu: Support the Request API
  rockchip/vpu: Add decoder boilerplate
  rockchip/vpu: Add support for non-standard controls

Jonas Karlman (4):
  rockchip/vpu: Add infra to support MPEG-2 decoding
  rockchip/vpu: Add MPEG2 decoding support to RK3399
  rockchip/vpu: Add support for MPEG-2 decoding on RK3288
  rockchip/vpu: Add support for MPEG-2 decoding on RK3328

 drivers/media/v4l2-core/v4l2-common.c         |  90 ++-
 drivers/staging/media/rockchip/vpu/Kconfig    |   1 +
 drivers/staging/media/rockchip/vpu/Makefile   |   7 +-
 .../media/rockchip/vpu/rk3288_vpu_hw.c        |  59 +-
 .../rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c     |   2 +-
 .../rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c    | 261 +++++++
 .../media/rockchip/vpu/rk3288_vpu_regs.h      |   1 +
 .../media/rockchip/vpu/rk3399_vpu_hw.c        |  71 +-
 .../rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c     |   8 +-
 .../rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c    | 267 +++++++
 .../staging/media/rockchip/vpu/rockchip_vpu.h | 110 ++-
 .../media/rockchip/vpu/rockchip_vpu_drv.c     | 466 ++++++++++--
 .../media/rockchip/vpu/rockchip_vpu_enc.c     | 571 ---------------
 .../media/rockchip/vpu/rockchip_vpu_hw.h      |  17 +
 .../media/rockchip/vpu/rockchip_vpu_mpeg2.c   |  61 ++
 .../media/rockchip/vpu/rockchip_vpu_v4l2.c    | 692 ++++++++++++++++++
 ...kchip_vpu_common.h => rockchip_vpu_v4l2.h} |  15 +-
 include/media/v4l2-common.h                   |  10 +-
 18 files changed, 2026 insertions(+), 683 deletions(-)
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_mpeg2.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
 rename drivers/staging/media/rockchip/vpu/{rockchip_vpu_common.h => rockchip_vpu_v4l2.h} (50%)

-- 
2.20.1

