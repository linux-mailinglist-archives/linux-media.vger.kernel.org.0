Return-Path: <linux-media+bounces-28470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B9AA68B48
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 713CB168D9D
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDB9253F27;
	Wed, 19 Mar 2025 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C8Or2f6Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4EB259C8B;
	Wed, 19 Mar 2025 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382641; cv=none; b=Gr9yuVODTY4YGXWPygq/gqa5Xs6U6Kx144DGqiGls+z6d4aOx2UKJSRZJk8/I018Sw4A5SwHDmqZgq592gJzMvcei3/wLtJqiOFwsCSGZZLYc+YNj/4HRM1PUN4FHtyV5dooN0+pS8s5AJ+bER7b+PIfu6rLNLEox6lMrVPd+Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382641; c=relaxed/simple;
	bh=a3MgKuhMu6xrOOpoaBuLkpn1rJSlf+cDg6re5Pkw2DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmVIVRx2hymVjMZBKhL9nWIXQ+R9GNK4PbTk80gcu+0BJEQrHi32D+4W6t8H0PEK8QF5cYed5eMuI2WheiKkGdhlBDrNihvlUFvwxKysxzM8mffRd5LkotMHL8q9lNJWdTtTmLNZhk4LVk1OdtUR6FkVfxs/Ua9fNwPmQHPvKkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C8Or2f6Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1b68:91ff:f58e:9810:9f03])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4801422F;
	Wed, 19 Mar 2025 12:08:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742382533;
	bh=a3MgKuhMu6xrOOpoaBuLkpn1rJSlf+cDg6re5Pkw2DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8Or2f6QqcxbjMcPYWPZn3An9t6yxSaQNl3aLpXSx9ej7wbiozNrxcDEoUT9Foywt
	 TTW2y2N8aj/TlMFAuP9KVKnCt+7B2+CrOGuAfWNug0Vulyv5bSfUlW4ZPwAcxQdQ0N
	 mVHX3x0/5yQiVBvWjVhvi0oTWFRI9SEn/RI7CWMQ=
Date: Wed, 19 Mar 2025 16:40:30 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com, robh@kernel.org, 
	krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com, 
	robert.chiras@nxp.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com, alain.volmat@foss.st.com, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, alexander.stein@ew.tq-group.com, 
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de, 
	julien.vuillaumier@nxp.com, devarsht@ti.com, r-donadkar@ti.com
Subject: Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
Message-ID: <46eescbpdyjr3ljlhyv7fwzxksuln5s57xqgv7nim4yon57im3@22slmk45taf2>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="og542hdplnqzogdo"
Content-Disposition: inline
In-Reply-To: <20250305094359.299895-3-mirela.rabulea@nxp.com>


--og542hdplnqzogdo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
MIME-Version: 1.0

Hi Mirela,

Thanks a lot for your patch/series.

On Mar 05, 2025 at 11:43:57 +0200, Mirela Rabulea wrote:
> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
>=20
> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
> active array size of 2592 x 1944.
>=20
> The following features are supported for OX05B1S:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
>=20
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> Changes in v4:
> 	Switch to Y media bus codes. The CFA pattern control will be implemented=
 when patches get merged, or maybe separatelly as RFC?
> 	Add pixel_rate member to mode struct, remove fps member. We do not have =
information how to calculate the pixel rate from the PLL parameters that ca=
n be made public.
> 	Use register macros for the registers that are documented. User register=
 group macros, where individual registers are not documented
> 	Remove some uneeded local variable initialisations
> 	Fix extra/missing spaces
> 	Add missing ending \n
> 	Use return -ENODEV & return 0 to ease reading
> 	Rename retval to ret in probe for consistency
> 	Use devm_mutex_init instead of mutex_init
> 	Replace more dev_err's with dev_err_probe
> 	Constify more structs
> 	Remove some unneded ending commas after a terminator
> 	Fix smatch error in ox05b1s_s_ctrl: error: typename in expression
> 	Fix a seeries of smatch warnings like: warning: symbol 'ovx5b_init_setti=
ng_2592x1944' was not declared. Should it be static?
> 	Shorten some more lines to 80 columns
>=20
> Changes in v3:
> 	Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_read_reg, o=
x05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)
> 	Don't hardcode timing registers: remove timing registers x_output_size/y=
_output_size from register configuration list, add them to ox05b1s_apply_cu=
rrent_mode
> 	Remove HTS,VTS from register config list as they are written by HBLANK a=
nd VBLANK controls through __v4l2_ctrl_handler_setup
> 	ox05b1s register config cleaning (remove all registers that were at thei=
r default value, and more, keep only what seems mandatory to be able to str=
eam)
> 	Use const for ox05b1s_supported_modes
> 	Device should be silent on success, use dev_dbg.
> 	Drop unneeded {}
> 	Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt for 4k =
BGGR12 mode was stuck)
> 	Fix an issue in ox05b1s_set_fmt, the format was saved in subdev state on=
ly for _TRY, save it also for _ACTIVE
>=20
> Changes in v2:
> 	Use dev_err_probe for missing clock, since it is now required property, =
and use NULL for devm_clk_get (no name for single clock), remove check for =
non NULL sensor->sensor_clk
> 	Remove dev_err message for devm_regmap_init_i2c allocation error
> 	Added spaces inside brackets, wrap lines to 80
> 	Remove some redundant initializations
> 	Add regulators
> 	Make "sizes" a pointer
> 		Use struct v4l2_area instead of u32[2] array
> 		Remove the count for supported_modes[] and supported_codes[], instead u=
se sentinel element at the end
> 		Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame_size, o=
x05b1s_nearest_size, ox05b1s_find_code, to not use the count
> 	Remove .h files for modes, however did not move this code in the driver =
file but added a separate c file for all supported modes
> 	Refactor register lists to allow multiple register arrays per mode
> 	Use GPL-2.0-only instead of GPL-2.0
>=20
>  drivers/media/i2c/Kconfig                 |   1 +
>  drivers/media/i2c/Makefile                |   1 +
>  drivers/media/i2c/ox05b1s/Kconfig         |  10 +
>  drivers/media/i2c/ox05b1s/Makefile        |   2 +
>  drivers/media/i2c/ox05b1s/ox05b1s.h       |  22 +
>  drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 951 ++++++++++++++++++++++
>  drivers/media/i2c/ox05b1s/ox05b1s_modes.c |  77 ++
>  7 files changed, 1064 insertions(+)
>  create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
>  create mode 100644 drivers/media/i2c/ox05b1s/Makefile
>  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
>  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c
>=20
[snip]
> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c=20
> b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> new file mode 100644
> index 000000000000..1026216ddd5b
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> @@ -0,0 +1,951 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
> + * Copyright (C) 2024, NXP
> + *
> + * Inspired from Sony imx219, imx290, imx214 and imx334 camera drivers
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/v4l2-cci.h>
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#include "ox05b1s.h"
> +
> +#define OX05B1S_SENS_PAD_SOURCE	0
> +#define OX05B1S_SENS_PADS_NUM	1
> +
> +#define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
> +#define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)

> +#define OX05B1S_REG_CHIP_ID		CCI_REG24(0x300a)
> +#define OX05B1S_REG_TIMING_HTS		CCI_REG16(0x380c)
> +#define OX05B1S_REG_TIMING_VTS		CCI_REG16(0x380e)
> +#define OX05B1S_REG_EXPOSURE		CCI_REG16(0x3501)
> +#define OX05B1S_REG_GAIN		CCI_REG16(0x3508)

There is a non-trivial overlap of registers between this driver and=20
ov9282.c which supports OV9281/OV9282 (1MP Mono).

There are two other Omnivision sensors, OV2311 (2MP Mono) and OV2312=20
(2MP 4x4 RGB-IR Bayer) with an even larger register overlap with OX05B1S=20
and OS08A20. Unfortunately those two have separate downstream drivers in=20
RPi and TI linux downstream trees respectively, and haven't yet been=20
posted upstream.

It would be ideal to have a single driver for all of these Omnivision=20
sensors, or if not, at least a common C module that can implement the=20
shared functionality like gain, exposure, blanking (vts & hts) in a=20
single place, as this will make maintenance much easier.

My question here to you and the maintainers is, would it be okay to use=20
this driver as a baseline to integrate all these different sensors=20
together? And secondly, would you like to take a look at supporting=20
ov9282, so the other driver can be dropped?

Anyway thanks again for your series, hopefully this will give a good=20
starting point for upstreaming OV2311 and OV2312 soon.

Thanks,
Jai

> +#define OX05B1S_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
> +#define OX05B1S_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
> +

[snip]

>=20

--=20
Thanks,
Jai

--og542hdplnqzogdo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmfapiYACgkQQ96R+SSa
cUXY+Q/9Gz2ROcg8bfqu2U6Kz0KOcA/2RMGQiDEY7YXYYy/9IdbjdogKWHeY2s3s
/5QGB3CnNlCWc1lfyOlJHDyOQZ8qIZ0SoUegfWtH4KbdpM684kjYkvXBFcI56ZRv
k5sy6qsJiuXHPZsQBd3z+Ihpu3TAhPgyyx1SRiFskkQijjMat50PUD1kPMXB645B
nTFiLHO+GmJAyyNP4iSlfVm6e6Cm+ci2KINjU/8HXFm0Q9SsHAYNY5ZW33eh2cri
GSIPFX7UMkn9WcuXf78EA9cHAGaWs6oH3vGo98XRYzwiRtSL57yh62Im27GEdahk
a9fqh/Uvw/eDTa0c1R3a64LakPnnUgOkSEfvkrdf2vwSKbp+gpnbANXd+lqvkDFC
wrAallhdCyFSWzAVvk1fVXgYgi57Gv5MNFEHuMc3yP+NtIla2zjW+KPnzD5TAuzn
DlVosXsx4sPbTsyj4It4uTYAlK5o5/LW6yllkSJH/Zrarks6DBWA6kDL8/61nY0X
lx9gJDYav5Kuicn/G6XnUzclx2D73bTYPYRZ/vXV0Aj8VAtKg1nl1lE0MkWAzWh5
Geeou96XBvqt2RW0bppLepNZd4tNRq1yKlhR5fV71cVe96JaQuLsEG9S3931XtiC
JvBEXJDRmOKzwFIKdHyGwpOKPoEzkPclUEfZjMXMZZJCKVqtx1A=
=G/7m
-----END PGP SIGNATURE-----

--og542hdplnqzogdo--

