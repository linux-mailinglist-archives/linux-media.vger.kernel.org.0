Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58991984EA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 21:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgC3Tws (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 15:52:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35994 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728393AbgC3Tws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 15:52:48 -0400
Received: from [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d] (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B845828B3D5;
        Mon, 30 Mar 2020 20:52:43 +0100 (BST)
Subject: Re: [PATCH] media: staging: rkisp1: cap: remove field fmt_type from
 struct rkisp1_capture_fmt_cfg
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200328084915.21398-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <ce4d8d70-eb62-bfb2-284c-4e2408842d48@collabora.com>
Date:   Mon, 30 Mar 2020 16:52:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200328084915.21398-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch

On 3/28/20 5:49 AM, Dafna Hirschfeld wrote:
> The pixel encoding can be retrieved from the cap->pix.info.
> Therefore the field fmt_type can be removed from the
> struct rkisp1_capture_fmt_cfg.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 62 +++++--------------
>  1 file changed, 17 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 24fe6a7888aa..01e1ff5943f1 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -52,7 +52,6 @@ enum rkisp1_plane {
>   */
>  struct rkisp1_capture_fmt_cfg {
>  	u32 fourcc;
> -	u8 fmt_type;
>  	u8 uv_swap;
>  	u32 write_format;
>  	u32 output_format;
> @@ -83,11 +82,24 @@ struct rkisp1_capture_config {
>  	} mi;
>  };
>  
> +static enum rkisp1_fmt_pix_type
> +rkisp1_pixel_enc_to_fmt_pix(const struct v4l2_format_info *f)
> +{
> +	switch (f->pixel_enc) {
> +	case V4L2_PIXEL_ENC_RGB:
> +		return RKISP1_FMT_RGB;
> +	case V4L2_PIXEL_ENC_YUV:
> +		return RKISP1_FMT_YUV;
> +	case V4L2_PIXEL_ENC_BAYER:
> +		return RKISP1_FMT_BAYER;
> +	}
> +	return V4L2_PIXEL_ENC_UNKNOWN;
> +}

Can't we remove enum·rkisp1_fmt_pix_type completly? And use V4L2_PIXEL_ENC_* directly?

Regards,
Helen

> +
>  static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  	/* yuv422 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUYV,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	}, {
> @@ -101,119 +113,95 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV16,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV61,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU422M,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	},
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV21M,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12M,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV420,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU420,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	},
>  	/* yuv444 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV444M,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	},
>  	/* yuv400 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	},
>  	/* raw */
>  	{
>  		.fourcc = V4L2_PIX_FMT_SRGGB8,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG8,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG8,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR8,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SRGGB10,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG10,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG10,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR10,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SRGGB12,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG12,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG12,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR12,
> -		.fmt_type = RKISP1_FMT_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	},
>  };
> @@ -222,7 +210,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv422 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUYV,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> @@ -240,25 +227,21 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV16,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV61,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU422M,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> @@ -266,37 +249,31 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV21M,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12M,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV420,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU420,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> @@ -304,7 +281,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv444 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV444M,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV444,
> @@ -312,7 +288,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv400 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
> -		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> @@ -320,17 +295,14 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* rgb */
>  	{
>  		.fourcc = V4L2_PIX_FMT_RGB24,
> -		.fmt_type = RKISP1_FMT_RGB,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_RGB565,
> -		.fmt_type = RKISP1_FMT_RGB,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_BGR666,
> -		.fmt_type = RKISP1_FMT_RGB,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB666,
>  	},
> @@ -504,13 +476,12 @@ static void rkisp1_sp_disable(struct rkisp1_capture *cap)
>  
>  static void rkisp1_mp_enable(struct rkisp1_capture *cap)
>  {
> -	const struct rkisp1_capture_fmt_cfg *isp_fmt = cap->pix.cfg;
>  	u32 mi_ctrl;
>  
>  	rkisp1_mp_disable(cap);
>  
>  	mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
> -	if (isp_fmt->fmt_type == RKISP1_FMT_BAYER)
> +	if (v4l2_is_format_bayer(cap->pix.info))
>  		mi_ctrl |= RKISP1_CIF_MI_CTRL_RAW_ENABLE;
>  	/* YUV */
>  	else
> @@ -1260,7 +1231,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  		return -EPIPE;
>  	}
>  
> -	if (cap->pix.cfg->fmt_type != isp->src_fmt->fmt_type) {
> +	if (rkisp1_pixel_enc_to_fmt_pix(cap->pix.info) !=
> +	    isp->src_fmt->fmt_type) {
>  		dev_err(cap->rkisp1->dev,
>  			"format type mismatch in link '%s:%d->%s:%d'\n",
>  			link->source->entity->name, link->source->index,
> 
