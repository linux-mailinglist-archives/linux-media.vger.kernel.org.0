Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6D2BEC71
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 09:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbfIZHTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 03:19:01 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44341 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728268AbfIZHTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 03:19:01 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DO3CiK37rKKNGDO3Fi0nzF; Thu, 26 Sep 2019 09:18:58 +0200
Subject: Re: [PATCH] media: vimc: Implement get/set selection
To:     Helen Koike <helen.koike@collabora.com>,
        Guilherme Alcarde Gallo <gagallo7@gmail.com>,
        linux-media@vger.kernel.org
Cc:     lkcamp@lists.libreplanetbr.org, mchehab@kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190909040853.22466-1-gagallo7@gmail.com>
 <7424ad6d-18bd-6876-b6b4-31b1edd61f2a@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4704948a-c0ec-ef83-0406-f0ee3a1eabba@xs4all.nl>
Date:   Thu, 26 Sep 2019 09:18:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7424ad6d-18bd-6876-b6b4-31b1edd61f2a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEUJO5YpLk75+4RF40BcOut7/cDqeU1P37ytbPDLrinH9OwATHmwWn0xVEsPBXnaDTJWUdUGVAd4xeK8htatmpjKl3ozgvRb72d5IGZY8QfPu3umlb3m
 V7fvp6+Bc5BwLb0jOVTbEGgGPtO4P+TvcnthKu6n25gXUr3/0NnkOQr5AngtiKanlul54r5xripWO47UUMHxCud4pfLdxjiAbkfNUxOepPkD4ibscOei3eAD
 n1r5AerYy4a2XX0S46anWcmVrtAtjbYhrKDEQ0J6yery21drzRfA4s1H+KAltdkEmkuASbx34Z3E2z2zXJYzPXIUtmVlv5O0VoLPnAsqa0fGexZOywS6vMUA
 5EV0E2F0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/25/19 8:15 PM, Helen Koike wrote:
> +Hans +Shuah
> 
> Hi Guilherme and Danilo,
> 
> Thank you for the patch, please see my comments below.
> 
> On 9/9/19 1:08 AM, Guilherme Alcarde Gallo wrote:
>> Add support for the scaler subdevice to respond VIDIOC_G_SELECTION and
>> VIDIOC_S_SELECTION ioctls with the following targets:
>> V4L2_SEL_TGT_COMPOSE_BOUNDS and V4L2_SEL_TGT_CROP.
>>
>> * Added new const struct crop_rect_default to initialize subdev scaler
>>   properly.
>> * Make changes in sink pad format reflect the crop rectangle. E.g.
>>   changing the frame format to a smaller size one can make the former
>>   crop rectangle selects a non existing frame area. To solve this
>>   situation the crop rectangle is clamped to the frame boundaries.
>> * Clamp crop rectangle respecting the sink bounds during set_selection
>>   ioctl.
>>
>> Signed-off-by: Guilherme Alcarde Gallo <gagallo7@gmail.com>
>> Co-developed-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>
>> Signed-off-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>
>>
>> ---
>>
>> This patch is based on the monolithic vimc driver from the patchset
>> named "Collapse vimc into single monolithic driver"
>> https://patchwork.kernel.org/patch/11136201/
>>
>> ---
>>
>>  drivers/media/platform/vimc/vimc-scaler.c | 148 +++++++++++++++++++---
>>  1 file changed, 133 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>> index a5a0855ad9cd..b50d11e76a2b 100644
>> --- a/drivers/media/platform/vimc/vimc-scaler.c
>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
>> @@ -18,6 +18,9 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>>  
>>  #define MAX_ZOOM	8
>>  
>> +#define VIMC_SCA_FMT_WIDTH_DEFAULT	640
>> +#define VIMC_SCA_FMT_HEIGHT_DEFAULT	480
>> +
>>  struct vimc_sca_device {
>>  	struct vimc_ent_device ved;
>>  	struct v4l2_subdev sd;
>> @@ -26,6 +29,7 @@ struct vimc_sca_device {
>>  	 * with the width and hight multiplied by mult
>>  	 */
>>  	struct v4l2_mbus_framefmt sink_fmt;
>> +	struct v4l2_rect crop_rect;
>>  	/* Values calculated when the stream starts */
>>  	u8 *src_frame;
>>  	unsigned int src_line_size;
>> @@ -33,22 +37,33 @@ struct vimc_sca_device {
>>  };
>>  
>>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
>> -	.width = 640,
>> -	.height = 480,
>> +	.width = VIMC_SCA_FMT_WIDTH_DEFAULT,
>> +	.height = VIMC_SCA_FMT_HEIGHT_DEFAULT,
>>  	.code = MEDIA_BUS_FMT_RGB888_1X24,
>>  	.field = V4L2_FIELD_NONE,
>>  	.colorspace = V4L2_COLORSPACE_DEFAULT,
>>  };
>>  
>> +static const struct v4l2_rect crop_rect_default = {
>> +	.width = VIMC_SCA_FMT_WIDTH_DEFAULT,
>> +	.height = VIMC_SCA_FMT_HEIGHT_DEFAULT,
>> +	.top = 0,
>> +	.left = 0,
>> +};
>> +
>>  static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
>>  			     struct v4l2_subdev_pad_config *cfg)
>>  {
>>  	struct v4l2_mbus_framefmt *mf;
>> +	struct v4l2_rect *r;
>>  	unsigned int i;
>>  
>>  	mf = v4l2_subdev_get_try_format(sd, cfg, 0);
>>  	*mf = sink_fmt_default;
>>  
>> +	r = v4l2_subdev_get_try_crop(sd, cfg, 0);
>> +	*r = crop_rect_default;
>> +
>>  	for (i = 1; i < sd->entity.num_pads; i++) {
>>  		mf = v4l2_subdev_get_try_format(sd, cfg, i);
>>  		*mf = sink_fmt_default;
>> @@ -107,16 +122,21 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>>  			    struct v4l2_subdev_format *format)
>>  {
>>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>> +	struct v4l2_rect *crop_rect;
>>  
>>  	/* Get the current sink format */
>> -	format->format = (format->which == V4L2_SUBDEV_FORMAT_TRY) ?
>> -			 *v4l2_subdev_get_try_format(sd, cfg, 0) :
>> -			 vsca->sink_fmt;
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>> +		format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
>> +		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>> +	} else {
>> +		format->format = vsca->sink_fmt;
>> +		crop_rect = &vsca->crop_rect;
>> +	}
>>  
>>  	/* Scale the frame size for the source pad */
>>  	if (VIMC_IS_SRC(format->pad)) {
>> -		format->format.width = vsca->sink_fmt.width * sca_mult;
>> -		format->format.height = vsca->sink_fmt.height * sca_mult;
>> +		format->format.width = crop_rect->width * sca_mult;
>> +		format->format.height = crop_rect->height * sca_mult;
>>  	}
>>  
>>  	return 0;
>> @@ -148,6 +168,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>  {
>>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>>  	struct v4l2_mbus_framefmt *sink_fmt;
>> +	struct v4l2_rect *crop_rect;
>>  
>>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>  		/* Do not change the format while stream is on */
>> @@ -155,8 +176,10 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>  			return -EBUSY;
>>  
>>  		sink_fmt = &vsca->sink_fmt;
>> +		crop_rect = &vsca->crop_rect;
>>  	} else {
>>  		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>> +		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>  	}
>>  
>>  	/*
>> @@ -165,12 +188,20 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>  	 */
>>  	if (VIMC_IS_SRC(fmt->pad)) {
>>  		fmt->format = *sink_fmt;
>> -		fmt->format.width = sink_fmt->width * sca_mult;
>> -		fmt->format.height = sink_fmt->height * sca_mult;
>> +		fmt->format.width = crop_rect->width * sca_mult;
>> +		fmt->format.height = crop_rect->height * sca_mult;
>>  	} else {
>>  		/* Set the new format in the sink pad */
>>  		vimc_sca_adjust_sink_fmt(&fmt->format);
>>  
>> +		crop_rect->width = clamp_t(u32, crop_rect->width,
>> +					   VIMC_FRAME_MIN_WIDTH,
>> +					   fmt->format.width) & ~1;
>> +
>> +		crop_rect->height = clamp_t(u32, crop_rect->height,
>> +					    VIMC_FRAME_MIN_HEIGHT,
>> +					    fmt->format.height) & ~1;
>> +
> 
> You need to consider top and left of the crop rectangle to make this clamp.
> 
> Lets say you have a 300x300 image and a crop rectangle to top=100,left=100,width=100,height=100.
> Then, if you set the image to 150x150, the crop rectangle should adjust to top=100,left=100,width=50,height=50.
> 
> There is also the case if you set the sink image to 50x50, now the crop rectangle is outside the image,
> I'm not sure what should happen in this case, maybe you should just reset the crop rectangle to the image format.
> 
> Hans, could you confirm what should be done here?

When you want to map an existing crop rectangle to a new, smaller image format, then
you try to keep the crop width and height. So in the example above (changing the image
to 150x150) the new crop would be top=50,left=50,width=100,height=100.

Use the functions in media/v4l2-rect.h for this (esp. v4l2_rect_map_inside).

If you'd change the image size to 50x50, then the new crop would automatically become
top=0,left=0,width=50,height=50. In other words, this does exactly what you want and
always keeps a valid configuration.

Regards,

	Hans

> 
>>  		dev_dbg(vsca->dev, "%s: sink format update: "
>>  			"old:%dx%d (0x%x, %d, %d, %d, %d) "
>>  			"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vsca->sd.name,
>> @@ -189,12 +220,91 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>  	return 0;
>>  }
>>  
>> +static int vimc_sca_get_selection(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_pad_config *cfg,
>> +				  struct v4l2_subdev_selection *sel)
>> +{
>> +	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>> +
>> +	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
>> +		return -EINVAL;
> 
> I think you could implement TRY already, you just need to use v4l2_subdev_get_try_crop() and v4l2_subdev_get_try_format()
> similar to what set/get format do.
> 
>> +
>> +	if (vsca->src_frame)
>> +		return -EBUSY;
>> +
>> +	if (VIMC_IS_SRC(sel->pad))
>> +		return -EINVAL;
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		sel->r = vsca->crop_rect;
>> +		break;
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		sel->r.left = 0;
>> +		sel->r.top = 0;
>> +		sel->r.width = vsca->sink_fmt.width;
>> +		sel->r.height = vsca->sink_fmt.height;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vimc_sca_set_selection(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_pad_config *cfg,
>> +				  struct v4l2_subdev_selection *sel)
>> +{
>> +	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>> +	struct v4l2_rect *vsca_crop_rect = &vsca->crop_rect;
>> +	struct v4l2_subdev_selection bound_sel = *sel;
>> +	int ret = 0;
>> +
>> +	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
>> +		return -EINVAL;
> 
> Same thing here.
> 
>> +
>> +	/* Do not change the format while stream is on */
>> +	if (vsca->src_frame)
>> +		return -EBUSY;
>> +
>> +	if (VIMC_IS_SRC(sel->pad))
>> +		return -EINVAL;
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		/* Get the crop bounds to clamp the crop rectangle correctly */
>> +		bound_sel.target = V4L2_SEL_TGT_CROP_BOUNDS;
>> +		ret = vimc_sca_get_selection(sd, cfg, &bound_sel);
>> +		if (ret) {
>> +			pr_err("Error during call to vimc_sca_get_selection.");
>> +			return ret;
>> +		}
>> +
>> +		sel->r.width = clamp_t(u32, sel->r.width, VIMC_FRAME_MIN_WIDTH,
>> +				       bound_sel.r.width) & ~1;
>> +		sel->r.height = clamp_t(u32, sel->r.height,
>> +					VIMC_FRAME_MIN_HEIGHT,
>> +					bound_sel.r.height);
> 
> You should also consider top/left to make this clamp.
> top and left should also be ajusted if they are set outside of the boundaries.
> 
>> +		*vsca_crop_rect = sel->r;
>> +		break;
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		return -EINVAL;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct v4l2_subdev_pad_ops vimc_sca_pad_ops = {
>>  	.init_cfg		= vimc_sca_init_cfg,
>>  	.enum_mbus_code		= vimc_sca_enum_mbus_code,
>>  	.enum_frame_size	= vimc_sca_enum_frame_size,
>>  	.get_fmt		= vimc_sca_get_fmt,
>>  	.set_fmt		= vimc_sca_set_fmt,
>> +	.get_selection		= vimc_sca_get_selection,
>> +	.set_selection		= vimc_sca_set_selection,
>>  };
>>  
>>  static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>> @@ -213,11 +323,11 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>>  		vsca->bpp = vpix->bpp;
>>  
>>  		/* Calculate the width in bytes of the src frame */
>> -		vsca->src_line_size = vsca->sink_fmt.width *
>> +		vsca->src_line_size = vsca->crop_rect.width *
>>  				      sca_mult * vsca->bpp;
>>  
>>  		/* Calculate the frame size of the source pad */
>> -		frame_size = vsca->src_line_size * vsca->sink_fmt.height *
>> +		frame_size = vsca->src_line_size * vsca->crop_rect.height *
>>  			     sca_mult;
>>  
>>  		/* Allocate the frame buffer. Use vmalloc to be able to
>> @@ -259,11 +369,12 @@ static void vimc_sca_fill_pix(u8 *const ptr,
>>  }
>>  
>>  static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>> -			       const unsigned int lin, const unsigned int col,
>> +			       unsigned int lin, unsigned int col,
>>  			       const u8 *const sink_frame)
>>  {
>>  	unsigned int i, j, index;
>>  	const u8 *pixel;
>> +	const struct v4l2_rect crop_rect = vsca->crop_rect;
>>  
>>  	/* Point to the pixel value in position (lin, col) in the sink frame */
>>  	index = VIMC_FRAME_INDEX(lin, col,
>> @@ -278,8 +389,10 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>>  	/* point to the place we are going to put the first pixel
>>  	 * in the scaled src frame
>>  	 */
>> +	lin -= crop_rect.top;
>> +	col -= crop_rect.left;
>>  	index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
>> -				 vsca->sink_fmt.width * sca_mult, vsca->bpp);
>> +				 crop_rect.width * sca_mult, vsca->bpp);
>>  
>>  	dev_dbg(vsca->dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
>>  		vsca->sd.name, lin * sca_mult, col * sca_mult, index);
>> @@ -309,10 +422,12 @@ static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
>>  {
>>  	unsigned int i, j;
>>  
> 
> Please remove this extra line.
> 
> Thanks :)
> Helen
> 
>> +	const struct v4l2_rect r = vsca->crop_rect;
>> +
>>  	/* Scale each pixel from the original sink frame */
>>  	/* TODO: implement scale down, only scale up is supported for now */
>> -	for (i = 0; i < vsca->sink_fmt.height; i++)
>> -		for (j = 0; j < vsca->sink_fmt.width; j++)
>> +	for (i = r.top; i < r.top + r.height; i++)
>> +		for (j = r.left; j < r.left + r.width; j++)
>>  			vimc_sca_scale_pix(vsca, i, j, sink_frame);
>>  }
>>  
>> @@ -382,5 +497,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>>  	/* Initialize the frame format */
>>  	vsca->sink_fmt = sink_fmt_default;
>>  
>> +	/* Initialize the crop selection */
>> +	vsca->crop_rect = crop_rect_default;
>> +
>>  	return &vsca->ved;
>>  }
>>

