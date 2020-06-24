Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D707120754D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 16:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403931AbgFXOIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 10:08:47 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35835 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388395AbgFXOIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 10:08:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o64ujhecENb6lo64xjtekk; Wed, 24 Jun 2020 16:08:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593007724; bh=miREzU3Dc/Cme1QvRRc37LDRccP6fg2e3VyJUq2cn2Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uKACVR7k9KBlbDNVX+peIYnWcaPiemqanKL66evQ85tK+ARfP1UzYptbUjeMjRkc2
         ++0ilMtFXF2jICHckcJZcctxQ1weOuv2JhyDe+ASC0nxFcYyhx2rcjMYdSGLzfZ68h
         yXtiVnBJk63YwLl8jsM1IAadz9LMat0hZH8jiAPxgxVw4q6CwjoSCwSmAKzGgJ+oc8
         Y0yrPVEiUofDuvi2PrxKKx8QS1hWSVgx/GGKsgXBKJ5qhGWpZsk1f7O/TI3LOcaLzF
         ccgf+yhMCHz/wEf2i4hk3pBHAwGGVNiX7FrD3kjjK22v6RFSIJBjSqhV/N8kttCLNk
         cTTewqyYXQ/Aw==
Subject: Re: [PATCH v5] media: vimc: get pixformat info from v4l2_format_info
To:     "Carlos E. C. Barbosa" <barbosa.carlos.ec@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     lkcamp@lists.libreplanetbr.org
References: <20200430023258.85404-1-barbosa.carlos.ec@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <44601fb9-b4a4-af1c-1a94-4bb7e5af356a@xs4all.nl>
Date:   Wed, 24 Jun 2020 16:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200430023258.85404-1-barbosa.carlos.ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOQHAspVHag4KnwM00QQXT58NlGrr6+FzlZVYgpVZ4J7F6oW/HiGKzFG8kQJMYIr4A3lI0Gbg2dXzcg2wSNuwn7NY76zNOZ2zc9+hOpAYPRMQf+/krwY
 /REBcMDCPzEiGm9HIovaNX9Ke232h2JYcyC3t1EJwKqlNLBr0es9HZt3RnAUkjZeg13b+X69qQ2O0iubf44pH7TSRtHcCHKQQXBdD+dZKtPJYnz4hZAT3YUw
 AWCaN22cdVcO5C5GgD8OtzZbNQoNFTmbmYiMwCDewLOA0QCSkoA76rfwGTq1P2E2YKAIP33U/Ms4wO3TfbkFxO3zve9QLCri3qc+Rsc80jRqYAEI/GBLhDJO
 8VYK/8PsRiCtHq1disoFCJb2rKAQY3XcKtF4Lvc5ArxGLd1QXbWRvIoO1NNZshInkvma+LsA
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Carlos,

On 30/04/2020 04:32, Carlos E. C. Barbosa wrote:
> There is overlapping code over two distinct lists. This repurposes
> vimc_pix_map for mapping formats and remaps the calls to the matching
> v4l2_format_info.
> 
> Signed-off-by: Carlos E. C. Barbosa <barbosa.carlos.ec@gmail.com>

This patch no longer applies to the latest vimc in our master tree.
Can you rebase and post a v6?

Regards,

	Hans

> 
> ---
> 
> Changes in v5:
> - .bayer member was removed and replaced by v4l2 functions calls
> 
> Changes in v4:
> - Unused variables were removed
> 
> Changes in v3:
> - Change declaration order of variables and some minor style changes
> 
> Changes in v2:
> - Const qualifiers are not removed
> - Bayer flag is kept
> - Unnecessary changes are not made anymore
> 
> v4l2-compliance -m /dev/media0 output:
> https://pastebin.com/VQV4vrTW
> 
> ---
> ---
>  .../media/test-drivers/vimc/vimc-capture.c    | 16 ++++---
>  drivers/media/test-drivers/vimc/vimc-common.c | 46 -------------------
>  drivers/media/test-drivers/vimc/vimc-common.h |  4 --
>  .../media/test-drivers/vimc/vimc-debayer.c    |  7 ++-
>  drivers/media/test-drivers/vimc/vimc-scaler.c | 18 ++++++--
>  drivers/media/test-drivers/vimc/vimc-sensor.c |  9 +++-
>  6 files changed, 35 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> index 5315c201314c..3c280a642ec7 100644
> --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> @@ -85,6 +85,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>  				    struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format *format = &f->fmt.pix;
> +	const struct v4l2_format_info *vinfo;
>  	const struct vimc_pix_map *vpix;
>  
>  	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
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
> @@ -386,7 +388,7 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  					    const char *vcfg_name)
>  {
>  	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
> -	const struct vimc_pix_map *vpix;
> +	const struct v4l2_format_info *vinfo;
>  	struct vimc_cap_device *vcap;
>  	struct video_device *vdev;
>  	struct vb2_queue *q;
> @@ -434,8 +436,8 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  
>  	/* Set default frame format */
>  	vcap->format = fmt_default;
> -	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
> -	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
> +	vinfo = v4l2_format_info(vcap->format.pixelformat);
> +	vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
>  	vcap->format.sizeimage = vcap->format.bytesperline *
>  				 vcap->format.height;
>  
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
> index c95c17c048f2..00f0e301b4e3 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.c
> +++ b/drivers/media/test-drivers/vimc/vimc-common.c
> @@ -21,146 +21,100 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_BGR888_1X24,
>  		.pixelformat = V4L2_PIX_FMT_BGR24,
> -		.bpp = 3,
> -		.bayer = false,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_RGB888_1X24,
>  		.pixelformat = V4L2_PIX_FMT_RGB24,
> -		.bpp = 3,
> -		.bayer = false,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_ARGB8888_1X32,
>  		.pixelformat = V4L2_PIX_FMT_ARGB32,
> -		.bpp = 4,
> -		.bayer = false,
>  	},
>  
>  	/* Bayer formats */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10,
> -		.bpp = 2,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10,
> -		.bpp = 2,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10,
> -		.bpp = 2,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10,
> -		.bpp = 2,
> -		.bayer = true,
>  	},
>  
>  	/* 10bit raw bayer a-law compressed to 8 bits */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  
>  	/* 10bit raw bayer DPCM compressed to 8 bits */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
> -		.bpp = 1,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.pixelformat = V4L2_PIX_FMT_SBGGR12,
> -		.bpp = 2,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.pixelformat = V4L2_PIX_FMT_SGBRG12,
> -		.bpp = 2,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.pixelformat = V4L2_PIX_FMT_SGRBG12,
> -		.bpp = 2,
> -		.bayer = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.pixelformat = V4L2_PIX_FMT_SRGGB12,
> -		.bpp = 2,
> -		.bayer = true,
>  	},
>  };
>  
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> index 487bd020f85c..f412368284df 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -62,18 +62,14 @@ do {									\
>   * struct vimc_pix_map - maps media bus code with v4l2 pixel format
>   *
>   * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
> - * @bpp:		number of bytes each pixel occupies
>   * @pixelformat:	pixel format defined by V4L2_PIX_FMT_* macros
> - * @bayer:		true if this is a bayer format
>   *
>   * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
>   * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
>   */
>  struct vimc_pix_map {
>  	unsigned int code;
> -	unsigned int bpp;
>  	u32 pixelformat;
> -	bool bayer;
>  };
>  
>  /**
> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> index d10aee9f84c4..2d173d3d43db 100644
> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> @@ -303,6 +303,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>  
>  	if (enable) {
> +		const struct v4l2_format_info *vinfo;
>  		const struct vimc_pix_map *vpix;
>  		unsigned int frame_size;
>  
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
> diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
> index 465b906b7497..6a42fc794b58 100644
> --- a/drivers/media/test-drivers/vimc/vimc-scaler.c
> +++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
> @@ -111,9 +111,12 @@ static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(code->index);
> +	const struct v4l2_format_info *vinfo;
> +
> +	vinfo = (vpix) ? v4l2_format_info(vpix->pixelformat) : NULL;
>  
>  	/* We don't support bayer format */
> -	if (!vpix || vpix->bayer)
> +	if (!vpix || v4l2_is_format_bayer(vinfo))
>  		return -EINVAL;
>  
>  	code->code = vpix->code;
> @@ -125,6 +128,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_pad_config *cfg,
>  				    struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	const struct v4l2_format_info *vinfo;
>  	const struct vimc_pix_map *vpix;
>  
>  	if (fse->index)
> @@ -132,7 +136,9 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>  
>  	/* Only accept code in the pix map table in non bayer format */
>  	vpix = vimc_pix_map_by_code(fse->code);
> -	if (!vpix || vpix->bayer)
> +	vinfo = (vpix) ? v4l2_format_info(vpix->pixelformat) : NULL;
> +
> +	if (!vpix || v4l2_is_format_bayer(vinfo))
>  		return -EINVAL;
>  
>  	fse->min_width = VIMC_FRAME_MIN_WIDTH;
> @@ -176,11 +182,13 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>  
>  static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
>  {
> +	const struct v4l2_format_info *vinfo;
>  	const struct vimc_pix_map *vpix;
>  
>  	/* Only accept code in the pix map table in non bayer format */
>  	vpix = vimc_pix_map_by_code(fmt->code);
> -	if (!vpix || vpix->bayer)
> +	vinfo = (vpix) ? v4l2_format_info(vpix->pixelformat) : NULL;
> +	if (!vpix || v4l2_is_format_bayer(vinfo))
>  		fmt->code = sink_fmt_default.code;
>  
>  	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
> @@ -331,6 +339,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>  
>  	if (enable) {
> +		const struct v4l2_format_info *vinfo;
>  		const struct vimc_pix_map *vpix;
>  		unsigned int frame_size;
>  
> @@ -339,7 +348,8 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  		/* Save the bytes per pixel of the sink */
>  		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
> -		vsca->bpp = vpix->bpp;
> +		vinfo = v4l2_format_info(vpix->pixelformat);
> +		vsca->bpp = vinfo->bpp[0];
>  
>  		/* Calculate the width in bytes of the src frame */
>  		vsca->src_line_size = vsca->crop_rect.width *
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index 228120b3a6dd..6cdcbb3773db 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -102,10 +102,13 @@ static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
>  {
>  	const struct vimc_pix_map *vpix =
>  				vimc_pix_map_by_code(vsen->mbus_format.code);
> +	const struct v4l2_format_info *vinfo =
> +				v4l2_format_info(vpix->pixelformat);
>  
>  	tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
>  			 vsen->mbus_format.height, vsen->mbus_format.field);
> -	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
> +	tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width *
> +							vinfo->bpp[0]);
>  	tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
>  	tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
>  	/* TODO: add support for V4L2_FIELD_ALTERNATE */
> @@ -198,12 +201,14 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>  				container_of(sd, struct vimc_sen_device, sd);
>  
>  	if (enable) {
> +		const struct v4l2_format_info *vinfo;
>  		const struct vimc_pix_map *vpix;
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

