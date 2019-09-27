Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE05BC07A5
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfI0OeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:34:18 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55551 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfI0OeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:34:18 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0EE6620019;
        Fri, 27 Sep 2019 14:34:14 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v8 0/3] HEVC/H.265 stateless support for V4L2 and Cedrus
Date:   Fri, 27 Sep 2019 16:34:08 +0200
Message-Id: <20190927143411.141526-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HEVC/H.265 stateless support for V4L2 and Cedrus

This is early support for HEVC/H.265 stateless decoding in V4L2,
including both definitions and driver support for the Cedrus VPU
driver, which concerns Allwinner devices.

A specific pixel format is introduced for the HEVC slice format and
controls are provided to pass the bitstream metadata to the decoder.
Some bitstream extensions are intentionally not supported at this point.

Since this is the first proposal for stateless HEVC/H.265 support in
V4L2, reviews and comments about the controls definitions are
particularly welcome.

On the Cedrus side, the H.265 implementation covers frame pictures
with both uni-directional and bi-direction prediction modes (P/B
slices). Field pictures (interleaved), scaling lists and 10-bit output
are not supported at this point.

Changes since v7:
* Rebased on latest media tree;
* Fixed holes in structures for cacheline alignment;
* Added decode mode and start code controls
  (only per-slice and no start code is supported at this point).

Changes since v6:
* Rebased on latest media tree from Hans;
* Reordered some fields to avoid holes and multi-padding;
* Updated the documentation.

Changes since v5:
* Rebased atop latest next media tree;
* Moved to flags instead of u8 fields;
* Added padding to ensure 64-bit alignment
  (tested with GDB on 32 and 64-bit architectures);
* Reworked cedrus H.265 driver support a bit for flags;
* Split off codec-specific control validation and init;
* Added HEVC controls fields cleanup at std_validate to allow reliable
  control comparison with memcmp;
* Fixed various misc reported mistakes.

Changes since v4:
* Rebased atop latest H.254 series.

Changes since v3:
* Updated commit messages;
* Updated CID base to avoid conflicts;
* Used cpu_to_le32 for packed le32 data;
* Fixed misc minor issues in the drive code;
* Made it clear in the docs that the API will evolve;
* Made the pixfmt private and split commits about it.

Changes since v2:
* Moved headers to non-public API;
* Added H265 capability for A64 and H5;
* Moved docs to ext-ctrls-codec.rst;
* Mentionned sections of the spec in the docs;
* Added padding to control structures for 32-bit alignment;
* Made write function use void/size in bytes;
* Reduced the number of arguments to helpers when possible;
* Removed PHYS_OFFSET since we already set PFN_OFFSET;
* Added comments where suggested;
* Moved to timestamp for references instead of index;
* Fixed some style issues reported by checkpatch.

Changes since v1:
* Added a H.265 capability to whitelist relevant platforms;
* Switched over to tags instead of buffer indices in the DPB
* Declared variable in their reduced scope as suggested;
* Added the H.265/HEVC spec to the biblio;
* Used in-doc references to the spec and the required APIs;
* Removed debugging leftovers.

Cheers!

Paul Kocialkowski (3):
  media: v4l: Add definitions for HEVC stateless decoding
  media: pixfmt: Document the HEVC slice pixel format
  media: cedrus: Add HEVC/H.265 decoding support

 Documentation/media/uapi/v4l/biblio.rst       |   9 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 553 +++++++++++++++-
 .../media/uapi/v4l/pixfmt-compressed.rst      |  23 +
 .../media/uapi/v4l/vidioc-queryctrl.rst       |  18 +
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/v4l2-core/v4l2-ctrls.c          | 108 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  52 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  18 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   9 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 616 ++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   4 +
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 271 ++++++++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  10 +
 include/media/hevc-ctrls.h                    | 212 ++++++
 include/media/v4l2-ctrls.h                    |   7 +
 17 files changed, 1907 insertions(+), 9 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h265.c
 create mode 100644 include/media/hevc-ctrls.h

-- 
2.23.0

