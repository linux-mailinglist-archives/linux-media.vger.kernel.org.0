Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0753E12CBA
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 13:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfECLrZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 07:47:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46166 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfECLrZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 07:47:25 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C22CC2817E1;
        Fri,  3 May 2019 12:47:22 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 00/15] Add MPEG-2 decoding to Rockchip VPU
Date:   Fri,  3 May 2019 13:47:04 +0200
Message-Id: <20190503114719.28784-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series introduces the decoding infrastructure that will be
used to add support for other codecs such as VP8, VP9 and H.264.

As explained in the cover letter for the v1 patchset,
the driver is now exposing two video device nodes.
The VPU encoder is exposed on /dev/video0, and the VPU decoder
is exposed on /dev/video1. Both devices are tied to the same
memory-to-memory queue, and same media device /dev/media0.

Therefore there are two media graphs:

┌────────────────────────────────┐
│ rockchip,rk3399-vpu-enc-source │
│          /dev/video0           │
└────────────────────────────────┘
  ┃
  ┃
  ▼
┌────────────────────────────────┐
│  rockchip,rk3399-vpu-enc-proc  │
└────────────────────────────────┘
  ┃
  ┃
  ▼
┌────────────────────────────────┐
│  rockchip,rk3399-vpu-enc-sink  │
│          /dev/video0           │
└────────────────────────────────┘

┌────────────────────────────────┐
│ rockchip,rk3399-vpu-dec-source │
│          /dev/video1           │
└────────────────────────────────┘
  ┃
  ┃
  ▼
┌────────────────────────────────┐
│  rockchip,rk3399-vpu-dec-proc  │
└────────────────────────────────┘
  ┃
  ┃
  ▼
┌────────────────────────────────┐
│  rockchip,rk3399-vpu-dec-sink  │
│          /dev/video1           │
└────────────────────────────────┘

Of course, this work has been possible thanks to Jonas Karlman, who did
the initial MPEG-2 decoding work and also got mpv+ffmpeg working using
the Request API.

Regards,

Boris

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
  media: v4l2-common: Support custom imagesize/bytesperline in
    fill_pixfmt()
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

Jonas Karlman (3):
  rockchip/vpu: Add infra to support MPEG-2 decoding
  rockchip/vpu: Add MPEG2 decoding support to RK3399
  rockchip/vpu: Add support for MPEG-2 decoding on RK3288

 drivers/media/v4l2-core/v4l2-common.c         |  86 ++-
 drivers/staging/media/rockchip/vpu/Kconfig    |   1 +
 drivers/staging/media/rockchip/vpu/Makefile   |   7 +-
 .../media/rockchip/vpu/rk3288_vpu_hw.c        |  59 +-
 .../rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c     |   2 +-
 .../rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c    | 261 +++++++
 .../media/rockchip/vpu/rk3288_vpu_regs.h      |   1 +
 .../media/rockchip/vpu/rk3399_vpu_hw.c        |  59 +-
 .../rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c     |   8 +-
 .../rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c    | 267 +++++++
 .../staging/media/rockchip/vpu/rockchip_vpu.h | 110 ++-
 .../media/rockchip/vpu/rockchip_vpu_drv.c     | 467 ++++++++++--
 .../media/rockchip/vpu/rockchip_vpu_enc.c     | 571 ---------------
 .../media/rockchip/vpu/rockchip_vpu_hw.h      |  16 +
 .../media/rockchip/vpu/rockchip_vpu_mpeg2.c   |  61 ++
 .../media/rockchip/vpu/rockchip_vpu_v4l2.c    | 692 ++++++++++++++++++
 ...kchip_vpu_common.h => rockchip_vpu_v4l2.h} |  15 +-
 include/media/v4l2-common.h                   |  10 +-
 18 files changed, 2009 insertions(+), 684 deletions(-)
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_mpeg2.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
 rename drivers/staging/media/rockchip/vpu/{rockchip_vpu_common.h => rockchip_vpu_v4l2.h} (50%)

-- 
2.20.1

