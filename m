Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662CB16C0BE
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 13:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729837AbgBYM00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 07:26:26 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51171 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729206AbgBYM00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 07:26:26 -0500
Received: from [IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2]
 ([IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6ZI3jyhoYjmHT6ZI6jWw5v; Tue, 25 Feb 2020 13:26:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582633583; bh=jtQMXNw/cfyh+gnYhCWrvjIQGpiDbUxxuddj1fuUNmg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EC1+98kg7kFI68JPL2LrYUFj0x7Rpbc7+nMlkvwkmXpvYcmuqbnZoBOEVaZSHcEtz
         Y8jwBhb3H7dpUGdJ24zhf/GxUW1+dPPG4UluNBFwPqHX01FEMVxHsNm01mGOA6pzWV
         ZxtWmER02n68ka7ivec5aNO3mDAqDqa8zhPMhporQI8G0MBezU8MxexwgAhystNoXU
         QHOJvhJ7lEWmQWODHHXP5E21bwCMrgXv86AUwPkFIpJlfqownyen53PVqKXOSLtccE
         pfk3ZPP/+6ogrLvfztPhouNgf7BPEvdq7ZuyHjoill4gW2iR5Dd48fIcVFwWrBekGd
         3aP8qR4pzeJbw==
Subject: Re: [PATCH v3] media: vimc: get pixformat info from v4l2_format_info
To:     "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org
References: <20200122175727.62664-1-carlosecb@tutanota.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c175b8fd-481c-5429-1f8c-4d8a8127584f@xs4all.nl>
Date:   Tue, 25 Feb 2020 13:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200122175727.62664-1-carlosecb@tutanota.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPcH9kTfNi8S5LUz9sGwr8ZGlUfUfLrp3dNgy9kqmje0jxipjQOsKc+uly5L74Mo/PXR7UvQl4ZUxr7nca+HjmYrJ1xCKW+5cPPX1TRjE7u8MzKFL3hf
 nn79Bw73nL0kAkpxrTSWDtEs/LegvL1giZOeSYYHAJ4WSaOtS/kcJQHc8rM4aXpkXC84wBQt39/qFOKu6AUcdEUnVUN4vprpLvEcl+dGi7EE/x0xc3O2ZKbR
 2K8zFUiF4v68kCcMSinpXQNm5xedYmndkTR5UCBUGPsszumGMrtZsYWPzlitjHDHgauEH2Ke8fpNrlaOo8mHFqJekqCmcIHfcWzaoxXWJ7owrDpNmXTH2a9l
 vT+EeFBK3F5K/hEE2Gok6bwKIKph6yxsF8YM8SpytG7sOxO79zF0QniNL96PEFQfdMBLVJjzxVlc64M1Bn4tuGDj9XsqS2eS7UCmjjUOiTl73g2zRMDOxfQ6
 T85DXlbqLKD6CsL3Zw+Wx2/dZtbGxBwbJsyUqHnxWpUC3Z0j4wspWVPFKb8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/22/20 6:57 PM, Carlos E. C. Barbosa wrote:
> From: "Carlos E.C. Barbosa" <carlosecb@tutanota.com>
> 
> There is overlapping code over two distinct lists. This repurposes vimc_pix_map
> for mapping formats and remaps the calls to the matching v4l2_format_info.
> 
> ---
> Changes in v2:
> As advised by Helen Koike and Hans Verkuil, the const qualifiers are not
> removed, the bayer flag is kept and the unnecessary changes are not
> made.
> 
> Changes in v3:
> Change declaration order of variables and some minor style changes.
> 
> v4l2-compliance message:
> https://pastebin.com/UkmfjuLa
> 
> Signed-off-by: Carlos E. C. Barbosa <carlosecb@tutanota.com>

This Sob needs to be above the --- line!

I get sparse warnings:

drivers/media/platform/vimc/vimc-scaler.c:128:33: warning: variable 'vinfo' set but not used [-Wunused-but-set-variable]
drivers/media/platform/vimc/vimc-scaler.c:181:33: warning: variable 'vinfo' set but not used [-Wunused-but-set-variable]

It does seem that it is indeed unused.

Regards,

	Hans

> ---
>  drivers/media/platform/vimc/vimc-capture.c | 14 ++++++++-----
>  drivers/media/platform/vimc/vimc-common.c  | 23 ----------------------
>  drivers/media/platform/vimc/vimc-common.h  |  2 --
>  drivers/media/platform/vimc/vimc-debayer.c |  7 +++++--
>  drivers/media/platform/vimc/vimc-scaler.c  | 12 +++++++++--
>  drivers/media/platform/vimc/vimc-sensor.c  |  9 +++++++--
>  6 files changed, 31 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 76c015898cfd..686456aad29c 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
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
> @@ -386,6 +388,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  				     const char *vcfg_name)
>  {
>  	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
> +	const struct v4l2_format_info *vinfo;
>  	const struct vimc_pix_map *vpix;
>  	struct vimc_cap_device *vcap;
>  	struct video_device *vdev;
> @@ -435,7 +438,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  	/* Set default frame format */
>  	vcap->format = fmt_default;
>  	vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
> -	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
> +	vinfo = v4l2_format_info(vpix->pixelformat);
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
> index 5d1b67d684bb..10d53ca129fd 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
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
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index e2e551bc3ded..55be69ddf918 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -125,6 +125,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_pad_config *cfg,
>  				    struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	const struct v4l2_format_info *vinfo;
>  	const struct vimc_pix_map *vpix;
>  
>  	if (fse->index)
> @@ -135,6 +136,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>  	if (!vpix || vpix->bayer)
>  		return -EINVAL;
>  
> +	vinfo = v4l2_format_info(vpix->pixelformat);
>  	fse->min_width = VIMC_FRAME_MIN_WIDTH;
>  	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
>  
> @@ -176,12 +178,16 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>  
>  static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
>  {
> +	const struct v4l2_format_info *vinfo;
>  	const struct vimc_pix_map *vpix;
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
> @@ -331,6 +337,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>  
>  	if (enable) {
> +		const struct v4l2_format_info *vinfo;
>  		const struct vimc_pix_map *vpix;
>  		unsigned int frame_size;
>  
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
> index 32380f504591..941529ddf639 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
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
> +	tpg_s_bytesperline(&vsen->tpg, 0,
> +			   vsen->mbus_format.width * vinfo->bpp[0]);
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

