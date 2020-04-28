Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE401BCECD
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 23:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgD1Vf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 17:35:27 -0400
Received: from mga07.intel.com ([134.134.136.100]:15088 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbgD1Vf1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 17:35:27 -0400
IronPort-SDR: faFk7BrV2k/n1mKQqVJfasw1iZUX4DGaTbzeXOp4psiQhmkhIYIenGC/AaPQKXXYiNEFmHJ6u+
 yl9s5BqjPdTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 14:35:26 -0700
IronPort-SDR: aPohWQivKBnVShpwTEMPDN5FzHfMnKoO3ZCpctDwFK4BYxfK0Is388kFAy/IGUfxGkWZXvbx/r
 A99s/5lhh/jQ==
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; 
   d="scan'208";a="247824235"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 14:35:24 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 82044202F2; Wed, 29 Apr 2020 00:35:02 +0300 (EEST)
Date:   Wed, 29 Apr 2020 00:35:02 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v3] media: i2c: imx219: Implement get_selection
Message-ID: <20200428213502.GD5381@paasikivi.fi.intel.com>
References: <20200428210903.6957-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428210903.6957-1-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Apr 28, 2020 at 11:09:03PM +0200, Jacopo Mondi wrote:
> Implement the get_selection pad operation for the IMX219 sensor driver.
> The supported targets report the sensor's native size, the crop default
> rectangle and the crop rectangle.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> ---
> v2->v3:
> - Guard with critical section only the V4L2_SEL_TGT_CROP case
> 
> v1->v2:
> - Add crop rectangle fro 640x480 mode
> - Re-order rectangle fields
> ---
> 
>  drivers/media/i2c/imx219.c | 99 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index cb03bdec1f9c..2916709a4ea3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -112,6 +112,14 @@
>  #define IMX219_TESTP_BLUE_DEFAULT	0
>  #define IMX219_TESTP_GREENB_DEFAULT	0
> 
> +/* IMX219 native and active pixel array size. */
> +#define IMX219_NATIVE_WIDTH		3296U
> +#define IMX219_NATIVE_HEIGHT		2480U
> +#define IMX219_PIXEL_ARRAY_LEFT		8U
> +#define IMX219_PIXEL_ARRAY_TOP		8U
> +#define IMX219_PIXEL_ARRAY_WIDTH	3280U
> +#define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> +
>  struct imx219_reg {
>  	u16 address;
>  	u8 val;
> @@ -129,6 +137,9 @@ struct imx219_mode {
>  	/* Frame height */
>  	unsigned int height;
> 
> +	/* Analog crop rectangle. */
> +	struct v4l2_rect crop;
> +
>  	/* V-timing */
>  	unsigned int vts_def;
> 
> @@ -463,6 +474,12 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 8MPix 15fps mode */
>  		.width = 3280,
>  		.height = 2464,
> +		.crop = {
> +			.left = 0,
> +			.top = 0,
> +			.width = 3280,
> +			.height = 2464
> +		},
>  		.vts_def = IMX219_VTS_15FPS,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> @@ -473,6 +490,12 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 1080P 30fps cropped */
>  		.width = 1920,
>  		.height = 1080,
> +		.crop = {
> +			.left = 680,
> +			.top = 692,
> +			.width = 1920,
> +			.height = 1080
> +		},
>  		.vts_def = IMX219_VTS_30FPS_1080P,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> @@ -483,6 +506,12 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 2x2 binned 30fps mode */
>  		.width = 1640,
>  		.height = 1232,
> +		.crop = {
> +			.left = 0,
> +			.top = 0,
> +			.width = 3280,
> +			.height = 2464
> +		},
>  		.vts_def = IMX219_VTS_30FPS_BINNED,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> @@ -493,6 +522,12 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 640x480 30fps mode */
>  		.width = 640,
>  		.height = 480,
> +		.crop = {
> +			.left = 1000,
> +			.top = 752,
> +			.width = 1280,
> +			.height = 960
> +		},
>  		.vts_def = IMX219_VTS_30FPS_640x480,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_640_480_regs),
> @@ -654,6 +689,7 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	struct imx219 *imx219 = to_imx219(sd);
>  	struct v4l2_mbus_framefmt *try_fmt =
>  		v4l2_subdev_get_try_format(sd, fh->pad, 0);
> +	struct v4l2_rect *try_crop;
> 
>  	mutex_lock(&imx219->mutex);
> 
> @@ -664,6 +700,13 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  					       MEDIA_BUS_FMT_SRGGB10_1X10);
>  	try_fmt->field = V4L2_FIELD_NONE;
> 
> +	/* Initialize try_crop rectangle. */
> +	try_crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
> +	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> +	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> +	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> +	try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> +
>  	mutex_unlock(&imx219->mutex);
> 
>  	return 0;
> @@ -928,6 +971,61 @@ static int imx219_set_framefmt(struct imx219 *imx219)
>  	return -EINVAL;
>  }
> 
> +static const struct v4l2_rect *
> +__imx219_get_pad_crop(struct imx219 *imx219, struct v4l2_subdev_pad_config *cfg,
> +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_crop(&imx219->sd, cfg, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &imx219->mode->crop;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static int imx219_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	struct imx219 *imx219 = to_imx219(sd);
> +	const struct v4l2_rect *__crop;
> +	int ret = 0;

ret is unused.

> +
> +	if (sel->pad != 0)
> +		return -EINVAL;

As you only have a single pad (0), this check is redundant --- the caller
will have done that check already.

> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = IMX219_NATIVE_WIDTH;
> +		sel->r.height = IMX219_NATIVE_HEIGHT;
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> +		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> +		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP:
> +		mutex_lock(&imx219->mutex);
> +		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> +					       sel->which);
> +		sel->r = *__crop;
> +		mutex_unlock(&imx219->mutex);
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int imx219_start_streaming(struct imx219 *imx219)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> @@ -1152,6 +1250,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>  	.enum_mbus_code = imx219_enum_mbus_code,
>  	.get_fmt = imx219_get_pad_format,
>  	.set_fmt = imx219_set_pad_format,
> +	.get_selection = imx219_get_selection,
>  	.enum_frame_size = imx219_enum_frame_size,
>  };
> 

-- 
Regards,

Sakari Ailus
