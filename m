Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF21760E7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 10:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfGZIeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 04:34:11 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:47621 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbfGZIeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 04:34:11 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qvfnhIatWAffAqvfqhWoI5; Fri, 26 Jul 2019 10:34:08 +0200
Subject: Re: [PATCH v7 0/4] HEVC/H.265 stateless support for V4L2 and Cedrus
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
References: <20190725185602.22522-1-paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7fa38a2c-8e16-5e88-d073-1d04e9feaa84@xs4all.nl>
Date:   Fri, 26 Jul 2019 10:33:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725185602.22522-1-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNsva33SWs0vuOMOs0gxsaNeFw/rMhzSnsHXRYnqVZZsm13uavrno33Yi+FLd95MK3M4q3XPzn/qIMrTKtUEIoEv+GYcpYWgVfwqXtMJsR6AQtiCEFs4
 dYUzz6sxR52Sf1T6fZK6VDxVzyHySEtCEZ1Yy3oiCCLBYVI4abNqtNlvPWQUDnVbTwwVEHx71ZbIVIBFbl2GyRp2VLeken9WELUNhYmsa4VjTq1PGq6W5a28
 OyR55+Xg+jtyyct418LWizQepHD7emo2Z8aexLhFr/W1YDBsojff/r4EoCcvefb+ijkdYbMDzXmBifhJmAIgrldsFN5TgENKYohzNCQ3ZKUvL1FLPZrrl3vk
 PeEj7zEuCvFZxLLgf/4ymX7ZPB32GOPqyPWjT16+Bpsr6KIgfJYEyuKQWPIzQFKvMB7+effcUGTSwnMlYxRMlXkMX31AMvk61paNTZUC1oX86yBX9gaM3bJm
 zVkyLsJJh1UmG73aG7TrsPb8yLEQQCMt1W4DxNsI8R5ohaZn4tCpe9pMYBaudM77TbC2L99wXHg85J669Wg3LBaLpJzbR3q+lhcg5pmfD6ftUb3I0lYUUdmR
 F5ArKmRQiY1z6mtLJuRz+ziiOrBpbCdhBNV6ZIInN/9t2o+clzNKWA3FR6Zy+qC8xRUjUKEa91ao30YYSN5ituHIiikrZlOUekhOVLH4ImLI4B+Si5r4bw16
 Px/LEJUWtUUM9dSJb8GYXHsZrbbQggKSVVOZfDsj8CebL5cQ4DgWIGDKXKzCTaAEyBuGHCtyjmpdDA/NIwyyW7ZF/KHGkCDiUeT7R3P04Ya4l7U7xYRGswaa
 LepCXkdb8+KiG+IfJBs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/25/19 8:55 PM, Paul Kocialkowski wrote:
> HEVC/H.265 stateless support for V4L2 and Cedrus
> 
> This is early support for HEVC/H.265 stateless decoding in V4L2,
> including both definitions and driver support for the Cedrus VPU
> driver, which concerns Allwinner devices.
> 
> A specific pixel format is introduced for the HEVC slice format and
> controls are provided to pass the bitstream metadata to the decoder.
> Some bitstream extensions are intentionally not supported at this point.
> 
> Since this is the first proposal for stateless HEVC/H.265 support in
> V4L2, reviews and comments about the controls definitions are
> particularly welcome.
> 
> On the Cedrus side, the H.265 implementation covers frame pictures
> with both uni-directional and bi-direction prediction modes (P/B
> slices). Field pictures (interleaved), scaling lists and 10-bit output
> are not supported at this point.
> 
> Changes since v6:
> * Rebased on latest media tree from Hans;

Which tree is that? Or are you just referring our media_tree master
branch? (which isn't 'my' tree :-) )

Regards,

	Hans

> * Reordered some fields to avoid holes and multi-padding;
> * Updated the documentation.
> 
> Changes since v5:
> * Rebased atop latest next media tree;
> * Moved to flags instead of u8 fields;
> * Added padding to ensure 64-bit alignment
>   (tested with GDB on 32 and 64-bit architectures);
> * Reworked cedrus H.265 driver support a bit for flags;
> * Split off codec-specific control validation and init;
> * Added HEVC controls fields cleanup at std_validate to allow reliable
>   control comparison with memcmp;
> * Fixed various misc reported mistakes.
> 
> Changes since v4:
> * Rebased atop latest H.254 series.
> 
> Changes since v3:
> * Updated commit messages;
> * Updated CID base to avoid conflicts;
> * Used cpu_to_le32 for packed le32 data;
> * Fixed misc minor issues in the drive code;
> * Made it clear in the docs that the API will evolve;
> * Made the pixfmt private and split commits about it.
> 
> Changes since v2:
> * Moved headers to non-public API;
> * Added H265 capability for A64 and H5;
> * Moved docs to ext-ctrls-codec.rst;
> * Mentionned sections of the spec in the docs;
> * Added padding to control structures for 32-bit alignment;
> * Made write function use void/size in bytes;
> * Reduced the number of arguments to helpers when possible;
> * Removed PHYS_OFFSET since we already set PFN_OFFSET;
> * Added comments where suggested;
> * Moved to timestamp for references instead of index;
> * Fixed some style issues reported by checkpatch.
> 
> Changes since v1:
> * Added a H.265 capability to whitelist relevant platforms;
> * Switched over to tags instead of buffer indices in the DPB
> * Declared variable in their reduced scope as suggested;
> * Added the H.265/HEVC spec to the biblio;
> * Used in-doc references to the spec and the required APIs;
> * Removed debugging leftovers.
> 
> Cheers!
> 
> Paul Kocialkowski (4):
>   media: v4l2-ctrl: Add a comment on why we zero out compound controls
>     fields
>   media: v4l: Add definitions for the HEVC slice controls
>   media: pixfmt: Document the HEVC slice pixel format
>   media: cedrus: Add HEVC/H.265 decoding support
> 
>  Documentation/media/uapi/v4l/biblio.rst       |   9 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 486 +++++++++++++-
>  .../media/uapi/v4l/pixfmt-compressed.rst      |  21 +
>  .../media/uapi/v4l/vidioc-queryctrl.rst       |  18 +
>  .../media/videodev2.h.rst.exceptions          |   3 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  93 +++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  31 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  18 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   9 +
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 616 ++++++++++++++++++
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   4 +
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  | 271 ++++++++
>  .../staging/media/sunxi/cedrus/cedrus_video.c |  10 +
>  include/media/hevc-ctrls.h                    | 198 ++++++
>  include/media/v4l2-ctrls.h                    |   7 +
>  17 files changed, 1789 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>  create mode 100644 include/media/hevc-ctrls.h
> 

