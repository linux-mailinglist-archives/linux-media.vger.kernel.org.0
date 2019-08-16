Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9057390528
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 18:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfHPQBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 12:01:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50156 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbfHPQBp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 12:01:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B77A6283C43
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v7 00/11] media: hantro: Add support for H264 decoding
Date:   Fri, 16 Aug 2019 13:01:21 -0300
Message-Id: <20190816160132.7352-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yet another small respin of H264 uAPI review and Hantro G1 H264
decoding support, addressing some last minute feedback from Hans.

It would be awesome if we can get this first part merged for v5.4.
We have lots of changes and improvements in the pipeline for this
driver!

Thanks,
Ezequiel

Boris Brezillon (3):
  media: uapi: h264: Add the concept of decoding mode
  media: uapi: h264: Get rid of the p0/b0/b1 ref-lists
  media: hantro: Move copy_metadata() before doing a decode operation

Ezequiel Garcia (4):
  media: uapi: h264: Rename pixel format
  media: uapi: h264: Add the concept of start code
  media: cedrus: Cleanup control initialization
  media: cedrus: Specify H264 startcode and decoding mode

Hertz Wong (3):
  media: hantro: Add core bits to support H264 decoding
  media: hantro: Add support for H264 decoding on G1
  media: hantro: Enable H264 decoding on rk3288

Rasmus Villemoes (1):
  lib/sort.c: implement sort() variant taking context argument

 .../media/uapi/v4l/ext-ctrls-codec.rst        |  99 ++-
 .../media/uapi/v4l/pixfmt-compressed.rst      |  11 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  18 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +-
 drivers/staging/media/hantro/Makefile         |   2 +
 drivers/staging/media/hantro/hantro.h         |   9 +-
 drivers/staging/media/hantro/hantro_drv.c     |  50 +-
 .../staging/media/hantro/hantro_g1_h264_dec.c | 292 ++++++++
 drivers/staging/media/hantro/hantro_h264.c    | 646 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  56 ++
 drivers/staging/media/hantro/hantro_v4l2.c    |  10 +
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  21 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  63 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   3 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |   6 +-
 include/linux/sort.h                          |   5 +
 include/media/h264-ctrls.h                    |  21 +-
 lib/sort.c                                    |  34 +-
 19 files changed, 1294 insertions(+), 56 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_h264_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_h264.c

-- 
2.22.0

