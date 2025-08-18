Return-Path: <linux-media+bounces-40097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A68B29B74
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C2EF18A670F
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E143B2BE621;
	Mon, 18 Aug 2025 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SEImoTW8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7A29B214;
	Mon, 18 Aug 2025 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503922; cv=none; b=BS5HQHaA81so2L85KkhocV08rhJ8SKymVqaG232IeMA4+AUn8JLieBdPkOj/xQLhA7Xe1G7iG9Nq5R59lOHbNf0rKSd/6KccTn6nvJAsp5P/XiEkC9cqyQGVR2JoBrpkKhz0V7LbZt6v2vcvHtTvaSz7uy+5FfL4MYXYaFI8sbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503922; c=relaxed/simple;
	bh=OW9f5Gz4q3W8mGYClWjgappBtP1YWzKFBndKdsW/UPM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ROXdN/7flezsyn5G3+D6CD/agec4Xllb+WAlLbSZPTkS+9Qtd2m12pFFgkHo0WMa7vL0CAGL9KJWTFHE+wCb9vnX+5bVPiw+/4AF+Yy3582c0wmZ9OdkH272EFV4PA3nXFBkvhmI0L3rh+ijwA/mn0rmy4T0OExumqajMNapDSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SEImoTW8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2B9717D1;
	Mon, 18 Aug 2025 09:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755503856;
	bh=OW9f5Gz4q3W8mGYClWjgappBtP1YWzKFBndKdsW/UPM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SEImoTW8ayDBecy2mEM1DV0ANnq74VI+K8tQF04QYawS1JqegbnJsuGd/OK0IweXa
	 CZJVL2loPHBU2jl2OtPYzQheafup6jMKobDYoiRpoB6/5plFPLr5axFeLu7OXtllfM
	 pMZjU765pmUgAv7A5yrtas6+3Y/TOku90HJGojBs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250816055432.131912-3-will@willwhang.com>
References: <20250816055432.131912-1-will@willwhang.com> <20250816055432.131912-3-will@willwhang.com>
Subject: Re: [PATCH v3 2/2] media: i2c: imx585: Add Sony IMX585 image-sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Will Whang <will@willwhang.com>
Date: Mon, 18 Aug 2025 08:58:29 +0100
Message-ID: <175550390975.1721288.3121861926484209664@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Will,

Thanks for working on getting this upstream! I'm always happy to see
more cameras supported for all platforms!

Please post the IMX585 camera sensor helpers to libcamera too - they're
eligible for merge when a driver is posted publicly to the kernel
mailing list.

I'm only tackling the black level in this review at the moment as I
noticied it so trimming out other parts for the review:


Quoting Will Whang (2025-08-16 06:54:32)
> Implements support for:
>   * 4-lane / 2-lane CSI-2
>   * 12-bit linear, 4K/FHD mode.
>   * Monochrome variant.
>   * Tested on Raspberry Pi 4/5 with 24 MHz clock.
>=20
> Signed-off-by: Will Whang <will@willwhang.com>
> ---

<snip>

> +
> +/* Black level control */
> +#define IMX585_REG_BLKLEVEL             CCI_REG16_LE(0x30dc)
> +#define IMX585_BLKLEVEL_DEFAULT         50

50 ... seems surprisingly low to me ... Is that a 10 bit value or a 12
bit value ? You only have 12 bit modes ...

Oh - fortunately I can see a datasheet on this one.

"""
When the output data length is 10-bit output, increasing the register
setting value by 1h increases the black level by 1 LSB. When the output
data length is 12-bit output, increasing the register setting value by
1h increases the black level by 4 LSB.

Use with values shown below is recommended.
10-bit output: 032h (50d in LSB units)
12-bit output: 032h (200d in LSB units)
"""


Ok - so the value written is always a 10 bit number regardless of the
mode, which gives 3200 as a 16 bit value which is more in the range I
would have expected, so now it makes sense.

> +
> +/* Digital Clamp */
> +#define IMX585_REG_DIGITAL_CLAMP        CCI_REG8(0x3458)
> +

<snip>

> +/* ---------------------------------------------------------------------=
-----
> + * Controls
> + * ---------------------------------------------------------------------=
-----
> + */
> +
> +static int imx585_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct imx585 *imx585 =3D container_of(ctrl->handler, struct imx5=
85, ctrl_handler);
> +       const struct imx585_mode *mode, *mode_list;
> +       struct v4l2_subdev_state *state;
> +       struct v4l2_mbus_framefmt *fmt;
> +       unsigned int num_modes;
> +       int ret =3D 0;
> +
> +       state =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> +       fmt =3D v4l2_subdev_state_get_format(state, 0);
> +
> +       get_mode_table(imx585, fmt->code, &mode_list, &num_modes);
> +       mode =3D v4l2_find_nearest_size(mode_list, num_modes, width, heig=
ht,
> +                                     fmt->width, fmt->height);
> +
> +       /* Apply control only when powered (runtime active). */
> +       if (!pm_runtime_get_if_active(imx585->clientdev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE: {
> +               u32 shr =3D (imx585->vmax - ctrl->val) & ~1U; /* SHR alwa=
ys a multiple of 2 */
> +
> +               dev_dbg(imx585->clientdev, "EXPOSURE=3D%u -> SHR=3D%u (VM=
AX=3D%u HMAX=3D%u)\n",
> +                       ctrl->val, shr, imx585->vmax, imx585->hmax);
> +
> +               ret =3D cci_write(imx585->regmap, IMX585_REG_SHR, shr, NU=
LL);
> +               if (ret)
> +                       dev_err_ratelimited(imx585->clientdev, "SHR write=
 failed (%d)\n", ret);
> +               break;
> +       }
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               dev_dbg(imx585->clientdev, "ANALOG_GAIN=3D%u\n", ctrl->va=
l);
> +               ret =3D cci_write(imx585->regmap, IMX585_REG_ANALOG_GAIN,=
 ctrl->val, NULL);
> +               if (ret)
> +                       dev_err_ratelimited(imx585->clientdev, "Gain writ=
e failed (%d)\n", ret);
> +               break;
> +       case V4L2_CID_VBLANK: {
> +               u32 current_exposure =3D imx585->exposure->cur.val;
> +
> +               imx585->vmax =3D (mode->height + ctrl->val) & ~1U;
> +
> +               current_exposure =3D clamp_t(u32, current_exposure,
> +                                          IMX585_EXPOSURE_MIN, imx585->v=
max - IMX585_SHR_MIN);
> +               __v4l2_ctrl_modify_range(imx585->exposure,
> +                                        IMX585_EXPOSURE_MIN, imx585->vma=
x - IMX585_SHR_MIN, 1,
> +                                        current_exposure);
> +
> +               dev_dbg(imx585->clientdev, "VBLANK=3D%u -> VMAX=3D%u\n", =
ctrl->val, imx585->vmax);
> +
> +               ret =3D cci_write(imx585->regmap, IMX585_REG_VMAX, imx585=
->vmax, NULL);
> +               if (ret)
> +                       dev_err_ratelimited(imx585->clientdev, "VMAX writ=
e failed (%d)\n", ret);
> +               break;
> +       }
> +       case V4L2_CID_HBLANK: {
> +               u64 pixel_rate =3D (u64)mode->width * IMX585_PIXEL_RATE;
> +               u64 hmax;
> +
> +               do_div(pixel_rate, mode->min_hmax);
> +               hmax =3D (u64)(mode->width + ctrl->val) * IMX585_PIXEL_RA=
TE;
> +               do_div(hmax, pixel_rate);
> +               imx585->hmax =3D (u32)hmax;
> +
> +               dev_dbg(imx585->clientdev, "HBLANK=3D%u -> HMAX=3D%u\n", =
ctrl->val, imx585->hmax);
> +
> +               ret =3D cci_write(imx585->regmap, IMX585_REG_HMAX, imx585=
->hmax, NULL);
> +               if (ret)
> +                       dev_err_ratelimited(imx585->clientdev, "HMAX writ=
e failed (%d)\n", ret);
> +               break;
> +       }
> +       case V4L2_CID_HFLIP:
> +               ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMODEH, c=
trl->val, NULL);
> +               if (ret)
> +                       dev_err_ratelimited(imx585->clientdev, "HFLIP wri=
te failed (%d)\n", ret);
> +               break;
> +       case V4L2_CID_VFLIP:
> +               ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMODEV, c=
trl->val, NULL);
> +               if (ret)
> +                       dev_err_ratelimited(imx585->clientdev, "VFLIP wri=
te failed (%d)\n", ret);
> +               break;
> +       case V4L2_CID_BRIGHTNESS: {

This is the wrong control to set blacklevel.

Please use V4L2_CID_BLACK_LEVEL


> +               u16 blacklevel =3D min_t(u32, ctrl->val, 4095);

do you know if the value is specific to which mode the sensor is in ?

I assume this is a 10 bit value if the sensor is in a 10 bit mode and a
12 bit mode if the sensor is in 12 bit mode for example.


Edit: Nope - now I've found a datasheet - this is /always/ a 10 bit
value. Can you document that with a comment please? Especially as this
driver only currently outputs 12 bit modes but uses a 10 bit black level
that could be confusing otherwise.

If we want to make that adjustable from libcamera we'll have to be
careful to always use the correct units.



> +
> +               ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEVEL, bl=
acklevel, NULL);
> +               if (ret)
> +                       dev_err_ratelimited(imx585->clientdev, "BLKLEVEL =
write failed (%d)\n", ret);
> +               break;
> +       }
> +       default:
> +               dev_dbg(imx585->clientdev, "Unhandled ctrl %s: id=3D0x%x,=
 val=3D0x%x\n",
> +                       ctrl->name, ctrl->id, ctrl->val);
> +               break;
> +       }
> +
> +       pm_runtime_put(imx585->clientdev);
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx585_ctrl_ops =3D {
> +       .s_ctrl =3D imx585_set_ctrl,
> +};
> +
> +static int imx585_init_controls(struct imx585 *imx585)
> +{
> +       struct v4l2_ctrl_handler *hdl =3D &imx585->ctrl_handler;
> +       struct v4l2_fwnode_device_properties props;
> +       int ret;
> +
> +       ret =3D v4l2_ctrl_handler_init(hdl, 16);
> +
> +       /* Read-only, updated per mode */
> +       imx585->pixel_rate =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +                                              V4L2_CID_PIXEL_RATE,
> +                                              1, UINT_MAX, 1, 1);
> +
> +       imx585->link_freq =3D
> +               v4l2_ctrl_new_int_menu(hdl, &imx585_ctrl_ops, V4L2_CID_LI=
NK_FREQ,
> +                                      0, 0, &link_freqs[imx585->link_fre=
q_idx]);
> +       if (imx585->link_freq)
> +               imx585->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       imx585->vblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +                                          V4L2_CID_VBLANK, 0, 0xFFFFF, 1=
, 0);
> +       imx585->hblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +                                          V4L2_CID_HBLANK, 0, 0xFFFF, 1,=
 0);
> +       imx585->blacklevel =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +                                              V4L2_CID_BRIGHTNESS, 0, 0x=
FFFF, 1,

You're setting max to 0xFFFF but in the code you clamp it to 4095
(0xFFF)?

I'd use readable decimal values for the black level range rather than
hex, as I think of black level in decimal values.

If you set this to=20

      imx585->blacklevel =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
                                              V4L2_CID_BLACK_LEVEL, 0, 4095=
, 1,
					      IMX585_BLKLEVEL_DEFAULT);

you can remove the clamp from the set controls call as v4l2 will
restrict the values.

Oh ... I just looked at the datasheet again:=20

Setting value

Initial value 032h
Setting value 000h to 3FFh

So the actual maximum is 1023. Maybe hex (0x3ff) or decimal is fine
either way depending on if you want to closely match the datasheet.




> +                                              IMX585_BLKLEVEL_DEFAULT);
> +
> +       imx585->exposure =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +                                            V4L2_CID_EXPOSURE,
> +                                            IMX585_EXPOSURE_MIN, IMX585_=
EXPOSURE_MAX,
> +                                            IMX585_EXPOSURE_STEP, IMX585=
_EXPOSURE_DEFAULT);
> +
> +       imx585->gain =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops, V4L2_CI=
D_ANALOGUE_GAIN,
> +                                        IMX585_ANA_GAIN_MIN, IMX585_ANA_=
GAIN_MAX,
> +                                        IMX585_ANA_GAIN_STEP, IMX585_ANA=
_GAIN_DEFAULT);
> +
> +       imx585->hflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> +       imx585->vflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
> +       if (hdl->error) {
> +               ret =3D hdl->error;
> +               dev_err(imx585->clientdev, "control init failed (%d)\n", =
ret);
> +               goto err_free;
> +       }
> +
> +       ret =3D v4l2_fwnode_device_parse(imx585->clientdev, &props);
> +       if (ret)
> +               goto err_free;
> +
> +       ret =3D v4l2_ctrl_new_fwnode_properties(hdl, &imx585_ctrl_ops, &p=
rops);
> +       if (ret)
> +               goto err_free;
> +
> +       imx585->sd.ctrl_handler =3D hdl;
> +       return 0;
> +
> +err_free:
> +       v4l2_ctrl_handler_free(hdl);
> +       return ret;
> +}
> +
> +static void imx585_free_controls(struct imx585 *imx585)
> +{
> +       v4l2_ctrl_handler_free(imx585->sd.ctrl_handler);
> +}
> +};

<snip>

