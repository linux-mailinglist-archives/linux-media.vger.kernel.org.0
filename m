Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8B85D4EF
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 19:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfGBRAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 13:00:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58684 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfGBRAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 13:00:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9F16B26394E
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
Subject: [PATCH v2 0/2] RK3288 VP8 decoding support
Date:   Tue,  2 Jul 2019 14:00:14 -0300
Message-Id: <20190702170016.5210-1-ezequiel@collabora.com>
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

As suggested by Boris on this new version of the uAPI all the structures
and fields have 8-bytes alignment.

In addition, I've checked once again the VP8 spec [1] and did a few
changes:

* Moved 1-bit fields to a bit in the appropriate flags fields.
* Dropped dequant_factors[4][3][2], I really couldn't find this field
  or anything similar in the spec. It's not mentioned anywhere in
  Chromium or FFMPEG, so I decided to drop it.

I have verified the current uAPI and it now matches the VP8 specification
completely, with the exception of the "macroblock_bit_offset" field.

This field is present in VAAPI's VP8 interface as "macroblock_offset"
and is required to find the start of the first macroblock.

[1] https://www.rfc-editor.org/rfc/rfc6386.html
[2] http://intel.github.io/libva/va__dec__vp8_8h_source.html

Thanks,
Ezequiel

Changes from v1:
* Move 1-bit fields to flags in the respective structures.
* Add padding fields to make all structures 8-byte aligned.
* Reorder fields where needed to avoid padding as much as possible.
* Fix documentation as needed.
* Place operators at the end of each line, as suggested by Boris.

Changes from RFC:
* Verify the various ABIs.
* Move entropy coder state fields to a struct.
* Move key_frame field to the flags.
* Remove unneeded first_part_offset field.
* Add documentation.

As before, the ABI has been verified with Maxime Ripard's tools:

https://gitlab.collabora.com/ezequiel/v4l2-ctrl-abi-check

Pawel Osciak (1):
  media: uapi: Add VP8 stateless decoder API

ZhiChao Yu (1):
  media: hantro: Add support for VP8 decoding on rk3288

 Documentation/media/uapi/v4l/biblio.rst       |  10 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 323 ++++++++++
 .../media/uapi/v4l/pixfmt-compressed.rst      |  20 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |   8 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 drivers/staging/media/hantro/Makefile         |   4 +-
 drivers/staging/media/hantro/hantro.h         |   5 +
 drivers/staging/media/hantro/hantro_drv.c     |   6 +
 .../staging/media/hantro/hantro_g1_vp8_dec.c  | 552 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  17 +
 drivers/staging/media/hantro/hantro_v4l2.c    |   1 +
 drivers/staging/media/hantro/hantro_vp8.c     | 188 ++++++
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  22 +-
 include/media/v4l2-ctrls.h                    |   3 +
 include/media/vp8-ctrls.h                     | 110 ++++
 15 files changed, 1268 insertions(+), 2 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_vp8_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp8.c
 create mode 100644 include/media/vp8-ctrls.h

-- 
2.20.1

