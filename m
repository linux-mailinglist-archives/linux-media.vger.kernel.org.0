Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FE9A7268
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 20:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbfICSRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 14:17:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38032 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfICSRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 14:17:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5A40F28A0A2
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/4] Enable Hantro G1 post-processor
Date:   Tue,  3 Sep 2019 15:17:07 -0300
Message-Id: <20190903181711.7559-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This series enables the post-processor support available
on the Hantro G1 VPU. The post-processor block can be
pipelined with the decoder hardware, allowing to perform
operations such as color conversion, scaling, rotation,
cropping, among others.

The decoder hardware needs its own set of NV12 buffers
(the native decoder format), and the post-processor is the
owner of the CAPTURE buffers. This allows the application
get processed (scaled, converted, etc) buffers, completely
transparently.

This feature is implemented by exposing other CAPTURE pixel
formats to the application (ENUM_FMT). When the application
sets a pixel format other than NV12, the driver will enable
and use the post-processor transparently.

Patches 1 to 3 cleanup and organize the code to allow easier
integration of the post-processor. Then patch 4 introduces
the new pixel formats and enables the post-processor itself.

I am aware it's still early for v5.5, yet I'm posting this
series to get feedback and allow others to tests.
Also, keep in mind these patches are conflict with Jonas'
recent series.

This is tested on RK3288 platforms with MPEG-2, VP8 and H264 streams,
decoding to RGB and YUV-packed surfaces.

Thanks,
Ezequiel

Ezequiel Garcia (4):
  media: hantro: Simplify macroblock macros
  media: hantro: Simplify buffer helpers
  media: hantro: Add helper for the H264 motion vectors allocation
  media: hantro: Support color conversion via post-processing

 drivers/staging/media/hantro/Makefile         |   1 +
 drivers/staging/media/hantro/hantro.h         |  49 ++-
 drivers/staging/media/hantro/hantro_drv.c     |  27 +-
 .../staging/media/hantro/hantro_g1_h264_dec.c |   9 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  14 +-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |  13 +-
 .../staging/media/hantro/hantro_h1_jpeg_enc.c |   4 +-
 drivers/staging/media/hantro/hantro_h264.c    |  26 +-
 drivers/staging/media/hantro/hantro_hw.h      |  15 +-
 .../staging/media/hantro/hantro_postproc.c    | 316 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_v4l2.c    |  25 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  37 +-
 drivers/staging/media/hantro/rk3399_vpu_hw.c  |  12 +-
 .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |   4 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  11 +-
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |  12 +-
 16 files changed, 483 insertions(+), 92 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_postproc.c

-- 
2.22.0

