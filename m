Return-Path: <linux-media+bounces-47971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 393F4C98011
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A97B734545D
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65167320A3F;
	Mon,  1 Dec 2025 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vl1q0JAc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7816DEB3;
	Mon,  1 Dec 2025 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764602137; cv=none; b=cg/EsOHc/FBber8gwJxeYmTEpr0kVQIzSYTN81jyNgRDvPLZFoc5/Or4/Pt9ICdpG3VqQT8Xi5cbEeaAd4IIyYmQajOlWbjoijEbHmGaYihs+klm0jzBZrOA7hbiBy58JPWthgQqG/sRKzx+dcj4S/o4SvVX95BdlMajHY0HCRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764602137; c=relaxed/simple;
	bh=unwhROlfIDKJhZRrjNRFgJyZp1RiAhD5PhXdORnQ8iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZ3OmtgJLUGV9buReWMROlHZh/I9ujarwIDad9IlaF72b6jKSl4fIGjh44y9Z9sifWCL/GEtTVoJcKf+Wbyrr3wYD9GZNmS6C1Kv6RxwwYioALQnehv+C1MY3TVCGLN5kA6fOU7X+pqF4IDp3BEQWKBVOHUXXH9iCs2rV5Fidt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vl1q0JAc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0CFC6DF;
	Mon,  1 Dec 2025 16:13:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764601998;
	bh=unwhROlfIDKJhZRrjNRFgJyZp1RiAhD5PhXdORnQ8iU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vl1q0JAc5rbYNblfx557hxNu8abwkS+2yaoGZzthhbVq34lRFw4txvnwTGcel5mdn
	 iFbMSxAduBdx574lRa5S8DbygGZE/ohP0Gbo5aDXfZU6Tf28XbwftuHYumWySMjlp6
	 T0NE4UrCqgOiIkdd5ktF2+dFoMabm9zZVg2jBkCo=
Date: Mon, 1 Dec 2025 16:15:27 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 09/16] media: i2c: ov5647: Support HFLIP and VFLIP
Message-ID: <gla47pqyt6aan7fzr4eizm5ftyoc5s5u3dyh5u2fqbig7h2n6o@3lernf2jpswf>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
 <20251118-b4-rpi-ov5647-v2-9-5e78e7cb7f9b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-b4-rpi-ov5647-v2-9-5e78e7cb7f9b@ideasonboard.com>

Hi Jai

On Tue, Nov 18, 2025 at 05:33:02PM +0530, Jai Luthra wrote:
> From: David Plowman <david.plowman@raspberrypi.com>
>
> Add missing controls for horizontal and vertical flipping.
>
> The sensor readout mirrors in the horizontal direction by default (if
> 0x3821[1] = 0) which can make things unnecessarily difficult for
> applications. The register table prior to this commit was setting that
> bit explicitly, to achieve a normally oriented image.
>
> Now that we have userspace controls for HFLIP, we keep the convention
> and report the non-mirrored image (with 0x3821[1] = 1) as
> horizontal_flip=0, and vice versa.

I would drop this last part. This patch makes thing work "as
expected", HFLIP=1 -> mirror, HFLIP=0 -> non mirror

The fact we invert the control value to get the right register value
might just be confusing to read here ?

>
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Co-developed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 86 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 79 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 5009fd8c05a64d7e06f66f8f75f0a881cd0b95c1..0343583692ab9bcca1a07d874a707ac6093a9035 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -55,6 +55,8 @@
>  #define OV5647_REG_GAIN_LO		0x350b
>  #define OV5647_REG_VTS_HI		0x380e
>  #define OV5647_REG_VTS_LO		0x380f
> +#define OV5647_REG_TIMING_TC_V		0x3820
> +#define OV5647_REG_TIMING_TC_H		0x3821
>  #define OV5647_REG_FRAME_OFF_NUMBER	0x4202
>  #define OV5647_REG_MIPI_CTRL00		0x4800
>  #define OV5647_REG_MIPI_CTRL14		0x4814
> @@ -120,6 +122,8 @@ struct ov5647 {
>  	struct v4l2_ctrl		*hblank;
>  	struct v4l2_ctrl		*vblank;
>  	struct v4l2_ctrl		*exposure;
> +	struct v4l2_ctrl		*hflip;
> +	struct v4l2_ctrl		*vflip;
>  };
>
>  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -161,7 +165,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
>  	{0x3036, 0x69},
>  	{0x303c, 0x11},
>  	{0x3106, 0xf5},
> -	{0x3821, 0x06},
> +	{0x3821, 0x00},
>  	{0x3820, 0x00},
>  	{0x3827, 0xec},
>  	{0x370c, 0x03},
> @@ -250,7 +254,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
>  	{0x3036, 0x62},
>  	{0x303c, 0x11},
>  	{0x3106, 0xf5},
> -	{0x3821, 0x06},
> +	{0x3821, 0x00},
>  	{0x3820, 0x00},
>  	{0x3827, 0xec},
>  	{0x370c, 0x03},
> @@ -414,7 +418,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
>  	{0x4800, 0x24},
>  	{0x3503, 0x03},
>  	{0x3820, 0x41},
> -	{0x3821, 0x07},
> +	{0x3821, 0x01},
>  	{0x350a, 0x00},
>  	{0x350b, 0x10},
>  	{0x3500, 0x00},
> @@ -430,7 +434,7 @@ static struct regval_list ov5647_640x480_10bpp[] = {
>  	{0x3035, 0x11},
>  	{0x3036, 0x46},
>  	{0x303c, 0x11},
> -	{0x3821, 0x07},
> +	{0x3821, 0x01},

So we now mirror by default (HFLIP=1). See below at controls
initialization

>  	{0x3820, 0x41},
>  	{0x370c, 0x03},
>  	{0x3612, 0x59},
> @@ -956,6 +960,26 @@ static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
>  	.s_stream =		ov5647_s_stream,
>  };
>
> +/*
> + * This function returns the mbus code for the current settings of the HFLIP
> + * and VFLIP controls.
> + */
> +static u32 ov5647_get_mbus_code(struct v4l2_subdev *sd)
> +{
> +	struct ov5647 *sensor = to_sensor(sd);
> +	/* The control values are only 0 or 1. */
> +	int index =  sensor->hflip->val | (sensor->vflip->val << 1);
> +
> +	static const u32 codes[4] = {
> +		MEDIA_BUS_FMT_SGBRG10_1X10,
> +		MEDIA_BUS_FMT_SBGGR10_1X10,
> +		MEDIA_BUS_FMT_SRGGB10_1X10,
> +		MEDIA_BUS_FMT_SGRBG10_1X10
> +	};
> +
> +	return codes[index];
> +}
> +
>  static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -963,7 +987,7 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index > 0)
>  		return -EINVAL;
>
> -	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	code->code = ov5647_get_mbus_code(sd);
>
>  	return 0;
>  }
> @@ -974,7 +998,7 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
>  {
>  	const struct v4l2_mbus_framefmt *fmt;
>
> -	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10 ||
> +	if (fse->code != ov5647_get_mbus_code(sd) ||
>  	    fse->index >= ARRAY_SIZE(ov5647_modes))
>  		return -EINVAL;
>
> @@ -1007,6 +1031,8 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>  	}
>
>  	*fmt = *sensor_format;
> +	/* The code we pass back must reflect the current h/vflips. */
> +	fmt->code = ov5647_get_mbus_code(sd);
>  	mutex_unlock(&sensor->lock);
>
>  	return 0;
> @@ -1054,6 +1080,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>  					 exposure_def);
>  	}
>  	*fmt = mode->format;
> +	/* The code we pass back must reflect the current h/vflips. */
> +	fmt->code = ov5647_get_mbus_code(sd);
>  	mutex_unlock(&sensor->lock);
>
>  	return 0;
> @@ -1229,6 +1257,36 @@ static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
>  	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
>  }
>
> +static int ov5647_s_flip(struct v4l2_subdev *sd, u16 reg, u32 ctrl_val)
> +{
> +	int ret;
> +	u8 reg_val;

nit: invert the declaration order

> +
> +	/*
> +	 * TIMING TC REG20 (Vertical) and REG21 (Horizontal):
> +	 * - [2]:	ISP mirror/flip
> +	 * - [1]:	Sensor mirror/flip
> +	 *
> +	 * We only use sensor flip.
> +	 *
> +	 * Using ISP flip retains the BGGR pattern at the cost of changing the
> +	 * pixel array readout. This affects the selection rectangles in ways
> +	 * that are not very well documented, and would be tougher to deal with
> +	 * for applications compared to reading a different bayer pattern.

Nice you reported this

> +	 */
> +	ret = ov5647_read(sd, reg, &reg_val);
> +	if (ret == 0) {

isn't it easier:

        if (ret)
                return ret;


> +		if (ctrl_val)
> +			reg_val |= BIT(1);
> +		else
> +			reg_val &= ~BIT(1);
> +
> +		ret = ov5647_write(sd, reg, reg_val);

        return ov5647_write(sd, reg, val ? reg_val | BIT(1)
                                         : reg_val &= ~BIT(1));

> +	}
> +
> +	return ret;
> +}
> +
>  static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov5647 *sensor = container_of(ctrl->handler,
> @@ -1291,6 +1349,14 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		/* Read-only, but we adjust it based on mode. */
>  		break;
>
> +	case V4L2_CID_HFLIP:
> +		/* There's an in-built hflip in the sensor, so account for that here. */
> +		ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ov5647_s_flip(sd, OV5647_REG_TIMING_TC_V, ctrl->val);
> +		break;
> +
>  	default:
>  		dev_info(&client->dev,
>  			 "Control (id:0x%x, val:0x%x) not supported\n",
> @@ -1324,7 +1390,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  	int hblank, exposure_max, exposure_def;
>  	struct device *dev = &client->dev;
>
> -	v4l2_ctrl_handler_init(&sensor->ctrls, 11);
> +	v4l2_ctrl_handler_init(&sensor->ctrls, 13);
>
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1373,6 +1439,12 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
>  				     0, 0, ov5647_test_pattern_menu);
>
> +	sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 0);

if now we mirror by default, should you initialize the control value
to 1 ?

Nits apart
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> +
> +	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
>  	v4l2_fwnode_device_parse(dev, &props);
>
>  	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
>
> --
> 2.51.1
>

