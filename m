Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9675431EA05
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 13:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhBRMpZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 07:45:25 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:49054 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbhBRLt3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 06:49:29 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11IBjDR5100470;
        Thu, 18 Feb 2021 11:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=gwqwaj90/51j1UhviI62itQcgDZ+UL2OX8HXyp5thNY=;
 b=KMdz05Lq0cnzzNqbFFCrmpKKchsVFW/3BEBtXWwk4KKmf5zZjMKb8xdAv03HB3KM7pxu
 yVyC2U2VtAmBUqBxiFP96IxdVc1neeC1czPQlaxI69kFEQx9fTmg8AIljDShdetIK6PA
 nAuaIXuITbmrDZWB9rm0s/1Psw0JxP1E9U1gWOh82TLjpVadRg/z8kR4Hdr1aK3gmV/r
 e+DPszi3GXOh1I6gYAqXpIt/dlJJItZ3LMBJ7VKrIFFbf/sRQy9KyDYFDM5ZEFDp7sxM
 +6XetKUwDQR1u/583yi5v66Me5FHihjeUN7JRDF9QiK4Tkzu5l273l2zGDV3Iwaj1KjF Zw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 36p7dnnjn4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Feb 2021 11:48:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11IBkQOM030625;
        Thu, 18 Feb 2021 11:48:08 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 36prbqntgx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Feb 2021 11:48:08 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11IBm2Jm025701;
        Thu, 18 Feb 2021 11:48:02 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 18 Feb 2021 03:48:01 -0800
Date:   Thu, 18 Feb 2021 14:47:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v1 13/18] media: hantro: Introduce G2/HEVC decoder
Message-ID: <20210218114747.GH2087@kadam>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <20210217080306.157876-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210217080306.157876-14-benjamin.gaignard@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9898 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102180105
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9898 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102180105
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 17, 2021 at 09:03:01AM +0100, Benjamin Gaignard wrote:
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index e1443c394f62..d171fb80876a 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -280,6 +280,20 @@ static int hantro_jpeg_s_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int hantro_extra_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	const struct hantro_hevc_extra_decode_params *extra_params;

Why is this const??

> +	struct hantro_ctx *ctx;
> +
> +	ctx = container_of(ctrl->handler,
> +			   struct hantro_ctx, ctrl_handler);
> +	extra_params = &ctx->hevc_dec.ctrls.extra_params;
> +
> +	memcpy((void *)extra_params, ctrl->p_new.p_u8, sizeof(extra_params));


Wrong sizeof.  Should be sizeof(*extra_params).  Also get rid of the
cast.

	memcpy(extra_params, ctrl->p_new.p_u8, sizeof(*extra_params));

This is the only bug that I found, but I had some small style comments
below.

> +
> +	return 0;
> +}
> +
>  static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
>  	.try_ctrl = hantro_try_ctrl,
>  };
> @@ -288,6 +302,10 @@ static const struct v4l2_ctrl_ops hantro_jpeg_ctrl_ops = {
>  	.s_ctrl = hantro_jpeg_s_ctrl,
>  };
>  
> +static const struct v4l2_ctrl_ops hantro_extra_ctrl_ops = {
> +	.s_ctrl = hantro_extra_s_ctrl,
> +};
> +
>  static const struct hantro_ctrl controls[] = {
>  	{
>  		.codec = HANTRO_JPEG_ENCODER,
> @@ -413,6 +431,29 @@ static const struct hantro_ctrl controls[] = {
>  		.cfg = {
>  			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
>  		},
> +	}, {
> +		.codec = HANTRO_HEVC_DECODER,
> +		.cfg = {
> +			.id = V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS,
> +			.name = "HANTRO extra decode params",
> +			.type = V4L2_CTRL_TYPE_U8,
> +			.min = 0,
> +			.def = 0,
> +			.max = 255,
> +			.step = 1,
> +			.dims = { sizeof(struct hantro_hevc_extra_decode_params) },
> +			.ops = &hantro_extra_ctrl_ops,
> +		},
> +	}, {
> +		.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
> +			 HANTRO_VP8_DECODER | HANTRO_H264_DECODER |
> +			 HANTRO_HEVC_DECODER,
> +		.cfg = {
> +			.id = V4L2_CID_USER_CLASS,
> +			.name = "HANTRO controls",
> +			.type = V4L2_CTRL_TYPE_CTRL_CLASS,
> +			.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
> +		},
>  	},
>  };
>  
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> new file mode 100644
> index 000000000000..5d4d9cda87b3
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -0,0 +1,637 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VPU HEVC codec driver
> + *
> + * Copyright (C) 2020 Safran Passenger Innovations LLC
> + */
> +
> +#include "hantro_hw.h"
> +#include "hantro_g2_regs.h"
> +
> +#define HEVC_DEC_MODE	0xC
> +
> +#define BUS_WIDTH_32		0
> +#define BUS_WIDTH_64		1
> +#define BUS_WIDTH_128		2
> +#define BUS_WIDTH_256		3
> +
> +static inline void hantro_write_addr(struct hantro_dev *vpu,
> +				     unsigned long offset,
> +				     dma_addr_t addr)
> +{
> +	vdpu_write(vpu, addr & 0xffffffff, offset);
> +}
> +
> +static void prepare_scaling_list_buffer(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	const struct v4l2_ctrl_hevc_scaling_matrix *sc = ctrls->scaling;
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +	u8 *p = ((u8 *)ctx->hevc_dec.scaling_lists.cpu);
> +	unsigned int scaling_list_enabled;
> +	unsigned int i, j, k;
> +
> +	scaling_list_enabled = !!(sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED);
> +	hantro_reg_write(vpu, hevc_scaling_list_e, scaling_list_enabled);
> +
> +	if (!scaling_list_enabled)
> +		return;
> +
> +	for (i = 0; i < ARRAY_SIZE(sc->scaling_list_dc_coef_16x16); i++)
> +		*p++ = sc->scaling_list_dc_coef_16x16[i];
> +	for (i = 0; i < ARRAY_SIZE(sc->scaling_list_dc_coef_32x32); i++)
> +		*p++ = sc->scaling_list_dc_coef_32x32[i];
> +
> +	/* 128-bit boundary */
> +	p += 8;
> +
> +	/* write scaling lists column by column */
> +
> +	for (i = 0; i < 6; i++)
> +		for (j = 0; j < 4; j++)
> +			for (k = 0; k < 4; k++)
> +				*p++ = sc->scaling_list_4x4[i][4 * k + j];
> +
> +	for (i = 0; i < 6; i++)
> +		for (j = 0; j < 8; j++)
> +			for (k = 0; k < 8; k++)
> +				*p++ = sc->scaling_list_8x8[i][8 * k + j];
> +
> +	for (i = 0; i < 6; i++)
> +		for (j = 0; j < 8; j++)
> +			for (k = 0; k < 8; k++)
> +				*p++ = sc->scaling_list_16x16[i][8 * k + j];
> +
> +	for (i = 0; i < 2; i++)
> +		for (j = 0; j < 8; j++)
> +			for (k = 0; k < 8; k++)
> +				*p++ = sc->scaling_list_32x32[i][8 * k + j];
> +}
> +
> +static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +	u16 *p = (u16 *)((u8 *)ctx->hevc_dec.tile_sizes.cpu);
> +	unsigned int num_tile_rows = pps->num_tile_rows_minus1 + 1;
> +	unsigned int num_tile_cols = pps->num_tile_columns_minus1 + 1;
> +	unsigned int pic_width_in_ctbs, pic_height_in_ctbs;
> +	unsigned int max_log2_ctb_size, ctb_size;
> +	bool tiles_enabled, uniform_spacing;
> +	u32 no_chroma = 0;
> +
> +	tiles_enabled = !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
> +	uniform_spacing = !!(pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING);
> +
> +	hantro_reg_write(vpu, hevc_tile_e, tiles_enabled);
> +
> +	max_log2_ctb_size = sps->log2_min_luma_coding_block_size_minus3 + 3 +
> +			    sps->log2_diff_max_min_luma_coding_block_size;
> +	pic_width_in_ctbs = (sps->pic_width_in_luma_samples +
> +			    (1 << max_log2_ctb_size) - 1) >> max_log2_ctb_size;
> +	pic_height_in_ctbs = (sps->pic_height_in_luma_samples + (1 << max_log2_ctb_size) - 1)
> +			     >> max_log2_ctb_size;
> +	ctb_size = 1 << max_log2_ctb_size;
> +
> +	vpu_debug(1, "Preparing tile sizes buffer for %dx%d CTBs (CTB size %d)\n",
> +		  pic_width_in_ctbs, pic_height_in_ctbs, ctb_size);
> +
> +	if (tiles_enabled) {
> +		unsigned int i, j, h;
> +
> +		vpu_debug(1, "Tiles enabled! %dx%d\n", num_tile_cols, num_tile_rows);
> +
> +		hantro_reg_write(vpu, hevc_num_tile_rows, num_tile_rows);
> +		hantro_reg_write(vpu, hevc_num_tile_cols, num_tile_cols);
> +
> +		/* write width + height for each tile in pic */
> +		if (!uniform_spacing) {
> +			u32 tmp_w = 0, tmp_h = 0;
> +
> +			for (i = 0; i < num_tile_rows; i++) {
> +				if (i == num_tile_rows - 1)
> +					h = pic_height_in_ctbs - tmp_h;
> +				else
> +					h = pps->row_height_minus1[i] + 1;
> +				tmp_h += h;
> +				if (i == 0 && h == 1 && ctb_size == 16)
> +					no_chroma = 1;
> +				for (j = 0, tmp_w = 0; j < num_tile_cols - 1; j++) {
> +					tmp_w += pps->column_width_minus1[j] + 1;
> +					*p++ = pps->column_width_minus1[j + 1];
> +					*p++ = h;
> +					if (i == 0 && h == 1 && ctb_size == 16)
> +						no_chroma = 1;
> +				}
> +				/* last column */
> +				*p++ = pic_width_in_ctbs - tmp_w;
> +				*p++ = h;
> +			}
> +		} else { /* uniform spacing */
> +			u32 tmp, prev_h, prev_w;
> +
> +			for (i = 0, prev_h = 0; i < num_tile_rows; i++) {
> +				tmp = (i + 1) * pic_height_in_ctbs / num_tile_rows;
> +				h = tmp - prev_h;
> +				prev_h = tmp;
> +				if (i == 0 && h == 1 && ctb_size == 16)
> +					no_chroma = 1;
> +				for (j = 0, prev_w = 0; j < num_tile_cols; j++) {
> +					tmp = (j + 1) * pic_width_in_ctbs / num_tile_cols;
> +					*p++ = tmp - prev_w;
> +					*p++ = h;
> +					if (j == 0 &&
> +					    (pps->column_width_minus1[0] + 1) == 1 &&
> +					    ctb_size == 16)
> +						no_chroma = 1;
> +					prev_w = tmp;
> +				}
> +			}
> +		}
> +	} else {
> +		hantro_reg_write(vpu, hevc_num_tile_rows, 1);
> +		hantro_reg_write(vpu, hevc_num_tile_cols, 1);
> +
> +		/* There's one tile, with dimensions equal to pic size. */
> +		p[0] = pic_width_in_ctbs;
> +		p[1] = pic_height_in_ctbs;
> +	}
> +
> +	if (no_chroma)
> +		vpu_debug(1, "%s: no chroma!\n", __func__);
> +}
> +
> +static void set_params(struct hantro_ctx *ctx)
> +{
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
> +	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
> +	const struct hantro_hevc_extra_decode_params *extra_params = &ctrls->extra_params;
> +	struct hantro_dev *vpu = ctx->dev;
> +	u32 min_log2_cb_size, max_log2_ctb_size, min_cb_size, max_ctb_size;
> +	u32 pic_width_in_min_cbs, pic_height_in_min_cbs;
> +	u32 pic_width_aligned, pic_height_aligned;
> +	u32 partial_ctb_x, partial_ctb_y;
> +
> +	hantro_reg_write(vpu, hevc_bit_depth_y_minus8, sps->bit_depth_luma_minus8);
> +	hantro_reg_write(vpu, hevc_bit_depth_c_minus8, sps->bit_depth_chroma_minus8);
> +
> +	hantro_reg_write(vpu, hevc_output_8_bits, 0);
> +
> +	hantro_reg_write(vpu, hevc_hdr_skip_lenght, extra_params->hevc_hdr_skip_lenght);
> +
> +	min_log2_cb_size = sps->log2_min_luma_coding_block_size_minus3 + 3;
> +	max_log2_ctb_size = min_log2_cb_size + sps->log2_diff_max_min_luma_coding_block_size;
> +
> +	hantro_reg_write(vpu, hevc_min_cb_size, min_log2_cb_size);
> +	hantro_reg_write(vpu, hevc_max_cb_size, max_log2_ctb_size);
> +
> +	min_cb_size = 1 << min_log2_cb_size;
> +	max_ctb_size = 1 << max_log2_ctb_size;
> +
> +	pic_width_in_min_cbs = sps->pic_width_in_luma_samples / min_cb_size;
> +	pic_height_in_min_cbs = sps->pic_height_in_luma_samples / min_cb_size;
> +	pic_width_aligned = ALIGN(sps->pic_width_in_luma_samples, max_ctb_size);
> +	pic_height_aligned = ALIGN(sps->pic_height_in_luma_samples, max_ctb_size);
> +
> +	partial_ctb_x = !!(sps->pic_width_in_luma_samples != pic_width_aligned);
> +	partial_ctb_y = !!(sps->pic_height_in_luma_samples != pic_height_aligned);
> +
> +	hantro_reg_write(vpu, hevc_partial_ctb_x, partial_ctb_x);
> +	hantro_reg_write(vpu, hevc_partial_ctb_y, partial_ctb_y);
> +
> +	hantro_reg_write(vpu, hevc_pic_width_in_cbs, pic_width_in_min_cbs);
> +	hantro_reg_write(vpu, hevc_pic_height_in_cbs, pic_height_in_min_cbs);
> +
> +	hantro_reg_write(vpu, hevc_pic_width_4x4,
> +			 (pic_width_in_min_cbs * min_cb_size) / 4);
> +	hantro_reg_write(vpu, hevc_pic_height_4x4,
> +			 (pic_height_in_min_cbs * min_cb_size) / 4);
> +
> +	hantro_reg_write(vpu, hevc_max_inter_hierdepth,
> +			 sps->max_transform_hierarchy_depth_inter);
> +	hantro_reg_write(vpu, hevc_max_intra_hierdepth,
> +			 sps->max_transform_hierarchy_depth_intra);
> +	hantro_reg_write(vpu, hevc_min_trb_size,
> +			 sps->log2_min_luma_transform_block_size_minus2 + 2);
> +	hantro_reg_write(vpu, hevc_max_trb_size,
> +			 sps->log2_min_luma_transform_block_size_minus2 + 2 +
> +			 sps->log2_diff_max_min_luma_transform_block_size);
> +
> +	hantro_reg_write(vpu, hevc_tempor_mvp_e,
> +			 !!(sps->flags & V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED) &&
> +			 !(decode_params->flags & V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC));
> +	hantro_reg_write(vpu, hevc_strong_smooth_e,
> +			 !!(sps->flags & V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED));
> +	hantro_reg_write(vpu, hevc_asym_pred_e,
> +			 !!(sps->flags & V4L2_HEVC_SPS_FLAG_AMP_ENABLED));
> +	hantro_reg_write(vpu, hevc_sao_e,
> +			 !!(sps->flags & V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET));
> +	hantro_reg_write(vpu, hevc_sign_data_hide,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED));
> +
> +	if (pps->flags & V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED) {
> +		hantro_reg_write(vpu, hevc_cu_qpd_e, 1);
> +		hantro_reg_write(vpu, hevc_max_cu_qpd_depth, pps->diff_cu_qp_delta_depth);
> +	} else {
> +		hantro_reg_write(vpu, hevc_cu_qpd_e, 0);
> +		hantro_reg_write(vpu, hevc_max_cu_qpd_depth, 0);
> +	}
> +
> +	if (pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT) {
> +		hantro_reg_write(vpu, hevc_cb_qp_offset, pps->pps_cb_qp_offset);
> +		hantro_reg_write(vpu, hevc_cr_qp_offset, pps->pps_cr_qp_offset);
> +	} else {
> +		hantro_reg_write(vpu, hevc_cb_qp_offset, 0);
> +		hantro_reg_write(vpu, hevc_cr_qp_offset, 0);
> +	}
> +
> +	hantro_reg_write(vpu, hevc_filt_offset_beta, pps->pps_beta_offset_div2);
> +	hantro_reg_write(vpu, hevc_filt_offset_tc, pps->pps_tc_offset_div2);
> +	hantro_reg_write(vpu, hevc_slice_hdr_ext_e,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT));
> +	hantro_reg_write(vpu, hevc_slice_hdr_ext_bits, pps->num_extra_slice_header_bits);
> +	hantro_reg_write(vpu, hevc_slice_chqp_present,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT));
> +	hantro_reg_write(vpu, hevc_weight_bipr_idc,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED));
> +	hantro_reg_write(vpu, hevc_transq_bypass,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED));
> +	hantro_reg_write(vpu, hevc_list_mod_e,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT));
> +	hantro_reg_write(vpu, hevc_entropy_sync_e,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED));
> +	hantro_reg_write(vpu, hevc_cabac_init_present,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT));
> +	hantro_reg_write(vpu, hevc_idr_pic_e,
> +			 !!(decode_params->flags & V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC));
> +	hantro_reg_write(vpu, hevc_parallel_merge,
> +			 pps->log2_parallel_merge_level_minus2 + 2);
> +	hantro_reg_write(vpu, hevc_pcm_filt_d,
> +			 !!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED));
> +	hantro_reg_write(vpu, hevc_pcm_e,
> +			 !!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED));
> +	if (sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED) {
> +		hantro_reg_write(vpu, hevc_max_pcm_size,
> +				 sps->log2_diff_max_min_pcm_luma_coding_block_size +
> +				 sps->log2_min_pcm_luma_coding_block_size_minus3 + 3);
> +		hantro_reg_write(vpu, hevc_min_pcm_size,
> +				 sps->log2_min_pcm_luma_coding_block_size_minus3 + 3);
> +		hantro_reg_write(vpu, hevc_bit_depth_pcm_y,
> +				 sps->pcm_sample_bit_depth_luma_minus1 + 1);
> +		hantro_reg_write(vpu, hevc_bit_depth_pcm_c,
> +				 sps->pcm_sample_bit_depth_chroma_minus1 + 1);
> +	} else {
> +		hantro_reg_write(vpu, hevc_max_pcm_size, 0);
> +		hantro_reg_write(vpu, hevc_min_pcm_size, 0);
> +		hantro_reg_write(vpu, hevc_bit_depth_pcm_y, 0);
> +		hantro_reg_write(vpu, hevc_bit_depth_pcm_c, 0);
> +	}
> +
> +	hantro_reg_write(vpu, hevc_start_code_e, 1);
> +	hantro_reg_write(vpu, hevc_init_qp, pps->init_qp_minus26 + 26);
> +	hantro_reg_write(vpu, hevc_weight_pred_e,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED));
> +	hantro_reg_write(vpu, hevc_cabac_init_present,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT));
> +	hantro_reg_write(vpu, hevc_const_intra_e,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED));
> +	hantro_reg_write(vpu, hevc_transform_skip,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED));
> +	hantro_reg_write(vpu, hevc_out_filtering_dis,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER));
> +	hantro_reg_write(vpu, hevc_filt_ctrl_pres,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT));
> +	hantro_reg_write(vpu, hevc_dependent_slice,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT));
> +	hantro_reg_write(vpu, hevc_filter_override,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED));
> +	hantro_reg_write(vpu, hevc_refidx0_active,
> +			 pps->num_ref_idx_l0_default_active_minus1 + 1);
> +	hantro_reg_write(vpu, hevc_refidx1_active,
> +			 pps->num_ref_idx_l1_default_active_minus1 + 1);
> +	hantro_reg_write(vpu, hevc_apf_threshold, 8);
> +}
> +
> +static int find_ref_pic_index(const struct v4l2_hevc_dpb_entry *dpb, int pic_order_cnt)
> +{
> +	int i;
> +
> +	for (i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> +		if (dpb[i].pic_order_cnt[0] == pic_order_cnt)
> +			return i;
> +	}
> +
> +	return 0x0;
> +}
> +
> +static void set_ref_pic_list(struct hantro_ctx *ctx)
> +{
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	struct hantro_dev *vpu = ctx->dev;
> +	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
> +	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
> +	u32 list0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] = {0};
> +	u32 list1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] = {0};
> +	const struct hantro_reg *ref_pic_regs0[] = {
> +		hevc_rlist_f0,
> +		hevc_rlist_f1,
> +		hevc_rlist_f2,
> +		hevc_rlist_f3,
> +		hevc_rlist_f4,
> +		hevc_rlist_f5,
> +		hevc_rlist_f6,
> +		hevc_rlist_f7,
> +		hevc_rlist_f8,
> +		hevc_rlist_f9,
> +		hevc_rlist_f10,
> +		hevc_rlist_f11,
> +		hevc_rlist_f12,
> +		hevc_rlist_f13,
> +		hevc_rlist_f14,
> +		hevc_rlist_f15,
> +	};
> +	const struct hantro_reg *ref_pic_regs1[] = {
> +		hevc_rlist_b0,
> +		hevc_rlist_b1,
> +		hevc_rlist_b2,
> +		hevc_rlist_b3,
> +		hevc_rlist_b4,
> +		hevc_rlist_b5,
> +		hevc_rlist_b6,
> +		hevc_rlist_b7,
> +		hevc_rlist_b8,
> +		hevc_rlist_b9,
> +		hevc_rlist_b10,
> +		hevc_rlist_b11,
> +		hevc_rlist_b12,
> +		hevc_rlist_b13,
> +		hevc_rlist_b14,
> +		hevc_rlist_b15,
> +	};
> +	unsigned int i, j;
> +
> +	/* List 0 contains: short term before, short term after and long term */
> +	j = 0;
> +	for (i = 0; i < decode_params->num_rps_poc_st_curr_before && j < ARRAY_SIZE(list0); i++)
> +		list0[j++] = find_ref_pic_index(dpb, decode_params->rps_st_curr_before[i]);
> +	for (i = 0; i < decode_params->num_rps_poc_st_curr_after && j < ARRAY_SIZE(list0); i++)
> +		list0[j++] = find_ref_pic_index(dpb, decode_params->rps_st_curr_after[i]);
> +	for (i = 0; i < decode_params->num_rps_poc_lt_curr && j < ARRAY_SIZE(list0); i++)
> +		list0[j++] = find_ref_pic_index(dpb, decode_params->rps_lt_curr[i]);
> +
> +	/* Fill the list, copying over and over */
> +	i = 0;
> +	while (j < ARRAY_SIZE(list0))
> +		list0[j++] = list0[i++];
> +
> +	j = 0;
> +	for (i = 0; i < decode_params->num_rps_poc_st_curr_after && j < ARRAY_SIZE(list1); i++)
> +		list1[j++] = find_ref_pic_index(dpb, decode_params->rps_st_curr_after[i]);
> +	for (i = 0; i < decode_params->num_rps_poc_st_curr_before && j < ARRAY_SIZE(list1); i++)
> +		list1[j++] = find_ref_pic_index(dpb, decode_params->rps_st_curr_before[i]);
> +	for (i = 0; i < decode_params->num_rps_poc_lt_curr && j < ARRAY_SIZE(list1); i++)
> +		list1[j++] = find_ref_pic_index(dpb, decode_params->rps_lt_curr[i]);
> +
> +	i = 0;
> +	while (j < ARRAY_SIZE(list1))
> +		list1[j++] = list1[i++];
> +
> +	for (i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> +		hantro_reg_write(vpu, ref_pic_regs0[i], list0[i]);
> +		hantro_reg_write(vpu, ref_pic_regs1[i], list1[i]);
> +	}
> +}
> +
> +static int set_ref(struct hantro_ctx *ctx)
> +{
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
> +	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
> +	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
> +	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
> +	struct hantro_dev *vpu = ctx->dev;
> +	size_t cr_offset = hantro_hevc_chroma_offset(sps);
> +	size_t mv_offset = hantro_hevc_motion_vectors_offset(sps);
> +	u32 max_ref_frames;
> +	u16 dpb_longterm_e;
> +
> +	const struct hantro_reg *cur_poc[] = {
> +		hevc_cur_poc_00,
> +		hevc_cur_poc_01,
> +		hevc_cur_poc_02,
> +		hevc_cur_poc_03,
> +		hevc_cur_poc_04,
> +		hevc_cur_poc_05,
> +		hevc_cur_poc_06,
> +		hevc_cur_poc_07,
> +		hevc_cur_poc_08,
> +		hevc_cur_poc_09,
> +		hevc_cur_poc_10,
> +		hevc_cur_poc_11,
> +		hevc_cur_poc_12,
> +		hevc_cur_poc_13,
> +		hevc_cur_poc_14,
> +		hevc_cur_poc_15,
> +	};
> +	unsigned int i;
> +
> +	max_ref_frames = decode_params->num_rps_poc_lt_curr +
> +		decode_params->num_rps_poc_st_curr_before +
> +		decode_params->num_rps_poc_st_curr_after;
> +	/*
> +	 * Set max_ref_frames to non-zero to avoid HW hang when decoding
> +	 * badly marked I-frames.
> +	 */
> +	max_ref_frames = max_ref_frames ? max_ref_frames : 1;
> +	hantro_reg_write(vpu, hevc_num_ref_frames, max_ref_frames);
> +	hantro_reg_write(vpu, hevc_filter_over_slices,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED));
> +	hantro_reg_write(vpu, hevc_filter_over_tiles,
> +			 !!(pps->flags & V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED));
> +
> +	/*
> +	 * Write POC count diff from current pic. For frame decoding only compute
> +	 * pic_order_cnt[0] and ignore pic_order_cnt[1] used in field-coding.
> +	 */
> +	for (i = 0; i < decode_params->num_active_dpb_entries; i++) {
> +		char poc_diff = decode_params->pic_order_cnt_val - dpb[i].pic_order_cnt[0];
> +
> +		hantro_reg_write(vpu, cur_poc[i], poc_diff);
> +	}
> +
> +	if (i < ARRAY_SIZE(cur_poc)) {
> +		/*
> +		 * After the references, fill one entry pointing to itself,
> +		 * i.e. difference is zero.
> +		 */
> +		hantro_reg_write(vpu, cur_poc[i], 0);
> +		i++;
> +	}
> +
> +	/* Fill the rest with the current picture */
> +	for (; i < ARRAY_SIZE(cur_poc); i++)
> +		hantro_reg_write(vpu, cur_poc[i], decode_params->pic_order_cnt_val);
> +
> +	set_ref_pic_list(ctx);
> +
> +	/* We will only keep the references picture that are still used */
> +	ctx->hevc_dec.ref_bufs_used = 0;
> +
> +	/* Set up addresses of DPB buffers */
> +	dpb_longterm_e = 0;
> +	for (i = 0; i < decode_params->num_active_dpb_entries; i++) {
> +		luma_addr = hantro_hevc_get_ref_buf(ctx, dpb[i].pic_order_cnt[0]);
> +		if (!luma_addr)
> +			return -ENOMEM;
> +
> +		chroma_addr = luma_addr + cr_offset;
> +		mv_addr = luma_addr + mv_offset;
> +
> +		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
> +			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
> +
> +		hantro_write_addr(vpu, HEVC_REG_ADDR_REF(i), luma_addr);
> +		hantro_write_addr(vpu, HEVC_REG_CHR_REF(i), chroma_addr);
> +		hantro_write_addr(vpu, HEVC_REG_DMV_REF(i), mv_addr);
> +	}
> +
> +	luma_addr = hantro_hevc_get_ref_buf(ctx, decode_params->pic_order_cnt_val);
> +	if (!luma_addr)
> +		return -ENOMEM;
> +
> +	chroma_addr = luma_addr + cr_offset;
> +	mv_addr = luma_addr + mv_offset;
> +
> +	hantro_write_addr(vpu, HEVC_REG_ADDR_REF(i), luma_addr);
> +	hantro_write_addr(vpu, HEVC_REG_CHR_REF(i), chroma_addr);
> +	hantro_write_addr(vpu, HEVC_REG_DMV_REF(i++), mv_addr);
> +
> +	hantro_write_addr(vpu, HEVC_ADDR_DST, luma_addr);
> +	hantro_write_addr(vpu, HEVC_ADDR_DST_CHR, chroma_addr);
> +	hantro_write_addr(vpu, HEVC_ADDR_DST_MV, mv_addr);
> +
> +	hantro_hevc_ref_remove_unused(ctx);
> +
> +	for (; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> +		hantro_write_addr(vpu, HEVC_REG_ADDR_REF(i), 0);
> +		hantro_write_addr(vpu, HEVC_REG_CHR_REF(i), 0);
> +		hantro_write_addr(vpu, HEVC_REG_DMV_REF(i), 0);
> +	}
> +
> +	hantro_reg_write(vpu, hevc_refer_lterm_e, dpb_longterm_e);
> +
> +	return 0;
> +}
> +
> +static void set_buffers(struct hantro_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct hantro_dev *vpu = ctx->dev;
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +	size_t cr_offset = hantro_hevc_chroma_offset(sps);
> +	dma_addr_t src_dma, dst_dma;
> +	u32 src_len, src_buf_len;
> +
> +	src_buf = hantro_get_src_buf(ctx);
> +	dst_buf = hantro_get_dst_buf(ctx);
> +
> +	/* Source (stream) buffer. */
> +	src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	src_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> +	src_buf_len = vb2_plane_size(&src_buf->vb2_buf, 0);
> +
> +	hantro_write_addr(vpu, HEVC_ADDR_STR, src_dma);
> +	hantro_reg_write(vpu, hevc_stream_len, src_len);
> +	hantro_reg_write(vpu, hevc_strm_buffer_len, src_buf_len);
> +	hantro_reg_write(vpu, hevc_strm_start_offset, 0);
> +	hantro_reg_write(vpu, hevc_write_mvs_e, 1);
> +
> +	/* Destination (decoded frame) buffer. */
> +	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
> +
> +	hantro_write_addr(vpu, HEVC_RASTER_SCAN, dst_dma);
> +	hantro_write_addr(vpu, HEVC_RASTER_SCAN_CHR, dst_dma + cr_offset);
> +	hantro_write_addr(vpu, HEVC_ADDR_TILE_SIZE, ctx->hevc_dec.tile_sizes.dma);
> +	hantro_write_addr(vpu, HEVC_SCALING_LIST, ctx->hevc_dec.scaling_lists.dma);
> +	hantro_write_addr(vpu, HEVC_TILE_FILTER, ctx->hevc_dec.tile_filter.dma);
> +	hantro_write_addr(vpu, HEVC_TILE_SAO, ctx->hevc_dec.tile_sao.dma);
> +	hantro_write_addr(vpu, HEVC_TILE_BSD, ctx->hevc_dec.tile_bsd.dma);
> +}
> +
> +void hantro_g2_check_idle(struct hantro_dev *vpu)
> +{
> +	int i;
> +
> +	for (i = 0; i < 3; i++) {
> +		u32 status;
> +
> +		/* Make sure the VPU is idle */
> +		status = vdpu_read(vpu, HEVC_REG_INTERRUPT);
> +		if (status & HEVC_REG_INTERRUPT_DEC_E) {
> +			pr_warn("%s: still enabled!!! resetting.\n", __func__);
> +			status |= HEVC_REG_INTERRUPT_DEC_ABORT_E | HEVC_REG_INTERRUPT_DEC_IRQ_DIS;
> +			vdpu_write(vpu, status, HEVC_REG_INTERRUPT);
> +		}
> +	}
> +}
> +
> +void hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +
> +	hantro_g2_check_idle(vpu);
> +
> +	/* Prepare HEVC decoder context. */
> +	if (hantro_hevc_dec_prepare_run(ctx))
> +		goto error;
> +
> +	/* Configure hardware registers. */
> +	set_params(ctx);
> +	if (set_ref(ctx))
> +		goto error;
> +
> +	set_buffers(ctx);
> +	prepare_tile_info_buffer(ctx);
> +	prepare_scaling_list_buffer(ctx);
> +
> +	hantro_end_prepare_run(ctx);
> +
> +	hantro_reg_write(vpu, hevc_mode, HEVC_DEC_MODE);
> +	hantro_reg_write(vpu, hevc_clk_gate_e, 1);
> +
> +	/* Don't disable output */
> +	hantro_reg_write(vpu, hevc_out_dis, 0);
> +
> +	/* Don't compress buffers */
> +	hantro_reg_write(vpu, hevc_ref_compress_bypass, 1);
> +
> +	/* use NV12 as output format */
> +	hantro_reg_write(vpu, hevc_tile_e, 0);
> +	hantro_reg_write(vpu, hevc_out_rs_e, 1);
> +	hantro_reg_write(vpu, hevc_num_tile_rows, 1);
> +	hantro_reg_write(vpu, hevc_num_tile_cols, 1);
> +
> +	/* Bus width and max burst */
> +	hantro_reg_write(vpu, hevc_buswidth, BUS_WIDTH_128);
> +	hantro_reg_write(vpu, hevc_max_burst, 16);
> +
> +	/* Swap */
> +	hantro_reg_write(vpu, hevc_strm_swap, 0xf);
> +	hantro_reg_write(vpu, hevc_dirmv_swap, 0xf);
> +	hantro_reg_write(vpu, hevc_compress_swap, 0xf);
> +
> +	/* Start decoding! */
> +	vdpu_write(vpu, HEVC_REG_INTERRUPT_DEC_E, HEVC_REG_INTERRUPT);
> +
> +	return;
> +
> +error:
> +	hantro_end_prepare_run(ctx);
> +}
> diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
> new file mode 100644
> index 000000000000..f744e5695e41
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_g2_regs.h
> @@ -0,0 +1,198 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021, Collabora
> + *
> + * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> + */
> +
> +#ifndef HANTRO_G2_REGS_H_
> +#define HANTRO_G2_REGS_H_
> +
> +#include "hantro.h"
> +
> +#define G2_SWREG(nr)	((nr) * 4)
> +
> +#define HEVC_DEC_REG(name, base, shift, mask) \
> +	static const struct hantro_reg _hevc_##name[] = { \
> +		{ G2_SWREG(base), (shift), (mask) } \
> +	}; \
> +	static const struct hantro_reg __maybe_unused *hevc_##name = &_hevc_##name[0];
> +
> +#define HEVC_REG_VERSION		G2_SWREG(0)
> +
> +#define HEVC_REG_INTERRUPT		G2_SWREG(1)
> +#define HEVC_REG_INTERRUPT_DEC_RDY_INT	BIT(12)
> +#define HEVC_REG_INTERRUPT_DEC_ABORT_E	BIT(5)
> +#define HEVC_REG_INTERRUPT_DEC_IRQ_DIS	BIT(4)
> +#define HEVC_REG_INTERRUPT_DEC_E	BIT(0)
> +
> +HEVC_DEC_REG(strm_swap,		2, 28,	0xf)
> +HEVC_DEC_REG(dirmv_swap,	2, 20,	0xf)
> +
> +HEVC_DEC_REG(mode,		  3, 27, 0x1f)
> +HEVC_DEC_REG(compress_swap,	  3, 20, 0xf)
> +HEVC_DEC_REG(ref_compress_bypass, 3, 17, 0x1)
> +HEVC_DEC_REG(out_rs_e,		  3, 16, 0x1)
> +HEVC_DEC_REG(out_dis,		  3, 15, 0x1)
> +HEVC_DEC_REG(out_filtering_dis,   3, 14, 0x1)
> +HEVC_DEC_REG(write_mvs_e,	  3, 12, 0x1)
> +
> +HEVC_DEC_REG(pic_width_in_cbs,	4, 19,	0x1ff)
> +HEVC_DEC_REG(pic_height_in_cbs,	4, 6,	0x1ff)
> +HEVC_DEC_REG(num_ref_frames,	4, 0,	0x1f)
> +
> +HEVC_DEC_REG(scaling_list_e,	5, 24,	0x1)
> +HEVC_DEC_REG(cb_qp_offset,	5, 19,	0x1f)
> +HEVC_DEC_REG(cr_qp_offset,	5, 14,	0x1f)
> +HEVC_DEC_REG(sign_data_hide,	5, 12,	0x1)
> +HEVC_DEC_REG(tempor_mvp_e,	5, 11,	0x1)
> +HEVC_DEC_REG(max_cu_qpd_depth,	5, 5,	0x3f)
> +HEVC_DEC_REG(cu_qpd_e,		5, 4,	0x1)
> +
> +HEVC_DEC_REG(stream_len,	6, 0,	0xffffffff)
> +
> +HEVC_DEC_REG(cabac_init_present, 7, 31, 0x1)
> +HEVC_DEC_REG(weight_pred_e,	 7, 28, 0x1)
> +HEVC_DEC_REG(weight_bipr_idc,	 7, 26, 0x3)
> +HEVC_DEC_REG(filter_over_slices, 7, 25, 0x1)
> +HEVC_DEC_REG(filter_over_tiles,  7, 24, 0x1)
> +HEVC_DEC_REG(asym_pred_e,	 7, 23, 0x1)
> +HEVC_DEC_REG(sao_e,		 7, 22, 0x1)
> +HEVC_DEC_REG(pcm_filt_d,	 7, 21, 0x1)
> +HEVC_DEC_REG(slice_chqp_present, 7, 20, 0x1)
> +HEVC_DEC_REG(dependent_slice,	 7, 19, 0x1)
> +HEVC_DEC_REG(filter_override,	 7, 18, 0x1)
> +HEVC_DEC_REG(strong_smooth_e,	 7, 17, 0x1)
> +HEVC_DEC_REG(filt_offset_beta,	 7, 12, 0x1f)
> +HEVC_DEC_REG(filt_offset_tc,	 7, 7,  0x1f)
> +HEVC_DEC_REG(slice_hdr_ext_e,	 7, 6,	0x1)
> +HEVC_DEC_REG(slice_hdr_ext_bits, 7, 3,	0x7)
> +
> +HEVC_DEC_REG(const_intra_e,	 8, 31, 0x1)
> +HEVC_DEC_REG(filt_ctrl_pres,	 8, 30, 0x1)
> +HEVC_DEC_REG(idr_pic_e,		 8, 16, 0x1)
> +HEVC_DEC_REG(bit_depth_pcm_y,	 8, 12, 0xf)
> +HEVC_DEC_REG(bit_depth_pcm_c,	 8, 8,  0xf)
> +HEVC_DEC_REG(bit_depth_y_minus8, 8, 6,  0x3)
> +HEVC_DEC_REG(bit_depth_c_minus8, 8, 4,  0x3)
> +HEVC_DEC_REG(output_8_bits,	 8, 3,  0x1)
> +
> +HEVC_DEC_REG(refidx1_active,	9, 19,	0x1f)
> +HEVC_DEC_REG(refidx0_active,	9, 14,	0x1f)
> +HEVC_DEC_REG(hdr_skip_lenght,	9, 0,	0x3fff)
> +
> +HEVC_DEC_REG(start_code_e,	10, 31, 0x1)
> +HEVC_DEC_REG(init_qp,		10, 24, 0x3f)
> +HEVC_DEC_REG(num_tile_cols,	10, 19, 0x1f)
> +HEVC_DEC_REG(num_tile_rows,	10, 14, 0x1f)
> +HEVC_DEC_REG(tile_e,		10, 1,	0x1)
> +HEVC_DEC_REG(entropy_sync_e,	10, 0,	0x1)
> +
> +HEVC_DEC_REG(refer_lterm_e,	12, 16, 0xffff)
> +HEVC_DEC_REG(min_cb_size,	12, 13, 0x7)
> +HEVC_DEC_REG(max_cb_size,	12, 10, 0x7)
> +HEVC_DEC_REG(min_pcm_size,	12, 7,  0x7)
> +HEVC_DEC_REG(max_pcm_size,	12, 4,  0x7)
> +HEVC_DEC_REG(pcm_e,		12, 3,  0x1)
> +HEVC_DEC_REG(transform_skip,	12, 2,	0x1)
> +HEVC_DEC_REG(transq_bypass,	12, 1,	0x1)
> +HEVC_DEC_REG(list_mod_e,	12, 0,	0x1)
> +
> +HEVC_DEC_REG(min_trb_size,	  13, 13, 0x7)
> +HEVC_DEC_REG(max_trb_size,	  13, 10, 0x7)
> +HEVC_DEC_REG(max_intra_hierdepth, 13, 7,  0x7)
> +HEVC_DEC_REG(max_inter_hierdepth, 13, 4,  0x7)
> +HEVC_DEC_REG(parallel_merge,	  13, 0,  0xf)
> +
> +HEVC_DEC_REG(rlist_f0,		14, 0,	0x1f)
> +HEVC_DEC_REG(rlist_f1,		14, 10,	0x1f)
> +HEVC_DEC_REG(rlist_f2,		14, 20,	0x1f)
> +HEVC_DEC_REG(rlist_b0,		14, 5,	0x1f)
> +HEVC_DEC_REG(rlist_b1,		14, 15, 0x1f)
> +HEVC_DEC_REG(rlist_b2,		14, 25, 0x1f)
> +
> +HEVC_DEC_REG(rlist_f3,		15, 0,	0x1f)
> +HEVC_DEC_REG(rlist_f4,		15, 10, 0x1f)
> +HEVC_DEC_REG(rlist_f5,		15, 20, 0x1f)
> +HEVC_DEC_REG(rlist_b3,		15, 5,	0x1f)
> +HEVC_DEC_REG(rlist_b4,		15, 15, 0x1f)
> +HEVC_DEC_REG(rlist_b5,		15, 25, 0x1f)
> +
> +HEVC_DEC_REG(rlist_f6,		16, 0,	0x1f)
> +HEVC_DEC_REG(rlist_f7,		16, 10, 0x1f)
> +HEVC_DEC_REG(rlist_f8,		16, 20, 0x1f)
> +HEVC_DEC_REG(rlist_b6,		16, 5,	0x1f)
> +HEVC_DEC_REG(rlist_b7,		16, 15, 0x1f)
> +HEVC_DEC_REG(rlist_b8,		16, 25, 0x1f)
> +
> +HEVC_DEC_REG(rlist_f9,		17, 0,	0x1f)
> +HEVC_DEC_REG(rlist_f10,		17, 10, 0x1f)
> +HEVC_DEC_REG(rlist_f11,		17, 20, 0x1f)
> +HEVC_DEC_REG(rlist_b9,		17, 5,	0x1f)
> +HEVC_DEC_REG(rlist_b10,		17, 15, 0x1f)
> +HEVC_DEC_REG(rlist_b11,		17, 25, 0x1f)
> +
> +HEVC_DEC_REG(rlist_f12,		18, 0,	0x1f)
> +HEVC_DEC_REG(rlist_f13,		18, 10, 0x1f)
> +HEVC_DEC_REG(rlist_f14,		18, 20, 0x1f)
> +HEVC_DEC_REG(rlist_b12,		18, 5,	0x1f)
> +HEVC_DEC_REG(rlist_b13,		18, 15, 0x1f)
> +HEVC_DEC_REG(rlist_b14,		18, 25, 0x1f)
> +
> +HEVC_DEC_REG(rlist_f15,		19, 0,	0x1f)
> +HEVC_DEC_REG(rlist_b15,		19, 5,	0x1f)
> +
> +HEVC_DEC_REG(partial_ctb_x,	20, 31, 0x1)
> +HEVC_DEC_REG(partial_ctb_y,	20, 30, 0x1)
> +HEVC_DEC_REG(pic_width_4x4,	20, 16, 0xfff)
> +HEVC_DEC_REG(pic_height_4x4,	20, 0,  0xfff)
> +
> +HEVC_DEC_REG(cur_poc_00,	46, 24,	0xff)
> +HEVC_DEC_REG(cur_poc_01,	46, 16,	0xff)
> +HEVC_DEC_REG(cur_poc_02,	46, 8,	0xff)
> +HEVC_DEC_REG(cur_poc_03,	46, 0,	0xff)
> +
> +HEVC_DEC_REG(cur_poc_04,	47, 24,	0xff)
> +HEVC_DEC_REG(cur_poc_05,	47, 16,	0xff)
> +HEVC_DEC_REG(cur_poc_06,	47, 8,	0xff)
> +HEVC_DEC_REG(cur_poc_07,	47, 0,	0xff)
> +
> +HEVC_DEC_REG(cur_poc_08,	48, 24,	0xff)
> +HEVC_DEC_REG(cur_poc_09,	48, 16,	0xff)
> +HEVC_DEC_REG(cur_poc_10,	48, 8,	0xff)
> +HEVC_DEC_REG(cur_poc_11,	48, 0,	0xff)
> +
> +HEVC_DEC_REG(cur_poc_12,	49, 24, 0xff)
> +HEVC_DEC_REG(cur_poc_13,	49, 16, 0xff)
> +HEVC_DEC_REG(cur_poc_14,	49, 8,	0xff)
> +HEVC_DEC_REG(cur_poc_15,	49, 0,	0xff)
> +
> +HEVC_DEC_REG(apf_threshold,	55, 0,	0xffff)
> +
> +HEVC_DEC_REG(clk_gate_e,	58, 16,	0x1)
> +HEVC_DEC_REG(buswidth,		58, 8,	0x7)
> +HEVC_DEC_REG(max_burst,		58, 0,	0xff)
> +
> +#define HEVC_REG_CONFIG				G2_SWREG(58)
> +#define HEVC_REG_CONFIG_DEC_CLK_GATE_E		BIT(16)
> +#define HEVC_REG_CONFIG_DEC_CLK_GATE_IDLE_E	BIT(17)
> +
> +#define HEVC_ADDR_DST		(G2_SWREG(65))
> +#define HEVC_REG_ADDR_REF(i)	(G2_SWREG(67)  + ((i) * 0x8))
> +#define HEVC_ADDR_DST_CHR	(G2_SWREG(99))
> +#define HEVC_REG_CHR_REF(i)	(G2_SWREG(101) + ((i) * 0x8))
> +#define HEVC_ADDR_DST_MV	(G2_SWREG(133))
> +#define HEVC_REG_DMV_REF(i)	(G2_SWREG(135) + ((i) * 0x8))
> +#define HEVC_ADDR_TILE_SIZE	(G2_SWREG(167))
> +#define HEVC_ADDR_STR		(G2_SWREG(169))
> +#define HEVC_SCALING_LIST	(G2_SWREG(171))
> +#define HEVC_RASTER_SCAN	(G2_SWREG(175))
> +#define HEVC_RASTER_SCAN_CHR	(G2_SWREG(177))
> +#define HEVC_TILE_FILTER	(G2_SWREG(179))
> +#define HEVC_TILE_SAO		(G2_SWREG(181))
> +#define HEVC_TILE_BSD		(G2_SWREG(183))
> +
> +HEVC_DEC_REG(strm_buffer_len,	258, 0,	0xffffffff)
> +HEVC_DEC_REG(strm_start_offset,	259, 0,	0xffffffff)
> +
> +#endif
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> new file mode 100644
> index 000000000000..6db1594ae5be
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VPU HEVC codec driver
> + *
> + * Copyright (C) 2020 Safran Passenger Innovations LLC
> + */
> +
> +#include <linux/types.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "hantro.h"
> +#include "hantro_hw.h"
> +
> +#define VERT_FILTER_RAM_SIZE 8 /* bytes per pixel row */
> +/*
> + * BSD control data of current picture at tile border
> + * 128 bits per 4x4 tile = 128/(8*4) bytes per row
> + */
> +#define BSD_CTRL_RAM_SIZE 4 /* bytes per pixel row */
> +/* tile border coefficients of filter */
> +#define VERT_SAO_RAM_SIZE 48 /* bytes per pixel */
> +
> +#define SCALING_LIST_SIZE (16 * 64)
> +#define MAX_TILE_COLS 20
> +#define MAX_TILE_ROWS 22
> +
> +#define UNUSED_REF	-1
> +
> +#define G2_ALIGN		16
> +#define MC_WORD_SIZE		32
> +
> +size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps)
> +{
> +	int bytes_per_pixel = sps->bit_depth_luma_minus8 == 0 ? 1 : 2;
> +
> +	return sps->pic_width_in_luma_samples *
> +		sps->pic_height_in_luma_samples * bytes_per_pixel;
> +}
> +
> +size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps *sps)
> +{
> +	size_t cr_offset = hantro_hevc_chroma_offset(sps);
> +
> +	return ALIGN((cr_offset * 3) / 2, G2_ALIGN) + MC_WORD_SIZE;
> +}
> +
> +static size_t hantro_hevc_mv_size(const struct v4l2_ctrl_hevc_sps *sps)
> +{
> +	u32 pic_width_in_ctb64 = (sps->pic_width_in_luma_samples + (1 << 8) - 1) >> 8;
> +	u32 pic_height_in_ctb64 = (sps->pic_height_in_luma_samples  + (1 << 8) - 1) >> 8;
> +	size_t mv_size;
> +
> +	mv_size = (pic_width_in_ctb64 * pic_height_in_ctb64 *
> +		  (1 << (2 * (8 - 4))) *
> +		  16) + 32;

This can fit on two lines:

	mv_size = (pic_width_in_ctb64 * pic_height_in_ctb64 *
		  (1 << (2 * (8 - 4))) * 16) + 32;

I still don't know what these numbers mean necessarily...  :/


> +
> +	vpu_debug(4, "%dx%d (CTBs) %lu MV bytes\n",
> +		  pic_width_in_ctb64, pic_height_in_ctb64, mv_size);
> +
> +	return mv_size;
> +}
> +
> +static size_t hantro_hevc_ref_size(struct hantro_ctx *ctx)
> +{
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +
> +	return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps);
> +}
> +
> +static void hantro_hevc_ref_free(struct hantro_ctx *ctx)
> +{
> +	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> +	struct hantro_dev *vpu = ctx->dev;
> +	int i;
> +
> +	/* Just tag buffer as unused, do not free them */
> +	for (i = 0;  i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> +		if (hevc_dec->ref_bufs[i].cpu)
> +			memset(hevc_dec->ref_bufs[i].cpu, 0, hantro_hevc_ref_size(ctx));
> +		hantro_aux_buf_free(vpu, &hevc_dec->ref_bufs[i]);
> +	}
> +}
> +
> +static void hantro_hevc_ref_init(struct hantro_ctx *ctx)
> +{
> +	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> +	int i;
> +
> +	for (i = 0;  i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++)
> +		hevc_dec->ref_bufs_poc[i] = UNUSED_REF;
> +}
> +
> +dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
> +				   int poc)
> +{
> +	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> +	int i, ret;
> +
> +	/* Find the reference buffer in already know ones */
> +	for (i = 0;  i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> +		if (hevc_dec->ref_bufs_poc[i] == poc) {
> +			hevc_dec->ref_bufs_used |= 1 << i;
> +			return hevc_dec->ref_bufs[i].dma;
> +		}
> +	}
> +
> +	/* Allocate a new reference buffer */
> +	for (i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> +		if (hevc_dec->ref_bufs_poc[i] == UNUSED_REF) {
> +			if (!hevc_dec->ref_bufs[i].cpu) {
> +				struct hantro_dev *vpu = ctx->dev;
> +
> +				ret = hantro_aux_buf_alloc(vpu,
> +							   &hevc_dec->ref_bufs[i],
> +							   hantro_hevc_ref_size(ctx));
> +				if (ret)
> +					goto failed;

Just "return 0;"  This is a do-nothing goto.  The common bug introduced
by do-nothing gotos is that we forget to return the error code.  So then
I look down and I briefly have to wonder if it should be "return ret;".
But "return 0;" is obviously intentional so there are no ambiguities or
questions.

> +			}
> +			hevc_dec->ref_bufs_used |= 1 << i;
> +			memset(hevc_dec->ref_bufs[i].cpu, 0, hantro_hevc_ref_size(ctx));
> +			hevc_dec->ref_bufs_poc[i] = poc;
> +
> +			return hevc_dec->ref_bufs[i].dma;
> +		}
> +	}
> +
> +failed:
> +	return 0;
> +}
> +
> +void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx)
> +{
> +	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> +	int i;
> +
> +	/* Just tag buffer as unused, do not free them */
> +	for (i = 0;  i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> +		if (hevc_dec->ref_bufs_poc[i] == UNUSED_REF)
> +			continue;
> +
> +		if (hevc_dec->ref_bufs_used & (1 << i))
> +			continue;
> +
> +		hevc_dec->ref_bufs_poc[i] = UNUSED_REF;
> +	}
> +}
> +
> +static int tile_buffer_reallocate(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> +	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +	unsigned int num_tile_cols = pps->num_tile_columns_minus1 + 1;
> +	unsigned int height64 = (sps->pic_height_in_luma_samples + 63) & ~63;
> +	unsigned int size;
> +	int ret;
> +
> +	if (num_tile_cols > 1 && num_tile_cols > hevc_dec->num_tile_cols_allocated) {

Reverse the if condition and pull things back a tab.  I don't know this
subsystem.  Apparently the _minus1 stuff is set by a standards body and
wow does that seem horrible!  But it's weird to me that we have to
check for == 1 here.  I would have thought that would be checked at a
more central location because it feels like anything else would lead to
a constant stream of bugs.

	if (num_tile_cols == 1 ||
	    num_tile_cols <= hevc_dec->num_tile_cols_allocated)
		return 0;


> +		/* Need to reallocate due to tiles passed via PPS */
> +		hantro_aux_buf_free(vpu, &hevc_dec->tile_filter);
> +		hantro_aux_buf_free(vpu, &hevc_dec->tile_sao);
> +		hantro_aux_buf_free(vpu, &hevc_dec->tile_bsd);
> +
> +		size = VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1);
> +		ret = hantro_aux_buf_alloc(vpu, &hevc_dec->tile_filter, size);
> +		if (ret)
> +			goto err_free_tile_buffers;
> +
> +		size = VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1);
> +		ret = hantro_aux_buf_alloc(vpu, &hevc_dec->tile_sao, size);
> +		if (ret)
> +			goto err_free_tile_buffers;
> +
> +		size = BSD_CTRL_RAM_SIZE * height64 * (num_tile_cols - 1);
> +		ret = hantro_aux_buf_alloc(vpu, &hevc_dec->tile_bsd, size);
> +		if (ret)
> +			goto err_free_tile_buffers;
> +
> +		hevc_dec->num_tile_cols_allocated = num_tile_cols;
> +	}
> +	return 0;
> +
> +err_free_tile_buffers:
> +	hantro_aux_buf_free(vpu, &hevc_dec->tile_filter);
> +	hantro_aux_buf_free(vpu, &hevc_dec->tile_sao);
> +	hantro_aux_buf_free(vpu, &hevc_dec->tile_bsd);
> +	return ret;
> +}
> +
> +int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx)
> +{
> +	struct hantro_hevc_dec_hw_ctx *hevc_ctx = &ctx->hevc_dec;
> +	struct hantro_hevc_dec_ctrls *ctrls = &hevc_ctx->ctrls;
> +	int ret;
> +
> +	hantro_start_prepare_run(ctx);
> +
> +	ctrls->scaling =
> +		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
> +	if (WARN_ON(!ctrls->scaling))
> +		return -EINVAL;
> +
> +	ctrls->decode_params =
> +		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
> +	if (WARN_ON(!ctrls->decode_params))
> +		return -EINVAL;
> +
> +	ctrls->sps =
> +		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_SPS);
> +	if (WARN_ON(!ctrls->sps))
> +		return -EINVAL;
> +
> +	ctrls->pps =
> +		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_PPS);
> +	if (WARN_ON(!ctrls->pps))
> +		return -EINVAL;
> +
> +	ret = tile_buffer_reallocate(ctx);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +void hantro_hevc_dec_exit(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> +
> +	hantro_aux_buf_free(vpu, &hevc_dec->scaling_lists);
> +	hantro_aux_buf_free(vpu, &hevc_dec->tile_sizes);
> +	hantro_aux_buf_free(vpu, &hevc_dec->tile_filter);
> +	hantro_aux_buf_free(vpu, &hevc_dec->tile_sao);
> +	hantro_aux_buf_free(vpu, &hevc_dec->tile_bsd);
> +	hantro_hevc_ref_free(ctx);
> +}
> +
> +int hantro_hevc_dec_init(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> +	unsigned int size;
> +	int ret;
> +
> +	memset(hevc_dec, 0, sizeof(struct hantro_hevc_dec_hw_ctx));

	memset(hevc_dec, 0, sizeof(*hevc_dec));

> +
> +	ret = hantro_aux_buf_alloc(vpu, &hevc_dec->scaling_lists,
> +				   SCALING_LIST_SIZE);
> +	if (ret)
> +		goto err_free_buffers;
> +
> +	/*
> +	 * Maximum number of tiles times width and height (2 bytes each),
> +	 * rounding up to next 16 bytes boundary + one extra 16 byte
> +	 * chunk (HW guys wanted to have this).
> +	 */
> +	size = (MAX_TILE_COLS * MAX_TILE_ROWS * 4 * sizeof(u16) + 15 + 16) & ~0xF;

Use the round_up() macro.

> +	ret = hantro_aux_buf_alloc(vpu, &hevc_dec->tile_sizes,
> +				   size);
> +	if (ret)
> +		goto err_free_buffers;
> +
> +	hantro_hevc_ref_init(ctx);
> +
> +	return 0;
> +
> +err_free_buffers:
> +	hantro_aux_buf_free(vpu, &hevc_dec->scaling_lists);
> +	hantro_aux_buf_free(vpu, &hevc_dec->tile_sizes);
> +	return -ENOMEM;

Better to propagate the error code "return ret;"

> +}

regards,
dan carpenter

