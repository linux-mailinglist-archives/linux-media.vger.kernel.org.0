Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B09E22A17F
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 23:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgGVVnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 17:43:55 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:28806 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgGVVnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 17:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=QHg1KzJuJRoJs0JEscQdHyBcO620GX3IT0D06djc5yk=;
        b=WSoyaQ48E6jg3HstUMUVhLy2OHHqL+qANLHM16cdGkd2HVA0iOPJKdFzlsSB0wesfr8E
        w7RPfRXvityeluS3ZngcLud0J+oSbxgmMDNbEwK8BZG18AxMOkQF8guX4wHzpfWEGJKdt5
        nJqNts+MIfT9jeBMZxelWvMIaqOpuA4CY=
Received: by filterdrecv-p3iad2-5b55dcd864-m99xc with SMTP id filterdrecv-p3iad2-5b55dcd864-m99xc-18-5F18B319-35
        2020-07-22 21:43:53.518064465 +0000 UTC m=+2262868.123012744
Received: from [192.168.1.14] (unknown)
        by ismtpd0002p1lon1.sendgrid.net (SG) with ESMTP
        id 571HsbEpTFKhin8cGd43Xw
        Wed, 22 Jul 2020 21:43:53.171 +0000 (UTC)
Subject: Re: [PATCH 01/10] media: uapi: h264: Update reference lists
References: <20200715202233.185680-1-ezequiel@collabora.com>
 <20200715202233.185680-2-ezequiel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <e5c57fd5-74d3-b25d-8054-f268aee6539c@kwiboo.se>
Date:   Wed, 22 Jul 2020 21:43:53 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715202233.185680-2-ezequiel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hz1gPYa6lKt1atsJk?=
 =?us-ascii?Q?53KKPCQYr5JyfXdbCYZHyfAJt=2Fk8vLVHu3i6tiy?=
 =?us-ascii?Q?WxvIHf6HdfG3ZqV88vZQkNkLAyuySpQRbCFo3c8?=
 =?us-ascii?Q?HHc0p8sG1bErWXg5jwFYFlILLES8tUyJ+q3wjc2?=
 =?us-ascii?Q?dHX3k=2FwlZMvjZWeKu82rA35aS7tRHkPUZ3zIQP9?=
 =?us-ascii?Q?yEPantyxuL2dSwsz3akmw=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-07-15 22:22, Ezequiel Garcia wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> When dealing with with interlaced frames, reference lists must tell if
> each particular reference is meant for top or bottom field. This info
> is currently not provided at all in the H264 related controls.
> 
> Make reference lists hold a structure which will also hold flags along
> index into DPB array. Flags will tell if reference is meant for top or
> bottom field.
> 
> Currently the only user of these lists is Cedrus which is just compile
> fixed here. Actual usage of newly introduced flags will come in
> following commit.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> [Ezequiel: Use a macro for the reference picture list length]
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 40 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
>  include/media/h264-ctrls.h                    | 20 +++++++---
>  3 files changed, 55 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..c2e17c02f77e 100644
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
> @@ -1926,6 +1926,42 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
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
> +    * - __u16
> +      - ``flags``
> +      - See :ref:`Picture Reference Flags <h264_reference_flags>`
> +    * - __u8
> +      - ``index``
> +      - Index into the :c:type:`v4l2_ctrl_h264_decode_params`.dpb array.
> +
> +.. _h264_reference_flags:
> +
> +``Picture Reference Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_H264_REFERENCE_FLAG_TOP_FIELD``
> +      - 0x00000001
> +      -
> +    * - ``V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD``
> +      - 0x00000002
> +      -
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
> index 080fd1293c42..bca4a9887e7e 100644
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
> @@ -140,6 +142,16 @@ struct v4l2_h264_pred_weight_table {
>  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
>  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
>  
> +#define V4L2_H264_REFERENCE_FLAG_TOP_FIELD		0x01
> +#define V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD		0x02

Later in this series enum v4l2_h264_dpb_reference is introduced that
represent same information as these two flags.
Maybe consolidate and use a shared enum for both slice ref list and dpb?

Regards,
Jonas

> +
> +struct v4l2_h264_reference {
> +	__u8 flags;
> +
> +	/* Index into v4l2_ctrl_h264_decode_params.dpb[] */
> +	__u8 index;
> +};
> +
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
>  	__u32 size;
> @@ -178,12 +190,8 @@ struct v4l2_ctrl_h264_slice_params {
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
>  
>  	__u32 flags;
>  };
> 
