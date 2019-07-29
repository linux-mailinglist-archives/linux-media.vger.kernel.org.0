Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B25678C61
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 15:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387965AbfG2NMe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 09:12:34 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:33277 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbfG2NMe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 09:12:34 -0400
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2EC75240004;
        Mon, 29 Jul 2019 13:12:30 +0000 (UTC)
Date:   Mon, 29 Jul 2019 15:12:29 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 02/14] videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
Message-ID: <20190729131229.GB24269@aptenodytes>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
 <20190724110523.29248-3-hverkuil-cisco@xs4all.nl>
 <20190727093745.GB16618@aptenodytes>
 <CAAFQd5CTcvyOe6_gETcdyvxVE6NaWmQwrgpWbTu5so_-FLYWtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAFQd5CTcvyOe6_gETcdyvxVE6NaWmQwrgpWbTu5so_-FLYWtA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sun 28 Jul 19, 23:05, Tomasz Figa wrote:
> On Sat, Jul 27, 2019 at 6:37 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi,
> >
> > On Wed 24 Jul 19, 13:05, Hans Verkuil wrote:
> > > Add an enum_fmt format flag to specifically tag coded formats where
> > > full bitstream parsing is supported by the device.
> > >
> > > Some stateful decoders are capable of fully parsing a bitstream,
> > > but others require that userspace pre-parses the bitstream into
> > > frames or fields (see the corresponding pixelformat descriptions
> > > for details).
> > >
> > > If this flag is set, then this pre-parsing step is not required
> > > (but still possible, of course).
> > >
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > ---
> > >  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
> > >  Documentation/media/videodev2.h.rst.exceptions   | 1 +
> > >  include/uapi/linux/videodev2.h                   | 5 +++--
> > >  3 files changed, 12 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > index 822d6730e7d2..4e24e671f32e 100644
> > > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
> > >        - This format is not native to the device but emulated through
> > >       software (usually libv4l2), where possible try to use a native
> > >       format instead for better performance.
> > > +    * - ``V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER``
> > > +      - 0x0004
> > > +      - The hardware decoder for this compressed bitstream format (aka coded
> > > +     format) is capable of parsing the bitstream. Applications do not
> > > +     need to parse the bitstream themselves to find the boundaries between
> > > +     frames/fields. This flag can only be used in combination with the
> > > +     ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
> > > +     formats only.
> >
> > Should this flag be set for stateless codecs as well? It seems a bit over-kill
> > for this case. I am not sure whether "compressed bitstream format" clearly only
> > covers the formats used by stateful decoders and not the ones for stateless
> > decoders.
> 
> I'd suggest using a different name for the flag, because "bitstream
> parser" is actually one of the core differences between stateful and
> stateless. All stateful decoders have bitstream parsers, the only
> difference between the implementations is the unit on which the parser
> operates, i.e. full stream, frame, NALU.
> 
> Perhaps V4L2_FMT_FLAG_CONTINUOUS_BITSTREAM (as opposed to discrete,
> framed/sliced chunks)?

Sure, that seems like a more explicit name regarding what it's supposed to
describe in my opinion.

> Regardless of that, it doesn't make sense for a stateless decoder to
> set this flag anyway, because the userspace needs to parse the whole
> stream anyway and the whole stateless API is based on the assumption
> that the userspace splits the bitstream into frames (or slices).

Indeed, I agree that it doesn't make sense, but I thought that the name of the
flag could be confusing. Since there is no direct equivalency between
"stateless" and "doesn't parse the bitstream" (as we've seen with the rockchip
decoder needing to parse the slice header on its own), that could have been
ambiguous. I think the name you're suggesting mostly solves this concern.

I'm still a bit unsure about what "compressed formats" entails or not, so it
could be good to explicitly mention that this applies to stateful decoders only
(but it's just a suggestion, advanced users of the API will probably find it
straightforward).

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
