Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FFC240641
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 14:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgHJM52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 08:57:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46126 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgHJM52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 08:57:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9FC9528BDB3
Message-ID: <8cf55169fa1dd55b5bdf746b321419f8c7988821.camel@collabora.com>
Subject: Re: [PATCH v2 03/14] media: uapi: h264: Split prediction weight
 parameters
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Mon, 10 Aug 2020 09:57:17 -0300
In-Reply-To: <2380739.qXQpHEDp1t@jernej-laptop>
References: <20200806151310.98624-1-ezequiel@collabora.com>
         <ae2ac4ba-9272-ec67-d075-3429bc8926c3@kwiboo.se>
         <CAAEAJfAGW6M1YPQhPqdvpYugWk+RRTNOQbKfSWrnw_A8M2k=EA@mail.gmail.com>
         <2380739.qXQpHEDp1t@jernej-laptop>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 2020-08-09 at 23:11 +0200, Jernej Škrabec wrote:
> Dne nedelja, 09. avgust 2020 ob 15:55:50 CEST je Ezequiel Garcia napisal(a):
> > On Sat, 8 Aug 2020 at 18:01, Jonas Karlman <jonas@kwiboo.se> wrote:
> > > On 2020-08-06 17:12, Ezequiel Garcia wrote:
> > > > The prediction weight parameters are only required under
> > > > certain conditions, which depend on slice header parameters.
> > > > 
> > > > As specified in section 7.3.3 Slice header syntax, the prediction
> > > > weight table is present if:
> > > > 
> > > > ((weighted_pred_flag && (slice_type == P || slice_type == SP)) || \
> > > > (weighted_bipred_idc == 1 && slice_type == B))
> > > 
> > > Maybe a macro can be added to help check this contition?
> > > 
> > > Something like this maybe:
> > > 
> > > #define V4L2_H264_CTRL_PRED_WEIGHTS_REQUIRED(pps, slice) \
> > > 
> > >         ((((pps)->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) && \
> > >         
> > >          ((slice)->slice_type == V4L2_H264_SLICE_TYPE_P || \
> > >          
> > >            (slice)->slice_type == V4L2_H264_SLICE_TYPE_SP)) || \
> > >          
> > >          ((pps)->weighted_bipred_idc == 1 && \
> > >          
> > >           (slice)->slice_type == V4L2_H264_SLICE_TYPE_B))
> > 
> > Yeah, that could make sense.
> > 
> > Note that the biggest value in having the prediction weight table
> > separated is to allow  applications to skip setting this largish control,
> > reducing the amount of data that needs to be passed from userspace
> > -- especially when not needed :-)
> > 
> > > > Given its size, it makes sense to move this table to its control,
> > > > so applications can avoid passing it if the slice doesn't specify it.
> > > > 
> > > > Before this change struct v4l2_ctrl_h264_slice_params was 960 bytes.
> > > > With this change, it's 188 bytes and struct v4l2_ctrl_h264_pred_weight
> > > > is 772 bytes.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > ---
> > > > v2: Fix missing Cedrus changes and mssing control declaration,
> > > > 
> > > >     as noted by Hans and Jernej.
> > > > 
> > > > ---
> > > > 
> > > >  .../media/v4l/ext-ctrls-codec.rst             | 19 ++++++++++++-------
> > > >  drivers/media/v4l2-core/v4l2-ctrls.c          |  8 ++++++++
> > > >  drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 +++++++
> > > >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
> > > >  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 ++
> > > >  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 ++----
> > > >  include/media/h264-ctrls.h                    |  5 +++--
> > > >  include/media/v4l2-ctrls.h                    |  2 ++
> > > >  8 files changed, 37 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst index
> > > > d1438b1e259f..c36ce5a95fc5 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > @@ -1879,18 +1879,23 @@ enum
> > > > v4l2_mpeg_video_h264_hierarchical_coding_type -> > 
> > > >        - 0x00000008
> > > >        -
> > > > 
> > > > -``Prediction Weight Table``
> > > > +``V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS (struct)``
> > > > +    Prediction weight table defined according to :ref:`h264`,
> > > > +    section 7.4.3.2 "Prediction Weight Table Semantics".
> > > > +    The prediction weight table must be passed by applications
> > > > +    under the conditions explained in section 7.3.3 "Slice header
> > > > +    syntax".
> > > > 
> > > > -    The bitstream parameters are defined according to :ref:`h264`,
> > > > -    section 7.4.3.2 "Prediction Weight Table Semantics". For further
> > > > -    documentation, refer to the above specification, unless there is
> > > > -    an explicit comment stating otherwise.
> > > > +    .. note::
> > > > +
> > > > +       This compound control is not yet part of the public kernel API
> > > > and
> > > > +       it is expected to change.
> > > > 
> > > > -.. c:type:: v4l2_h264_pred_weight_table
> > > > +.. c:type:: v4l2_ctrl_h264_pred_weights
> > > > 
> > > >  .. cssclass:: longtable
> > > > 
> > > > -.. flat-table:: struct v4l2_h264_pred_weight_table
> > > > +.. flat-table:: struct v4l2_ctrl_h264_pred_weights
> > > > 
> > > >      :header-rows:  0
> > > >      :stub-columns: 0
> > > >      :widths:       1 1 2
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > b/drivers/media/v4l2-core/v4l2-ctrls.c index 3f3fbcd60cc6..76c8dc8fb31c
> > > > 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > @@ -897,6 +897,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > > 
> > > >       case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:            return
> > > >       "H264 Decode Parameters"; case
> > > >       V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:              return "H264
> > > >       Decode Mode"; case V4L2_CID_MPEG_VIDEO_H264_START_CODE:          
> > > >           return "H264 Start Code";> > 
> > > > +     case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:             return
> > > > "H264 Prediction Weight Table";> > 
> > > >       case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:                   return
> > > >       "MPEG2 Level"; case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:           
> > > >            return "MPEG2 Profile"; case
> > > >       V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:              return "MPEG4
> > > >       I-Frame QP Value";> > 
> > > > @@ -1412,6 +1413,9 @@ void v4l2_ctrl_fill(u32 id, const char **name,
> > > > enum v4l2_ctrl_type *type,> > 
> > > >       case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
> > > >               *type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
> > > >               break;
> > > > 
> > > > +     case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:
> > > > +             *type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
> > > > +             break;
> > > > 
> > > >       case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
> > > >               *type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
> > > >               break;
> > > > 
> > > > @@ -1790,6 +1794,7 @@ static int std_validate_compound(const struct
> > > > v4l2_ctrl *ctrl, u32 idx,> > 
> > > >       case V4L2_CTRL_TYPE_H264_SPS:
> > > >       case V4L2_CTRL_TYPE_H264_PPS:
> > > > 
> > > >       case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> > > > +     case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
> > > >       case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
> > > >       
> > > >       case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> > > >               break;
> > > > 
> > > > @@ -2553,6 +2558,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct
> > > > v4l2_ctrl_handler *hdl,> > 
> > > >       case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> > > >               elem_size = sizeof(struct v4l2_ctrl_h264_decode_params);
> > > >               break;
> > > > 
> > > > +     case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
> > > > +             elem_size = sizeof(struct v4l2_ctrl_h264_pred_weights);
> > > > +             break;
> > > > 
> > > >       case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> > > >               elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
> > > >               break;
> > > > 
> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > > b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> > > > bc27f9430eeb..027cdd1be5a0 100644
> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > > @@ -78,6 +78,13 @@ static const struct cedrus_control cedrus_controls[]
> > > > = {
> > > > 
> > > >               .codec          = CEDRUS_CODEC_H264,
> > > >               .required       = true,
> > > >       
> > > >       },
> > > > 
> > > > +     {
> > > > +             .cfg = {
> > > > +                     .id     = V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS,
> > > > +             },
> > > > +             .codec          = CEDRUS_CODEC_H264,
> > > > +             .required       = true,
> > > 
> > > This should probably be false if this control is to be optional as implied
> > > by the commit message.
> > 
> > Well, the control is optional if the driver implements it as optional,
> > which Cedrus isn't currently doing :-)
> 
> Why do you think so? Prediction weights are filled only when they are 
> needed:https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/
> sunxi/cedrus/cedrus_h264.c#L370
> 

Right, but that should be changed to be really optional.
How does the driver reject/fail the request if the table is NULL?

In any case, I don't think it's necessarily something we need
to tackle now.

Thanks,
Ezequiel

