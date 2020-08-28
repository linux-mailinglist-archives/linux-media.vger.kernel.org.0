Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C76255C0A
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 16:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgH1OMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 10:12:16 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:36013 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgH1OML (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 10:12:11 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 186C7240007;
        Fri, 28 Aug 2020 14:12:03 +0000 (UTC)
Date:   Fri, 28 Aug 2020 16:12:03 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mripard@kernel.org, wens@csie.org,
        yong.deng@magewell.com, mchehab+samsung@kernel.org,
        p.zabel@pengutronix.de, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 0/4] Support of MIPI CSI-2 for A83T
Message-ID: <20200828141203.GC6858@aptenodytes>
References: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/dFl7e5Y0zcWrcPL"
Content-Disposition: inline
In-Reply-To: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--/dFl7e5Y0zcWrcPL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

On Fri 28 Aug 20, 15:17, K=C3=A9vin L'h=C3=B4pital wrote:
> This series adds the support for the MIPI CSI-2 controller for the A83T S=
oC.
> The CSI controller is the same as the V3s SoC that's why I put the A83T
> MIPI CSI-2 driver in sun6i-csi.
> My work is based on the Allwinner BSP for A83T and also on MIPI CSI-2
> specification for the A83T given by Allwinner.

To give a bit of context here, Kevin is our intern who worked on MIPI CSI-2
support on the A83t this summer. As we were approaching the end of the
internship, we wanted to publish the current state of the work as a working
reference and base for mainline support.

However, we are well aware that there are significant design issues in this
series, such as:
- not supporting the fwnode graph;
- not working with the DPHY API;
- adding MIPI CSI-2 support under the same dt compatible as parallel CSI;

and probably other things.

Bootlin is currently working on V3s MIPI CSI-2 support and we intend to res=
pin
this series when submitting V3s MIPI CSI-2 support, with fixes to these des=
ign
issues.

So we hope you keep this in mind when reviewing the series, which is not me=
ant
to be merged in its current state.

Thanks!

Paul

> v4l2-compliance SHA: not available, 32 bits                              =
                                              =20
>                                                                          =
                                              =20
> Compliance test for sun6i-video device /dev/video0:                      =
                                              =20
>                                                                          =
                                              =20
> Driver Info:                                                             =
                                              =20
>         Driver name      : sun6i-video                                   =
                                              =20
>         Card type        : sun6i-csi                                     =
                                              =20
>         Bus info         : platform:camera                               =
                                              =20
>         Driver version   : 5.5.0                                         =
                                              =20
>         Capabilities     : 0x84200001                                    =
                                              =20
>                 Video Capture                                            =
                                              =20
>                 Streaming                                                =
                                              =20
>                 Extended Pix Format                                      =
                                              =20
>                 Device Capabilities                                      =
                                              =20
>         Device Caps      : 0x04200001                                    =
                                              =20
>                 Video Capture                                            =
                                              =20
>                 Streaming                                                =
                                              =20
>                 Extended Pix Format                                      =
                                              =20
> Media Driver Info:                                                       =
                                              =20
>         Driver name      : sun6i-csi                                     =
                                              =20
>         Model            : Allwinner Video Capture Device                =
                                              =20
>         Serial           :                                               =
                                              =20
>         Bus info         :                                               =
                                              =20
>         Media version    : 5.5.0                                         =
                                              =20
>         Hardware revision: 0x00000000 (0)                                =
                                              =20
>         Driver version   : 5.5.0                                         =
                                              =20
> Interface Info:                                                          =
                                              =20
>         ID               : 0x03000003                                    =
                                              =20
>         Type             : V4L Video                                     =
                                              =20
> Entity Info:                                                             =
                                              =20
>         ID               : 0x00000001 (1)                                =
                                              =20
>         Name             : sun6i-csi                                     =
                                              =20
>         Function         : V4L2 I/O                                      =
                                              =20
>         Pad 0x01000002   : 0: Sink, Must Connect                         =
                                              =20
>           Link 0x02000007: from remote pad 0x1000006 of entity 'ov8865 1-=
0036': Data, Enabled, Immutable               =20
>                                                                          =
                                              =20
> Required ioctls:                                                         =
                                              =20
>         test MC information (see 'Media Driver Info' above): OK          =
                                              =20
>         test VIDIOC_QUERYCAP: OK                                         =
                                              =20
>                                                                          =
                                              =20
> Allow for multiple opens:                                                =
                                              =20
>         test second /dev/video0 open: OK                                 =
                                              =20
>         test VIDIOC_QUERYCAP: OK                                         =
                                              =20
>         test VIDIOC_G/S_PRIORITY: OK                                     =
                                              =20
>         test for unlimited opens: OK                                     =
                                              =20
>                                                                          =
                                              =20
> Debug ioctls:                                                            =
                                              =20
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                 =
                                              =20
>         test VIDIOC_LOG_STATUS: OK                                       =
                                              =20
>                                                                          =
                                              =20
> Input ioctls:                                                            =
                                              =20
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)        =
                                              =20
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)                    =
                                              =20
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)                   =
                                              =20
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)                        =
                                              =20
>         test VIDIOC_G/S/ENUMINPUT: OK                                    =
                                              =20
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)                        =
                                              =20
>         Inputs: 1 Audio Inputs: 0 Tuners: 0                              =
                                              =20
>                                                                          =
                                              =20
> Output ioctls:                                                           =
                                              =20
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)                    =
                                              =20
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)                    =
                                              =20
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)                       =
                                              =20
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)                   =
                                              =20
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)                       =
                                              =20
>         Outputs: 0 Audio Outputs: 0 Modulators: 0                        =
                                              =20
>                                                                          =
                                              =20
> Input/Output configuration ioctls:                                       =
                                              =20
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)               =
                                              =20
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)        =
                                              =20
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)                   =
                                              =20
>         test VIDIOC_G/S_EDID: OK (Not Supported)                         =
                                              =20
>                                                                          =
                                              =20
> Control ioctls (Input 0):                                                =
                                              =20
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK                         =
                                              =20
>         test VIDIOC_QUERYCTRL: OK                                        =
                                              =20
>         test VIDIOC_G/S_CTRL: OK                                         =
                                              =20
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK                                =
                                              =20
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK                      =
                                              =20
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)                     =
                                              =20
>         Standard Controls: 7 Private Controls: 0                         =
                                              =20
>                                                                          =
                                              =20
> Format ioctls (Input 0):                                                 =
                                              =20
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK               =
                                              =20
>         test VIDIOC_G/S_PARM: OK (Not Supported)                         =
                                              =20
>         test VIDIOC_G_FBUF: OK (Not Supported)                           =
                                              =20
>         test VIDIOC_G_FMT: OK                                            =
                                              =20
>         test VIDIOC_TRY_FMT: OK                                          =
                                              =20
>         test VIDIOC_S_FMT: OK                                            =
                                              =20
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)                 =
                                              =20
>         test Cropping: OK (Not Supported)                                =
                                              =20
>         test Composing: OK (Not Supported)                               =
                                              =20
>         test Scaling: OK                                                 =
                                              =20
>                                                                          =
                                              =20
> Codec ioctls (Input 0):                                                  =
                                              =20
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                =
                                              =20
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)                      =
                                              =20
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                =
                                              =20
>                                                                          =
                                              =20
> Buffer ioctls (Input 0):                                                 =
                                              =20
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                     =
                                              =20
>         test VIDIOC_EXPBUF: OK                                           =
                                              =20
>         test Requests: OK (Not Supported)                                =
                                              =20
>                                                                          =
                                              =20
> Total for sun6i-video device /dev/video0: 45, Succeeded: 45, Failed: 0, W=
arnings: 0
>=20
> Changes since V1:
> - Add more details in the cover letter.
> - Add a test to get the clocks to avoid an error for the platform without=
 MIPI
> CSI-2.
> - Add more details in the register assignations.
> - Removed the support of multiple virtual channels because there is only =
one
> channel support in the CSI driver.
>=20
> K=C3=A9vin L'h=C3=B4pital (4):
>   media: sun6i-csi: Fix the bpp for 10-bit bayer formats
>   media: sunxi: sun6i-csi: Move the sun6i_csi_dev structure to the
>     common header
>   media: sunxi: sun6i-csi: Add support of MIPI CSI-2 for A83T
>   ARM: dts: sun8i: a83t: Add support for the MIPI CSI-2 in CSI node
>=20
>  arch/arm/boot/dts/sun8i-a83t.dtsi             |  11 +-
>  .../media/platform/sunxi/sun6i-csi/Makefile   |   2 +-
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  96 +++++---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  14 +-
>  .../sunxi/sun6i-csi/sun8i_a83t_dphy.c         |  39 ++++
>  .../sunxi/sun6i-csi/sun8i_a83t_dphy.h         |  16 ++
>  .../sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h     |  39 ++++
>  .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c    | 217 ++++++++++++++++++
>  .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h    |  16 ++
>  .../sun6i-csi/sun8i_a83t_mipi_csi2_reg.h      | 179 +++++++++++++++
>  10 files changed, 595 insertions(+), 34 deletions(-)
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dph=
y.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dph=
y.h
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dph=
y_reg.h
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mip=
i_csi2.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mip=
i_csi2.h
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mip=
i_csi2_reg.h
>=20
> --=20
> 2.17.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--/dFl7e5Y0zcWrcPL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl9JELMACgkQ3cLmz3+f
v9Fc0Qf/S07c7Hdhnzb41WcEM2OpOc3NsME/sjeAdJhTi0zt9cgyeadSg8B/menR
OFJFD4M0XVaXhXkqCuzdFj9Rc7+gLWfdSn6PnMNxQ1K4VEhJDNS2ToxTFyLRy2pL
qUe2KzO8ILWR6Wq5iNfyeikMqxfwEvWN9gtDUndUrlmp/+WRfXWfp9Pby8oOxIXA
rXJaV/DhPLCd8BXlp4PnaNVsk2dFjckGjCLjcHMygH+NXZUUTocEjjDrSp+7MmvR
O3NaHu9cvB73XfdBqSQJijkY4ZMPjw+O4+WfzhwN19sNJ2GOSPdaKlgEyg6KV4JU
ZeyLAheRsKSQJ1r9Hka+iRVgspyhmA==
=V3H8
-----END PGP SIGNATURE-----

--/dFl7e5Y0zcWrcPL--
