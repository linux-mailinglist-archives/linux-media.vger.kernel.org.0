Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F00E20B95D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 21:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgFZTfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 15:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFZTfW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 15:35:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EE3C03E979;
        Fri, 26 Jun 2020 12:35:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 711962A1B94
Message-ID: <cefd138460ac7fa2918047418245ffb23c06dbd1.camel@collabora.com>
Subject: Re: [RFC 6/7] media: uapi: h264: Clean slice invariants syntax
 elements
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri, 26 Jun 2020 16:34:37 -0300
In-Reply-To: <ef31d7df42976eae4633f01ca9ce5d78a7804417.camel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
         <20200623182809.1375-7-ezequiel@collabora.com>
         <ef31d7df42976eae4633f01ca9ce5d78a7804417.camel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-06-25 at 11:05 -0400, Nicolas Dufresne wrote:
> Le mardi 23 juin 2020 à 15:28 -0300, Ezequiel Garcia a écrit :
> > The H.264 specification requires in its "Slice header semantics"
> > section that the following values shall be the same in all slice headers:
> > 
> >   pic_parameter_set_id
> >   frame_num
> >   field_pic_flag
> >   bottom_field_flag
> >   idr_pic_id
> >   pic_order_cnt_lsb
> >   delta_pic_order_cnt_bottom
> >   delta_pic_order_cnt[ 0 ]
> >   delta_pic_order_cnt[ 1 ]
> >   sp_for_switch_flag
> >   slice_group_change_cycle
> > 
> > and can therefore be moved to the per-frame decode parameters control.
> > 
> > Field 'pic_parameter_set_id' is simply removed in this case,
> > because the PPS control must currently contain the active PPS.
> > 
> > Syntax elements dec_ref_pic_marking() and those related
> > to pic order count, remain invariant as well, and therefore,
> > the fields dec_ref_pic_marking_bit_size and pic_order_cnt_bit_size
> > are also common to all slices.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> This looks good to me. Perhaps drivers that don't need the slice_params
> (hantro) should simply not implement it ?
> 

Yes, but let's keep that out of this series.

> Assuming this is/will be thoroughly tested by porting userspace code:
> 

Of course!
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 


Thanks,
Ezequiel

> > ---
> >  .../media/v4l/ext-ctrls-codec.rst             | 84 +++++++++----------
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  1 +
> >  drivers/media/v4l2-core/v4l2-h264.c           |  8 +-
> >  .../staging/media/hantro/hantro_g1_h264_dec.c | 21 +++--
> >  drivers/staging/media/hantro/hantro_h264.c    |  3 +-
> >  drivers/staging/media/rkvdec/rkvdec-h264.c    |  6 +-
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  9 +-
> >  include/media/h264-ctrls.h                    | 43 +++++-----
> >  include/media/v4l2-h264.h                     |  1 -
> >  9 files changed, 86 insertions(+), 90 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index 2c682f81aaad..24b30ff37d9a 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1781,44 +1781,12 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u8
> >        - ``slice_type``
> >        -
> > -    * - __u8
> > -      - ``pic_parameter_set_id``
> > -      -
> >      * - __u8
> >        - ``colour_plane_id``
> >        -
> >      * - __u8
> >        - ``redundant_pic_cnt``
> >        -
> > -    * - __u16
> > -      - ``frame_num``
> > -      -
> > -    * - __u16
> > -      - ``idr_pic_id``
> > -      -
> > -    * - __u16
> > -      - ``pic_order_cnt_lsb``
> > -      -
> > -    * - __s32
> > -      - ``delta_pic_order_cnt_bottom``
> > -      -
> > -    * - __s32
> > -      - ``delta_pic_order_cnt0``
> > -      -
> > -    * - __s32
> > -      - ``delta_pic_order_cnt1``
> > -      -
> > -    * - struct :c:type:`v4l2_h264_pred_weight_table`
> > -      - ``pred_weight_table``
> > -      -
> > -    * - __u32
> > -      - ``dec_ref_pic_marking_bit_size``
> > -      - Size in bits of the dec_ref_pic_marking() syntax element.
> > -    * - __u32
> > -      - ``pic_order_cnt_bit_size``
> > -      - Combined size in bits of the picture order count related syntax
> > -        elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
> > -        delta_pic_order_cnt0, and delta_pic_order_cnt1.
> >      * - __u8
> >        - ``cabac_init_idc``
> >        -
> > @@ -1845,8 +1813,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - ``num_ref_idx_l1_active_minus1``
> >        - If num_ref_idx_active_override_flag is not set, this field must be
> >          set to the value of num_ref_idx_l1_default_active_minus1.
> > -    * - __u32
> > -      - ``slice_group_change_cycle``
> > +    * - __u8
> > +      - ``reserved[5]``
> > +      - Applications and drivers must set this to zero.
> > +    * - struct :c:type:`v4l2_h264_pred_weight_table`
> > +      - ``pred_weight_table``
> >        -
> >      * - struct :c:type:`v4l2_h264_reference`
> >        - ``ref_pic_list0[32]``
> > @@ -1869,17 +1840,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      :stub-columns: 0
> >      :widths:       1 1 2
> >  
> > -    * - ``V4L2_H264_SLICE_FLAG_FIELD_PIC``
> > -      - 0x00000001
> > -      -
> > -    * - ``V4L2_H264_SLICE_FLAG_BOTTOM_FIELD``
> > -      - 0x00000002
> > -      -
> >      * - ``V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED``
> > -      - 0x00000004
> > +      - 0x00000001
> >        -
> >      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
> > -      - 0x00000008
> > +      - 0x00000002
> >        -
> >  
> >  ``Prediction Weight Table``
> > @@ -2011,6 +1976,35 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __s32
> >        - ``bottom_field_order_cnt``
> >        - Picture Order Count for the coded bottom field
> > +    * - __u16
> > +      - ``frame_num``
> > +      -
> > +    * - __u16
> > +      - ``idr_pic_id``
> > +      -
> > +    * - __u16
> > +      - ``pic_order_cnt_lsb``
> > +      -
> > +    * - __s32
> > +      - ``delta_pic_order_cnt_bottom``
> > +      -
> > +    * - __s32
> > +      - ``delta_pic_order_cnt0``
> > +      -
> > +    * - __s32
> > +      - ``delta_pic_order_cnt1``
> > +      -
> > +    * - __u32
> > +      - ``dec_ref_pic_marking_bit_size``
> > +      - Size in bits of the dec_ref_pic_marking() syntax element.
> > +    * - __u32
> > +      - ``pic_order_cnt_bit_size``
> > +      - Combined size in bits of the picture order count related syntax
> > +        elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
> > +        delta_pic_order_cnt0, and delta_pic_order_cnt1.
> > +    * - __u32
> > +      - ``slice_group_change_cycle``
> > +      -
> >      * - __u32
> >        - ``flags``
> >        - See :ref:`Decode Parameters Flags <h264_decode_params_flags>`
> > @@ -2029,6 +2023,12 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - ``V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC``
> >        - 0x00000001
> >        - That picture is an IDR picture
> > +    * - ``V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC``
> > +      - 0x00000002
> > +      -
> > +    * - ``V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD``
> > +      - 0x00000004
> > +      -
> >  
> >  .. c:type:: v4l2_h264_dpb_entry
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index 003333b6c7f7..a21f96c7d077 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -1812,6 +1812,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >  			zero_reserved(*ref0);
> >  			zero_reserved(*ref1);
> >  		}
> > +		zero_reserved(*p_h264_slice_params);
> >  		break;
> >  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> >  		p_h264_dec_params = p;
> > diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
> > index edf6225f0522..791d24e1b72f 100644
> > --- a/drivers/media/v4l2-core/v4l2-h264.c
> > +++ b/drivers/media/v4l2-core/v4l2-h264.c
> > @@ -18,14 +18,12 @@
> >   *
> >   * @b: the builder context to initialize
> >   * @dec_params: decode parameters control
> > - * @slice_params: first slice parameters control
> >   * @sps: SPS control
> >   * @dpb: DPB to use when creating the reference list
> >   */
> >  void
> >  v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
> >  		const struct v4l2_ctrl_h264_decode_params *dec_params,
> > -		const struct v4l2_ctrl_h264_slice_params *slice_params,
> >  		const struct v4l2_ctrl_h264_sps *sps,
> >  		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES])
> >  {
> > @@ -33,13 +31,13 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
> >  	unsigned int i;
> >  
> >  	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
> > -	cur_frame_num = slice_params->frame_num;
> > +	cur_frame_num = dec_params->frame_num;
> >  
> >  	memset(b, 0, sizeof(*b));
> > -	if (!(slice_params->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
> > +	if (!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC))
> >  		b->cur_pic_order_count = min(dec_params->bottom_field_order_cnt,
> >  					     dec_params->top_field_order_cnt);
> > -	else if (slice_params->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> > +	else if (dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
> >  		b->cur_pic_order_count = dec_params->bottom_field_order_cnt;
> >  	else
> >  		b->cur_pic_order_count = dec_params->top_field_order_cnt;
> > diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > index 424c648ce9fc..f9839e9c6da5 100644
> > --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> > @@ -23,7 +23,6 @@ static void set_params(struct hantro_ctx *ctx)
> >  {
> >  	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
> >  	const struct v4l2_ctrl_h264_decode_params *dec_param = ctrls->decode;
> > -	const struct v4l2_ctrl_h264_slice_params *slices = ctrls->slices;
> >  	const struct v4l2_ctrl_h264_sps *sps = ctrls->sps;
> >  	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
> >  	struct vb2_v4l2_buffer *src_buf = hantro_get_src_buf(ctx);
> > @@ -42,11 +41,11 @@ static void set_params(struct hantro_ctx *ctx)
> >  
> >  	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
> >  	    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD ||
> > -	     slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
> > +	     dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC))
> >  		reg |= G1_REG_DEC_CTRL0_PIC_INTERLACE_E;
> > -	if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> > +	if (dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC)
> >  		reg |= G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
> > -	if (!(slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD))
> > +	if (!(dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD))
> >  		reg |= G1_REG_DEC_CTRL0_PIC_TOPFIELD_E;
> >  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
> >  
> > @@ -75,7 +74,7 @@ static void set_params(struct hantro_ctx *ctx)
> >  
> >  	/* Decoder control register 4. */
> >  	reg = G1_REG_DEC_CTRL4_FRAMENUM_LEN(sps->log2_max_frame_num_minus4 + 4) |
> > -	      G1_REG_DEC_CTRL4_FRAMENUM(slices[0].frame_num) |
> > +	      G1_REG_DEC_CTRL4_FRAMENUM(dec_param->frame_num) |
> >  	      G1_REG_DEC_CTRL4_WEIGHT_BIPR_IDC(pps->weighted_bipred_idc);
> >  	if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)
> >  		reg |= G1_REG_DEC_CTRL4_CABAC_E;
> > @@ -88,8 +87,8 @@ static void set_params(struct hantro_ctx *ctx)
> >  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL4);
> >  
> >  	/* Decoder control register 5. */
> > -	reg = G1_REG_DEC_CTRL5_REFPIC_MK_LEN(slices[0].dec_ref_pic_marking_bit_size) |
> > -	      G1_REG_DEC_CTRL5_IDR_PIC_ID(slices[0].idr_pic_id);
> > +	reg = G1_REG_DEC_CTRL5_REFPIC_MK_LEN(dec_param->dec_ref_pic_marking_bit_size) |
> > +	      G1_REG_DEC_CTRL5_IDR_PIC_ID(dec_param->idr_pic_id);
> >  	if (pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED)
> >  		reg |= G1_REG_DEC_CTRL5_CONST_INTRA_E;
> >  	if (pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT)
> > @@ -103,10 +102,10 @@ static void set_params(struct hantro_ctx *ctx)
> >  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL5);
> >  
> >  	/* Decoder control register 6. */
> > -	reg = G1_REG_DEC_CTRL6_PPS_ID(slices[0].pic_parameter_set_id) |
> > +	reg = G1_REG_DEC_CTRL6_PPS_ID(pps->pic_parameter_set_id) |
> >  	      G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
> >  	      G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(pps->num_ref_idx_l1_default_active_minus1 + 1) |
> > -	      G1_REG_DEC_CTRL6_POC_LENGTH(slices[0].pic_order_cnt_bit_size);
> > +	      G1_REG_DEC_CTRL6_POC_LENGTH(dec_param->pic_order_cnt_bit_size);
> >  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL6);
> >  
> >  	/* Error concealment register. */
> > @@ -246,7 +245,7 @@ static void set_buffers(struct hantro_ctx *ctx)
> >  	/* Destination (decoded frame) buffer. */
> >  	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
> >  	/* Adjust dma addr to start at second line for bottom field */
> > -	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> > +	if (ctrls->decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
> >  		offset = ALIGN(ctx->src_fmt.width, MB_DIM);
> >  	vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DST);
> >  
> > @@ -265,7 +264,7 @@ static void set_buffers(struct hantro_ctx *ctx)
> >  		 * DMV buffer is split in two for field encoded frames,
> >  		 * adjust offset for bottom field
> >  		 */
> > -		if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> > +		if (ctrls->decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
> >  			offset += 32 * MB_WIDTH(ctx->src_fmt.width) *
> >  				  MB_HEIGHT(ctx->src_fmt.height);
> >  		vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DIR_MV);
> > diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> > index d561f125085a..9890ae7bf3bc 100644
> > --- a/drivers/staging/media/hantro/hantro_h264.c
> > +++ b/drivers/staging/media/hantro/hantro_h264.c
> > @@ -374,8 +374,7 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
> >  
> >  	/* Build the P/B{0,1} ref lists. */
> >  	v4l2_h264_init_reflist_builder(&reflist_builder, ctrls->decode,
> > -				       &ctrls->slices[0], ctrls->sps,
> > -				       ctx->h264_dec.dpb);
> > +				       ctrls->sps, ctx->h264_dec.dpb);
> >  	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
> >  	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
> >  				    h264_ctx->reflists.b1);
> > diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > index 7b66e2743a4f..0f5d519528d8 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > @@ -730,7 +730,6 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> >  			    struct rkvdec_h264_run *run)
> >  {
> >  	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
> > -	const struct v4l2_ctrl_h264_slice_params *sl_params = &run->slices_params[0];
> >  	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
> >  	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
> >  	const struct v4l2_ctrl_h264_sps *sps = run->sps;
> > @@ -754,7 +753,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> >  			continue;
> >  
> >  		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
> > -		    dpb[i].frame_num < sl_params->frame_num) {
> > +		    dpb[i].frame_num < dec_params->frame_num) {
> >  			p[i] = dpb[i].frame_num;
> >  			continue;
> >  		}
> > @@ -1093,8 +1092,7 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> >  
> >  	/* Build the P/B{0,1} ref lists. */
> >  	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
> > -				       &run.slices_params[0], run.sps,
> > -				       run.decode_params->dpb);
> > +				       run.sps, run.decode_params->dpb);
> >  	h264_ctx->reflists.num_valid = reflist_builder.num_valid;
> >  	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
> >  	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > index cce527bbdf86..e7387315253d 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -95,7 +95,6 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
> >  {
> >  	struct cedrus_h264_sram_ref_pic pic_list[CEDRUS_H264_FRAME_NUM];
> >  	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
> > -	const struct v4l2_ctrl_h264_slice_params *slice = run->h264.slice_params;
> >  	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
> >  	struct vb2_queue *cap_q;
> >  	struct cedrus_buffer *output_buf;
> > @@ -144,7 +143,7 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
> >  	output_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
> >  	output_buf->codec.h264.position = position;
> >  
> > -	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> > +	if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC)
> >  		output_buf->codec.h264.pic_type = CEDRUS_H264_PIC_TYPE_FIELD;
> >  	else if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
> >  		output_buf->codec.h264.pic_type = CEDRUS_H264_PIC_TYPE_MBAFF;
> > @@ -414,7 +413,7 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
> >  		reg |= VE_H264_SPS_DIRECT_8X8_INFERENCE;
> >  	cedrus_write(dev, VE_H264_SPS, reg);
> >  
> > -	mbaff_pic = !(slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) &&
> > +	mbaff_pic = !(decode->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC) &&
> >  		    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
> >  	pic_width_in_mbs = sps->pic_width_in_mbs_minus1 + 1;
> >  
> > @@ -428,9 +427,9 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
> >  	reg |= slice->cabac_init_idc & 0x3;
> >  	if (ctx->fh.m2m_ctx->new_frame)
> >  		reg |= VE_H264_SHS_FIRST_SLICE_IN_PIC;
> > -	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> > +	if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC)
> >  		reg |= VE_H264_SHS_FIELD_PIC;
> > -	if (slice->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> > +	if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
> >  		reg |= VE_H264_SHS_BOTTOM_FIELD;
> >  	if (slice->flags & V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED)
> >  		reg |= VE_H264_SHS_DIRECT_SPATIAL_MV_PRED;
> > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > index 4119dc4486f3..6446ec9f283d 100644
> > --- a/include/media/h264-ctrls.h
> > +++ b/include/media/h264-ctrls.h
> > @@ -138,10 +138,8 @@ struct v4l2_h264_pred_weight_table {
> >  #define V4L2_H264_SLICE_TYPE_SP				3
> >  #define V4L2_H264_SLICE_TYPE_SI				4
> >  
> > -#define V4L2_H264_SLICE_FLAG_FIELD_PIC			0x01
> > -#define V4L2_H264_SLICE_FLAG_BOTTOM_FIELD		0x02
> > -#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
> > -#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
> > +#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x01
> > +#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x02
> >  
> >  #define V4L2_H264_REFERENCE_FLAG_TOP_FIELD		0x01
> >  #define V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD		0x02
> > @@ -165,22 +163,8 @@ struct v4l2_ctrl_h264_slice_params {
> >  	__u32 first_mb_in_slice;
> >  
> >  	__u8 slice_type;
> > -	__u8 pic_parameter_set_id;
> >  	__u8 colour_plane_id;
> >  	__u8 redundant_pic_cnt;
> > -	__u16 frame_num;
> > -	__u16 idr_pic_id;
> > -	__u16 pic_order_cnt_lsb;
> > -	__s32 delta_pic_order_cnt_bottom;
> > -	__s32 delta_pic_order_cnt0;
> > -	__s32 delta_pic_order_cnt1;
> > -
> > -	struct v4l2_h264_pred_weight_table pred_weight_table;
> > -	/* Size in bits of dec_ref_pic_marking() syntax element. */
> > -	__u32 dec_ref_pic_marking_bit_size;
> > -	/* Size in bits of pic order count syntax. */
> > -	__u32 pic_order_cnt_bit_size;
> > -
> >  	__u8 cabac_init_idc;
> >  	__s8 slice_qp_delta;
> >  	__s8 slice_qs_delta;
> > @@ -189,7 +173,9 @@ struct v4l2_ctrl_h264_slice_params {
> >  	__s8 slice_beta_offset_div2;
> >  	__u8 num_ref_idx_l0_active_minus1;
> >  	__u8 num_ref_idx_l1_active_minus1;
> > -	__u32 slice_group_change_cycle;
> > +	__u8 reserved[5];
> > +
> > +	struct v4l2_h264_pred_weight_table pred_weight_table;
> >  
> >  	/*
> >  	 * Entries on each list are indices into
> > @@ -218,7 +204,9 @@ struct v4l2_h264_dpb_entry {
> >  	__u32 flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
> >  };
> >  
> > -#define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC	0x01
> > +#define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
> > +#define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
> > +#define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
> >  
> >  struct v4l2_ctrl_h264_decode_params {
> >  	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
> > @@ -226,6 +214,21 @@ struct v4l2_ctrl_h264_decode_params {
> >  	__u16 nal_ref_idc;
> >  	__s32 top_field_order_cnt;
> >  	__s32 bottom_field_order_cnt;
> > +
> > +	__u16 frame_num;
> > +	__u16 idr_pic_id;
> > +	__u16 reserved;
> > +
> > +	__u16 pic_order_cnt_lsb;
> > +	__s32 delta_pic_order_cnt_bottom;
> > +	__s32 delta_pic_order_cnt0;
> > +	__s32 delta_pic_order_cnt1;
> > +	/* Size in bits of dec_ref_pic_marking() syntax element. */
> > +	__u32 dec_ref_pic_marking_bit_size;
> > +	/* Size in bits of pic order count syntax. */
> > +	__u32 pic_order_cnt_bit_size;
> > +	__u32 slice_group_change_cycle;
> > +
> >  	__u32 flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
> >  };
> >  
> > diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
> > index 1a5f26fc2a9a..f08ba181263d 100644
> > --- a/include/media/v4l2-h264.h
> > +++ b/include/media/v4l2-h264.h
> > @@ -44,7 +44,6 @@ struct v4l2_h264_reflist_builder {
> >  void
> >  v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
> >  		const struct v4l2_ctrl_h264_decode_params *dec_params,
> > -		const struct v4l2_ctrl_h264_slice_params *slice_params,
> >  		const struct v4l2_ctrl_h264_sps *sps,
> >  		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]);
> >  


