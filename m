Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 397B41EBD6
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 12:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfEOKJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 06:09:51 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:55763 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfEOKJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 06:09:50 -0400
X-Originating-IP: 90.88.161.46
Received: from aptenodytes (aaubervilliers-681-1-43-46.w90-88.abo.wanadoo.fr [90.88.161.46])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 39108FF80A;
        Wed, 15 May 2019 10:09:46 +0000 (UTC)
Message-ID: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
Subject: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Wed, 15 May 2019 12:09:45 +0200
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

With the Rockchip stateless VPU driver in the works, we now have a
better idea of what the situation is like on platforms other than
Allwinner. This email shares my conclusions about the situation and how
we should update the MPEG-2, H.264 and H.265 controls accordingly.

- Per-slice decoding

We've discussed this one already[0] and Hans has submitted a patch[1]
to implement the required core bits. When we agree it looks good, we
should lift the restriction that all slices must be concatenated and
have them submitted as individual requests.

One question is what to do about other controls. I feel like it would
make sense to always pass all the required controls for decoding the
slice, including the ones that don't change across slices. But there
may be no particular advantage to this and only downsides. Not doing it
and relying on the "control cache" can work, but we need to specify
that only a single stream can be decoded per opened instance of the
v4l2 device. This is the assumption we're going with for handling
multi-slice anyway, so it shouldn't be an issue.

- Annex-B formats

I don't think we have really reached a conclusion on the pixel formats
we want to expose. The main issue is how to deal with codecs that need
the full slice NALU with start code, where the slice_header is
duplicated in raw bitstream, when others are fine with just the encoded
slice data and the parsed slice header control.

My initial thinking was that we'd need 3 formats:
- One that only takes only the slice compressed data (without raw slice
header and start code);
- One that takes both the NALU data (including start code, raw header
and compressed data) and slice header controls;
- One that takes the NALU data but no slice header.

But I no longer think the latter really makes sense in the context of
stateless video decoding.

A side-note: I think we should definitely have data offsets in every
case, so that implementations can just push the whole NALU regardless
of the format if they're lazy.

- Dropping the DPB concept in H.264/H.265

As far as I could understand, the decoded picture buffer (DPB) is a
concept that only makes sense relative to a decoder implementation. The
spec mentions how to manage it with the Hypothetical reference decoder
(Annex C), but that's about it.

What's really in the bitstream is the list of modified short-term and
long-term references, which is enough for every decoder.

For this reason, I strongly believe we should stop talking about DPB in
the controls and just pass these lists agremented with relevant
information for userspace.

I think it should be up to the driver to maintain a DPB and we could
have helpers for common cases. For instance, the rockchip decoder needs
to keep unused entries around[2] and cedrus has the same requirement
for H.264. However for cedrus/H.265, we don't need to do any book-
keeping in particular and can manage with the lists from the bitstream
directly.

- Using flags

The current MPEG-2 controls have lots of u8 values that can be
represented as flags. Using flags also helps with padding.
It's unlikely that we'll get more than 64 flags, so using a u64 by
default for that sounds fine (we definitely do want to keep some room
available and I don't think using 32 bits as a default is good enough).

I think H.264/HEVC per-control flags should also be moved to u64.

- Clear split of controls and terminology

Some codecs have explicit NAL units that are good fits to match as
controls: e.g. slice header, pps, sps. I think we should stick to the
bitstream element names for those.

For H.264, that would suggest the following changes:
- renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
- killing v4l2_ctrl_h264_decode_param and having the reference lists
where they belong, which seems to be slice_header;

I'm up for preparing and submitting these control changes and updating
cedrus if they seem agreeable.

What do you think?

Cheers,

Paul

[0]: https://lkml.org/lkml/2019/3/6/82
[1]: https://patchwork.linuxtv.org/patch/55947/
[2]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/4d7cb46539a93bb6acc802f5a46acddb5aaab378

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

