Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 525A2145785
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 15:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgAVOOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 09:14:25 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33658 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVOOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 09:14:25 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 0B2232927C8
Subject: Re: [PATCH v2] media: vimc: get pixformat info from v4l2_format_info
To:     "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org
References: <20200122084025.628462-1-carlosecb@tutanota.com>
From:   Helen Koike <helen.koike@collabora.com>
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <cae36ff9-6f45-6550-9ec0-24e09ac0ea79@collabora.com>
Date:   Wed, 22 Jan 2020 11:14:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200122084025.628462-1-carlosecb@tutanota.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Carlos,

Thanks for the patch, just some small comments below.

On 1/22/20 6:40 AM, Carlos E. C. Barbosa wrote:
> From: "Carlos E.C. Barbosa" <carlosecb@tutanota.com>
> 
> There is overlapping code over two distinct lists. This repurposes one
> of vimc_pix_map for strictly mapping formats and remaps other calls to
> the matching v4l2_format_info.
> 
> Signed-off-by: Carlos E. C. Barbosa <carlosecb@tutanota.com>
> ---
> Changes in v2:
> As advised by Helen Koike and Hans Verkuil, the const qualifiers are not
> removed, the bayer flag is kept and the unnecessary changes are not
> made.
> 
> v4l2-compliance message:
> https://pastebin.com/1XF45aCA
> 
> ---
>  drivers/media/platform/vimc/vimc-capture.c | 19 ++++++++++++------
>  drivers/media/platform/vimc/vimc-common.c  | 23 ----------------------
>  drivers/media/platform/vimc/vimc-common.h  |  2 --
>  drivers/media/platform/vimc/vimc-debayer.c |  7 +++++--
>  drivers/media/platform/vimc/vimc-scaler.c  | 12 +++++++++--
>  drivers/media/platform/vimc/vimc-sensor.c  | 12 ++++++++---
>  6 files changed, 37 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 76c015898cfd..30659e934cfb 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -86,6 +86,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>  {
>  	struct v4l2_pix_format *format = &f->fmt.pix;
>  	const struct vimc_pix_map *vpix;
> +	const struct v4l2_format_info *vinfo;

Could you please declare vinfo before vpix? I was trying to keep bigger lines
first in the declaration order, but not a big deal.

Same in other places of this patch.

>  
>  	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
>  				VIMC_FRAME_MAX_WIDTH) & ~1;
> @@ -94,12 +95,13 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>  
>  	/* Don't accept a pixelformat that is not on the table */
>  	vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
> -	if (!vpix) {
> +	if (!vpix)
>  		format->pixelformat = fmt_default.pixelformat;
> -		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
> -	}
> +
> +	vinfo = v4l2_format_info(format->pixelformat);
> +
>  	/* TODO: Add support for custom bytesperline values */
> -	format->bytesperline = format->width * vpix->bpp;
> +	format->bytesperline = format->width * vinfo->bpp[0];
>  	format->sizeimage = format->bytesperline * format->height;
>  
>  	if (format->field == V4L2_FIELD_ANY)
> @@ -166,6 +168,7 @@ static int vimc_cap_enum_framesizes(struct file *file, void *fh,
>  
>  	/* Only accept code in the pix map table */
>  	vpix = vimc_pix_map_by_code(fsize->pixel_format);
> +

You don't need to add a new line here, please, remember to review the patch yourself
before sending it :)

>  	if (!vpix)
>  		return -EINVAL;
>  
> @@ -386,10 +389,11 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  				     const char *vcfg_name)
>  {
>  	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
> -	const struct vimc_pix_map *vpix;

No need to change this if you are just adding vinfo.

>  	struct vimc_cap_device *vcap;
>  	struct video_device *vdev;
>  	struct vb2_queue *q;
> +	const struct vimc_pix_map *vpix;
> +	const struct v4l2_format_info *vinfo;
>  	int ret;
>  
>  	/* Allocate the vimc_cap_device struct */
> @@ -434,8 +438,11 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  
>  	/* Set default frame format */
>  	vcap->format = fmt_default;
> +
>  	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
> -	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
> +	vinfo = v4l2_format_info(vpix->pixelformat);
> +
> +	vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
>  	vcap->format.sizeimage = vcap->format.bytesperline *
>  				 vcap->format.height;
>  
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 16ce9f3b7c75..8327ada1b461 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -21,19 +21,16 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_BGR888_1X24,
>  		.pixelformat = V4L2_PIX_FMT_BGR24,
> -		.bpp = 3,
>  		.bayer = false,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_RGB888_1X24,
>  		.pixelformat = V4L2_PIX_FMT_RGB24,
> -		.bpp = 3,
>  		.bayer = false,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_ARGB8888_1X32,
>  		.pixelformat = V4L2_PIX_FMT_ARGB32,
> -		.bpp = 4,
>  		.bayer = false,
>  	},
>  
> @@ -41,49 +38,41 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10,
> -		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10,
> -		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10,
> -		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10,
> -		.bpp = 2,
>  		.bayer = true,
>  	},
>  
> @@ -91,25 +80,21 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  
> @@ -117,49 +102,41 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
> -		.bpp = 1,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR12,
> -		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG12,
> -		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG12,
> -		.bpp = 2,
>  		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB12,
> -		.bpp = 2,
>  		.bayer = true,
>  	},
>  };
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 87eb8259c2a8..dd1c45334705 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -62,7 +62,6 @@ do {									\
>   * struct vimc_pix_map - maps media bus code with v4l2 pixel format
>   *
>   * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
> - * @bbp:		number of bytes each pixel occupies
>   * @pixelformat:	pixel format devined by V4L2_PIX_FMT_* macros
>   *
>   * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
> @@ -70,7 +69,6 @@ do {									\
>   */
>  struct vimc_pix_map {
>  	unsigned int code;
> -	unsigned int bpp;
>  	u32 pixelformat;
>  	bool bayer;
>  };
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 5d1b67d684bb..0df44b8bb7d0 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -304,6 +304,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	if (enable) {
>  		const struct vimc_pix_map *vpix;
> +		const struct v4l2_format_info *vinfo;
>  		unsigned int frame_size;
>  
>  		if (vdeb->src_frame)
> @@ -311,12 +312,14 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  		/* Calculate the frame size of the source pad */
>  		vpix = vimc_pix_map_by_code(vdeb->src_code);
> +		vinfo = v4l2_format_info(vpix->pixelformat);
>  		frame_size = vdeb->sink_fmt.width * vdeb->sink_fmt.height *
> -				vpix->bpp;
> +				vinfo->bpp[0];
>  
>  		/* Save the bytes per pixel of the sink */
>  		vpix = vimc_pix_map_by_code(vdeb->sink_fmt.code);
> -		vdeb->sink_bpp = vpix->bpp;
> +		vinfo = v4l2_format_info(vpix->pixelformat);
> +		vdeb->sink_bpp = vinfo->bpp[0];
>  
>  		/* Get the corresponding pixel map from the table */
>  		vdeb->sink_pix_map =
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index e2e551bc3ded..9fcca5b1f0b7 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -126,6 +126,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	const struct vimc_pix_map *vpix;
> +	const struct v4l2_format_info *vinfo;
>  
>  	if (fse->index)
>  		return -EINVAL;
> @@ -134,6 +135,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>  	vpix = vimc_pix_map_by_code(fse->code);
>  	if (!vpix || vpix->bayer)
>  		return -EINVAL;

new line here.

> +	vinfo = v4l2_format_info(vpix->pixelformat);
>  
>  	fse->min_width = VIMC_FRAME_MIN_WIDTH;
>  	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
> @@ -177,11 +179,15 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>  static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
>  {
>  	const struct vimc_pix_map *vpix;
> +	const struct v4l2_format_info *vinfo;
>  
>  	/* Only accept code in the pix map table in non bayer format */
>  	vpix = vimc_pix_map_by_code(fmt->code);
> -	if (!vpix || vpix->bayer)
> +	if (!vpix || vpix->bayer) {
>  		fmt->code = sink_fmt_default.code;
> +		vpix = vimc_pix_map_by_code(fmt->code);
> +	}
> +	vinfo = v4l2_format_info(vpix->pixelformat);
>  
>  	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
>  			     VIMC_FRAME_MAX_WIDTH) & ~1;
> @@ -332,6 +338,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	if (enable) {
>  		const struct vimc_pix_map *vpix;
> +		const struct v4l2_format_info *vinfo;
>  		unsigned int frame_size;
>  
>  		if (vsca->src_frame)
> @@ -339,7 +346,8 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  		/* Save the bytes per pixel of the sink */
>  		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
> -		vsca->bpp = vpix->bpp;
> +		vinfo = v4l2_format_info(vpix->pixelformat);
> +		vsca->bpp = vinfo->bpp[0];
>  
>  		/* Calculate the width in bytes of the src frame */
>  		vsca->src_line_size = vsca->crop_rect.width *
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 32380f504591..849658d0bade 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -100,12 +100,16 @@ static int vimc_sen_get_fmt(struct v4l2_subdev *sd,
>  
>  static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
>  {
> -	const struct vimc_pix_map *vpix =
> +	const struct vimc_pix_map *vpix	=
>  				vimc_pix_map_by_code(vsen->mbus_format.code);
> +	const struct v4l2_format_info *vinfo =
> +				v4l2_format_info(vpix->pixelformat);
> +
>  

There are two new lines here (I throught checkpatch.pl should complain about this).

Thanks
Helen

>  	tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
>  			 vsen->mbus_format.height, vsen->mbus_format.field);
> -	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
> +	tpg_s_bytesperline(&vsen->tpg, 0,
> +			   vsen->mbus_format.width * vinfo->bpp[0]);
>  	tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
>  	tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
>  	/* TODO: add support for V4L2_FIELD_ALTERNATE */
> @@ -199,11 +203,13 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	if (enable) {
>  		const struct vimc_pix_map *vpix;
> +		const struct v4l2_format_info *vinfo;
>  		unsigned int frame_size;
>  
>  		/* Calculate the frame size */
>  		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
> -		frame_size = vsen->mbus_format.width * vpix->bpp *
> +		vinfo = v4l2_format_info(vpix->pixelformat);
> +		frame_size = vsen->mbus_format.width * vinfo->bpp[0] *
>  			     vsen->mbus_format.height;
>  
>  		/*
> 
