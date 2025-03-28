Return-Path: <linux-media+bounces-28918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28BA7458C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 09:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914E017812C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 08:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A5E213232;
	Fri, 28 Mar 2025 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rclf2AYI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD382F3B;
	Fri, 28 Mar 2025 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151044; cv=none; b=GUOnYWplCHvN1nZE66ve1kvbAY8W+DILSyPE/ZK8htUQ86A2a6YDi62qratur/7reubJbXYDUGHkwhW1vRDJEOhIgDaWEPr42tQ1Udi4QxOy+dYKuNpJudi4sUpFTK5Hd03O0QFFv7DgnbgRD4Wgdr3rY/zyY+0okMWkY0MWrQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151044; c=relaxed/simple;
	bh=ZfSgPMKrEU0/pCq+1I8E2yGss+PnjLKqAr9oTtk8e+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7Bd/QtFfxPNqR3Sy8VsUDhdqyo7wo7iVyVQoRSVw4d7oFhtI8IkUrzZYYHWPpOcL3B3srnsrQvsxEaQc3NfFFU8uC8WZSP5UDrK3D3DROV3XsP9OMTUgsVNI6waeOvU8Y3bmaDyPvYgleWyFdvmYhweSgYPq+DCYv6xq8kxsMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rclf2AYI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2da5:fba3:e0c0:39b5:4b18])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AF3A844;
	Fri, 28 Mar 2025 09:35:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743150929;
	bh=ZfSgPMKrEU0/pCq+1I8E2yGss+PnjLKqAr9oTtk8e+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rclf2AYI9CboG5/3E7/a0mairWSxDca73z18xRWa36kPpMvHLCqvwOC3cXEt1Q2VZ
	 kzpXaa7nQYlKgH6ao4Eq53k6uqJEa8DMcoySX4hShruH1n1GJcEvmkZq+EWF8TPR85
	 5tA3EnhH9/+VPBaXoX3RPvaXBS1Wn2pvganSz9QM=
Date: Fri, 28 Mar 2025 14:07:05 +0530
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
Message-ID: <qzgdjeogowudvtrd5p7heank2puifzsppcovo2bctysfzt7u7t@kakpfjj5mm23>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
 <46eescbpdyjr3ljlhyv7fwzxksuln5s57xqgv7nim4yon57im3@22slmk45taf2>
 <6f0168b5-6f79-470e-a8f8-bed8d2495826@nxp.com>
 <pzbbtaltu7wcrsjvjg6n2x33uwm3us4uwpykektc7xlj47s7pz@odqzjc64db2i>
 <9e4e8d6d-f4f0-4332-a30c-ab0429e1526d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="llyv5kobrekldrxw"
Content-Disposition: inline
In-Reply-To: <9e4e8d6d-f4f0-4332-a30c-ab0429e1526d@nxp.com>


--llyv5kobrekldrxw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
MIME-Version: 1.0

On Mar 26, 2025 at 17:32:55 +0200, Mirela Rabulea wrote:
> Hi Jai,
>=20
> On 25.03.2025 18:02, Jai Luthra wrote:
> > On Mar 24, 2025 at 17:32:01 +0200, Mirela Rabulea wrote:
> > > Hi Jai and all,
> > >=20
> > > On Mar 19, 2025 at 16:40:30 +0530, Jai Luthra wrote:
> > > > Hi Mirela,
> > > >=20
> > > > Thanks a lot for your patch/series.
> > > >=20
> > > > On Mar 05, 2025 at 11:43:57 +0200, Mirela Rabulea wrote:
> > > > > Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sen=
sor.
> > > > >=20
> > > > > The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
> > > > > active array size of 2592 x 1944.
> > > > >=20
> > > > > The following features are supported for OX05B1S:
> > > > > - Manual exposure an gain control support
> > > > > - vblank/hblank control support
> > > > > - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
> > > > >=20
> > > > > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > > > ---
> > > > > Changes in v4:
> > > > > 	Switch to Y media bus codes. The CFA pattern control will be imp=
lemented when patches get merged, or maybe separatelly as RFC?
> > > > > 	Add pixel_rate member to mode struct, remove fps member. We do n=
ot have information how to calculate the pixel rate from the PLL parameters=
 that can be made public.
> > > > > 	Use register macros for the registers that are documented. User =
register group macros, where individual registers are not documented
> > > > > 	Remove some uneeded local variable initialisations
> > > > > 	Fix extra/missing spaces
> > > > > 	Add missing ending \n
> > > > > 	Use return -ENODEV & return 0 to ease reading
> > > > > 	Rename retval to ret in probe for consistency
> > > > > 	Use devm_mutex_init instead of mutex_init
> > > > > 	Replace more dev_err's with dev_err_probe
> > > > > 	Constify more structs
> > > > > 	Remove some unneded ending commas after a terminator
> > > > > 	Fix smatch error in ox05b1s_s_ctrl: error: typename in expression
> > > > > 	Fix a seeries of smatch warnings like: warning: symbol 'ovx5b_in=
it_setting_2592x1944' was not declared. Should it be static?
> > > > > 	Shorten some more lines to 80 columns
> > > > >=20
> > > > > Changes in v3:
> > > > > 	Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_rea=
d_reg, ox05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)
> > > > > 	Don't hardcode timing registers: remove timing registers x_outpu=
t_size/y_output_size from register configuration list, add them to ox05b1s_=
apply_current_mode
> > > > > 	Remove HTS,VTS from register config list as they are written by =
HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
> > > > > 	ox05b1s register config cleaning (remove all registers that were=
 at their default value, and more, keep only what seems mandatory to be abl=
e to stream)
> > > > > 	Use const for ox05b1s_supported_modes
> > > > > 	Device should be silent on success, use dev_dbg.
> > > > > 	Drop unneeded {}
> > > > > 	Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt=
 for 4k BGGR12 mode was stuck)
> > > > > 	Fix an issue in ox05b1s_set_fmt, the format was saved in subdev =
state only for _TRY, save it also for _ACTIVE
> > > > >=20
> > > > > Changes in v2:
> > > > > 	Use dev_err_probe for missing clock, since it is now required pr=
operty, and use NULL for devm_clk_get (no name for single clock), remove ch=
eck for non NULL sensor->sensor_clk
> > > > > 	Remove dev_err message for devm_regmap_init_i2c allocation error
> > > > > 	Added spaces inside brackets, wrap lines to 80
> > > > > 	Remove some redundant initializations
> > > > > 	Add regulators
> > > > > 	Make "sizes" a pointer
> > > > > 		Use struct v4l2_area instead of u32[2] array
> > > > > 		Remove the count for supported_modes[] and supported_codes[], i=
nstead use sentinel element at the end
> > > > > 		Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame=
_size, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count
> > > > > 	Remove .h files for modes, however did not move this code in the=
 driver file but added a separate c file for all supported modes
> > > > > 	Refactor register lists to allow multiple register arrays per mo=
de
> > > > > 	Use GPL-2.0-only instead of GPL-2.0
> > > > >=20
> > > > >   drivers/media/i2c/Kconfig                 |   1 +
> > > > >   drivers/media/i2c/Makefile                |   1 +
> > > > >   drivers/media/i2c/ox05b1s/Kconfig         |  10 +
> > > > >   drivers/media/i2c/ox05b1s/Makefile        |   2 +
> > > > >   drivers/media/i2c/ox05b1s/ox05b1s.h       |  22 +
> > > > >   drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 951 +++++++++++++++=
+++++++
> > > > >   drivers/media/i2c/ox05b1s/ox05b1s_modes.c |  77 ++
> > > > >   7 files changed, 1064 insertions(+)
> > > > >   create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
> > > > >   create mode 100644 drivers/media/i2c/ox05b1s/Makefile
> > > > >   create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
> > > > >   create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> > > > >   create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c
> > > > >=20
> > > > [snip]
> > > > > diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> > > > > b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> > > > > new file mode 100644
> > > > > index 000000000000..1026216ddd5b
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> > > > > @@ -0,0 +1,951 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/*
> > > > > + * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
> > > > > + * Copyright (C) 2024, NXP
> > > > > + *
> > > > > + * Inspired from Sony imx219, imx290, imx214 and imx334 camera d=
rivers
> > > > > + *
> > > > > + */
> > > > > +
> > > > > +#include <linux/clk.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > > +#include <linux/regmap.h>
> > > > > +#include <linux/regulator/consumer.h>
> > > > > +#include <media/v4l2-cci.h>
> > > > > +#include <media/mipi-csi2.h>
> > > > > +#include <media/v4l2-ctrls.h>
> > > > > +#include <media/v4l2-device.h>
> > > > > +#include <media/v4l2-fwnode.h>
> > > > > +
> > > > > +#include "ox05b1s.h"
> > > > > +
> > > > > +#define OX05B1S_SENS_PAD_SOURCE	0
> > > > > +#define OX05B1S_SENS_PADS_NUM	1
> > > > > +
> > > > > +#define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
> > > > > +#define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)
> > > > > +#define OX05B1S_REG_CHIP_ID		CCI_REG24(0x300a)
> > > > > +#define OX05B1S_REG_TIMING_HTS		CCI_REG16(0x380c)
> > > > > +#define OX05B1S_REG_TIMING_VTS		CCI_REG16(0x380e)
> > > > > +#define OX05B1S_REG_EXPOSURE		CCI_REG16(0x3501)
> > > > > +#define OX05B1S_REG_GAIN		CCI_REG16(0x3508)
> > > > There is a non-trivial overlap of registers between this driver and
> > > > ov9282.c which supports OV9281/OV9282 (1MP Mono).
> > > >=20
> > > > There are two other Omnivision sensors, OV2311 (2MP Mono) and OV2312
> > > > (2MP 4x4 RGB-IR Bayer) with an even larger register overlap with OX=
05B1S
> > > > and OS08A20. Unfortunately those two have separate downstream drive=
rs in
> > > > RPi and TI linux downstream trees respectively, and haven't yet been
> > > > posted upstream.
> > > Thanks for sharing this information, I was unaware. The question of
> > > how much similarity should two sensors share, in order to stay in the
> > > same driver, was also on my mind for some time, and I=E2=80=99d be gl=
ad to
> > > hear more opinions on it ;)
> > >=20
> > Same here :)
> >=20
> > > > It would be ideal to have a single driver for all of these Omnivisi=
on
> > > > sensors, or if not, at least a common C module that can implement t=
he
> > > > shared functionality like gain, exposure, blanking (vts & hts) in a
> > > > single place, as this will make maintenance much easier.
> > > I would need to get more information on the sensors you mentioned in =
order
> > > to issue an informed opinion. So far, with the OX05B1S and OS08A20, I=
 have
> > > found some small differences regarding exposure and digital gain regi=
sters,
> > > so the overlap is not perfect, I expect it will also not be a perfect
> > > overlap with the other sensors you mentioned.
> > >=20
> > Sure, I had some experience with supporting OV2312 and OX05B1S in the
> > downstream TI linux tree, and while they share the registers for
> > exposure and gain, there are some other differences in features, aside
> > from the 2MP vs 5MP resolution.
> >=20
> > > > My question here to you and the maintainers is, would it be okay to=
 use
> > > > this driver as a baseline to integrate all these different sensors
> > > > together? And secondly, would you like to take a look at supporting
> > > > ov9282, so the other driver can be dropped?
> > > >=20
> > > For the first question, I don't know what to say, and I cannot tell if
> > > we are far or close for this patch-set to be accepted. Also, I am
> > > unsure about how maintenance would go on a driver claiming to support
> > > a multitude of sensors, who could test them all, whenever something
> > > changes? Are you thinking to add ov2311/12 as other compatibles to
> > > this driver?
> > >=20
> > While it would be ideal to have OV2312 support within this driver if
> > there is a significant register overlap, it might still require some
> > effort, as TI's downstream drivers for the RGBIR sensors capture two
> > streams with different exposure, gain and IR flash values, and different
> > MIPI CSI virtual channels, using the group hold functionality. Which
> > IIUC may be quite different from what your patches implement, and will
> > require adding streams/routing support so the userspace can configure.
>=20
> You are not alone on this ;)
>=20
> We have an internal solution for adding streams/routing support to this
> driver, we used it both for ox05b1s (AB mode with 2 pixel streams on
> separate virtual channels) and for os08a20 (staggered hdr mode with 2 pix=
el
> streams on separate virtual channels), and also a separate stream for
> embedded data (same VC but a different mipi data type). I did not post th=
ese
> patches because of 2 reasons:

Ah that's good to know that you also use AB mode, as combining the=20
drivers makes even more sense now.

>=20
> 1. We are waiting for internal pads to be accepted, and possibly the comm=
on
> raw sensor model

I wasn't aware of the raw sensor model series, will read up more on that=20
as that also seems to have an easier way to represent RGB-Ir bayer=20
formats.

>=20
> 2. There are issues with the individual control (exposure, analog and
> digital gain) per exposure/context, with the current available standard
> controls. This is an entire topic on its own, maybe I should start a
> separate discussion thread on that.
>=20

Yes individual controls, be it for internal pads or per-stream, will be=20
a requirement for multi-stream sensor drivers. I have proposed a topic=20
to discuss this with the rest of the community at the Media Summit being=20
held on May 13 in Nice. [1]

Do you have plans to attend the summit? In any case, please feel free to=20
start a RFC discussion thread on it :)

One idea is to move the controls in the v4l2_subdev_state, which would=20
make it easier to specify pad/stream combinations, but I am not yet sure=20
on what the userspace ioctls will look like for that.

[1] https://lore.kernel.org/linux-media/sbhsskq7kzrl5bkbqbijxszz7hfg34pjajg=
dmw23x7aseztyy3@26zcjwnjkpl4/

> >=20
> > > I agree there is a great deal of similarity shared across many raw,
> > > mode-based sensor drivers, and it sounds good to have some common fra=
mework.
> > > Some steps were done with the common raw sensor model. I would defini=
tely
> > > also like to hear more expert opinions on this.
> > >=20
> > > For the second question, as of now, we do not have any of the sensors=
 you
> > > mentioned, unfortunately. I could help in the future to test patches =
for
> > > this driver on the sensors that we already have, but cannot make any
> > > promises for what I do not have, best effort if we find these sensors=
 in a
> > > form factor that will work for our boards.
> > >=20
> > I agree, having a single maintainer would not be feasible given
> > different sensor modules may have incompatible connectors. But yes it
> > should be okay to provide a T-By tag or a Nack on the shared driver if a
> > patch breaks your particular hardware or usecase, similar to how other
> > popular sensor drivers are maintained like IMX219 or OV5640.
> Sounds ok to me, we cannot guarantee to test the other sensors, but having
> T-by tag from other users will hopefully cover it.
> >=20

Thanks.

> > > > Anyway thanks again for your series, hopefully this will give a good
> > > > starting point for upstreaming OV2311 and OV2312 soon.
> > > >=20
> > > I would like to know more about the OV2312 (RGB-Ir) sensor and if it
> > > has many similarities with OX05B1S.=C2=A0 What hardware are you using=
 to
> > > test this sensor? And what interface to connect the sensor? We are
> > > working with MIPI-CSI on most imx boards, and also RPI on imx93.
> > For OV2312 I have used this FPDLink module [1] with the Arducam V3Link
> > board [2] that connects to the EVM using 22-pin FFC MIPI-CSI connector
> > that is pin-compatible with the RPi5 connector.
> >=20
> > [1]: https://leopardimaging.com/wp-content/uploads/2024/03/LI-OV2312-FP=
DLINKIII_Datasheet.pdf
> > [2]: https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datashe=
et.pdf
> Thanks, we don't have any ser/des involved in the ox05b1s/os08a20 case, if
> we will ever get into the position to try ov2312, probably we will look f=
or
> some solution for imx95-15x15 board, on the RPi connector (22-pin), cannot
> tell if it will work, one can never tell what may go wrong.
> >=20

Makes sense.

> > >  =C2=A0Regards,
> > >=20
> > > Mirela
> > PS: Your mail client broke the quotations on your reply. I have fixed
> > those here, but might be a good idea to double-check your client
> > settings.
>=20
> Sorry about that, I may have edited the draft from both Thunderbird and
> Outlook. Hope this will be ok, sending from Thunderbird now as plain text
> only.
>=20

No problem, this mail looks okay.

> Regards,
>=20
> Mirela
>=20

Thanks,
Jai

--llyv5kobrekldrxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmfmX7AACgkQQ96R+SSa
cUV1cRAAoOw8BZ0DwCEjINijMffzPZX7wEz6d5zoYTFcqd7OzqzUWJwpcTbXqa0N
iBxJ8JjLMjnOT6UTyI+pCXjOMITgCvszJqrFeajHYQPa1THp80gi02YoLkGy0sXk
q2NLNopeVuxfDg0OguaBpGWMOKWB0jT23ukoLw0etSm60/kDxe8O+71dW9n+8ssW
fgyVMoKbPYLtSEGFG/04guA1C0VjdI2A37uSn1FHGgmG3m833n64mHBAvtDndPlo
5OpiREzYjG2oaBxAa5M4C6i5TZ6lQGhvh20C7ssXbUDSyg4ipRF5UKYGtX5y/nhI
TYaoa6wJNjxqJlg2C2guO9D0cVWJjyO4t9aZyu8EBxH4rnaWcGQPdW5u7k1VVcBN
xbzPdYPjP78p1dluqsUYLjgC2KzRmqSlChxQ2Xc2Dl0Vo5mvqFyiJ3KYWfc+iuhD
5iKZgDS7F9wXpIAzbK2gB2NRbaUYhzqIq3q3/Q8StH7ergz1A8EutGFhQ8BjRG+V
UVpQo5fZh8ueyCLE0SvITufaGS1Nuh4nFVHib7W7GrWAYdBO4GS4A/TIfvqjKhV2
yjWcIwkx0sSJ6iV+iO2MXm47N2uqao/cNgKma9BCK+JZ8+E8fR0D+h9RylJ5UmmW
VLocced+I0bJu4qzIDLv/p3Bax+LT9K7+m5WfBcNAiQp7umgfsY=
=wdPZ
-----END PGP SIGNATURE-----

--llyv5kobrekldrxw--

