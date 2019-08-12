Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79D0C89D74
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfHLL7P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:59:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56380 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfHLL7O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:59:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8F78728AC52
Message-ID: <1d1ff6c5943c462f38235e4b003eff5ab65dbbd0.camel@collabora.com>
Subject: Re: [PATCH v4 03/11] media: uapi: h264: Add the concept of decoding
 mode
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
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
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Mon, 12 Aug 2019 08:59:02 -0300
In-Reply-To: <e8895d5f-af65-5ee8-665b-b9d4abd681bc@xs4all.nl>
References: <20190808103432.12062-1-ezequiel@collabora.com>
         <20190808103432.12062-4-ezequiel@collabora.com>
         <e8895d5f-af65-5ee8-665b-b9d4abd681bc@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-08-12 at 12:19 +0200, Hans Verkuil wrote:
> On 8/8/19 12:34 PM, Ezequiel Garcia wrote:
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
> > ---
> > Changes in v4:
> > * Typos/rewording fixes
> > 
> > Changes in v3:
> > * s/per-{slice,frame} decoding/{slice,frame}-based decoding/
> > * Add Paul's R-b
> > 
> > Changes in v2:
> > * Allow decoding multiple slices in per-slice decoding mode
> > * Minor doc improvement/fixes
> > ---
> >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 43 ++++++++++++++++++-
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
> >  include/media/h264-ctrls.h                    | 11 +++++
> >  3 files changed, 62 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index c5f39dd50043..ea0455957149 100644
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
> >      * - __u16
> >        - ``nal_ref_idc``
> >        - NAL reference ID value coming from the NAL Unit header
> > @@ -2021,6 +2029,39 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - 0x00000004
> >        - The DPB entry is a long term reference frame
> >  
> > +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> > +    Specifies the decoding mode to use. Currently exposes slice-based and
> > +    frame-based decoding but new modes might be added later on.
> > +    Drivers may expose a single or multiple decoding modes,
> > +    depending on what they can support.
> 
> This should mention that this is valid for V4L2_PIX_FMT_H264_SLICE pixelformat
> only. And it is a required control (i.e. it must always be present for that
> pixelformat). Ditto for the start code control.
> 
> Also, the V4L2_PIX_FMT_H264_SLICE should refer to this control and the start
> code control as well since these controls effectively are modifiers for the
> pixelformat.
> 

Right, this makes perfect sense.

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
> 
> Actually, I wonder if there shouldn't be a third option: FIELD_BASED_DECODING
> to indicate that the hardware expects the slices of a single field in a buffer
> instead of both fields.
> 
> Or just stick to FRAME_BASED_DECODING for now but explicitly mention that
> in the case of interlaced decoding both fields must be present in the buffer.
> 

OK.

> A FIELD_BASED_DECODING option can always be added later if necessary.
> 

Thanks,
Ezequiel

