Return-Path: <linux-media+bounces-28723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B18A705F3
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6B4D7A1E6D
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0FA253B5C;
	Tue, 25 Mar 2025 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="os+htRFa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36B2E3382;
	Tue, 25 Mar 2025 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918565; cv=none; b=FWlaItW8p5zxLTIcO0+XpkgemRrSOCfvZs8dv22iiCQw2TVgGQnupoWrk6RNdtFFoBpi3JfP7xPVQHrHHV+yHonzv+9ZIAYdIAmoBHyRbvvTBOsiozCyhueOx9bac6HSDPdkK04GLpxdj8ToKoc0AEqlV/QxfuoUZZejqH5MZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918565; c=relaxed/simple;
	bh=svblI899drwouAJLliXU7j5kNLcdRAspJBa9jzt2N/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhSuHcwynys11ofNjGyHIm+0FCdVdTE3jcA7kxbV7JfWXvrK09yYMZdHgCRftTjDK9wAVQP2oXrYn9m2StxOxRzZPz1Zz8qvnJslrvBZ9Kr1c2oQs3BrvTFjuKiWDV2erpRRxifcOtNhCLY2oYwoL9Cuc4CQHtpdanZs9itrOaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=os+htRFa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:904a:b2d:8d57:4705:738e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB4AA353;
	Tue, 25 Mar 2025 17:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742918452;
	bh=svblI899drwouAJLliXU7j5kNLcdRAspJBa9jzt2N/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=os+htRFaaip/nXUcIVJPffdfgCg27lDV0gK/Mme0RD6HITVJvzUStbguTrl7n6FOI
	 Xwfnw87ilHJEmOf6DSURdGJgN9T1I75/aG2Ec8HGedkn5n6TRFBUk3VL96waPcCKm0
	 UN6yUbE/W2tdj8AiqEadZNY9bQjzShRM8AFm05CU=
Date: Tue, 25 Mar 2025 21:32:33 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>, 
	Laurentiu Palcu <laurentiu.palcu@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	LnxRevLi <LnxRevLi@nxp.com>, 
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, 
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>, "mike.rudenko@gmail.com" <mike.rudenko@gmail.com>, 
	"alain.volmat@foss.st.com" <alain.volmat@foss.st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, "umang.jain@ideasonboard.com" <umang.jain@ideasonboard.com>, 
	"zhi.mao@mediatek.com" <zhi.mao@mediatek.com>, "festevam@denx.de" <festevam@denx.de>, 
	Julien Vuillaumier <julien.vuillaumier@nxp.com>, "devarsht@ti.com" <devarsht@ti.com>, 
	"r-donadkar@ti.com" <r-donadkar@ti.com>, Oliver Brown <oliver.brown@nxp.com>
Subject: Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
Message-ID: <pzbbtaltu7wcrsjvjg6n2x33uwm3us4uwpykektc7xlj47s7pz@odqzjc64db2i>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
 <46eescbpdyjr3ljlhyv7fwzxksuln5s57xqgv7nim4yon57im3@22slmk45taf2>
 <6f0168b5-6f79-470e-a8f8-bed8d2495826@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="omz7nozsxwgvuor4"
Content-Disposition: inline
In-Reply-To: <6f0168b5-6f79-470e-a8f8-bed8d2495826@nxp.com>


--omz7nozsxwgvuor4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
MIME-Version: 1.0

On Mar 24, 2025 at 17:32:01 +0200, Mirela Rabulea wrote:
> Hi Jai and all,
>=20
> On Mar 19, 2025 at 16:40:30 +0530, Jai Luthra wrote:
> > Hi Mirela,
> >=20
> > Thanks a lot for your patch/series.
> >=20
> > On Mar 05, 2025 at 11:43:57 +0200, Mirela Rabulea wrote:
> > > Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
> > >=20
> > > The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
> > > active array size of 2592 x 1944.
> > >=20
> > > The following features are supported for OX05B1S:
> > > - Manual exposure an gain control support
> > > - vblank/hblank control support
> > > - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
> > >=20
> > > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > ---
> > > Changes in v4:
> > > 	Switch to Y media bus codes. The CFA pattern control will be impleme=
nted when patches get merged, or maybe separatelly as RFC?
> > > 	Add pixel_rate member to mode struct, remove fps member. We do not h=
ave information how to calculate the pixel rate from the PLL parameters tha=
t can be made public.
> > > 	Use register macros for the registers that are documented. User regi=
ster group macros, where individual registers are not documented
> > > 	Remove some uneeded local variable initialisations
> > > 	Fix extra/missing spaces
> > > 	Add missing ending \n
> > > 	Use return -ENODEV & return 0 to ease reading
> > > 	Rename retval to ret in probe for consistency
> > > 	Use devm_mutex_init instead of mutex_init
> > > 	Replace more dev_err's with dev_err_probe
> > > 	Constify more structs
> > > 	Remove some unneded ending commas after a terminator
> > > 	Fix smatch error in ox05b1s_s_ctrl: error: typename in expression
> > > 	Fix a seeries of smatch warnings like: warning: symbol 'ovx5b_init_s=
etting_2592x1944' was not declared. Should it be static?
> > > 	Shorten some more lines to 80 columns
> > >=20
> > > Changes in v3:
> > > 	Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_read_re=
g, ox05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)
> > > 	Don't hardcode timing registers: remove timing registers x_output_si=
ze/y_output_size from register configuration list, add them to ox05b1s_appl=
y_current_mode
> > > 	Remove HTS,VTS from register config list as they are written by HBLA=
NK and VBLANK controls through __v4l2_ctrl_handler_setup
> > > 	ox05b1s register config cleaning (remove all registers that were at =
their default value, and more, keep only what seems mandatory to be able to=
 stream)
> > > 	Use const for ox05b1s_supported_modes
> > > 	Device should be silent on success, use dev_dbg.
> > > 	Drop unneeded {}
> > > 	Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt for=
 4k BGGR12 mode was stuck)
> > > 	Fix an issue in ox05b1s_set_fmt, the format was saved in subdev stat=
e only for _TRY, save it also for _ACTIVE
> > >=20
> > > Changes in v2:
> > > 	Use dev_err_probe for missing clock, since it is now required proper=
ty, and use NULL for devm_clk_get (no name for single clock), remove check =
for non NULL sensor->sensor_clk
> > > 	Remove dev_err message for devm_regmap_init_i2c allocation error
> > > 	Added spaces inside brackets, wrap lines to 80
> > > 	Remove some redundant initializations
> > > 	Add regulators
> > > 	Make "sizes" a pointer
> > > 		Use struct v4l2_area instead of u32[2] array
> > > 		Remove the count for supported_modes[] and supported_codes[], inste=
ad use sentinel element at the end
> > > 		Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame_siz=
e, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count
> > > 	Remove .h files for modes, however did not move this code in the dri=
ver file but added a separate c file for all supported modes
> > > 	Refactor register lists to allow multiple register arrays per mode
> > > 	Use GPL-2.0-only instead of GPL-2.0
> > >=20
> > >  drivers/media/i2c/Kconfig                 |   1 +
> > >  drivers/media/i2c/Makefile                |   1 +
> > >  drivers/media/i2c/ox05b1s/Kconfig         |  10 +
> > >  drivers/media/i2c/ox05b1s/Makefile        |   2 +
> > >  drivers/media/i2c/ox05b1s/ox05b1s.h       |  22 +
> > >  drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 951 ++++++++++++++++++++=
++
> > >  drivers/media/i2c/ox05b1s/ox05b1s_modes.c |  77 ++
> > >  7 files changed, 1064 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
> > >  create mode 100644 drivers/media/i2c/ox05b1s/Makefile
> > >  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
> > >  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> > >  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c
> > >=20
> > [snip]
> > > diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c=20
> > > b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> > > new file mode 100644
> > > index 000000000000..1026216ddd5b
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> > > @@ -0,0 +1,951 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
> > > + * Copyright (C) 2024, NXP
> > > + *
> > > + * Inspired from Sony imx219, imx290, imx214 and imx334 camera drive=
rs
> > > + *
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <media/v4l2-cci.h>
> > > +#include <media/mipi-csi2.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +
> > > +#include "ox05b1s.h"
> > > +
> > > +#define OX05B1S_SENS_PAD_SOURCE	0
> > > +#define OX05B1S_SENS_PADS_NUM	1
> > > +
> > > +#define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
> > > +#define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)
> >=20
> > > +#define OX05B1S_REG_CHIP_ID		CCI_REG24(0x300a)
> > > +#define OX05B1S_REG_TIMING_HTS		CCI_REG16(0x380c)
> > > +#define OX05B1S_REG_TIMING_VTS		CCI_REG16(0x380e)
> > > +#define OX05B1S_REG_EXPOSURE		CCI_REG16(0x3501)
> > > +#define OX05B1S_REG_GAIN		CCI_REG16(0x3508)
> >=20
> > There is a non-trivial overlap of registers between this driver and=20
> > ov9282.c which supports OV9281/OV9282 (1MP Mono).
> >=20
> > There are two other Omnivision sensors, OV2311 (2MP Mono) and OV2312=20
> > (2MP 4x4 RGB-IR Bayer) with an even larger register overlap with OX05B1=
S=20
> > and OS08A20. Unfortunately those two have separate downstream drivers i=
n=20
> > RPi and TI linux downstream trees respectively, and haven't yet been=20
> > posted upstream.
>
> Thanks for sharing this information, I was unaware. The question of=20
> how much similarity should two sensors share, in order to stay in the=20
> same driver, was also on my mind for some time, and I=E2=80=99d be glad t=
o=20
> hear more opinions on it ;)
>=20

Same here :)

> >=20
> > It would be ideal to have a single driver for all of these Omnivision=
=20
> > sensors, or if not, at least a common C module that can implement the=
=20
> > shared functionality like gain, exposure, blanking (vts & hts) in a=20
> > single place, as this will make maintenance much easier.
>=20
> I would need to get more information on the sensors you mentioned in order
> to issue an informed opinion. So far, with the OX05B1S and OS08A20, I have
> found some small differences regarding exposure and digital gain register=
s,
> so the overlap is not perfect, I expect it will also not be a perfect
> overlap with the other sensors you mentioned.
>=20

Sure, I had some experience with supporting OV2312 and OX05B1S in the=20
downstream TI linux tree, and while they share the registers for=20
exposure and gain, there are some other differences in features, aside=20
=66rom the 2MP vs 5MP resolution.

> >=20
> > My question here to you and the maintainers is, would it be okay to use=
=20
> > this driver as a baseline to integrate all these different sensors=20
> > together? And secondly, would you like to take a look at supporting=20
> > ov9282, so the other driver can be dropped?
> >=20
> For the first question, I don't know what to say, and I cannot tell if=20
> we are far or close for this patch-set to be accepted. Also, I am=20
> unsure about how maintenance would go on a driver claiming to support=20
> a multitude of sensors, who could test them all, whenever something=20
> changes? Are you thinking to add ov2311/12 as other compatibles to=20
> this driver?
>=20

While it would be ideal to have OV2312 support within this driver if=20
there is a significant register overlap, it might still require some=20
effort, as TI's downstream drivers for the RGBIR sensors capture two=20
streams with different exposure, gain and IR flash values, and different=20
MIPI CSI virtual channels, using the group hold functionality. Which=20
IIUC may be quite different from what your patches implement, and will=20
require adding streams/routing support so the userspace can configure.

> I agree there is a great deal of similarity shared across many raw,
> mode-based sensor drivers, and it sounds good to have some common framewo=
rk.
> Some steps were done with the common raw sensor model. I would definitely
> also like to hear more expert opinions on this.
>=20
> For the second question, as of now, we do not have any of the sensors you
> mentioned, unfortunately. I could help in the future to test patches for
> this driver on the sensors that we already have, but cannot make any
> promises for what I do not have, best effort if we find these sensors in a
> form factor that will work for our boards.
>=20

I agree, having a single maintainer would not be feasible given=20
different sensor modules may have incompatible connectors. But yes it=20
should be okay to provide a T-By tag or a Nack on the shared driver if a=20
patch breaks your particular hardware or usecase, similar to how other=20
popular sensor drivers are maintained like IMX219 or OV5640.

> > Anyway thanks again for your series, hopefully this will give a good=20
> > starting point for upstreaming OV2311 and OV2312 soon.
> >=20
> I would like to know more about the OV2312 (RGB-Ir) sensor and if it=20
> has many similarities with OX05B1S.=C2=A0 What hardware are you using to=
=20
> test this sensor? And what interface to connect the sensor? We are=20
> working with MIPI-CSI on most imx boards, and also RPI on imx93.

For OV2312 I have used this FPDLink module [1] with the Arducam V3Link=20
board [2] that connects to the EVM using 22-pin FFC MIPI-CSI connector=20
that is pin-compatible with the RPi5 connector.

[1]: https://leopardimaging.com/wp-content/uploads/2024/03/LI-OV2312-FPDLIN=
KIII_Datasheet.pdf=20
[2]: https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datasheet.p=
df

>=20
> =C2=A0Regards,
>=20
> Mirela

PS: Your mail client broke the quotations on your reply. I have fixed=20
those here, but might be a good idea to double-check your client=20
settings.

--=20
Thanks,
Jai

--omz7nozsxwgvuor4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmfi05kACgkQQ96R+SSa
cUVj2RAAv3N3yhY7ubGrCH3U92Gc4yIxQ+c7XzIjRl3M95OVXMoGA8V7OEkIjEYV
plE9DXndDSbYYba3AFL6ygx6PvbeCkwvjcaan0ogePMfxoaogROKdxjyRRZHkm2F
qbMoHcYupxsRKEKOdSgFhOg/ef5YCtCmRYQ/hrOEX1gsEa3+zldDa9o/AX4s74Vv
LVJ697QmaWVu1aSkkklCGJJt9g4vW6yuw0Hi8JqgWLxoErdIoUoZ+jwFyPC3np+8
6JFxDxdiGFsxZy+fEMlvYjdyTuR+VDtb/Npn+464UosZIz0Zyav/XJcJPNu2l8UE
FRiiiZqLLBgWdFfnVK4a5rGUImUvsNX0cC8WGJVALQ8220szDy9hpBLbQ9GpiNx8
gdjzYXfzW8/etapBPj7e+7kPLaagPXkB51Yf8nMaQ/5zbMPmeve6FCdOjUrDAv4a
pcDj73aN0UBXAoliCX9PvubRmhndfLmFTqL3JESi/FayxI/bHS0tokw/IH5ck/YY
SxeaQWRFdRSw3mYuPkFuWqSqwW3wSI2T8bm+2s4RbtOsK9pWDAkuJ+prBABW4I2v
7OeS6o97BTEAf0fWzRznx1KXg4zy/A0Bc7P4iNEYWrWMOw0vJ4ZR3O4Rg3dWS1+y
BVAB+pDOUaOkVdovODFHqV2lH/vFyX8wUHmcBX2JKPit2YoHavk=
=VYrY
-----END PGP SIGNATURE-----

--omz7nozsxwgvuor4--

