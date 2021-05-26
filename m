Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFC13918CE
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 15:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbhEZN37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 09:29:59 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:59713 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbhEZN37 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 09:29:59 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 45D4B1BF215;
        Wed, 26 May 2021 13:28:21 +0000 (UTC)
Date:   Wed, 26 May 2021 15:28:20 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v5 00/16] Allwinner MIPI CSI-2 support for A31/V3s/A83T
Message-ID: <YK5M9PyUB4IfuaNU@aptenodytes>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
 <f92c0812-7e1c-74e4-602b-7a885ef31454@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YrICaRvc7abbpPS2"
Content-Disposition: inline
In-Reply-To: <f92c0812-7e1c-74e4-602b-7a885ef31454@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--YrICaRvc7abbpPS2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 26 May 21, 14:00, Hans Verkuil wrote:
> Hi Paul,
>=20
> On 15/01/2021 21:01, Paul Kocialkowski wrote:
> > This series introduces support for MIPI CSI-2, with the A31 controller =
that is
> > found on most SoCs (A31, V3s and probably V5) as well as the A83T-speci=
fic
> > controller. While the former uses the same MIPI D-PHY that is already s=
upported
> > for DSI, the latter embeds its own D-PHY.
> >=20
> > In order to distinguish the use of the D-PHY between Rx mode (for MIPI =
CSI-2)
> > and Tx mode (for MIPI DSI), a submode is introduced for D-PHY in the PH=
Y API.
> > This allows adding Rx support in the A31 D-PHY driver.
> >=20
> > A few changes and fixes are applied to the A31 CSI controller driver, i=
n order
> > to support the MIPI CSI-2 use-case.
>=20
> Besides the compile error for patch 2/16, I also get several other compil=
e errors:
>=20
> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c: In function =E2=80=98=
sun6i_csi_v4l2_fwnode_init=E2=80=99:
> ./include/media/v4l2-async.h:207:10: error: expected expression before =
=E2=80=98)=E2=80=99 token
>   207 |  ((type *)       \
>       |          ^
> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:790:8: note: in expans=
ion of macro =E2=80=98v4l2_async_notifier_add_fwnode_remote_subdev=E2=80=99
>   790 |  ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notif=
ier,
>       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/media/v4l2-async.h:207:10: error: expected expression before =
=E2=80=98)=E2=80=99 token
>   207 |  ((type *)       \
>       |          ^
> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:811:8: note: in expans=
ion of macro =E2=80=98v4l2_async_notifier_add_fwnode_remote_subdev=E2=80=99
>   811 |  ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notif=
ier,
>       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:272: drivers/media/platform/sunxi/su=
n6i-csi/sun6i_csi.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[4]: *** [scripts/Makefile.build:272: drivers/media/platform/rockchip=
/rkisp1/rkisp1-isp.o] Error 1
> make[3]: *** [scripts/Makefile.build:515: drivers/media/platform/rockchip=
/rkisp1] Error 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from ./include/media/v4l2-subdev.h:14,
>                  from ./include/media/v4l2-device.h:13,
>                  from drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/s=
un8i_a83t_mipi_csi2.c:19:
> drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:=
 In function =E2=80=98sun8i_a83t_mipi_csi2_v4l2_setup=E2=80=99:
> ./include/media/v4l2-async.h:207:10: error: expected expression before =
=E2=80=98)=E2=80=99 token
>   207 |  ((type *)       \
>       |          ^
> drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:=
495:8: note: in expansion of macro
> =E2=80=98v4l2_async_notifier_add_fwnode_remote_subdev=E2=80=99
>   495 |  ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(notifier, h=
andle,
>       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from ./include/media/v4l2-subdev.h:14,
>                  from ./include/media/v4l2-device.h:13,
>                  from drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_=
mipi_csi2.c:18:
> drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c: In functi=
on =E2=80=98sun6i_mipi_csi2_v4l2_setup=E2=80=99:
> ./include/media/v4l2-async.h:207:10: error: expected expression before =
=E2=80=98)=E2=80=99 token
>   207 |  ((type *)       \
>       |          ^
> drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:437:8: not=
e: in expansion of macro =E2=80=98v4l2_async_notifier_add_fwnode_remote_sub=
dev=E2=80=99
>   437 |  ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(notifier, h=
andle,
>       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Can you rebase this series?

Thanks for letting me know, I'll look into this for the next iteration.

> I also need Acked-by's for patches 1-3 from one of the PHY maintainers, b=
ut as
> you mentioned this might need to change as well.
>=20
> Was there a reason why I haven't looked at this before? It's quite an old=
 series,
> usually I don't wait for so long. If it was because I was really slow, th=
en I
> apologize and please kick me sooner if you see a review like this take so=
 long.

I'm not sure, but Sakari definitely went over previous interations and made
various comments,so the series definitely hasn't gone unreviewed!

To be honest I also lost momentum on this but I'll be trying to finalize the
series soon, once the discussion on rx/tx handling has concluded.

Cheers,

Paul

>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> > Changes since v4:
> > - Added patch to stop using v4l2_async_notifier_parse_fwnode_endpoints;
> > - Fixed checkpatch strict issues (parenthesis alignment);
> > - Fixed runtime PM call order and disable;
> > - Fixed fwnode_handle_put order;
> > - Brought back phy-names for A31 since it's mandatory according to the =
generic
> >   PHY binding and needed by the code;
> > - Added collected tags.
> >=20
> > Changes since v3:
> > - Fixed single-item phys description in sun6i mipi csi-2 binding;
> > - Fixed variables names in macros using container_of;
> > - Fixed style issue with operators at the end of lines;
> > - Reworked source endpoint/subdev assignment in sun6i-csi to handle
> >   link_validate error case;
> > - Removed unrelated dt change in sun8i-a83t mipi csi-2 driver;
> > - Added collected tags.
> >=20
> > Changes since v2:
> > - added Kconfig depend on PM since it's not optional;
> > - removed phy-names for A31 MIPI CSI-2 controller;
> > - removed v3s compatible in the A31 MIPI CSI-2 controller driver;
> > - removed A31 CSI controller single-port binding deprecation;
> > - removed empty dt port definitions;
> > - fixed minor checkpatch warnings;
> > - added collected tags;
> > - added media-ctl output in cover letter.
> >=20
> > Changes since v1:
> > - reworked fwnode and media graph on the CSI controller end to have one=
 port
> >   per interface, which solves the bus type representation issue;
> > - removed unused IRQ handlers in the MIPI CSI-2 bridges;
> > - avoided the use of devm_regmap_init_mmio_clk;
> > - deasserted reset before enabling clocks;
> > - fixed reported return code issues (ret |=3D, missing checks);
> > - applied requested cosmetic changes (backward goto, etc);
> > - switched over to runtime PM for the mipi csi-2 bridge drivers;
> > - selected PHY_SUN6I_MIPI_DPHY in Kconfig for sun6i-mipi-csi2;
> > - registered nodes with mipi csi-2 bridge subdevs;
> > - used V4L2 format info instead of switch/case for sun6i-csi bpp;
> > - fixed device-tree bindings as requested (useless properties, license);
> > - fixed mipi bridge dt instances names;
> > - added PHY API documentation about mode/power on order requirement;
> > - fixed clock error return code in d-phy code;
> > - fixed D-PHY mode check in d-phy code;
> > - added MAINTAINERS entries for the new drivers;
> > - added V4L2 compliance results;
> > - added various comments and rework commit mesages as requested.
> >=20
> > Media ctl outputs for the testing setups are available below:
> >=20
> > # sun6i-csi + sun6i-mipi-csi2 + ov5648
> >=20
> > Media device information
> > ------------------------
> > driver          sun6i-csi
> > model           Allwinner Video Capture Device
> > serial         =20
> > bus info        platform:1cb0000.camera
> > hw revision     0x0
> > driver version  5.10.0
> >=20
> > Device topology
> > - entity 1: sun6i-csi (2 pads, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> > 	pad0: Sink
> > 	pad1: Sink
> > 		<- "sun6i-mipi-csi2":1 [ENABLED]
> >=20
> > - entity 6: sun6i-mipi-csi2 (2 pads, 2 links)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> > 	pad0: Sink
> > 		[fmt:unknown/0x0]
> > 		<- "ov5648 0-0036":0 [ENABLED,IMMUTABLE]
> > 	pad1: Source
> > 		[fmt:unknown/0x0]
> > 		-> "sun6i-csi":1 [ENABLED]
> >=20
> > - entity 9: ov5648 0-0036 (1 pad, 1 link)
> >             type V4L2 subdev subtype Sensor flags 0
> >             device node name /dev/v4l-subdev1
> > 	pad0: Source
> > 		[fmt:SBGGR8_1X8/2592x1944@1/15 field:none colorspace:raw xfer:none yc=
bcr:601 quantization:full-range]
> > 		-> "sun6i-mipi-csi2":0 [ENABLED,IMMUTABLE]
> >=20
> > # sun6i-csi + sun8i-a83t-mipi-csi2 + ov8865
> >=20
> > Media device information
> > ------------------------
> > driver          sun6i-csi
> > model           Allwinner Video Capture Device
> > serial         =20
> > bus info        platform:1cb0000.camera
> > hw revision     0x0
> > driver version  5.10.0
> >=20
> > Device topology
> > - entity 1: sun6i-csi (2 pads, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> > 	pad0: Sink
> > 	pad1: Sink
> > 		<- "sun8i-a83t-mipi-csi2":1 [ENABLED]
> >=20
> > - entity 6: sun8i-a83t-mipi-csi2 (2 pads, 2 links)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> > 	pad0: Sink
> > 		[fmt:unknown/0x0]
> > 		<- "ov8865 1-0036":0 [ENABLED,IMMUTABLE]
> > 	pad1: Source
> > 		[fmt:unknown/0x0]
> > 		-> "sun6i-csi":1 [ENABLED]
> >=20
> > - entity 9: ov8865 1-0036 (1 pad, 1 link)
> >             type V4L2 subdev subtype Sensor flags 0
> >             device node name /dev/v4l-subdev1
> > 	pad0: Source
> > 		[fmt:SBGGR10_1X10/3264x2448@1/30 field:none colorspace:raw xfer:none =
ycbcr:601 quantization:full-range]
> > 		-> "sun8i-a83t-mipi-csi2":0 [ENABLED,IMMUTABLE]
> >=20
> > V4L2 compliance runs are available below:
> >=20
> > # sun6i-csi + sun6i-mipi-csi2 + ov5648
> >=20
> > v4l2-compliance SHA: not available, 32 bits
> >=20
> > Compliance test for sun6i-video device /dev/video0:
> >=20
> > Driver Info:
> > 	Driver name      : sun6i-video
> > 	Card type        : sun6i-csi
> > 	Bus info         : platform:camera
> > 	Driver version   : 5.10.0
> > 	Capabilities     : 0x84200001
> > 		Video Capture
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x04200001
> > 		Video Capture
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : sun6i-csi
> > 	Model            : Allwinner Video Capture Device
> > 	Serial           :=20
> > 	Bus info         : platform:1cb0000.camera
> > 	Media version    : 5.10.0
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 5.10.0
> > Interface Info:
> > 	ID               : 0x03000004
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x00000001 (1)
> > 	Name             : sun6i-csi
> > 	Function         : V4L2 I/O
> > 	Pad 0x01000002   : 0: Sink
> > 	Pad 0x01000003   : 1: Sink
> > 	  Link 0x0200000d: from remote pad 0x1000008 of entity 'sun6i-mipi-csi=
2': Data, Enabled
> >=20
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb0000.came=
ra' differs from V4L2 bus_info 'platform:camera'
> > 	test VIDIOC_QUERYCAP: OK
> >=20
> > Allow for multiple opens:
> > 	test second /dev/video0 open: OK
> > 		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb0000.came=
ra' differs from V4L2 bus_info 'platform:camera'
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> >=20
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK
> >=20
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> >=20
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> >=20
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> >=20
> > Control ioctls (Input 0):
> > 		warn: v4l2-test-controls.cpp(92): Exposure: (max - min) % step !=3D 0
> > 		warn: v4l2-test-controls.cpp(92): Gain: (max - min) % step !=3D 0
> > 		warn: v4l2-test-controls.cpp(92): Exposure: (max - min) % step !=3D 0
> > 		warn: v4l2-test-controls.cpp(92): Gain: (max - min) % step !=3D 0
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > 	test VIDIOC_QUERYCTRL: OK
> > 		warn: v4l2-test-controls.cpp(368): Gain: returned control value 44 no=
t a multiple of step
> > 		warn: v4l2-test-controls.cpp(368): Gain: returned control value 44 no=
t a multiple of step
> > 		warn: v4l2-test-controls.cpp(368): Gain: returned control value 44 no=
t a multiple of step
> > 		warn: v4l2-test-controls.cpp(368): Gain: returned control value 44 no=
t a multiple of step
> > 	test VIDIOC_G/S_CTRL: OK
> > 		warn: v4l2-test-controls.cpp(555): Gain: returned control value 44 no=
t a multiple of step
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 15 Private Controls: 0
> >=20
> > Format ioctls (Input 0):
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK
> >=20
> > Codec ioctls (Input 0):
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >=20
> > Buffer ioctls (Input 0):
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 		fail: v4l2-test-buffers.cpp(755): q.export_bufs(node, q.g_type())
> > 	test VIDIOC_EXPBUF: FAIL
> > 	test Requests: OK (Not Supported)
> >=20
> > Total for sun6i-video device /dev/video0: 45, Succeeded: 44, Failed: 1,=
 Warnings: 1
> >=20
> > # sun6i-csi + sun8i-a83t-mipi-csi2 + ov8865
> >=20
> > v4l2-compliance SHA: not available, 32 bits
> >=20
> > Compliance test for sun6i-video device /dev/video0:
> >=20
> > Driver Info:
> > 	Driver name      : sun6i-video
> > 	Card type        : sun6i-csi
> > 	Bus info         : platform:camera
> > 	Driver version   : 5.10.0
> > 	Capabilities     : 0x84200001
> > 		Video Capture
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x04200001
> > 		Video Capture
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : sun6i-csi
> > 	Model            : Allwinner Video Capture Device
> > 	Serial           :=20
> > 	Bus info         : platform:1cb0000.camera
> > 	Media version    : 5.10.0
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 5.10.0
> > Interface Info:
> > 	ID               : 0x03000004
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x00000001 (1)
> > 	Name             : sun6i-csi
> > 	Function         : V4L2 I/O
> > 	Pad 0x01000002   : 0: Sink
> > 	Pad 0x01000003   : 1: Sink
> > 	  Link 0x0200000d: from remote pad 0x1000008 of entity 'sun8i-a83t-mip=
i-csi2': Data, Enabled
> >=20
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb0000.came=
ra' differs from V4L2 bus_info 'platform:camera'
> > 	test VIDIOC_QUERYCAP: OK
> >=20
> > Allow for multiple opens:
> > 	test second /dev/video0 open: OK
> > 		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb0000.came=
ra' differs from V4L2 bus_info 'platform:camera'
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> >=20
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK
> >=20
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> >=20
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> >=20
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> >=20
> > Control ioctls (Input 0):
> > 		warn: v4l2-test-controls.cpp(92): Exposure: (max - min) % step !=3D 0
> > 		warn: v4l2-test-controls.cpp(92): Gain: (max - min) % step !=3D 0
> > 		warn: v4l2-test-controls.cpp(92): Exposure: (max - min) % step !=3D 0
> > 		warn: v4l2-test-controls.cpp(92): Gain: (max - min) % step !=3D 0
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > 	test VIDIOC_QUERYCTRL: OK
> > 	test VIDIOC_G/S_CTRL: OK
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 11 Private Controls: 0
> >=20
> > Format ioctls (Input 0):
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK
> >=20
> > Codec ioctls (Input 0):
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >=20
> > Buffer ioctls (Input 0):
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK (Not Supported)
> >=20
> > Total for sun6i-video device /dev/video0: 45, Succeeded: 45, Failed: 0,=
 Warnings: 6
> >=20
> > Paul Kocialkowski (16):
> >   docs: phy: Add a part about PHY mode and submode
> >   phy: Distinguish between Rx and Tx for MIPI D-PHY with submodes
> >   phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY Rx mode for MIPI
> >     CSI-2
> >   media: sun6i-csi: Stop using the deprecated fwnode endpoint parser
> >   media: sun6i-csi: Use common V4L2 format info for storage bpp
> >   media: sun6i-csi: Only configure the interface data width for parallel
> >   dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2 input port
> >   media: sun6i-csi: Add support for MIPI CSI-2 bridge input
> >   dt-bindings: media: Add A31 MIPI CSI-2 bindings documentation
> >   media: sunxi: Add support for the A31 MIPI CSI-2 controller
> >   ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
> >   MAINTAINERS: Add entry for the Allwinner A31 MIPI CSI-2 bridge
> >   dt-bindings: media: Add A83T MIPI CSI-2 bindings documentation
> >   media: sunxi: Add support for the A83T MIPI CSI-2 controller
> >   ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
> >   MAINTAINERS: Add entry for the Allwinner A83T MIPI CSI-2 bridge
> >=20
> >  .../media/allwinner,sun6i-a31-csi.yaml        |  88 ++-
> >  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 156 ++++
> >  .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 147 ++++
> >  Documentation/driver-api/phy/phy.rst          |  18 +
> >  MAINTAINERS                                   |  16 +
> >  arch/arm/boot/dts/sun8i-a83t.dtsi             |  26 +
> >  arch/arm/boot/dts/sun8i-v3s.dtsi              |  68 ++
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     |   3 +-
> >  drivers/media/platform/sunxi/Kconfig          |   2 +
> >  drivers/media/platform/sunxi/Makefile         |   2 +
> >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 218 ++++--
> >  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  65 +-
> >  .../platform/sunxi/sun6i-csi/sun6i_video.c    |  57 +-
> >  .../platform/sunxi/sun6i-csi/sun6i_video.h    |   7 +-
> >  .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  12 +
> >  .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 600 ++++++++++++++++
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 117 +++
> >  .../sunxi/sun8i-a83t-mipi-csi2/Kconfig        |  11 +
> >  .../sunxi/sun8i-a83t-mipi-csi2/Makefile       |   4 +
> >  .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |  92 +++
> >  .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h    |  39 +
> >  .../sun8i_a83t_mipi_csi2.c                    | 666 ++++++++++++++++++
> >  .../sun8i_a83t_mipi_csi2.h                    | 197 ++++++
> >  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 164 ++++-
> >  include/linux/phy/phy-mipi-dphy.h             |  13 +
> >  26 files changed, 2651 insertions(+), 141 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,s=
un6i-a31-mipi-csi2.yaml
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,s=
un8i-a83t-mipi-csi2.yaml
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefi=
le
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_=
mipi_csi2.c
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_=
mipi_csi2.h
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/K=
config
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/M=
akefile
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/s=
un8i_a83t_dphy.c
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/s=
un8i_a83t_dphy.h
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/s=
un8i_a83t_mipi_csi2.c
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/s=
un8i_a83t_mipi_csi2.h
> >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--YrICaRvc7abbpPS2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmCuTPQACgkQ3cLmz3+f
v9HsWgf7B62DAQdaujPweOtLXSl13w29sqsm+pjqZju6zr+BZ8buA9OGMLA2Xa6/
m7R4HaIBpBlRsTgn5cPm0/QH+jX8PXMMIc7dWqu+4v4oYvYjjFMRHhkIgRUrvegN
i2SgWIrMWVnM9oEkOz3glZy0hGDb8bBwxblslSdNceaDg+P0Sj1JvOQvKFV99LvP
LsoPFtSrw0zFuYx6MSnA2hTi0GLn5MTFMU01wgKwf8Fv++6KV4CM7USGYFUY+pkl
8XSnkR1a4G+IlqlJLDEPTyVRglhZR9mVQAFkkCd6via1I5RFRSz9klpUhVKy6sgW
hVLv+l3VWTAIkMGZy842Nx7OBYzRcQ==
=TZGF
-----END PGP SIGNATURE-----

--YrICaRvc7abbpPS2--
