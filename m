Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3920824B1C5
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 11:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgHTJMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 05:12:53 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44675 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725834AbgHTJMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 05:12:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8gcpkFSRoywL58gcqkZ61l; Thu, 20 Aug 2020 11:12:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597914768; bh=aXI2/6QEiinjBXcX2u69fj7TFQ5IZXG2FvHF5Y8k7f8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AjZdStg814c0S3MYTLeC/A8UxTsmH3fCMDL5kvwIjw/8xnwEMTbIddTg5C1k4tluH
         0+wRy+7iMTcU7y+IIWTpdl1oegMkxF9lV+WsWZBCKG3jeTCV0GuGxS+eotOvbQf1xc
         lUxOhAxKWuycHKOixgQh0BxillRlF6LVSHqDpZ5K1IueUanWVRTwNOgp9zsWTys53D
         hXAzf3DX3Z7br3tcpWi6PkxUk3E312PbAztGw/PKBXYEwFyYsZZPQvxjpMNX+NVzmf
         g34TigYZHQaRCesA+sj/raT9hpHFE7pjnIY8kxNr3kcbvM/w0gmEQFhnoC2gE1o+5l
         7l57zTS+uXJSg==
Subject: Re: [PATCH v3 06/19] media: uapi: h264: Clean DPB entry interface
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20200814133634.95665-1-ezequiel@collabora.com>
 <20200814133634.95665-7-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3de270f8-b248-977b-fc14-56d9e2ed05e2@xs4all.nl>
Date:   Thu, 20 Aug 2020 11:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814133634.95665-7-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB52LwPAMGQLXyp8ZoNriEzVLyAmR06KbczdgRQP6Nnk8IBae/KS7hcDJHNbpJPz3U4r3K6WYmL8ae1HfkNeHcH/7Ye9gmzOwLmGuo/YgUYJVvQp/wMX
 fMtNa2zY4n6cybCFryXEfoogR0zOVA/zJlniKooxVtV7mc2mGy3Kw7VrCmDeHJmJu6iDA2QGbhXnhaSH9+4oNwjDTbhYbOGtYEtixiNRNZ8Fxw5JIEELuiJo
 x05Kp+iJCUy2bY7GJBwHkOMskA02yU4xRcBvnrNWtl89BLPbcJAaP3tlHAfzxG/0+Wr5LpJIKJA4h4+rkAqq/cLYh5Rm3heQuFkPIEow8qPXqcqLGr3MH0tQ
 nTvKm+Gph0Yddf4RdZ0ABY5k00TC08T2ilRm2huqY95Ou1ZZvjabeNuZBAeD68aSlHFIsvne6Tr1m9TL3MnAsxJLerwhSSvdXdfcfqIas66WQ5EvHdNo4PxY
 rWUILyyLTK++7UK0LdD6OgxHiVD7iDtpTJw+FGze0ABZrRqbt4zog87+GWaDxrPSNZnGp+pTufPibb9/ghCvSDUITrwUPqE4kNzWnGHaynPeAT3nF8xMl4DJ
 kv5Sfene59ikUKe5GuWsV/DlEUFUymFLaw5q7/Kre9Zw/OMXOIqMJAu0NzK1leF/Q7JSsJSsKJ2nUi6YTQlfDtImqHnzAlBroS7O3tJYnn8qTQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/08/2020 15:36, Ezequiel Garcia wrote:
> As discussed recently, the current interface for the
> Decoded Picture Buffer is not enough to properly
> support field coding.
> 
> This commit introduces enough semantics to support
> frame and field coding, and to signal how DPB entries
> are "used for reference".
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v3:
> * Port to renamed types.
> v2:
> * Fix rkvdec usage of fields flags as noted by Jonas.
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 24 ++++++-------------
>  drivers/media/v4l2-core/v4l2-h264.c           |  4 ++--
>  drivers/staging/media/rkvdec/rkvdec-h264.c    | 17 ++++++-------
>  include/media/h264-ctrls.h                    |  2 +-
>  4 files changed, 19 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 714a8d9ae6a0..d14da8325382 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2063,6 +2063,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __s32
>        - ``bottom_field_order_cnt``
>        -
> +    * - enum :c:type:`v4l2_h264_field_reference`
> +      - ``reference``
> +      - Specifies how the DPB entry is referenced.
>      * - __u32
>        - ``flags``
>        - See :ref:`DPB Entry Flags <h264_dpb_flags>`
> @@ -2080,29 +2083,16 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>  
>      * - ``V4L2_H264_DPB_ENTRY_FLAG_VALID``
>        - 0x00000001
> -      - The DPB entry is valid and should be considered
> +      - The DPB entry is valid (non-empty) and should be considered.
>      * - ``V4L2_H264_DPB_ENTRY_FLAG_ACTIVE``
>        - 0x00000002
> -      - The DPB entry is currently being used as a reference frame
> +      - The DPB entry is used for reference.
>      * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
>        - 0x00000004
> -      - The DPB entry is a long term reference frame
> +      - The DPB entry is used for long-term reference.
>      * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD``
>        - 0x00000008
> -      - The DPB entry is a field reference, which means only one of the field
> -        will be used when decoding the new frame/field. When not set the DPB
> -        entry is a frame reference (both fields will be used). Note that this
> -        flag does not say anything about the number of fields contained in the
> -        reference frame, it just describes the one used to decode the new
> -        field/frame
> -    * - ``V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD``
> -      - 0x00000010
> -      - The DPB entry is a bottom field reference (only the bottom field of the
> -        reference frame is needed to decode the new frame/field). Only valid if
> -        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set. When
> -        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set but
> -        V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD is not, that means the
> -        DPB entry is a top field reference
> +      - The DPB entry is a single field or a complementary field pair.
>  
>  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
>      Specifies the decoding mode to use. Currently exposes slice-based and
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
> index edf6225f0522..12b751c09016 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -66,10 +66,10 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
>  		else
>  			b->refs[i].frame_num = dpb[i].frame_num;
>  
> -		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> +		if (dpb[i].reference == V4L2_H264_FRAME_REF)
>  			pic_order_count = min(dpb[i].top_field_order_cnt,
>  					      dpb[i].bottom_field_order_cnt);
> -		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> +		else if (dpb[i].reference & V4L2_H264_BOTTOM_FIELD_REF)
>  			pic_order_count = dpb[i].bottom_field_order_cnt;
>  		else
>  			pic_order_count = dpb[i].top_field_order_cnt;
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 7b66e2743a4f..07a80e9a9df2 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -949,16 +949,17 @@ static void config_registers(struct rkvdec_ctx *ctx,
>  	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
>  		struct vb2_buffer *vb_buf = get_ref_buf(ctx, run, i);
>  
> -		refer_addr = vb2_dma_contig_plane_dma_addr(vb_buf, 0) |
> -			     RKVDEC_COLMV_USED_FLAG_REF;
> +		refer_addr = vb2_dma_contig_plane_dma_addr(vb_buf, 0);
>  
> -		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> -			refer_addr |= RKVDEC_TOPFIELD_USED_REF |
> -				      RKVDEC_BOTFIELD_USED_REF;
> -		else if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> -			refer_addr |= RKVDEC_BOTFIELD_USED_REF;
> -		else
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> +			refer_addr |= RKVDEC_COLMV_USED_FLAG_REF;
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)
> +			refer_addr |= RKVDEC_FIELD_REF;
> +
> +		if (dpb[i].reference & V4L2_H264_TOP_FIELD_REF)
>  			refer_addr |= RKVDEC_TOPFIELD_USED_REF;
> +		if (dpb[i].reference & V4L2_H264_BOTTOM_FIELD_REF)
> +			refer_addr |= RKVDEC_BOTFIELD_USED_REF;
>  
>  		writel_relaxed(dpb[i].top_field_order_cnt,
>  			       rkvdec->regs +  poc_reg_tbl_top_field[i]);
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 9ff085fdc9ab..4447697e9465 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -212,7 +212,6 @@ struct v4l2_ctrl_h264_slice_params {
>  #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
>  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
>  #define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
> -#define V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD	0x10
>  
>  struct v4l2_h264_dpb_entry {
>  	__u64 reference_ts;
> @@ -221,6 +220,7 @@ struct v4l2_h264_dpb_entry {
>  	/* Note that field is indicated by v4l2_buffer.field */
>  	__s32 top_field_order_cnt;
>  	__s32 bottom_field_order_cnt;
> +	enum v4l2_h264_field_reference reference;

Here it is called 'references', but the same enum field in struct v4l2_h264_reference
is called 'fields' there. It's a good idea to use the same names.

Regards,

	Hans

>  	__u32 flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
>  };
>  
> 

