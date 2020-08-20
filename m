Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A85324B1C3
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 11:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgHTJLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 05:11:52 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56033 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726364AbgHTJLp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 05:11:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8gblkFRmeywL58gbmkZ5pf; Thu, 20 Aug 2020 11:11:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597914702; bh=U7xBLcM2J0jpHAEK5uZYaH2c1oV3hUq9xBqu8R3Xk5s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LaaXzekvbv04aXLJUi0eJAG8g7ODXfUELwhFsahrBUUuM8RZsp582BjyuPOu3E9V4
         Q9K/quCO7BiIStMa3WS24eFIxfSpStTQSooqgIacXM07Rmn+1KgfQLZgjDyBvSmVqj
         64T77nOLZ0rnpi6qbwnTAIR0eI9Sb28u2hyCv6yLSVYpG8ba6aLVqT5u44QfsE2irn
         mSpcZyUFZePb7FEQ3wuyqJ1g9j5fc+VamCqtIKg9uRZ1kljhrVyxoCHCSkKLixPwPF
         yR/jrCV8Z7jHRJQVDX7g18mlv5cusaAxpIp1m+X0Q/cpkrjvtpA+jCv6deCLxt+wB5
         AlL+djRYrd/eA==
Subject: Re: [PATCH v3 01/19] media: uapi: h264: Update reference lists
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
 <20200814133634.95665-2-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f00e299f-8ed2-6dcf-211f-0545e13438aa@xs4all.nl>
Date:   Thu, 20 Aug 2020 11:11:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814133634.95665-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAjTqbisxxfuHqWvIRIOhnI8MK49adN3g+IHofEpheCosvb8sv3BNbTYJN7+/spl3+u2qEBz4tvjmIyx1P5HxD3b59gnrjvS2FVBX1bfCxNPMszZDk11
 IbnXH6nPsnEdkBrjcm5wzfwkoX0Wv5K58gSAbYgode3aK6TDgznTDFK4itsJRmZ8FGlfta9h/oejjldypeAkLvnGoxglyGvzY8YkyUZg8sBbDzn0uYC73Sna
 dcOfWCKoeT8Uj+h+/RyMTpMok3zlGhDqZ6lyQwp9QAHX0+0WXHkDSQvHxdecTV70yNwzPn0rmAF3RCQbOqTCgRZdtlRe/kAbDH+IhrI8zd3BRhl0xxV7m1zR
 idjJl3/NowOJf/drEWEy0nwphqv2jgeP4rDJNZd5J0APqfwIlm+A6rGuYce5fykr8olAAQgkP0T/kh7a4sKCqH+TaHRSH2NfRSeQMWveeKqcyzLPpHrcX2eo
 o7DGoXmx5l1ssB0RJYMBg5u6MroIzPymTaNSkLzREaaOhQGhgNa1R2/NreKZwXKmkVDuwh1brqmYI8mGyZchOPl8qo5+eQ2Rc8llKrSgDT39lYuEVOldUY1A
 P57e48XWqPvxMNfr9xo9L/1Ghsm+VFNJibxkp+MqJdCaB8BLC9ueO+AV1LKPkuYp8HQibWCAOSL9m/nKk0RmkN+Vk9k5m8kMlXZrt9YHMZPpYw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/08/2020 15:36, Ezequiel Garcia wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> When dealing with with interlaced frames, reference lists must tell if
> each particular reference is meant for top or bottom field. This info
> is currently not provided at all in the H264 related controls.
> 
> Make reference lists hold a structure which will also hold an
> enumerator type along index into DPB array. The enumerator must
> be used to specify if reference is for top or bottom field.
> 
> Currently the only user of these lists is Cedrus which is just compile
> fixed here. Actual usage of will come in a following commit.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v3:
> * Rename to avoid mentioning the DPB.
> v2:
> * As pointed out by Jonas, enum v4l2_h264_dpb_reference here.
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 44 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
>  include/media/h264-ctrls.h                    | 23 +++++++---
>  3 files changed, 62 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..b9b2617c3bda 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1843,10 +1843,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u32
>        - ``slice_group_change_cycle``
>        -
> -    * - __u8
> +    * - struct :c:type:`v4l2_h264_reference`
>        - ``ref_pic_list0[32]``
>        - Reference picture list after applying the per-slice modifications
> -    * - __u8
> +    * - struct :c:type:`v4l2_h264_reference`
>        - ``ref_pic_list1[32]``
>        - Reference picture list after applying the per-slice modifications
>      * - __u32
> @@ -1926,6 +1926,46 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - ``chroma_offset[32][2]``
>        -
>  
> +``Picture Reference``
> +
> +.. c:type:: v4l2_h264_reference
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_h264_reference
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - enum :c:type:`v4l2_h264_field_reference`
> +      - ``reference``
> +      - Specifies how the picture is referenced.
> +    * - __u8
> +      - ``index``
> +      - Index into the :c:type:`v4l2_ctrl_h264_decode_params`.dpb array.
> +
> +.. c:type:: v4l2_h264_field_reference
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_H264_TOP_FIELD_REF``
> +      - 0x1
> +      - The top field in field pair is used for
> +        short-term reference.
> +    * - ``V4L2_H264_BOTTOM_FIELD_REF``
> +      - 0x2
> +     - The bottom field in field pair is used for
> +        short-term reference.
> +    * - ``V4L2_H264_FRAME_REF``
> +      - 0x3
> +      - The frame (or the top/bottom fields, if it's a field pair)
> +        is used for short-term reference.
> +
>  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
>      Specifies the decode parameters (as extracted from the bitstream)
>      for the associated H264 slice data. This includes the necessary
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index 54ee2aa423e2..cce527bbdf86 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -166,8 +166,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
>  
>  static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>  				   struct cedrus_run *run,
> -				   const u8 *ref_list, u8 num_ref,
> -				   enum cedrus_h264_sram_off sram)
> +				   const struct v4l2_h264_reference *ref_list,
> +				   u8 num_ref, enum cedrus_h264_sram_off sram)
>  {
>  	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
>  	struct vb2_queue *cap_q;
> @@ -188,7 +188,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>  		int buf_idx;
>  		u8 dpb_idx;
>  
> -		dpb_idx = ref_list[i];
> +		dpb_idx = ref_list[i].index;
>  		dpb = &decode->dpb[dpb_idx];
>  
>  		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 080fd1293c42..5f635e8d25e2 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -19,6 +19,8 @@
>   */
>  #define V4L2_H264_NUM_DPB_ENTRIES 16
>  
> +#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
> +
>  /* Our pixel format isn't stable at the moment */
>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>  
> @@ -140,6 +142,19 @@ struct v4l2_h264_pred_weight_table {
>  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
>  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
>  
> +enum v4l2_h264_field_reference {
> +	V4L2_H264_TOP_FIELD_REF = 0x1,
> +	V4L2_H264_BOTTOM_FIELD_REF = 0x2,
> +	V4L2_H264_FRAME_REF = 0x3,
> +};
> +
> +struct v4l2_h264_reference {
> +	enum v4l2_h264_field_reference fields;
> +
> +	/* Index into v4l2_ctrl_h264_decode_params.dpb[] */
> +	__u8 index;
> +};

This introducing 3 bytes of padding at the end of this struct...

> +
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
>  	__u32 size;
> @@ -178,12 +193,8 @@ struct v4l2_ctrl_h264_slice_params {
>  	__u8 num_ref_idx_l1_active_minus1;
>  	__u32 slice_group_change_cycle;
>  
> -	/*
> -	 * Entries on each list are indices into
> -	 * v4l2_ctrl_h264_decode_params.dpb[].
> -	 */
> -	__u8 ref_pic_list0[32];
> -	__u8 ref_pic_list1[32];
> +	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN];
> +	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN];

...which leads to a lot of holes of uninitialized data in these arrays.

I recommend to replace 'enum v4l2_h264_field_reference fields;' in struct v4l2_h264_reference
by '__u8 fields; /* enum v4l2_h264_field_reference */'.

This also saves a lot of memory (2*32*6 = 384 bytes!) and avoids the padding issue.

Regards,

	Hans

>  
>  	__u32 flags;
>  };
> 

