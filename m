Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1FED8D59E
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 16:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfHNOIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 10:08:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54958 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfHNOIp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 10:08:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B007B28A214
Message-ID: <48aa33392e81cc5b3a0a7eed403ecb91c89ac320.camel@collabora.com>
Subject: Re: [PATCH v5 03/11] media: uapi: h264: Add the concept of decoding
 mode
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Wed, 14 Aug 2019 11:08:31 -0300
In-Reply-To: <20190814122323.GC4687@aptenodytes>
References: <20190812193522.10911-1-ezequiel@collabora.com>
         <20190812193522.10911-4-ezequiel@collabora.com>
         <20190814122323.GC4687@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-08-14 at 14:23 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Mon 12 Aug 19, 16:35, Ezequiel Garcia wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Some stateless decoders don't support per-slice decoding granularity
> > (or at least not in a way that would make them efficient or easy to use).
> > 
> > Expose a menu to control the supported decoding modes. Drivers are
> > allowed to support only one decoding but they can support both too.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > Changes in v5:
> > * Improve specification as suggested by Hans.
> > Changes in v4:
> > * Typos/rewording fixes
> > Changes in v3:
> > * s/per-{slice,frame} decoding/{slice,frame}-based decoding/
> > * Add Paul's R-b
> > Changes in v2:
> > * Allow decoding multiple slices in per-slice decoding mode
> > * Minor doc improvement/fixes
> > ---
> >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 47 ++++++++++++++++++-
> >  .../media/uapi/v4l/pixfmt-compressed.rst      |  3 +-
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
> >  include/media/h264-ctrls.h                    | 11 +++++
> >  4 files changed, 68 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index c5f39dd50043..568390273fde 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -1747,6 +1747,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u32
> >        - ``size``
> >        -
> > +    * - __u32
> > +      - ``start_byte_offset``
> > +      - Where the slice payload starts in the output buffer. Useful when the
> > +        OUTPUT buffer contains more than one slice (some codecs need to know
> > +        where each slice starts in this buffer).
> 
> I think there is a possibility for misunderstanding here: does the
> "slice payload" include the start code when it (annex-b) is selected?
> 
> I'd suspect that the hardware needs to know where the start code begings rather
> than where the NAL unit starts when there is a start code. So I'd suggest
> specifying it as the offset to the beginning of the start code (if present) or
> to the slice NAL unit start otherwise.
> 

Yes, start_byte_offset is the offset in bytes from the beginning
of the OUTPUT buffer to the start of this slice (which may start
with a start code as per the start code control).

I guess the field could be named simply "offset", but at the same
time, this is bikeshedding.

> The clarification should probably also concern header_bit_size, to make it clear
> where it is counted from. I think it makes sense to count it starting from
> the start_byte_offset position.
> 

The header_bit_size is currently counted from the start of slice.
It seems this needs to be better documented, but not necessarily
as part of this patch.

> >      * - __u32
> >        - ``header_bit_size``
> >        -
> > @@ -1930,7 +1935,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        -
> >      * - __u16
> >        - ``num_slices``
> > -      - Number of slices needed to decode the current frame
> > +      - Number of slices needed to decode the current frame/field. When
> > +        operating in slice-based decoding mode (see
> > +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
> > +        should always be set to one.
> 
> I am fine with the current proposal for now, but I believe that we should keep
> discussing whether we want per-slice mode to strictly enforce having a
> single-slice, outside of this series.
> 

Sounds good.

> One reason for that would be to gather multiple slices (up to what amounts to
> a frame) for efficient use of OUTPUT buffers and to avoid allocating a huge
> number of small ones (which is certainly quite inefficient due to CMA
> alignment).
> 
> Apparently, passing multiple slice_params controls is an issue so per-frame mode
> currently has to rely on the hardware being able to parse the slice header on
> its own. The issue exists in the V4L2 API, where we need to know in advance
> the maximum number of slices we want to use to make the control an array and
> copy all the controls with each request, even if only a single-one is used.
> 
> Maybe one way to solve that would be to use multiple requests with the same
> OUTPUT buffer, one per slice, so that we only have to pass a single slice_params
> control per-request. And the first slice of the frame would get the other
> controls too, while the others wouldn't (assuming we can trust that controls
> won't change in-between and I'm not sure how true that is). Worst case, all
> the controls have to be attached with each request, which is maybe still better
> than passing a big number of unused slice_params controls each time.
> 
> Again, I believe the current proposal is good to go for now as it allows the
> hantro driver to get-in staging, which is the priority.
> 
> But the issue I'm discussing should certainly be fixed before unstaging the API.
> 

Totally, I think the next step is to add multi-slice support to the cedrus
driver. It will help consolidate the API.

> >      * - __u16
> >        - ``nal_ref_idc``
> >        - NAL reference ID value coming from the NAL Unit header
> > @@ -2021,6 +2029,43 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - 0x00000004
> >        - The DPB entry is a long term reference frame
> >  
> > +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> > +    Specifies the decoding mode to use. Currently exposes slice-based and
> > +    frame-based decoding but new modes might be added later on.
> > +    This control is used to complement V4L2_PIX_FMT_H264_SLICE
> > +    pixel format. Applications that support V4L2_PIX_FMT_H264_SLICE
> > +    are required to set this control in order to specify the decoding mode
> > +    that is expected for the buffer.
> > +    Drivers may expose a single or multiple decoding modes, depending
> > +    on what they can support.
> > +
> > +    .. note::
> > +
> > +       This menu control is not yet part of the public kernel API and
> > +       it is expected to change.
> > +
> > +.. c:type:: v4l2_mpeg_video_h264_decoding_mode
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - ``V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING``
> > +      - 0
> > +      - The decoding is done at the slice granularity.
> > +        v4l2_ctrl_h264_decode_params->num_slices should be set to 1.
> > +        The OUTPUT buffer must contain a single slice.
> > +    * - ``V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING``
> > +      - 1
> > +      - The decoding is done at the frame granularity.
> > +        v4l2_ctrl_h264_decode_params->num_slices should be set to the number of
> > +        slices forming a frame.
> > +        The OUTPUT buffer must contain all slices needed to decode the
> > +        frame. The OUTPUT buffer must also contain both fields.
> > +
> 
> Nitpick/suggestion here: could we use the name of the enum as a prefix for the
> modes, like:
> - V4L2_MPEG_VIDEO_H264_DECODING_MODE_PER_SLICE
> - V4L2_MPEG_VIDEO_H264_DECODING_MODE_PER_FRAME
> 
> or
> - V4L2_MPEG_VIDEO_H264_DECODING_MODE_SLICE_BASED
> - V4L2_MPEG_VIDEO_H264_DECODING_MODE_FRAME_BASED
> 
> I personally find it more readable this way, since the same prefix is kept.
> 

Yes, that looks better.

Thanks for reviewing,
Ezequiel

