Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF9E46119
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 16:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbfFNOjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 10:39:53 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52451 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbfFNOj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 10:39:27 -0400
Received: from localhost.localdomain (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr [90.88.23.150])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BC3AB24000E;
        Fri, 14 Jun 2019 14:39:09 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v6 0/5] HEVC/H.265 stateless support for V4L2 and Cedrus
Date:   Fri, 14 Jun 2019 16:38:32 +0200
Message-Id: <20190614143837.15605-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

This series is based upon the following series:
* media: cedrus: Add H264 decoding support

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

Paul Kocialkowski (5):
  media: v4l2-ctrls: Split off MPEG-2 controls validation
  media: v4l2-ctrls: Split off MPEG-2 controls initialization
  media: v4l: Add definitions for the HEVC slice controls
  media: pixfmt: Document the HEVC slice pixel format
  media: cedrus: Add HEVC/H.265 decoding support

 Documentation/media/uapi/v4l/biblio.rst       |   9 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 474 +++++++++++++-
 .../media/uapi/v4l/pixfmt-compressed.rst      |  21 +
 .../media/uapi/v4l/vidioc-queryctrl.rst       |  18 +
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/v4l2-core/v4l2-ctrls.c          | 231 +++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  31 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  18 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   9 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 616 ++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   4 +
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 271 ++++++++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  10 +
 include/media/hevc-ctrls.h                    | 197 ++++++
 include/media/v4l2-ctrls.h                    |   7 +
 17 files changed, 1860 insertions(+), 62 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h265.c
 create mode 100644 include/media/hevc-ctrls.h

-- 
2.21.0

