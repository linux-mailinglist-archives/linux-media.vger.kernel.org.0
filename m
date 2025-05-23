Return-Path: <linux-media+bounces-33281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B5AC27F5
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 18:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8DAA423F3
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 16:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7544D297130;
	Fri, 23 May 2025 16:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cRMsfUbH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705E221547;
	Fri, 23 May 2025 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748019216; cv=none; b=nFUUo6CrCCZMzbIQ7M2mhS1IvutI9eKE8qkVfClM/z7ArdaMNpul1YNDoX+XW+74/fnXcAB9fw+9jPQamaUTbsiD4JBDlp5xnb6UO1OhODdSshIrKmp7iR2m+qU0rZXJ0n7Hf63Psad5i1QgFRsDTbzAVn4UbbDGdWIDmcqhXRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748019216; c=relaxed/simple;
	bh=7vPG/vp7sl4OImEeVueSFERD4i0cKqTC9I6nhMiwNis=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ipFjJAqHVy4c7b8XsQ33oaG0W+Apo9JK6ykt5Gyx5sjthhBA54VXBoya5MzniHLngShMU6um/SC5d6zjafiNDXX2zpZ5NqYsl60ZqhqN0XmRp5bnN7WRWIODHgk2f76fG3rRtQdVEQIaPhtE9geDOb1b1aOQp2K7ElyysX9Digo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cRMsfUbH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:b8ba:6efe:8413:cff8:dd59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 241464A4;
	Fri, 23 May 2025 18:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748019189;
	bh=7vPG/vp7sl4OImEeVueSFERD4i0cKqTC9I6nhMiwNis=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cRMsfUbH7i5mxtR8mZEQ4nJQsnu9h4Y1CDyXqkj9mgRp+C6gznDtib3km3s6vS5AD
	 q1OnahOfYX1I81PfDdaYJmI49rCxqDsXNow4hCh5a1lDchZBvSWp9DZn8JqeX1wmZJ
	 mLcsiRtv7Eg2SVNqou+v9DWSXSCuB/ZIaISdOIIs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250523083655.3876005-3-y-abhilashchandra@ti.com>
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com> <20250523083655.3876005-3-y-abhilashchandra@ti.com>
Subject: Re: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, vaishnav.a@ti.com, u-kumar1@ti.com, jai.luthra@linux.dev, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, y-abhilashchandra@ti.com
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, conor+dt@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org, tomi.valkeinen@ideasonboard.com
Date: Fri, 23 May 2025 22:23:26 +0530
Message-ID: <174801920679.2094995.12860064357887094874@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Abhilash,

Thanks for the patch.

Quoting Yemike Abhilash Chandra (2025-05-23 14:06:55)
> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
> compatible with DS90UB960-Q1. The main difference is that it supports
> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
> port.
>=20
> Some other registers are marked as reserved in the datasheet as well,
> notably around CSI-TX frame and line-count monitoring and some other
> status registers. The datasheet also does not mention anything about

So what happens when userspace calls LOG_STATUS and the driver tries to
read these monitoring registers? Are these populated in the device but just
marked as reserved in the datasheet?

Whatever is the case, please make sure the driver doesn't crash, and update
the commit message with the reality if the datasheet is wrong.

> setting strobe position, and fails to lock the RX ports if we forcefully
> set it, so disable it through the hw_data.
>=20
> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  drivers/media/i2c/Kconfig     |  2 +-
>  drivers/media/i2c/ds90ub960.c | 46 +++++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e68202954a8f..6e265e1cec20 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1662,7 +1662,7 @@ config VIDEO_DS90UB960
>         select V4L2_FWNODE
>         select VIDEO_V4L2_SUBDEV_API
>         help
> -         Device driver for the Texas Instruments DS90UB960
> +         Device driver for the Texas Instruments DS90UB954/DS90UB960
>           FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializ=
er.

nit:
           Device driver for the Texas Instruments DS90UB954, DS90UB960
           FPD-Link III Deserializers and DS90UB9702 FPD-Link IV Deserializ=
er.

> =20
>  config VIDEO_MAX96714
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index ed2cf9d247d1..38e4f006d098 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -460,6 +460,7 @@ struct ub960_hw_data {
>         u8 num_txports;
>         bool is_ub9702;
>         bool is_fpdlink4;
> +       bool is_ub954;
>  };
> =20
>  enum ub960_rxport_mode {
> @@ -982,6 +983,10 @@ static int ub960_txport_select(struct ub960_data *pr=
iv, u8 nport)
> =20
>         lockdep_assert_held(&priv->reg_lock);
> =20
> +       /* TX port registers are shared for UB954*/
> +       if (priv->hw_data->is_ub954)
> +               return 0;
> +

nit: This could be moved above the assertion

>         if (priv->reg_current.txport =3D=3D nport)
>                 return 0;
> =20
> @@ -1415,6 +1420,13 @@ static int ub960_parse_dt_txport(struct ub960_data=
 *priv,
>                 goto err_free_vep;
>         }
> =20
> +       /* UB954 does not support 1.2 Gbps */
> +       if (priv->tx_data_rate =3D=3D MHZ(1200) && priv->hw_data->is_ub95=
4) {
> +               dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", =
nport);
> +               ret =3D -EINVAL;
> +               goto err_free_vep;
> +       }
> +

The error handling is exactly the same as the previous if {} block that
checks the allowed data rates for UB960. IMO cleaner to move this condition
in that block.

Maybe even a separate table for allowed data-rates for each chip, but that
is probably overkill.

>         v4l2_fwnode_endpoint_free(&vep);
> =20
>         priv->txports[nport] =3D txport;
> @@ -1572,6 +1584,10 @@ static int ub960_rxport_set_strobe_pos(struct ub96=
0_data *priv,
>         u8 clk_delay, data_delay;
>         int ret =3D 0;
> =20
> +       /* FIXME: After writing to this area the UB954 chip no longer res=
ponds */
> +       if (priv->hw_data->is_ub954)
> +               return 0;
> +

It would be good to understand if this is a hardware limitation or not.
Tomi, do you have any idea?

>         clk_delay =3D UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>         data_delay =3D UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
> =20
> @@ -5021,6 +5037,27 @@ static int ub960_enable_core_hw(struct ub960_data =
*priv)
>         if (priv->hw_data->is_ub9702)
>                 ret =3D ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_f=
req,
>                                  NULL);
> +       else if (priv->hw_data->is_ub954) {
> +               /* From DS90UB954-Q1 datasheet:
> +                * "REFCLK_FREQ measurement is not synchronized. Value in=
 this
> +                * register should read twice and only considered valid if

                   * register should be read twice and only considered vali=
d if

> +                * REFCLK_FREQ is unchanged between reads."
> +                */
> +               unsigned long timeout =3D jiffies + msecs_to_jiffies(100);
> +
> +               do {
> +                       u8 refclk_new;
> +
> +                       ret =3D ub960_read(priv, UB960_XR_REFCLK_FREQ, &r=
efclk_new,
> +                                        NULL);
> +                       if (ret)
> +                               goto err_pd_gpio;
> +
> +                       if (refclk_new =3D=3D refclk_freq)
> +                               break;
> +                       refclk_freq =3D refclk_new;
> +               } while (time_before(jiffies, timeout));
> +       }

Hmm.. in your testing did you find this actually requiring more than one
read?

I'm surprised because this is missing from UB960 which is an older device.

>         else
>                 ret =3D ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_fr=
eq,
>                                  NULL);
> @@ -5177,6 +5214,13 @@ static void ub960_remove(struct i2c_client *client)
>         mutex_destroy(&priv->reg_lock);
>  }
> =20
> +static const struct ub960_hw_data ds90ub954_hw =3D {
> +       .model =3D "ub954",
> +       .num_rxports =3D 2,
> +       .num_txports =3D 1,
> +       .is_ub954 =3D true,
> +};
> +
>  static const struct ub960_hw_data ds90ub960_hw =3D {
>         .model =3D "ub960",
>         .num_rxports =3D 4,
> @@ -5192,6 +5236,7 @@ static const struct ub960_hw_data ds90ub9702_hw =3D=
 {
>  };
> =20
>  static const struct i2c_device_id ub960_id[] =3D {
> +       { "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
>         { "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
>         { "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
>         {}
> @@ -5199,6 +5244,7 @@ static const struct i2c_device_id ub960_id[] =3D {
>  MODULE_DEVICE_TABLE(i2c, ub960_id);
> =20
>  static const struct of_device_id ub960_dt_ids[] =3D {
> +       { .compatible =3D "ti,ds90ub954-q1", .data =3D &ds90ub954_hw },
>         { .compatible =3D "ti,ds90ub960-q1", .data =3D &ds90ub960_hw },
>         { .compatible =3D "ti,ds90ub9702-q1", .data =3D &ds90ub9702_hw },
>         {}
> --=20
> 2.34.1
>=20
>

Thanks,
Jai

