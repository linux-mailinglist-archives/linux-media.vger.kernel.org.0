Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5159856D9A
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 17:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfFZP0f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 11:26:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37650 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfFZP0f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 11:26:35 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D76C628528D;
        Wed, 26 Jun 2019 16:26:32 +0100 (BST)
Date:   Wed, 26 Jun 2019 17:26:29 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/3] media: uapi: h264: Add the concept of decoding
 mode
Message-ID: <20190626172629.51f6c572@collabora.com>
In-Reply-To: <b8212cca2e824c199b439bc7fb1c235693d79cbd.camel@bootlin.com>
References: <20190610085250.3255-1-boris.brezillon@collabora.com>
        <20190610085250.3255-3-boris.brezillon@collabora.com>
        <b8212cca2e824c199b439bc7fb1c235693d79cbd.camel@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 26 Jun 2019 13:30:38 +0200
Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:

> Hi,
> 
> On Mon, 2019-06-10 at 10:52 +0200, Boris Brezillon wrote:
> > Some stateless decoders don't support per-slice decoding (or at least
> > not in a way that would make them efficient or easy to use).
> > Let's expose a menu to control and expose the supported decoding modes.
> > Drivers are allowed to support only one decoding but they can support
> > both too.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v2:
> > * Allow decoding multiple slices in per-slice decoding mode
> > * Minor doc improvement/fixes
> > ---
> >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 46 ++++++++++++++++++-
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
> >  include/media/h264-ctrls.h                    | 13 ++++++
> >  3 files changed, 67 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index 82547d5de250..e3b9ab73a588 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u32
> >        - ``size``
> >        -
> > +    * - __u32
> > +      - ``start_byte_offset``
> > +      - Where the slice payload starts in the output buffer. Useful when
> > +        operating in per frame decoding mode and decoding multi-slice content.
> > +        In this case, the output buffer will contain more than one slice and
> > +        some codecs need to know where each slice starts. Note that this
> > +        offsets points to the beginning of the slice which is supposed to
> > +        contain an ANNEX B start code.
> >      * - __u32
> >        - ``header_bit_size``
> >        -
> > @@ -1931,7 +1939,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        -
> >      * - __u16
> >        - ``num_slices``
> > -      - Number of slices needed to decode the current frame
> > +      - Number of slices attached to decode the operation. When operating in
> > +        per-frame decoding mode (see
> > +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field should
> > +        be set to the number of slices needed to fully decode the frame. When
> > +        operating in per-slice decoding mode this field can be set to anything
> > +        between 1 and the remaining number of slices needed to fully decode the
> > +        frame.
> >      * - __u16
> >        - ``nal_ref_idc``
> >        - NAL reference ID value coming from the NAL Unit header
> > @@ -2022,6 +2036,36 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - 0x00000004
> >        - The DPB entry is a long term reference frame
> >  
> > +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> > +    Specifies the decoding mode to use. Currently exposes per slice and per
> > +    frame decoding but new modes might be added later on.  
> 
> I would maybe formulate this as slice-based and frame-based decoding
> since I feel like per-slice implies that slices have to be passed one-
> by-one. This wouldn't be the case with the latest proposal for slice-
> based decoding, where more than one slice can be passed at a time.
> 
> About that, I'm wondering how we could handle that in our drivers.
> It will probably be something like:
> 
> device_run -+-> decode slice i -> IRQ -+-> job_finish
>             `----------- i++ ----------'
> 
> And I'm wondering if there could be common helpers to help implement
> this, if that's needed at all.

Yep, we could probably have that kind of helper. I haven't had time to
work on the generic m2m stateless codec layer since last time we talked
about it on IRC, but I plan to resume working on this task soon. I'll
try to think about this generic "decode all slices" helper once the
basic building blocks are ready.

> 
> What do you think?
> 
> Anyway if you agree with the rewording, this is:

I'm perfectly fine with the suggested rewording.

> 
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks for the review.

Boris
