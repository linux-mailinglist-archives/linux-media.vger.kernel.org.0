Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF2B619ED29
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgDERyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:54:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59050 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgDERyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:54:52 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E56E8312;
        Sun,  5 Apr 2020 19:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586109290;
        bh=epgX/HDxiIsue+BQXRMXKPCi2Z7zbUY5UANTohvWR0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UEBpbKmn+thtRAODm7LEKFSe4KaacZr+rj64Ap11EzPWzOnfDXneJe5FM8vtPWb/G
         YJ87nR8X0Mqm0XpH3CuFbmz5F16uZzzRaRD/9eRN7wNRUBJYvXLuolOhy26HSTgqbf
         mRyReUN9qH8WeALpsacOiJ0MtU0bN90xATkDaYTs=
Date:   Sun, 5 Apr 2020 20:54:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 2/2] media: staging: rkisp1: cap: remove field
 fmt_type from struct rkisp1_capture_fmt_cfg
Message-ID: <20200405175440.GM5846@pendragon.ideasonboard.com>
References: <20200403092738.29831-1-dafna.hirschfeld@collabora.com>
 <20200403092738.29831-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200403092738.29831-3-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Fri, Apr 03, 2020 at 11:27:38AM +0200, Dafna Hirschfeld wrote:
> The pixel encoding can be retrieved from the cap->pix.info.
> Therefore the field fmt_type can be removed from the
> struct rkisp1_capture_fmt_cfg.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 51 +------------------
>  1 file changed, 2 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 8e8ea7ed8de3..0bef5faf068e 100644
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
> @@ -87,133 +86,106 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  	/* yuv422 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUYV,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVYU,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_VYUY,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV16,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV61,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU422M,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	},
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV21M,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12M,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV420,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU420,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	},
>  	/* yuv444 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV444M,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	},
>  	/* yuv400 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	},
>  	/* raw */
>  	{
>  		.fourcc = V4L2_PIX_FMT_SRGGB8,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG8,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG8,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR8,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SRGGB10,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG10,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG10,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR10,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SRGGB12,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG12,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG12,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR12,
> -		.fmt_type = V4L2_PIXEL_ENC_BAYER,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>  	},
>  };
> @@ -222,43 +194,36 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv422 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUYV,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVYU,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_VYUY,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV16,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV61,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU422M,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> @@ -266,37 +231,31 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV21M,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12M,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV420,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU420,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> @@ -304,7 +263,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv444 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV444M,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV444,
> @@ -312,7 +270,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv400 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
> -		.fmt_type = V4L2_PIXEL_ENC_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> @@ -320,17 +277,14 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* rgb */
>  	{
>  		.fourcc = V4L2_PIX_FMT_RGB24,
> -		.fmt_type = V4L2_PIXEL_ENC_RGB,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_RGB565,
> -		.fmt_type = V4L2_PIXEL_ENC_RGB,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_BGR666,
> -		.fmt_type = V4L2_PIXEL_ENC_RGB,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB666,
>  	},
> @@ -504,13 +458,12 @@ static void rkisp1_sp_disable(struct rkisp1_capture *cap)
>  
>  static void rkisp1_mp_enable(struct rkisp1_capture *cap)
>  {
> -	const struct rkisp1_capture_fmt_cfg *isp_fmt = cap->pix.cfg;
>  	u32 mi_ctrl;
>  
>  	rkisp1_mp_disable(cap);
>  
>  	mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
> -	if (isp_fmt->fmt_type == V4L2_PIXEL_ENC_BAYER)
> +	if (v4l2_is_format_bayer(cap->pix.info))
>  		mi_ctrl |= RKISP1_CIF_MI_CTRL_RAW_ENABLE;
>  	/* YUV */
>  	else
> @@ -1265,7 +1218,7 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  		return -EPIPE;
>  	}
>  
> -	if (cap->pix.cfg->fmt_type != isp->src_fmt->fmt_type) {
> +	if (cap->pix.info->pixel_enc != isp->src_fmt->fmt_type) {
>  		dev_err(cap->rkisp1->dev,
>  			"format type mismatch in link '%s:%d->%s:%d'\n",
>  			link->source->entity->name, link->source->index,

-- 
Regards,

Laurent Pinchart
