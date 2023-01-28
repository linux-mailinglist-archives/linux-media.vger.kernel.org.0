Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D7867FA22
	for <lists+linux-media@lfdr.de>; Sat, 28 Jan 2023 18:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbjA1R5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 12:57:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbjA1R5t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 12:57:49 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCFCB28869
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 09:57:45 -0800 (PST)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id E0EA5C3FEB;
        Sat, 28 Jan 2023 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1674928664; bh=zXZrlmp7eYqpWcgqAbQdR34I1cdi56K6z+qVZTjHUiQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Gq+4QkJZNA2ikefWxZvCp6W8AEJO020S0EV9pwZzEpO8TXbP2WwDXcCzXQQEANfEP
         TWKZTYbjh6k5aWX/xbKqqnp1v271PMtjAoIxOy/cWHFlgz+EDWxH4sL8EKNwNsFt/7
         iGFi0LxWqZeW9VJnrR6nLAQW9gkaKZNNVJj0FywA=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: Re: [PATCH v6 8/9] media: i2c: ov5670: Add .get_selection() support
Date:   Sat, 28 Jan 2023 18:57:43 +0100
Message-ID: <1918352.PYKUYFuaPT@g550jk>
In-Reply-To: <20230126165909.121302-9-jacopo.mondi@ideasonboard.com>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
 <20230126165909.121302-9-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FROM_SUSPICIOUS_NTLD,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Donnerstag, 26. J=E4nner 2023 17:59:08 CET Jacopo Mondi wrote:
> From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>=20
> Add support for the .get_selection() pad operation to the ov5670 sensor
> driver.
>=20
> Report the native sensor size (pixel array), the crop bounds (readable
> pixel array area) and the current and default analog crop rectangles.
>=20
> Currently all driver's modes use an analog crop rectangle of size
> [12, 4, 2600, 1952]. Instead of hardcoding the value in the operation
> implementation, ad an .analog_crop field to the sensor's modes
> definitions, to make sure that if any mode gets added, its crop
> rectangle will be defined as well.
>=20
> While at it re-sort the modes' field definition order to match the
> declaration order and initialize the crop rectangle in init_cfg().
>=20
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5670.c | 89 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 83 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 898f564e0c3e..e2a3db7e4e20 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -74,6 +74,10 @@
>  #define OV5670_REG_VALUE_16BIT		2
>  #define OV5670_REG_VALUE_24BIT		3
>=20
> +/* Pixel Array */
> +#define OV5670_NATIVE_WIDTH		2624
> +#define OV5670_NATIVE_HEIGHT		1980
> +
>  /* Initial number of frames to skip to avoid possible garbage */
>  #define OV5670_NUM_OF_SKIP_FRAMES	2
>=20
> @@ -116,10 +120,25 @@ struct ov5670_mode {
>  	/* Link frequency needed for this resolution */
>  	u32 link_freq_index;
>=20
> +	/* Analog crop rectangle */
> +	const struct v4l2_rect *analog_crop;
> +
>  	/* Sensor register settings for this resolution */
>  	const struct ov5670_reg_list reg_list;
>  };
>=20
> +/*
> + * All the modes supported by the driver are obtained by subsampling the
> + * full pixel array. The below values are reflected in registers from
> + * 03800-0x3807 in the modes register-value tables.

nit: 03800 should be 0x3800

Regards
Luca

> + */
> +static const struct v4l2_rect ov5670_analog_crop =3D {
> +	.left	=3D 12,
> +	.top	=3D 4,
> +	.width	=3D 2600,
> +	.height	=3D 1952,
> +};
> +
>  static const struct ov5670_reg mipi_data_rate_840mbps[] =3D {
>  	{0x0300, 0x04},
>  	{0x0301, 0x00},
> @@ -1767,66 +1786,73 @@ static const struct ov5670_mode supported_modes[]=
 =3D
> { .height =3D 1944,
>  		.vts_def =3D OV5670_VTS_30FPS,
>  		.vts_min =3D OV5670_VTS_30FPS,
> +		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
> +		.analog_crop =3D &ov5670_analog_crop,
>  		.reg_list =3D {
>  			.num_of_regs =3D ARRAY_SIZE(mode_2592x1944_regs),
>  			.regs =3D mode_2592x1944_regs,
>  		},
> -		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
>  	},
>  	{
>  		.width =3D 1296,
>  		.height =3D 972,
>  		.vts_def =3D OV5670_VTS_30FPS,
>  		.vts_min =3D 996,
> +		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
> +		.analog_crop =3D &ov5670_analog_crop,
>  		.reg_list =3D {
>  			.num_of_regs =3D ARRAY_SIZE(mode_1296x972_regs),
>  			.regs =3D mode_1296x972_regs,
>  		},
> -		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
>  	},
>  	{
>  		.width =3D 648,
>  		.height =3D 486,
>  		.vts_def =3D OV5670_VTS_30FPS,
>  		.vts_min =3D 516,
> +		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
> +		.analog_crop =3D &ov5670_analog_crop,
>  		.reg_list =3D {
>  			.num_of_regs =3D ARRAY_SIZE(mode_648x486_regs),
>  			.regs =3D mode_648x486_regs,
>  		},
> -		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
>  	},
>  	{
>  		.width =3D 2560,
>  		.height =3D 1440,
>  		.vts_def =3D OV5670_VTS_30FPS,
>  		.vts_min =3D OV5670_VTS_30FPS,
> +		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
> +		.analog_crop =3D &ov5670_analog_crop,
>  		.reg_list =3D {
>  			.num_of_regs =3D ARRAY_SIZE(mode_2560x1440_regs),
>  			.regs =3D mode_2560x1440_regs,
>  		},
> -		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
>  	},
>  	{
>  		.width =3D 1280,
>  		.height =3D 720,
>  		.vts_def =3D OV5670_VTS_30FPS,
>  		.vts_min =3D 1020,
> +
> +		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
> +		.analog_crop =3D &ov5670_analog_crop,
>  		.reg_list =3D {
>  			.num_of_regs =3D ARRAY_SIZE(mode_1280x720_regs),
>  			.regs =3D mode_1280x720_regs,
>  		},
> -		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
>  	},
>  	{
>  		.width =3D 640,
>  		.height =3D 360,
>  		.vts_def =3D OV5670_VTS_30FPS,
>  		.vts_min =3D 510,
> +		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
> +		.analog_crop =3D &ov5670_analog_crop,
>  		.reg_list =3D {
>  			.num_of_regs =3D ARRAY_SIZE(mode_640x360_regs),
>  			.regs =3D mode_640x360_regs,
>  		},
> -		.link_freq_index =3D OV5670_LINK_FREQ_422MHZ_INDEX,
>  	}
>  };
>=20
> @@ -2167,6 +2193,7 @@ static int ov5670_init_cfg(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *fmt =3D
>  				v4l2_subdev_get_try_format(sd, state,=20
0);
>  	const struct ov5670_mode *default_mode =3D &supported_modes[0];
> +	struct v4l2_rect *crop =3D v4l2_subdev_get_try_crop(sd, state, 0);
>=20
>  	fmt->width =3D default_mode->width;
>  	fmt->height =3D default_mode->height;
> @@ -2177,6 +2204,8 @@ static int ov5670_init_cfg(struct v4l2_subdev *sd,
>  	fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
>  	fmt->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB);
>=20
> +	*crop =3D *default_mode->analog_crop;
> +
>  	return 0;
>  }
>=20
> @@ -2506,6 +2535,52 @@ static const struct v4l2_subdev_core_ops
> ov5670_core_ops =3D { .unsubscribe_event =3D v4l2_event_subdev_unsubscrib=
e,
>  };
>=20
> +static const struct v4l2_rect *
> +__ov5670_get_pad_crop(struct ov5670 *sensor, struct v4l2_subdev_state
> *state, +		      unsigned int pad, enum=20
v4l2_subdev_format_whence which)
> +{
> +	const struct ov5670_mode *mode =3D sensor->cur_mode;
> +
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return mode->analog_crop;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int ov5670_get_selection(struct v4l2_subdev *subdev,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	struct ov5670 *sensor =3D to_ov5670(subdev);
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		mutex_lock(&sensor->mutex);
> +		sel->r =3D *__ov5670_get_pad_crop(sensor, state, sel->pad,
> +						sel->which);
> +		mutex_unlock(&sensor->mutex);
> +		break;
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.top =3D 0;
> +		sel->r.left =3D 0;
> +		sel->r.width =3D OV5670_NATIVE_WIDTH;
> +		sel->r.height =3D OV5670_NATIVE_HEIGHT;
> +		break;
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r =3D ov5670_analog_crop;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_video_ops ov5670_video_ops =3D {
>  	.s_stream =3D ov5670_set_stream,
>  };
> @@ -2516,6 +2591,8 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_=
ops
> =3D { .get_fmt =3D ov5670_get_pad_format,
>  	.set_fmt =3D ov5670_set_pad_format,
>  	.enum_frame_size =3D ov5670_enum_frame_size,
> +	.get_selection =3D ov5670_get_selection,
> +	.set_selection =3D ov5670_get_selection,
>  };
>=20
>  static const struct v4l2_subdev_sensor_ops ov5670_sensor_ops =3D {




