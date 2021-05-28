Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C876393CC9
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 07:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbhE1F7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 01:59:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60180 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbhE1F7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 01:59:22 -0400
Received: from [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d] (unknown [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D0F161F43EDC;
        Fri, 28 May 2021 06:57:05 +0100 (BST)
Subject: Re: [PATCH v4,6/6] media: mtk-vcodec: Support MT8192 H264 4K encoding
To:     Irui Wang <irui.wang@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-7-irui.wang@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <045d7e8e-967e-dc52-8c48-514edee0c1d1@collabora.com>
Date:   Fri, 28 May 2021 08:57:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521070139.20644-7-irui.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 21.05.21 10:01, Irui Wang wrote:
> MT8192 H264 support 4k(3840x2176) and Level 5.1 encoding,
> add related path according to enc_capability.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 75 ++++++++++++-------
>   .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 +
>   2 files changed, 54 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 42ff13867940..7396a5050b45 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -19,23 +19,32 @@
>   
>   #define MTK_VENC_MIN_W	160U
>   #define MTK_VENC_MIN_H	128U
> -#define MTK_VENC_MAX_W	1920U
> -#define MTK_VENC_MAX_H	1088U
> +#define MTK_VENC_HD_MAX_W	1920U
> +#define MTK_VENC_HD_MAX_H	1088U
> +#define MTK_VENC_4K_MAX_W	3840U
> +#define MTK_VENC_4K_MAX_H	2176U
> +
>   #define DFT_CFG_WIDTH	MTK_VENC_MIN_W
>   #define DFT_CFG_HEIGHT	MTK_VENC_MIN_H
>   #define MTK_MAX_CTRLS_HINT	20
>   
>   #define MTK_DEFAULT_FRAMERATE_NUM 1001
>   #define MTK_DEFAULT_FRAMERATE_DENOM 30000
> +#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
>   
>   static void mtk_venc_worker(struct work_struct *work);
>   
> -static const struct v4l2_frmsize_stepwise mtk_venc_framesizes = {
> -	MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
> -	MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16,
> +static const struct v4l2_frmsize_stepwise mtk_venc_hd_framesizes = {
> +	MTK_VENC_MIN_W, MTK_VENC_HD_MAX_W, 16,
> +	MTK_VENC_MIN_H, MTK_VENC_HD_MAX_H, 16,
> +};
> +
> +static const struct v4l2_frmsize_stepwise mtk_venc_4k_framesizes = {
> +	MTK_VENC_MIN_W, MTK_VENC_4K_MAX_W, 16,
> +	MTK_VENC_MIN_H, MTK_VENC_4K_MAX_H, 16,
>   };
>   
> -#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_venc_framesizes)
> +#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_venc_hd_framesizes)

This define is never used so it can be removed.

Thanks,
Dafna

>   
>   static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
> @@ -151,17 +160,20 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
>   				  struct v4l2_frmsizeenum *fsize)
>   {
>   	const struct mtk_video_fmt *fmt;
> +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(fh);
>   
>   	if (fsize->index != 0)
>   		return -EINVAL;
>   
>   	fmt = mtk_venc_find_format(fsize->pixel_format,
> -				   fh_to_ctx(fh)->dev->venc_pdata);
> +				   ctx->dev->venc_pdata);
>   	if (!fmt)
>   		return -EINVAL;
>   
>   	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> -	fsize->stepwise = mtk_venc_framesizes;
> +	fsize->stepwise =
> +		(ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) ?
> +		mtk_venc_4k_framesizes : mtk_venc_hd_framesizes;
>   
>   	return 0;
>   }
> @@ -248,7 +260,7 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
>   /* V4L2 specification suggests the driver corrects the format struct if any of
>    * the dimensions is unsupported
>    */
> -static int vidioc_try_fmt(struct v4l2_format *f,
> +static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
>   			  const struct mtk_video_fmt *fmt)
>   {
>   	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
> @@ -260,13 +272,22 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>   		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
>   	} else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>   		int tmp_w, tmp_h;
> +		unsigned int max_width, max_height;
> +
> +		if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
> +			max_width = MTK_VENC_4K_MAX_W;
> +			max_height = MTK_VENC_4K_MAX_H;
> +		} else {
> +			max_width = MTK_VENC_HD_MAX_W;
> +			max_height = MTK_VENC_HD_MAX_H;
> +		}
>   
>   		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
>   					MTK_VENC_MIN_H,
> -					MTK_VENC_MAX_H);
> +					max_height);
>   		pix_fmt_mp->width = clamp(pix_fmt_mp->width,
>   					MTK_VENC_MIN_W,
> -					MTK_VENC_MAX_W);
> +					max_width);
>   
>   		/* find next closer width align 16, heign align 32, size align
>   		 * 64 rectangle
> @@ -275,16 +296,16 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>   		tmp_h = pix_fmt_mp->height;
>   		v4l_bound_align_image(&pix_fmt_mp->width,
>   					MTK_VENC_MIN_W,
> -					MTK_VENC_MAX_W, 4,
> +					max_width, 4,
>   					&pix_fmt_mp->height,
>   					MTK_VENC_MIN_H,
> -					MTK_VENC_MAX_H, 5, 6);
> +					max_height, 5, 6);
>   
>   		if (pix_fmt_mp->width < tmp_w &&
> -			(pix_fmt_mp->width + 16) <= MTK_VENC_MAX_W)
> +			(pix_fmt_mp->width + 16) <= max_width)
>   			pix_fmt_mp->width += 16;
>   		if (pix_fmt_mp->height < tmp_h &&
> -			(pix_fmt_mp->height + 32) <= MTK_VENC_MAX_H)
> +			(pix_fmt_mp->height + 32) <= max_height)
>   			pix_fmt_mp->height += 32;
>   
>   		mtk_v4l2_debug(0,
> @@ -405,7 +426,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
>   	}
>   
>   	q_data->fmt = fmt;
> -	ret = vidioc_try_fmt(f, q_data->fmt);
> +	ret = vidioc_try_fmt(ctx, f, q_data->fmt);
>   	if (ret)
>   		return ret;
>   
> @@ -467,7 +488,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>   		f->fmt.pix.pixelformat = fmt->fourcc;
>   	}
>   
> -	ret = vidioc_try_fmt(f, fmt);
> +	ret = vidioc_try_fmt(ctx, f, fmt);
>   	if (ret)
>   		return ret;
>   
> @@ -545,7 +566,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>   	f->fmt.pix_mp.quantization = ctx->quantization;
>   	f->fmt.pix_mp.xfer_func = ctx->xfer_func;
>   
> -	return vidioc_try_fmt(f, fmt);
> +	return vidioc_try_fmt(ctx, f, fmt);
>   }
>   
>   static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
> @@ -567,7 +588,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
>   		f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>   	}
>   
> -	return vidioc_try_fmt(f, fmt);
> +	return vidioc_try_fmt(ctx, f, fmt);
>   }
>   
>   static int vidioc_venc_g_selection(struct file *file, void *priv,
> @@ -1171,16 +1192,16 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
>   
>   	v4l_bound_align_image(&q_data->coded_width,
>   				MTK_VENC_MIN_W,
> -				MTK_VENC_MAX_W, 4,
> +				MTK_VENC_HD_MAX_W, 4,
>   				&q_data->coded_height,
>   				MTK_VENC_MIN_H,
> -				MTK_VENC_MAX_H, 5, 6);
> +				MTK_VENC_HD_MAX_H, 5, 6);
>   
>   	if (q_data->coded_width < DFT_CFG_WIDTH &&
> -		(q_data->coded_width + 16) <= MTK_VENC_MAX_W)
> +		(q_data->coded_width + 16) <= MTK_VENC_HD_MAX_W)
>   		q_data->coded_width += 16;
>   	if (q_data->coded_height < DFT_CFG_HEIGHT &&
> -		(q_data->coded_height + 32) <= MTK_VENC_MAX_H)
> +		(q_data->coded_height + 32) <= MTK_VENC_HD_MAX_H)
>   		q_data->coded_height += 32;
>   
>   	q_data->sizeimage[0] =
> @@ -1210,6 +1231,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>   {
>   	const struct v4l2_ctrl_ops *ops = &mtk_vcodec_enc_ctrl_ops;
>   	struct v4l2_ctrl_handler *handler = &ctx->ctrl_hdl;
> +	const u8 h264_max_level =
> +		(ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) ?
> +		V4L2_MPEG_VIDEO_H264_LEVEL_5_1 : V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
>   
>   	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
>   
> @@ -1240,8 +1264,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>   			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>   			0, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
>   	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> -			V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> -			0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
> +			       h264_max_level,
> +			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
> +
>   	if (handler->error) {
>   		mtk_v4l2_err("Init control handler fail %d",
>   				handler->error);
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index d0123dfc5f93..b6a4f2074fa5 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -215,6 +215,10 @@ static unsigned int h264_get_level(struct venc_h264_inst *inst,
>   		return 41;
>   	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
>   		return 42;
> +	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
> +		return 50;
> +	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
> +		return 51;
>   	default:
>   		mtk_vcodec_debug(inst, "unsupported level %d", level);
>   		return 31;
> 
