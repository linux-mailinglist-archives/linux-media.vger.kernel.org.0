Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 347AFCAEDB
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732321AbfJCTI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:08:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45062 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732289AbfJCTI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:08:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0B9C528C499
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 0/4] Enable Hantro G1 post-processor
Date:   Thu,  3 Oct 2019 16:08:29 -0300
Message-Id: <20191003190833.29046-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

The Hantro G1 VPU post-processor block can be pipelined with
the decoder hardware, allowing to perform operations such as
color conversion, scaling, rotation, cropping, among others.

When the post-processor is enabled, the decoder hardware
gets its own set of NV12 buffers (the native decoder format),
and the post-processor is the owner of the CAPTURE buffers.

This allows the application get processed
(scaled, converted, etc) buffers, completely transparently.

This feature is implemented by exposing the post-processed pixel
formats on ENUM_FMT. When the application sets a pixel format
other than NV12, and if the post-processor is MC-linked,
the driver will make use of it, transparently.

On this v2, the media controller API is now required
to "enable" (aka link, in topology jargon) the post-processor.
Therefore, applications now have to explicitly request this feature.

For instance, the post-processor is enabled using the media-ctl
tool:

media-ctl -l "'decoder':1 -> 'rockchip,rk3288-vpu-dec':0[0]"
media-ctl -l "'postproc':1 -> 'rockchip,rk3288-vpu-dec':0[1]"

v4l2-ctl -d 1 --list-formats
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture Multiplanar

	[0]: 'NV12' (Y/CbCr 4:2:0)
	[1]: 'YUYV' (YUYV 4:2:2)

Patches 1 and 2 are simply cleanups needed to easier integrate the
post-processor. Patch 2 is a bit invasive, but it's a step
forward towards merging the implementation for RK3399 and RK3288.

Patch 3 re-works the media-topology, making the decoder
a v4l2_subdevice, instead of a bare entity. This allows
to introduce a more accurate of the decoder+post-processor complex.

Patch 4 introduces the post-processing support.

This is tested on RK3288 platforms with MPEG-2, VP8 and
H264 streams, decoding to YUY2 surfaces. For now, this series
is only adding support for NV12-to-YUY2 conversion.

The design and implementation is quite different from v1:

* The decoder->post-processor topology is now exposed
  explicitly and applications need to configure the pipeline.
  By default, the decoder is enabled and the post-processor
  is disabled.

* RGB post-processing output has been dropped. We might
  add this in the future, but for now, it seems it would
  make the code more complex without a use-case in mind.
  RGB is much more memory-consuming so less attractive
  than YUV, and modern GPUs and display controllers support YUV.

* The post-processor implementation still supports RK3288
  only. However, a generic register infrastructure is introduced
  to make addition of other variants such as RK3399 really easy.

Ezequiel Garcia (4):
  media: hantro: Cleanup format negotiation helpers
  media: hantro: mpeg2_dec: Re-use common register macros
  media: hantro: Rework media topology
  media: hantro: Support color conversion via post-processing

 drivers/staging/media/hantro/Makefile         |   1 +
 drivers/staging/media/hantro/hantro.h         | 105 +++++-
 drivers/staging/media/hantro/hantro_drv.c     | 336 ++++++++++++++----
 .../staging/media/hantro/hantro_g1_h264_dec.c |   2 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        | 188 ++++------
 drivers/staging/media/hantro/hantro_g1_regs.h | 109 ++++--
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |   2 +-
 drivers/staging/media/hantro/hantro_h264.c    |   6 +-
 drivers/staging/media/hantro/hantro_hw.h      |  13 +
 .../staging/media/hantro/hantro_postproc.c    | 141 ++++++++
 drivers/staging/media/hantro/hantro_v4l2.c    | 116 ++++--
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  10 +
 12 files changed, 754 insertions(+), 275 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_postproc.c

-- 
2.22.0

