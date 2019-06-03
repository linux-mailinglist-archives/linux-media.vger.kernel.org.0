Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4282E333AE
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 17:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbfFCPhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 11:37:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34860 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfFCPhQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 11:37:16 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BF040260A1E;
        Mon,  3 Jun 2019 16:37:13 +0100 (BST)
Date:   Mon, 3 Jun 2019 17:37:11 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RFC 2/6] media: uapi: h264: Add the concept of decoding
 mode
Message-ID: <20190603173711.716b96c4@collabora.com>
In-Reply-To: <20190603140526.GF30132@ulmo>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
        <20190603110946.4952-3-boris.brezillon@collabora.com>
        <20190603123020.GC30132@ulmo>
        <20190603145058.0c46febd@collabora.com>
        <20190603140526.GF30132@ulmo>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 3 Jun 2019 16:05:26 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Mon, Jun 03, 2019 at 02:51:13PM +0200, Boris Brezillon wrote:
> > +Maxime
> > 
> > Oops, just realized Maxime was not Cc-ed on this series.
> > 
> > On Mon, 3 Jun 2019 14:30:20 +0200
> > Thierry Reding <thierry.reding@gmail.com> wrote:
> >   
> > > On Mon, Jun 03, 2019 at 01:09:42PM +0200, Boris Brezillon wrote:  
> > > > Some stateless decoders don't support per-slice decoding (or at least
> > > > not in a way that would make them efficient or easy to use).
> > > > Let's expose a menu to control and expose the supported decoding modes.
> > > > Drivers are allowed to support only one decoding but they can support
> > > > both too.
> > > > 
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > ---
> > > >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 42 ++++++++++++++++++-
> > > >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
> > > >  include/media/h264-ctrls.h                    | 13 ++++++
> > > >  3 files changed, 63 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > index 82547d5de250..188f625acb7c 100644
> > > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > @@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > >      * - __u32
> > > >        - ``size``
> > > >        -
> > > > +    * - __u32
> > > > +      - ``start_byte_offset``
> > > > +      - Where the slice payload starts in the output buffer. Useful when
> > > > +        operating in per frame decoding mode and decoding multi-slice content.
> > > > +        In this case, the output buffer will contain more than one slice and
> > > > +        some codecs need to know where each slice starts. Note that this
> > > > +        offsets points to the beginning of the slice which is supposed to
> > > > +        contain an ANNEX B start code
> > > >      * - __u32
> > > >        - ``header_bit_size``
> > > >        -
> > > > @@ -1931,7 +1939,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > >        -
> > > >      * - __u16
> > > >        - ``num_slices``
> > > > -      - Number of slices needed to decode the current frame
> > > > +      - Number of slices needed to decode the current frame/field. When
> > > > +        operating in per-slice decoding mode (see
> > > > +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
> > > > +        should always be set to one
> > > >      * - __u16
> > > >        - ``nal_ref_idc``
> > > >        - NAL reference ID value coming from the NAL Unit header
> > > > @@ -2022,6 +2033,35 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > >        - 0x00000004
> > > >        - The DPB entry is a long term reference frame
> > > >  
> > > > +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> > > > +    Specifies the decoding mode to use. Currently exposes per slice and per
> > > > +    frame decoding but new modes might be added later on.
> > > > +
> > > > +    .. note::
> > > > +
> > > > +       This menu control is not yet part of the public kernel API and
> > > > +       it is expected to change.
> > > > +
> > > > +.. c:type:: v4l2_mpeg_video_h264_decoding_mode
> > > > +
> > > > +.. cssclass:: longtable
> > > > +
> > > > +.. flat-table::
> > > > +    :header-rows:  0
> > > > +    :stub-columns: 0
> > > > +    :widths:       1 1 2
> > > > +
> > > > +    * - ``V4L2_MPEG_VIDEO_H264_DECODING_PER_SLICE``
> > > > +      - 0
> > > > +      - The decoding is done per slice. v4l2_ctrl_h264_decode_params->num_slices
> > > > +        must be set to 1 and the output buffer should contain only one slice.    
> > > 
> > > I wonder if we need to be that strict. Wouldn't it be possible for
> > > drivers to just iterate over a number of slices and decode each in turn
> > > if userspace passed more than one?
> > > 
> > > Or perhaps a decoder can batch queue a couple of slices. I'm not sure
> > > how frequent this is, but consider something like a spike in activity on
> > > your system, causing some slices to get delayed so you actually get a
> > > few buffered up before you get a chance to hand them to the V4L2 device.
> > > Processing them all at once may help conceal the lag.  
> > 
> > Hm, so we'd be in some kind of slice-batch mode, which means we could
> > trigger a decode operation with more than one slice, but not
> > necessarily all the slices needed to decode a frame. TBH, supporting
> > per-frame (or the batch mode you suggest) on a HW that supports
> > per-slice decoding should be pretty simple and has not real impact on
> > perfs (as you said, it's just a matter of iterating over all the slices
> > attached to a decode operation), so I'm fine relaxing the rule here and
> > patching the cedrus driver accordingly (I can't really test the
> > changes though). Paul, Maxime, what's your opinion?  
> 
> We could perhaps have a test program to orchestrate such a scenario. I
> think the assumption should obviously still be that we don't cross the
> frame boundary using slices in one batch.

We should definitely forbid mixing slices of different frames in the
same decode operation, since each decode operation is targeting a
single capture buffer.

> Just that if a frame was made
> up of, say, 4 slices and you first pass 3 slices, then 1, that it'd be
> nice if the driver would be able to cope with that.

Yep, that makes sense.

> It's something that
> could probably even be implemented in the framework as a helper, though
> I suspect it'd be just a couple of lines of extra code to wrap a loop
> around everything.

I also thought about providing generic wrappers, both for this case and
the per-slice -> per-frame case (this one would be a bit more
complicated as it implies queuing slices in a bounce buffer and
triggering the decode operation only when we have all slices of a
frame).
