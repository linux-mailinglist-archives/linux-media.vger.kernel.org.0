Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE053550C9
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 12:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236204AbhDFK0M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 06:26:12 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40981 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234143AbhDFK0K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 06:26:10 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TiuDl4K7v43ycTiuGlNYEV; Tue, 06 Apr 2021 12:26:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617704761; bh=sT4RSH4Pm1iNReZ65vtcckLNunpCRYmabsizObRVtpQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vi92r96htqW9/O36+8kaczdF9XL5cfaAlrDyaS39GxeO2NhBGT65tKpyPNMgEnYbX
         hRsAy3g83WwwFxzgoojEjuSdD3t+5mMrpNR7PM8BygYSapXTSVvdU/IkzLTGV2Hqh3
         VXsIUDn/k+Z5oy4JQE1tineUSsBC5n99OcCQg22eU9dy9JGLXlsnIYqQezyil0da5y
         0cXE4myh7HiZN+JtW+QH3u86CXGA1kDznYOHXbUVyyuRB11kltT4vyAyWEFxueuM9c
         14vUfsNmOSLQZRHJtlrFutCih7wPFjB6NzCS1WXuCQpby0LC8SEOzhpgAJ6RmRHZDH
         mRN8gij4oVOvw==
Subject: Re: [PATCH v5 02/10] media: uapi: mpeg2: rework quantisation matrices
 semantics
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>
References: <20210403180756.175881-1-ezequiel@collabora.com>
 <20210403180756.175881-3-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <993e935f-1c1b-c890-4760-652e5e12735b@xs4all.nl>
Date:   Tue, 6 Apr 2021 12:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210403180756.175881-3-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMoY9fJsTOpa5jqyO/NAzKDO8NuZVu4N3URKkWtDpaYh9+nknsdlgXYcUmYyII7/QmP4gWO1+ufdnMXaccLpxGvFOpy8B/c+wjxM8qceMuYFM9EhZz0n
 3I2JSI/SEXVMn7sflj5Gmn8rRjh32rimM0HZvH1/U/MaryheuLg7ZYklz/OWko7dPuGQDADlXgjr5TFg92N8ZwzCVyZMStefyh2swcjNBoLbGcAlkIK9H+ab
 r++h5/iVtktzxy1cx1rJBZSVFVqYVCJRcCmPdZVbuEQLYPermvoPXMmRg4qwMhRw+Oi1+nJSbcpXRbz9d0Rrp/BrAHskav3yJfT4Bq/4RzzgimuJZBAO8JfF
 zIYxGYZxV2Bf4Hazvso/M9GMxUDgjkFN4gHWsdDvq4Vp4sfmSEhEQcfqwJEL+QTIxg1AaAMF2qRknnIG2rQBRDw5VMkc6XI2z805oz9L/ZYCjsLdnVClCoB9
 1kaxEmHAmHtQBeztZZgubMHnyfPgGuao43CivLZltEU4fWGw3On/Ol5EAakefkojwZtYrYLVDqr4qj0p8M5/jechRISLWECt+uxy/g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/04/2021 20:07, Ezequiel Garcia wrote:
> As stated in the MPEG-2 specification, section 6.3.7 "Quant matrix
> extension":
> 
>   Each quantisation matrix has a default set of values. When a
>   sequence_header_code is decoded all matrices shall be reset to
>   their default values. User defined matrices may be downloaded
>   and this can occur in a sequence_header() or in a
>   quant_matrix_extension().
> 
> The load_intra_quantiser_matrix syntax elements are transmitted
> in the bistream headers, signalling that a quantisation matrix

bistream -> bitstream

> needs to be loaded and used for pictures transmitted afterwards
> (until the matrices are reset).
> 
> This "load" semantics are implemented in the V4L2 interface
> without the need of any "load" flags: passing the control
> is effectively a load.
> 
> Therefore, rework the V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION
> semantics to match the MPEG-2 semantics. Quantisation matrices
> values are now initialized by the V4L2 control core to their
> reset default value, and applications are expected to reset
> their values as specified.
> 
> The quantisation control is therefore optional, and used to
> load bitstream-defined values in the quantisation matrices.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 17 ---------
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 21 ++++++++++
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 38 +------------------
>  include/media/mpeg2-ctrls.h                   |  5 ---
>  4 files changed, 23 insertions(+), 58 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 151d1c676b6e..d9546f0aa2e8 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1746,23 +1746,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      :stub-columns: 0
>      :widths:       1 1 2
>  
> -    * - __u8
> -      - ``load_intra_quantiser_matrix``
> -      - One bit to indicate whether to load the ``intra_quantiser_matrix`` data.
> -    * - __u8
> -      - ``load_non_intra_quantiser_matrix``
> -      - One bit to indicate whether to load the ``non_intra_quantiser_matrix``
> -	data.
> -    * - __u8
> -      - ``load_chroma_intra_quantiser_matrix``
> -      - One bit to indicate whether to load the
> -	``chroma_intra_quantiser_matrix`` data, only relevant for non-4:2:0 YUV
> -	formats.
> -    * - __u8
> -      - ``load_chroma_non_intra_quantiser_matrix``
> -      - One bit to indicate whether to load the
> -	``chroma_non_intra_quantiser_matrix`` data, only relevant for non-4:2:0
> -	YUV formats.
>      * - __u8
>        - ``intra_quantiser_matrix[64]``
>        - The quantisation matrix coefficients for intra-coded frames, in zigzag
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 74f5ca1a5f6c..5d92a2b33a6e 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -57,6 +57,18 @@ static bool is_new_manual(const struct v4l2_ctrl *master)
>  	return master->is_auto && master->val == master->manual_mode_value;
>  }
>  
> +/* Default MPEG-2 quantisation coefficients, from the specification. */

Default -> Default intra

> +static const u8 mpeg2_intra_quant_matrix[64] = {
> +	8,  16, 16, 19, 16, 19, 22, 22,
> +	22, 22, 22, 22, 26, 24, 26, 27,
> +	27, 27, 26, 26, 26, 26, 27, 27,
> +	27, 29, 29, 29, 34, 34, 34, 29,
> +	29, 29, 27, 27, 29, 29, 32, 32,
> +	34, 34, 37, 38, 37, 35, 35, 34,
> +	35, 38, 38, 40, 40, 40, 48, 48,
> +	46, 46, 56, 56, 58, 69, 69, 83
> +};
> +
>  /* Returns NULL or a character pointer array containing the menu for
>     the given control ID. The pointer array ends with a NULL pointer.
>     An empty string signifies a menu entry that is invalid. This allows
> @@ -1656,6 +1668,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			      union v4l2_ctrl_ptr ptr)
>  {
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> +	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
>  	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
>  	struct v4l2_ctrl_fwht_params *p_fwht_params;
>  	void *p = ptr.p + idx * ctrl->elem_size;
> @@ -1680,6 +1693,14 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		p_mpeg2_slice_params->picture.picture_coding_type =
>  					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
>  		break;
> +	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
> +		p_mpeg2_quant = p;
> +
> +		memcpy(p_mpeg2_quant->intra_quantiser_matrix,
> +		       mpeg2_intra_quant_matrix,
> +		       ARRAY_SIZE(mpeg2_intra_quant_matrix));
> +		memset(p_mpeg2_quant->non_intra_quantiser_matrix, 16, 64);

64 -> sizeof(p_mpeg2_quant->non_intra_quantiser_matrix)

Also add a comment before the memset:

	/*
	 * The default non-intra MPEG-2 quantisation coefficients are all 16,
	 * as per the specification.
	 */

> +		break;
>  	case V4L2_CTRL_TYPE_VP8_FRAME:
>  		p_vp8_frame = p;
>  		p_vp8_frame->num_dct_parts = 1;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index 459f71679a4f..e3154f631858 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -13,30 +13,6 @@
>  #include "cedrus_hw.h"
>  #include "cedrus_regs.h"
>  
> -/* Default MPEG-2 quantisation coefficients, from the specification. */
> -
> -static const u8 intra_quantisation_matrix_default[64] = {
> -	8,  16, 16, 19, 16, 19, 22, 22,
> -	22, 22, 22, 22, 26, 24, 26, 27,
> -	27, 27, 26, 26, 26, 26, 27, 27,
> -	27, 29, 29, 29, 34, 34, 34, 29,
> -	29, 29, 27, 27, 29, 29, 32, 32,
> -	34, 34, 37, 38, 37, 35, 35, 34,
> -	35, 38, 38, 40, 40, 40, 48, 48,
> -	46, 46, 56, 56, 58, 69, 69, 83
> -};
> -
> -static const u8 non_intra_quantisation_matrix_default[64] = {
> -	16, 16, 16, 16, 16, 16, 16, 16,
> -	16, 16, 16, 16, 16, 16, 16, 16,
> -	16, 16, 16, 16, 16, 16, 16, 16,
> -	16, 16, 16, 16, 16, 16, 16, 16,
> -	16, 16, 16, 16, 16, 16, 16, 16,
> -	16, 16, 16, 16, 16, 16, 16, 16,
> -	16, 16, 16, 16, 16, 16, 16, 16,
> -	16, 16, 16, 16, 16, 16, 16, 16
> -};
> -
>  static enum cedrus_irq_status cedrus_mpeg2_irq_status(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev = ctx->dev;
> @@ -99,12 +75,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  	cedrus_engine_enable(ctx, CEDRUS_CODEC_MPEG2);
>  
>  	/* Set intra quantisation matrix. */
> -
> -	if (quantisation && quantisation->load_intra_quantiser_matrix)
> -		matrix = quantisation->intra_quantiser_matrix;
> -	else
> -		matrix = intra_quantisation_matrix_default;
> -
> +	matrix = quantisation->intra_quantiser_matrix;
>  	for (i = 0; i < 64; i++) {
>  		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, matrix[i]);
>  		reg |= VE_DEC_MPEG_IQMINPUT_FLAG_INTRA;
> @@ -113,12 +84,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  	}
>  
>  	/* Set non-intra quantisation matrix. */
> -
> -	if (quantisation && quantisation->load_non_intra_quantiser_matrix)
> -		matrix = quantisation->non_intra_quantiser_matrix;
> -	else
> -		matrix = non_intra_quantisation_matrix_default;
> -
> +	matrix = quantisation->non_intra_quantiser_matrix;
>  	for (i = 0; i < 64; i++) {
>  		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, matrix[i]);
>  		reg |= VE_DEC_MPEG_IQMINPUT_FLAG_NON_INTRA;
> diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
> index b8adf3ac2c1d..8ea2c7f3a172 100644
> --- a/include/media/mpeg2-ctrls.h
> +++ b/include/media/mpeg2-ctrls.h
> @@ -68,11 +68,6 @@ struct v4l2_ctrl_mpeg2_slice_params {
>  
>  struct v4l2_ctrl_mpeg2_quantisation {
>  	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Quant matrix extension */
> -	__u8	load_intra_quantiser_matrix;
> -	__u8	load_non_intra_quantiser_matrix;
> -	__u8	load_chroma_intra_quantiser_matrix;
> -	__u8	load_chroma_non_intra_quantiser_matrix;
> -
>  	__u8	intra_quantiser_matrix[64];
>  	__u8	non_intra_quantiser_matrix[64];
>  	__u8	chroma_intra_quantiser_matrix[64];
> 

Regards,

	Hans
