Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F2523DF91
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbgHFRt2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 6 Aug 2020 13:49:28 -0400
Received: from mailoutvs34.siol.net ([185.57.226.225]:44784 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728137AbgHFQeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:34:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9F3E5524534;
        Thu,  6 Aug 2020 17:54:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gggXxBQX4zcq; Thu,  6 Aug 2020 17:54:23 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id F2B9652457D;
        Thu,  6 Aug 2020 17:54:22 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-58-148.static.triera.net [86.58.58.148])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 16B02524534;
        Thu,  6 Aug 2020 17:54:22 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 01/14] media: uapi: h264: Update reference lists
Date:   Thu, 06 Aug 2020 17:54:21 +0200
Message-ID: <3517723.C3QgaYJNcI@jernej-laptop>
In-Reply-To: <20200806154707.GA1621078@aptenodytes>
References: <20200806151310.98624-1-ezequiel@collabora.com> <20200806151310.98624-2-ezequiel@collabora.com> <20200806154707.GA1621078@aptenodytes>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne četrtek, 06. avgust 2020 ob 17:47:07 CEST je Paul Kocialkowski napisal(a):
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

Yes, it is.

> 
> It feels nicer to avoid making the lists structs when the entries they are
> referring to are already in a struct. I think this is the approach Kwiboo
> took when adding support for fields in references some time ago.
> 
> What do you think?

It's different thing. I tried using that, but image wasn't decoded correctly. 
IMO this is also the same reason why VAAPI doesn't have indices to DPB and 
instead have full VAPictureH264 structure array for RefPicList0 and 
RefPicList1. VAAPI has also note here "/* See 8.2.4.2 */" but I need to check 
it...

Best regards,
Jernej 

> 
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
> > 
> >  .../media/v4l/ext-ctrls-codec.rst             | 44 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
> >  include/media/h264-ctrls.h                    | 23 +++++++---
> >  3 files changed, 62 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst index
> > d0d506a444b1..f2b2a381369f 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1843,10 +1843,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type
> > -> 
> >      * - __u32
> >      
> >        - ``slice_group_change_cycle``
> >        -
> > 
> > -    * - __u8
> > +    * - struct :c:type:`v4l2_h264_reference`
> > 
> >        - ``ref_pic_list0[32]``
> >        - Reference picture list after applying the per-slice modifications
> > 
> > -    * - __u8
> > +    * - struct :c:type:`v4l2_h264_reference`
> > 
> >        - ``ref_pic_list1[32]``
> >        - Reference picture list after applying the per-slice modifications
> >      
> >      * - __u32
> > 
> > @@ -1926,6 +1926,46 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type
> > -
> > 
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
> > 
> >  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
> >  
> >      Specifies the decode parameters (as extracted from the bitstream)
> >      for the associated H264 slice data. This includes the necessary
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> > 54ee2aa423e2..cce527bbdf86 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -166,8 +166,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx
> > *ctx,> 
> >  static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> >  
> >  				   struct cedrus_run *run,
> > 
> > -				   const u8 *ref_list, u8 
num_ref,
> > -				   enum cedrus_h264_sram_off sram)
> > +				   const struct 
v4l2_h264_reference *ref_list,
> > +				   u8 num_ref, enum 
cedrus_h264_sram_off sram)
> > 
> >  {
> >  
> >  	const struct v4l2_ctrl_h264_decode_params *decode =
> >  	run->h264.decode_params; struct vb2_queue *cap_q;
> > 
> > @@ -188,7 +188,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx
> > *ctx,> 
> >  		int buf_idx;
> >  		u8 dpb_idx;
> > 
> > -		dpb_idx = ref_list[i];
> > +		dpb_idx = ref_list[i].index;
> > 
> >  		dpb = &decode->dpb[dpb_idx];
> >  		
> >  		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > 
> > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > index 080fd1293c42..4c0bb7f5fb05 100644
> > --- a/include/media/h264-ctrls.h
> > +++ b/include/media/h264-ctrls.h
> > @@ -19,6 +19,8 @@
> > 
> >   */
> >  
> >  #define V4L2_H264_NUM_DPB_ENTRIES 16
> > 
> > +#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
> > +
> > 
> >  /* Our pixel format isn't stable at the moment */
> >  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264
> >  parsed slices */> 
> > @@ -140,6 +142,19 @@ struct v4l2_h264_pred_weight_table {
> > 
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
> > 
> >  struct v4l2_ctrl_h264_slice_params {
> >  
> >  	/* Size in bytes, including header */
> >  	__u32 size;
> > 
> > @@ -178,12 +193,8 @@ struct v4l2_ctrl_h264_slice_params {
> > 
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
> >  
> >  };




