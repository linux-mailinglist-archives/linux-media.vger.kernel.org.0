Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 497DE9018D
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 14:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfHPM30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 08:29:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47932 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbfHPM30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 08:29:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3C8FC26127B
Message-ID: <3c7d72f3ae3a4235cd818a051ee0265ac123bdc1.camel@collabora.com>
Subject: Re: [PATCH v6 03/11] media: uapi: h264: Add the concept of decoding
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
Date:   Fri, 16 Aug 2019 09:29:13 -0300
In-Reply-To: <38911c55-3ca7-4fd8-d10e-34f48a5a2851@xs4all.nl>
References: <20190814195931.6587-1-ezequiel@collabora.com>
         <20190814195931.6587-4-ezequiel@collabora.com>
         <38911c55-3ca7-4fd8-d10e-34f48a5a2851@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-08-16 at 09:34 +0200, Hans Verkuil wrote:
> On 8/14/19 9:59 PM, Ezequiel Garcia wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Some stateless decoders don't support per-slice decoding granularity
> > (or at least not in a way that would make them efficient or easy to use).
> > 
> > Expose a menu to control the supported decoding modes. Drivers are
> > allowed to support only one decoding but they can support both too.
> 
> The commit message doesn't say anything about the start_byte_offset
> addition and the num_slices documentation improvement. It probably
> should.
> 

Yes, of course.

> See more comments below:
> 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > Changes in v6:
> > * Fix spec, specifiying the decode-mode pixelformat modifier
> >   needs to be set once, as suggested by Hans.
> > * Rename, as suggested by Paul.
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
> >  .../media/uapi/v4l/pixfmt-compressed.rst      |  6 ++-
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
> >  include/media/h264-ctrls.h                    | 10 ++++
> >  4 files changed, 69 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index c5f39dd50043..623b34f61b32 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -1747,6 +1747,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u32
> >        - ``size``
> >        -
> > +    * - __u32
> > +      - ``start_byte_offset``
> > +        Offset (in bytes) from the beginning of the OUTPUT buffer to the start
> > +        of the slice. If the slice starts with a start code, then this is the
> > +        offset to such start code.
> 
> This should mention that it should be set to 0 for SLICE_BASED decoding mode.
> 

Right.

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
> > +        :c:type:`v4l2_mpeg_video_h264_decode_mode`), this field
> > +        should always be set to one.
> >      * - __u16
> >        - ``nal_ref_idc``
> >        - NAL reference ID value coming from the NAL Unit header
> > @@ -2021,6 +2029,43 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - 0x00000004
> >        - The DPB entry is a long term reference frame
> >  
> > +``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
> > +    Specifies the decoding mode to use. Currently exposes slice-based and
> > +    frame-based decoding but new modes might be added later on.
> > +    This control is used as a modifier for V4L2_PIX_FMT_H264_SLICE
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
> > +.. c:type:: v4l2_mpeg_video_h264_decode_mode
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED``
> > +      - 0
> > +      - Decoding is done at the slice granularity.
> > +        v4l2_ctrl_h264_decode_params->num_slices should be set to 1.
> 
> And start_byte_offset should be set to 0.
> 

OK.

> > +        The OUTPUT buffer must contain a single slice.
> > +    * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED``
> > +      - 1
> > +      - Decoding is done at the frame granularity.
> > +        v4l2_ctrl_h264_decode_params->num_slices should be set to the number of
> > +        slices forming a frame.
> 
> And start_byte_offset should be filled in accordingly for each slice.
> 

OK.

Thanks,
Ezequiel

