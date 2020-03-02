Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8F2175DFA
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 16:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCBPNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 10:13:22 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41570 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgCBPNW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 10:13:22 -0500
Received: by mail-lj1-f193.google.com with SMTP id u26so11996280ljd.8
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 07:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0znOc/l4mj2MJ35/NatCkndFXeueBI39Q/e36DG17iU=;
        b=R5Q5ih4jWWs27qQeLWxWpxlrF2siqroVPitDRgHweg3soyN+wO3wOnPU8gXE+1xFUm
         5ZonsQW1PeZnHOLs3Wz1+gCshU1Svg4r6tI+/DDukRfjl50fGOHJjPCuDGlDSlMRHrTL
         1O38TcjI1oNlTqmCScGEkXrFd5FhdZqUiBzexHOzCNgYU5uYFBrCabW1S4HnJzJU8cvD
         LfFX9Ll4uRtK5AVYhQB9LuhXoRsvoudOVxjJb5DGH9Eh4zqsV1tJg1zyjSJ8g+BNDgKn
         qHC14K/3y6lGdw1TCQl5T/pzDYB0h7GLMscDxTU38EaMjykswDkGT5SNFyc2FPIF6NHS
         vHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0znOc/l4mj2MJ35/NatCkndFXeueBI39Q/e36DG17iU=;
        b=NN3ckNnOG5CqNJ5oZwfjN/OaUSwvAQGLnXejgnfh+NZBt4wAVlokiBLPTCxbaRoB6P
         VVRBySnw0xqCnZFmMGR+k1SkPkH8NKDCPIyU6O0Vbq+0qdXbxmfPRvgGuORgnqzvwb4Z
         irjwy1O1rT2QHBwvmH1z+QnJ8xzerwzPgiVKxyL6yX/0UXvZr0R8NkhtZktMb1qk/KO+
         F3HUaCNpYAerC0Q8v44nUa5n5QMZrihzyNiIgWUUbRYUbhXXFblNsZD8OaClYRiOYyTA
         nmF/3FFuyGo9NZfhGDgigi0h8rSTjV5Svcpm9LF3sCLtanC6Mad1VO4jSD5/iRB0sRs3
         sdSA==
X-Gm-Message-State: ANhLgQ15j/P/U7237BJPa/xQ+stJbBYTr4C3iNP4vO4wi+0A+jIFegFw
        QqpMPgSEBFyMdsdmZ9sSOBlbRA==
X-Google-Smtp-Source: ADFU+vt57LW8SmXLrd9ODHMkgUjfh7RsWPqsfRJnfCjyE7BoC7s1c6y2EaNcRrTje8v8HX/jTyFJfw==
X-Received: by 2002:a2e:9256:: with SMTP id v22mr12302182ljg.45.1583162000087;
        Mon, 02 Mar 2020 07:13:20 -0800 (PST)
Received: from [192.168.119.5] (office.dev.rtsoft.ru. [62.117.114.130])
        by smtp.gmail.com with ESMTPSA id r14sm3028500ljj.54.2020.03.02.07.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 07:13:19 -0800 (PST)
Subject: Re: [PATCH 2/3] media: i2c: imx219: Add support for SRGGB8_1X8 format
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200228165503.18054-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200228165503.18054-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <830c49f7-74b4-c6c3-7883-ec0f967ec730@linaro.org>
Date:   Mon, 2 Mar 2020 18:13:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228165503.18054-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for the patch!

On 28.02.2020 19:55, Lad Prabhakar wrote:
> imx219 sensor is capable for RAW8/RAW10 modes, this commit adds support
> for SRGGB8_1X8 format.

... but not for SGRBG8_1X8, SGBRG8_1X8, and SBGGR8_1X8?

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   drivers/media/i2c/imx219.c | 122 +++++++++++++++++++++++++++++--------
>   1 file changed, 96 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 8b48e148f2d0..1388c9bc00bb 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -90,6 +90,9 @@
>   
>   #define IMX219_REG_ORIENTATION		0x0172
>   
> +#define IMX219_CSI_DATA_FORMAT_A_0_7	0x018c
> +#define IMX219_CSI_DATA_FORMAT_A_8_15	0x018d
> +
>   /* Test Pattern Control */
>   #define IMX219_REG_TEST_PATTERN		0x0600
>   #define IMX219_TEST_PATTERN_DISABLE	0
> @@ -135,6 +138,16 @@ struct imx219_mode {
>   	struct imx219_reg_list reg_list;
>   };
>   
> +struct imx219_pixfmt {
> +	u32 code;
> +	u32 colorspace;
> +};
> +
> +static const struct imx219_pixfmt imx219_formats[] = {
> +	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_COLORSPACE_SRGB, },
> +	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB },
> +};

This table has only one (RGGB) layout (out of 4 possible) for 8-bit and for 10-bit
modes.

> +
>   /*
>    * Register sets lifted off the i2C interface from the Raspberry Pi firmware
>    * driver.
> @@ -168,8 +181,6 @@ static const struct imx219_reg mode_3280x2464_regs[] = {
>   	{0x0171, 0x01},
>   	{0x0174, 0x00},
>   	{0x0175, 0x00},
> -	{0x018c, 0x0a},
> -	{0x018d, 0x0a},
>   	{0x0301, 0x05},
>   	{0x0303, 0x01},
>   	{0x0304, 0x03},
> @@ -230,8 +241,6 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
>   	{0x0171, 0x01},
>   	{0x0174, 0x00},
>   	{0x0175, 0x00},
> -	{0x018c, 0x0a},
> -	{0x018d, 0x0a},
>   	{0x0301, 0x05},
>   	{0x0303, 0x01},
>   	{0x0304, 0x03},
> @@ -290,8 +299,6 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
>   	{0x0171, 0x01},
>   	{0x0174, 0x01},
>   	{0x0175, 0x01},
> -	{0x018c, 0x0a},
> -	{0x018d, 0x0a},
>   	{0x0301, 0x05},
>   	{0x0303, 0x01},
>   	{0x0304, 0x03},
> @@ -413,6 +420,8 @@ struct imx219 {
>   	struct v4l2_subdev sd;
>   	struct media_pad pad;
>   
> +	struct v4l2_mbus_framefmt fmt;
> +

- adding the whole struct v4l2_mbus_framefmt for "is it RAW10 or RAW8" looks
like an overkill (and adds some duplication of code - see below).

>   	struct clk *xclk; /* system clock to IMX219 */
>   	u32 xclk_freq;
>   
> @@ -519,19 +528,26 @@ static int imx219_write_regs(struct imx219 *imx219,
>   }
>   
>   /* Get bayer order based on flip setting. */
> -static u32 imx219_get_format_code(struct imx219 *imx219)
> +static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)

Naming the 2nd argument as 'code' seems a bit confusing to me, as it
used to select between MEDIA_BUS_FMT_*_1X10 and MEDIA_BUS_FMT_*_1X8.
While the Bayer order depends on the current hflip/vflip settings
(they are stored in struct imx219).

>   {
> -	/*
> -	 * Only one bayer order is supported.
> -	 * It depends on the flip settings.
> -	 */
> -	static const u32 codes[2][2] = {
> +	static const u32 codes10[2][2] = {
>   		{ MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10, },
>   		{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
>   	};
> +	static const u32 codes8[2][2] = {
> +		{ MEDIA_BUS_FMT_SRGGB8_1X8, MEDIA_BUS_FMT_SGRBG8_1X8, },
> +		{ MEDIA_BUS_FMT_SGBRG8_1X8, MEDIA_BUS_FMT_SBGGR8_1X8, },
> +	};
>   
>   	lockdep_assert_held(&imx219->mutex);
> -	return codes[imx219->vflip->val][imx219->hflip->val];
> +
> +	if (code == MEDIA_BUS_FMT_SRGGB10_1X10 ||
> +	    code == MEDIA_BUS_FMT_SGRBG10_1X10 ||
> +	    code == MEDIA_BUS_FMT_SGBRG10_1X10 ||
> +	    code == MEDIA_BUS_FMT_SBGGR10_1X10)
> +		return codes10[imx219->vflip->val][imx219->hflip->val];
> +
> +	return codes8[imx219->vflip->val][imx219->hflip->val];
>   }

Wouldn't extending the original table be a better and simpler solution?
Something like:

static u32 imx219_get_format_code(struct imx219 *imx219, int is_8_bit)
{
	static const u32 codes[2][2][2] = {
		{
	   		{ MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10, },
	   		{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
		},
		{
			{ MEDIA_BUS_FMT_SRGGB8_1X8, MEDIA_BUS_FMT_SGRBG8_1X8, },
			{ MEDIA_BUS_FMT_SGBRG8_1X8, MEDIA_BUS_FMT_SBGGR8_1X8, },
		},
	};

  	lockdep_assert_held(&imx219->mutex);
	return codes[is_8bit][imx219->vflip->val][imx219->hflip->val];
}

"is_8bit" a member of struct imx219 which equals to 0 if the sensor if RAW10 mode,
and is 1 for RAW8 mode.

>   
>   static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> @@ -539,13 +555,26 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>   	struct imx219 *imx219 = to_imx219(sd);
>   	struct v4l2_mbus_framefmt *try_fmt =
>   		v4l2_subdev_get_try_format(sd, fh->pad, 0);
> +	struct v4l2_mbus_framefmt *fmt;
>   
>   	mutex_lock(&imx219->mutex);
>   
> +	fmt = &imx219->fmt;
> +	fmt->code = MEDIA_BUS_FMT_SRGGB8_1X8;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> +	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +							  fmt->colorspace,
> +							  fmt->ycbcr_enc);
> +	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +	fmt->width = supported_modes[0].width;
> +	fmt->height = supported_modes[0].height;
> +	fmt->field = V4L2_FIELD_NONE;
> +
>   	/* Initialize try_fmt */
>   	try_fmt->width = supported_modes[0].width;
>   	try_fmt->height = supported_modes[0].height;
> -	try_fmt->code = imx219_get_format_code(imx219);
> +	try_fmt->code = imx219_get_format_code(imx219, fmt->code);
>   	try_fmt->field = V4L2_FIELD_NONE;
>   
>   	mutex_unlock(&imx219->mutex);
> @@ -646,16 +675,12 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>   				 struct v4l2_subdev_pad_config *cfg,
>   				 struct v4l2_subdev_mbus_code_enum *code)
>   {
> -	struct imx219 *imx219 = to_imx219(sd);
> -
> -	/*
> -	 * Only one bayer order is supported (though it depends on the flip
> -	 * settings)
> -	 */

Guess the above comment still holds

> -	if (code->index > 0)

Though two media bus formats will be available: 8-bit and 10-bit ones, both
with the same Bayer order.

> +	if (code->pad != 0)
> +		return -EINVAL;
> +	if (code->index >= ARRAY_SIZE(imx219_formats))
>   		return -EINVAL;
>   
> -	code->code = imx219_get_format_code(imx219);
> +	code->code = imx219_formats[code->index].code;

This excludes all the Bayer orders except RGGB thus breaking the hflip/vflip support, right?

I would better check (as the sensor can only support two media bus formats at a time):
	if (code->index > 1)
		return -EINVAL;
and use imx219_get_format_code(struct imx219 *imx219, int is_8_bit) to set the code->code:
	code->code = imx219_get_format_code(imx219, code->index);

>   
>   	return 0;
>   }
> @@ -669,7 +694,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>   	if (fse->index >= ARRAY_SIZE(supported_modes))
>   		return -EINVAL;
>   
> -	if (fse->code != imx219_get_format_code(imx219))
> +	if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
>   		return -EINVAL;
>   
>   	fse->min_width = supported_modes[fse->index].width;

Looking at the "[PATCH 3/3] media: i2c: imx219: Add support 640x480",
the RAW8 mode is added to the end of the supported_modes[] array after the three RAW10 modes.
Guess this breaks VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl for RAW8, as in the RAW8 case
it would return 0 (and the supported frame sizes) for fse->index=3 only, while for all
the other values, fse->index=0 included, it will return -EINVAL ...

> @@ -696,7 +721,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
>   {
>   	fmt->format.width = mode->width;
>   	fmt->format.height = mode->height;
> -	fmt->format.code = imx219_get_format_code(imx219);
> +	fmt->format.code = imx219_get_format_code(imx219, imx219->fmt.code);
>   	fmt->format.field = V4L2_FIELD_NONE;
>   
>   	imx219_reset_colorspace(&fmt->format);
> @@ -710,7 +735,7 @@ static int __imx219_get_pad_format(struct imx219 *imx219,
>   		struct v4l2_mbus_framefmt *try_fmt =
>   			v4l2_subdev_get_try_format(&imx219->sd, cfg, fmt->pad);
>   		/* update the code which could change due to vflip or hflip: */
> -		try_fmt->code = imx219_get_format_code(imx219);
> +		try_fmt->code = imx219_get_format_code(imx219, try_fmt->code);
>   		fmt->format = *try_fmt;
>   	} else {
>   		imx219_update_pad_format(imx219, imx219->mode, fmt);
> @@ -741,11 +766,19 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   	const struct imx219_mode *mode;
>   	struct v4l2_mbus_framefmt *framefmt;
>   	int exposure_max, exposure_def, hblank;
> +	int i;
>   
>   	mutex_lock(&imx219->mutex);
>   
> +	for (i = 0; i < ARRAY_SIZE(imx219_formats); i++)
> +		if (imx219_formats[i].code == fmt->format.code)

This excludes all the Bayer orders except RGGB thus breaking the hflip/vflip support, right?

> +			break;
> +	if (i >= ARRAY_SIZE(imx219_formats))
> +		i = 0;
> +
>   	/* Bayer order varies with flips */
> -	fmt->format.code = imx219_get_format_code(imx219);
> +	fmt->format.code = imx219_get_format_code(imx219,
> +						  imx219_formats[i].code);
>   
>   	mode = v4l2_find_nearest_size(supported_modes,
>   				      ARRAY_SIZE(supported_modes),
> @@ -756,6 +789,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>   		*framefmt = fmt->format;
>   	} else if (imx219->mode != mode) {
> +		imx219->fmt = fmt->format;
>   		imx219->mode = mode;
>   		/* Update limits and set FPS to default */
>   		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> @@ -786,6 +820,36 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   	return 0;
>   }
>   
> +static int imx219_set_framefmt(struct imx219 *imx219)
> +{
> +	int ret;
> +
> +	switch (imx219->fmt.code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		ret = imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_0_7,
> +				       IMX219_REG_VALUE_08BIT, 0x08);
> +		ret |= imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_8_15,
> +				       IMX219_REG_VALUE_08BIT, 0x08);
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +		ret = imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_0_7,
> +				       IMX219_REG_VALUE_08BIT, 0x0a);
> +		ret |= imx219_write_reg(imx219, IMX219_CSI_DATA_FORMAT_A_8_15,
> +				       IMX219_REG_VALUE_08BIT, 0x0a);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
>   static int imx219_start_streaming(struct imx219 *imx219)
>   {
>   	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> @@ -800,6 +864,12 @@ static int imx219_start_streaming(struct imx219 *imx219)
>   		return ret;
>   	}
>   
> +	ret = imx219_set_framefmt(imx219);

I just wonder if it makes sense to remove setting IMX219_CSI_DATA_FORMAT_A register
from the struct imx219_reg mode_x_y_regs[] tables and to introduce new imx219_set_framefmt()
function which is called right after the settings from the mode_x_y_regs[] are written
into the sensor, and is never called otherwise?

> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set format\n", __func__);
> +		return ret;
> +	}
> +
>   	/* Apply customized values from user */
>   	ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
>   	if (ret)
> 
