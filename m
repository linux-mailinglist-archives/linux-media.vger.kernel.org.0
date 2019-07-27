Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329C877807
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 11:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbfG0J5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 05:57:38 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44623 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbfG0J5i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 05:57:38 -0400
X-Originating-IP: 176.158.46.5
Received: from aptenodytes (static-176-158-46-5.ftth.abo.bbox.fr [176.158.46.5])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BC06740004;
        Sat, 27 Jul 2019 09:57:29 +0000 (UTC)
Date:   Sat, 27 Jul 2019 11:57:29 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 0/4] HEVC/H.265 stateless support for V4L2 and Cedrus
Message-ID: <20190727095729.GD16618@aptenodytes>
References: <20190725185602.22522-1-paul.kocialkowski@bootlin.com>
 <7fa38a2c-8e16-5e88-d073-1d04e9feaa84@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7fa38a2c-8e16-5e88-d073-1d04e9feaa84@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri 26 Jul 19, 10:33, Hans Verkuil wrote:
> On 7/25/19 8:55 PM, Paul Kocialkowski wrote:
> > HEVC/H.265 stateless support for V4L2 and Cedrus
> > 
> > This is early support for HEVC/H.265 stateless decoding in V4L2,
> > including both definitions and driver support for the Cedrus VPU
> > driver, which concerns Allwinner devices.
> > 
> > A specific pixel format is introduced for the HEVC slice format and
> > controls are provided to pass the bitstream metadata to the decoder.
> > Some bitstream extensions are intentionally not supported at this point.
> > 
> > Since this is the first proposal for stateless HEVC/H.265 support in
> > V4L2, reviews and comments about the controls definitions are
> > particularly welcome.
> > 
> > On the Cedrus side, the H.265 implementation covers frame pictures
> > with both uni-directional and bi-direction prediction modes (P/B
> > slices). Field pictures (interleaved), scaling lists and 10-bit output
> > are not supported at this point.
> > 
> > Changes since v6:
> > * Rebased on latest media tree from Hans;
> 
> Which tree is that? Or are you just referring our media_tree master
> branch? (which isn't 'my' tree :-) )

I'm usually rebasing on the tree you use to send PRs to Mauro, at:
https://git.linuxtv.org/hverkuil/media_tree.git/

which is usually the best up-to-date stateless codec support tree :)

Cheers,

Paul

> Regards,
> 
> 	Hans
> 
> > * Reordered some fields to avoid holes and multi-padding;
> > * Updated the documentation.
> > 
> > Changes since v5:
> > * Rebased atop latest next media tree;
> > * Moved to flags instead of u8 fields;
> > * Added padding to ensure 64-bit alignment
> >   (tested with GDB on 32 and 64-bit architectures);
> > * Reworked cedrus H.265 driver support a bit for flags;
> > * Split off codec-specific control validation and init;
> > * Added HEVC controls fields cleanup at std_validate to allow reliable
> >   control comparison with memcmp;
> > * Fixed various misc reported mistakes.
> > 
> > Changes since v4:
> > * Rebased atop latest H.254 series.
> > 
> > Changes since v3:
> > * Updated commit messages;
> > * Updated CID base to avoid conflicts;
> > * Used cpu_to_le32 for packed le32 data;
> > * Fixed misc minor issues in the drive code;
> > * Made it clear in the docs that the API will evolve;
> > * Made the pixfmt private and split commits about it.
> > 
> > Changes since v2:
> > * Moved headers to non-public API;
> > * Added H265 capability for A64 and H5;
> > * Moved docs to ext-ctrls-codec.rst;
> > * Mentionned sections of the spec in the docs;
> > * Added padding to control structures for 32-bit alignment;
> > * Made write function use void/size in bytes;
> > * Reduced the number of arguments to helpers when possible;
> > * Removed PHYS_OFFSET since we already set PFN_OFFSET;
> > * Added comments where suggested;
> > * Moved to timestamp for references instead of index;
> > * Fixed some style issues reported by checkpatch.
> > 
> > Changes since v1:
> > * Added a H.265 capability to whitelist relevant platforms;
> > * Switched over to tags instead of buffer indices in the DPB
> > * Declared variable in their reduced scope as suggested;
> > * Added the H.265/HEVC spec to the biblio;
> > * Used in-doc references to the spec and the required APIs;
> > * Removed debugging leftovers.
> > 
> > Cheers!
> > 
> > Paul Kocialkowski (4):
> >   media: v4l2-ctrl: Add a comment on why we zero out compound controls
> >     fields
> >   media: v4l: Add definitions for the HEVC slice controls
> >   media: pixfmt: Document the HEVC slice pixel format
> >   media: cedrus: Add HEVC/H.265 decoding support
> > 
> >  Documentation/media/uapi/v4l/biblio.rst       |   9 +
> >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 486 +++++++++++++-
> >  .../media/uapi/v4l/pixfmt-compressed.rst      |  21 +
> >  .../media/uapi/v4l/vidioc-queryctrl.rst       |  18 +
> >  .../media/videodev2.h.rst.exceptions          |   3 +
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  93 +++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> >  drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   |  31 +-
> >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  18 +
> >  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   9 +
> >  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 616 ++++++++++++++++++
> >  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   4 +
> >  .../staging/media/sunxi/cedrus/cedrus_regs.h  | 271 ++++++++
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |  10 +
> >  include/media/hevc-ctrls.h                    | 198 ++++++
> >  include/media/v4l2-ctrls.h                    |   7 +
> >  17 files changed, 1789 insertions(+), 8 deletions(-)
> >  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> >  create mode 100644 include/media/hevc-ctrls.h
> > 
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
