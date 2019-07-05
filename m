Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CED260855
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 16:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbfGEOvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 10:51:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36268 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfGEOvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 10:51:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 77FA928B494
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
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 0/4] RK3288 VP8 decoding support
Date:   Fri,  5 Jul 2019 11:50:46 -0300
Message-Id: <20190705145050.25911-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for Hantro G1 VP8 stateless decoding,
as available on RK3288 SoC.

In order to support VP8 stateless decoding, a new pixel format
is introduced V4L2_PIX_FMT_VP8_FRAME, to be used with a new control
V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER.

Changes in v3:

* Validate num_dct_parts field, as suggested by Philipp.
  This fixes the kernel oops reported by Philipp.
* Add documentation for num_dct_parts constraint.
* Renamed macroblock_bit_offset to first_part_header_bits
  and fixed its documentation.

Changes in v2:

* Verified that all the fields in the uAPI come from the spec [1].
* Structures and fields have 8-bytes alignment and sizes,
  as suggested by Boris.
* Moved 1-bit fields to a bit in the appropriate flags fields.
* Dropped dequant_factors[4][3][2], I really couldn't find this field
  or anything similar in the spec. It's not mentioned anywhere in
  Chromium or FFMPEG, so I decided to drop it.

[1] https://www.rfc-editor.org/rfc/rfc6386.html

Ezequiel Garcia (2):
  media: v4l2-ctrl: Move compound control validation
  media: v4l2-ctrl: Validate VP8 stateless decoder controls

Pawel Osciak (1):
  media: uapi: Add VP8 stateless decoder API

ZhiChao Yu (1):
  media: hantro: Add support for VP8 decoding on rk3288

 Documentation/media/uapi/v4l/biblio.rst       |  10 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 323 +++++++++++
 .../media/uapi/v4l/pixfmt-compressed.rst      |  20 +
 drivers/media/v4l2-core/v4l2-ctrls.c          | 148 +++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 drivers/staging/media/hantro/Makefile         |   4 +-
 drivers/staging/media/hantro/hantro.h         |   9 +
 drivers/staging/media/hantro/hantro_drv.c     |   6 +
 .../staging/media/hantro/hantro_g1_vp8_dec.c  | 543 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  17 +
 drivers/staging/media/hantro/hantro_v4l2.c    |   1 +
 drivers/staging/media/hantro/hantro_vp8.c     | 188 ++++++
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  22 +-
 include/media/v4l2-ctrls.h                    |   3 +
 include/media/vp8-ctrls.h                     | 110 ++++
 15 files changed, 1346 insertions(+), 59 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_vp8_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp8.c
 create mode 100644 include/media/vp8-ctrls.h

-- 
2.20.1

