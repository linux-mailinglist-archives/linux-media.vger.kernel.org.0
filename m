Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED0522CE63
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 21:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgGXTId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 15:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXTIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 15:08:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F831C0619D3;
        Fri, 24 Jul 2020 12:08:32 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E3D5E2993B7
Message-ID: <6bac45d9b22deacf8ac7d68f5b51a5a6c30649f3.camel@collabora.com>
Subject: Re: [PATCH 06/10] media: uapi: h264: Cleanup DPB entry interface
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri, 24 Jul 2020 16:08:19 -0300
In-Reply-To: <5726fac8-9d3b-d429-0894-cd8c02c288ee@kwiboo.se>
References: <20200715202233.185680-1-ezequiel@collabora.com>
         <20200715202233.185680-7-ezequiel@collabora.com>
         <5726fac8-9d3b-d429-0894-cd8c02c288ee@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jonas,

On Wed, 2020-07-22 at 21:52 +0000, Jonas Karlman wrote:
> On 2020-07-15 22:22, Ezequiel Garcia wrote:
> > As discussed recently, the current interface for the
> > Decoded Picture Buffer is not enough to properly
> > support field coding.
> > 
> > This commit introduces enough semantics to support
> > frame and field coding, and to signal how DPB entries
> > are "used for reference".
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../media/v4l/ext-ctrls-codec.rst             | 46 ++++++++++++-------
> >  drivers/media/v4l2-core/v4l2-h264.c           |  4 +-
> >  drivers/staging/media/rkvdec/rkvdec-h264.c    |  8 ++--
> >  include/media/h264-ctrls.h                    |  8 +++-
> >  4 files changed, 42 insertions(+), 24 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index dd8e5a2e8986..46d4c8c6ad47 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -2058,10 +2058,35 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __s32
> >        - ``bottom_field_order_cnt``
> >        -
> > +    * - enum :c:type:`v4l2_h264_dpb_reference`
> > +      - ``reference``
> > +      - Specifies how the DPB entry is referenced.
> >      * - __u32
> >        - ``flags``
> >        - See :ref:`DPB Entry Flags <h264_dpb_flags>`
> >  
> > +.. c:type:: v4l2_h264_dpb_reference
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - ``V4L2_H264_DPB_TOP_REF``
> > +      - 0x1
> > +      - The top field in field pair is used for
> > +        short-term reference.
> > +    * - ``V4L2_H264_DPB_BOTTOM_REF``
> > +      - 0x2
> > +      - The bottom field in field pair is used for
> > +        short-term reference.
> > +    * - ``V4L2_H264_DPB_FRAME_REF``
> > +      - 0x3
> > +      - The frame (or the top/bottom fields, if it's a field pair)
> > +        is used for short-term reference.
> > +
> >  .. _h264_dpb_flags:
> >  
> >  ``DPB Entries Flags``
> > @@ -2075,29 +2100,16 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >  
> >      * - ``V4L2_H264_DPB_ENTRY_FLAG_VALID``
> >        - 0x00000001
> > -      - The DPB entry is valid and should be considered
> > +      - The DPB entry is valid (non-empty) and should be considered.
> >      * - ``V4L2_H264_DPB_ENTRY_FLAG_ACTIVE``
> >        - 0x00000002
> > -      - The DPB entry is currently being used as a reference frame
> > +      - The DPB entry is used for reference.
> >      * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
> >        - 0x00000004
> > -      - The DPB entry is a long term reference frame
> > +      - The DPB entry is used for long-term reference.
> >      * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD``
> >        - 0x00000008
> > -      - The DPB entry is a field reference, which means only one of the field
> > -        will be used when decoding the new frame/field. When not set the DPB
> > -        entry is a frame reference (both fields will be used). Note that this
> > -        flag does not say anything about the number of fields contained in the
> > -        reference frame, it just describes the one used to decode the new
> > -        field/frame
> > -    * - ``V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD``
> > -      - 0x00000010
> > -      - The DPB entry is a bottom field reference (only the bottom field of the
> > -        reference frame is needed to decode the new frame/field). Only valid if
> > -        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set. When
> > -        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set but
> > -        V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD is not, that means the
> > -        DPB entry is a top field reference
> > +      - The DPB entry is a single field or a complementary field pair.
> >  
> >  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
> >      Specifies the decoding mode to use. Currently exposes slice-based and
> > diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
> > index edf6225f0522..306a51683606 100644
> > --- a/drivers/media/v4l2-core/v4l2-h264.c
> > +++ b/drivers/media/v4l2-core/v4l2-h264.c
> > @@ -66,10 +66,10 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
> >  		else
> >  			b->refs[i].frame_num = dpb[i].frame_num;
> >  
> > -		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> > +		if (dpb[i].reference & V4L2_H264_DPB_FRAME_REF)
> 
> This looks wrong, should probably use ==,
> 
> dpb[i].reference == V4L2_H264_DPB_FRAME_REF
> 
> else this would match any reference value.
> 
> >  			pic_order_count = min(dpb[i].top_field_order_cnt,
> >  					      dpb[i].bottom_field_order_cnt);
> > -		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> > +		else if (dpb[i].reference & V4L2_H264_DPB_BOTTOM_REF)
> >  			pic_order_count = dpb[i].bottom_field_order_cnt;
> >  		else
> >  			pic_order_count = dpb[i].top_field_order_cnt;
> > diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > index 7b66e2743a4f..57539c630422 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > @@ -953,11 +953,11 @@ static void config_registers(struct rkvdec_ctx *ctx,
> >  			     RKVDEC_COLMV_USED_FLAG_REF;
> >  
> >  		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> > -			refer_addr |= RKVDEC_TOPFIELD_USED_REF |
> > -				      RKVDEC_BOTFIELD_USED_REF;
> > -		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> > +			refer_addr |= RKVDEC_FIELD_REF;
> > +
> > +		if (dpb[i].reference & V4L2_H264_DPB_TOP_REF)
> >  			refer_addr |= RKVDEC_BOTFIELD_USED_REF;
> > -		else
> > +		else if (dpb[i].reference & V4L2_H264_DPB_BOTTOM_REF)
> 
> This should probably be if and not else if, and BOTFIELD/TOPFIELD_USED_REF
> seems to be mixed up.
> 
> I have only taken a quick look so far, I will update ffmpeg and runtime test
> later this weekend, will get back with result and full review on Sunday evening.
> 

Thanks that would be useful.

However, keep in mind this series is specifically concerned
with the uAPI review.

This is not supposed to fix the field coded support, or anything
else in any driver.

IMO, at this stage, fixing drivers is somewhat lower priority
than discussing and stabilizing the uAPI.

Thanks,
Ezequiel


