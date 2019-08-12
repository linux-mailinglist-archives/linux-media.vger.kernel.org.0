Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 423388A728
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 21:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfHLTfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 15:35:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60016 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfHLTfk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 15:35:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6A236283C52
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
Subject: [PATCH v5 00/11] media: hantro: Add support for H264 decoding
Date:   Mon, 12 Aug 2019 16:35:11 -0300
Message-Id: <20190812193522.10911-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A new version of H264 uAPI review and Hantro G1 H264 decoding support.
Compared to previous version, this version takes care of the
suggestions from Hans Verkuil clarifying the uAPI spec.

This series consolidates the two recent H264 series submitted
by Boris [1] [2]. Some patches from [2] have been merged (namely,
helpers for the Hantro driver), and so I'm adding the remanining
bits required to support H264 on Hantro G1 VPU.

* Patch 1 adds support for the sort_r() variant and has
  been posted separately by Rasmus. It would be good to merge this patch
  via the media tree, ideally as soon as possible, to avoid the
  synchronisation burden that might appear if we decide to delay it.

* Patch 2 to 4 extends the H264 uAPI, introducing frame-based vs slice-based
  decoding granularity, and also support for different NALU start codes.
  Currently, Annex B and no start codes are the supported options.

  With the introduction of the start code control, the H264 parsed
  slices pixel format should be renamed, dropping the _RAW suffix,
  which is now meaningless.

* Patch 5 removes the P0/B0/B1 ref lists from the decode_params control.
  These lists are no longer needed since we build them on the
  kernel side based on the DPB.

* Patch 6 and 7 exposes the proper decoding mode and start code
  on the cedrus driver. The driver functionality is not changed,
  and only the Cedrus support is now being properly exposed to
  userspace.

* Patch 8 is needed to properly propagate the OUTPUT buffer timestamp to
  the CAPTURE buffer one, which is required for intra-frame references.

* Patches 9 to 11 adds H264 support for Hantro G1 and then enable
  H264 decoding on RK3288.

This is based on media master and tested on Rockchip RK3288 for Hantro and
Allwinner H3 boards for Cedrus. Philipp Zabel tested on i.MX8MQ EVK using [3].

The Ffmpeg branch used to test is based on the great work of Jonas and Boris,
and is available in [4]. Instructions to build and run are as follows:

./configure --enable-v4l2-request --enable-libdrm
make -j4

(test via framebuffer rendering):

./ffmpeg -loglevel debug -hwaccel drm -hwaccel_device /dev/dri/card0 -i $some_file.avi -pix_fmt bgra -f fbdev /dev/fb0

[1] https://www.mail-archive.com/linux-media@vger.kernel.org/msg148299.html
[2] https://lkml.org/lkml/2019/6/19/379
[3] git://git.pengutronix.de/git/pza/linux.git hantro/imx8m-wip
[4] https://gitlab.collabora.com/ezequiel/ffmpeg/tree/stateless-mpeg2-vp8-h264-v4

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

 .../media/uapi/v4l/ext-ctrls-codec.rst        |  89 ++-
 .../media/uapi/v4l/pixfmt-compressed.rst      |   8 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  18 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +-
 drivers/staging/media/hantro/Makefile         |   2 +
 drivers/staging/media/hantro/hantro.h         |   9 +-
 drivers/staging/media/hantro/hantro_drv.c     |  50 +-
 .../staging/media/hantro/hantro_g1_h264_dec.c | 292 ++++++++
 drivers/staging/media/hantro/hantro_h264.c    | 651 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  56 ++
 drivers/staging/media/hantro/hantro_v4l2.c    |  10 +
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  21 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  65 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   3 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |   6 +-
 include/linux/sort.h                          |   5 +
 include/media/h264-ctrls.h                    |  22 +-
 lib/sort.c                                    |  34 +-
 19 files changed, 1290 insertions(+), 55 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_h264_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_h264.c

-- 
2.22.0

