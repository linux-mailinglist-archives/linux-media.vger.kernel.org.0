Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497FE23EF16
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 16:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgHGOdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 10:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgHGOdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 10:33:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A11CC061756;
        Fri,  7 Aug 2020 07:33:32 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 549B4299B0A
Message-ID: <4112aad8ad439fe5b46192e7540e91da4ae8a557.camel@collabora.com>
Subject: Re: [PATCH v2 01/14] media: uapi: h264: Update reference lists
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Fri, 07 Aug 2020 11:33:17 -0300
In-Reply-To: <20200806154707.GA1621078@aptenodytes>
References: <20200806151310.98624-1-ezequiel@collabora.com>
         <20200806151310.98624-2-ezequiel@collabora.com>
         <20200806154707.GA1621078@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-08-06 at 17:47 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Thu 06 Aug 20, 12:12, Ezequiel Garcia wrote:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > 
> > When dealing with with interlaced frames, reference lists must tell if
> > each particular reference is meant for top or bottom field. This info
> > is currently not provided at all in the H264 related controls.
> > 
> > Make reference lists hold a structure which will also hold an
> > enumerator type along index into DPB array. The enumerator must
> > be used to specify if reference is for top or bottom field.
> > 
> > Currently the only user of these lists is Cedrus which is just compile
> > fixed here. Actual usage of will come in a following commit.
> 
> Is there a particular reason we are adding this to the ref_pic_list[0-1]
> instead of the DPB entries directly?
> 

I actually asked the same question to Jernej's original series.

Given the references are per-field, which is why there are twice
as many references as DPB entries, the semantics proposed here
are required for slice-based decoders.

See Nicolas' reply:

https://www.spinics.net/lists/arm-kernel/msg812277.html

As Jernej's already reply, this is required to fix Cedrus.

Thanks!
Ezequiel

> Cheers,
> 
> Paul
> 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> > v2:
> > * As pointed out by Jonas, enum v4l2_h264_dpb_reference here.
> > ---
> >  .../media/v4l/ext-ctrls-codec.rst             | 44 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
> >  include/media/h264-ctrls.h                    | 23 +++++++---
> >  3 files changed, 62 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index d0d506a444b1..f2b2a381369f 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1843,10 +1843,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u32
> >        - ``slice_group_change_cycle``
> >        -
> > -    * - __u8
> > +    * - struct :c:type:`v4l2_h264_reference`
> >        - ``ref_pic_list0[32]``
> >        - Reference picture list after applying the per-slice modifications
> > -    * - __u8
> > +    * - struct :c:type:`v4l2_h264_reference`
> >        - ``ref_pic_list1[32]``
> >        - Reference picture list after applying the per-slice modifications
> >      * - __u32
> > @@ -1926,6 +1926,46 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - ``chroma_offset[32][2]``
> >        -
> >  
> > +``Picture Reference``
> > +
> > +.. c:type:: v4l2_h264_reference
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table:: struct v4l2_h264_reference
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - enum :c:type:`v4l2_h264_dpb_reference`
> > +      - ``reference``
> > +      - Specifies how the DPB entry is referenced.
> > +    * - __u8
> > +      - ``index``
> > +      - Index into the :c:type:`v4l2_ctrl_h264_decode_params`.dpb array.
> > +
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
> > +     - The bottom field in field pair is used for
> > +        short-term reference.
> > +    * - ``V4L2_H264_DPB_FRAME_REF``
> > +      - 0x3
> > +      - The frame (or the top/bottom fields, if it's a field pair)
> > +        is used for short-term reference.
> > +
> >  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
> >      Specifies the decode parameters (as extracted from the bitstream)
> >      for the associated H264 slice data. This includes the necessary
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > index 54ee2aa423e2..cce527bbdf86 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -166,8 +166,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
> >  
> >  static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> >  				   struct cedrus_run *run,
> > -				   const u8 *ref_list, u8 num_ref,
> > -				   enum cedrus_h264_sram_off sram)
> > +				   const struct v4l2_h264_reference *ref_list,
> > +				   u8 num_ref, enum cedrus_h264_sram_off sram)
> >  {
> >  	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
> >  	struct vb2_queue *cap_q;
> > @@ -188,7 +188,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> >  		int buf_idx;
> >  		u8 dpb_idx;
> >  
> > -		dpb_idx = ref_list[i];
> > +		dpb_idx = ref_list[i].index;
> >  		dpb = &decode->dpb[dpb_idx];
> >  
> >  		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > index 080fd1293c42..4c0bb7f5fb05 100644
> > --- a/include/media/h264-ctrls.h
> > +++ b/include/media/h264-ctrls.h
> > @@ -19,6 +19,8 @@
> >   */
> >  #define V4L2_H264_NUM_DPB_ENTRIES 16
> >  
> > +#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
> > +
> >  /* Our pixel format isn't stable at the moment */
> >  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
> >  
> > @@ -140,6 +142,19 @@ struct v4l2_h264_pred_weight_table {
> >  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
> >  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
> >  
> > +enum v4l2_h264_dpb_reference {
> > +	V4L2_H264_DPB_TOP_REF = 0x1,
> > +	V4L2_H264_DPB_BOTTOM_REF = 0x2,
> > +	V4L2_H264_DPB_FRAME_REF = 0x3,
> > +};
> > +
> > +struct v4l2_h264_reference {
> > +	enum v4l2_h264_dpb_reference fields;
> > +
> > +	/* Index into v4l2_ctrl_h264_decode_params.dpb[] */
> > +	__u8 index;
> > +};
> > +
> >  struct v4l2_ctrl_h264_slice_params {
> >  	/* Size in bytes, including header */
> >  	__u32 size;
> > @@ -178,12 +193,8 @@ struct v4l2_ctrl_h264_slice_params {
> >  	__u8 num_ref_idx_l1_active_minus1;
> >  	__u32 slice_group_change_cycle;
> >  
> > -	/*
> > -	 * Entries on each list are indices into
> > -	 * v4l2_ctrl_h264_decode_params.dpb[].
> > -	 */
> > -	__u8 ref_pic_list0[32];
> > -	__u8 ref_pic_list1[32];
> > +	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN];
> > +	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN];
> >  
> >  	__u32 flags;
> >  };
> > -- 
> > 2.27.0
> > 


