Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96317CBCCC
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 09:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234749AbjJQHvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 03:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbjJQHvS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 03:51:18 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666AAF0
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 00:51:16 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39H7oug8091124;
        Tue, 17 Oct 2023 02:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1697529056;
        bh=L1LbFBJTr5mBUWSxF1OTPnqg5A8zw+lFcIS4nzFRULI=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=bIFQbO/+J/fYR06I3OrtBZ60fQv8rPaEAa0YSbet0lPEvfzInOMrdztbLBCK57cs/
         PiVCvyT+MOzjX7rZkCwLKocVzJSJ+kJJ/G/MEEP/YFXX1x4UTICQTDboe2SJ/GIqv6
         zBjP4JJsGAEA6dKygr5i/X9NcYQ8Uqv9gH/tJrJs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39H7ou7g034328
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Oct 2023 02:50:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 02:50:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 02:50:56 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39H7otIS077269;
        Tue, 17 Oct 2023 02:50:56 -0500
Date:   Tue, 17 Oct 2023 13:20:56 +0530
From:   Jai Luthra <j-luthra@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL FOR 6.7] CSI2RX, mostly camera sensor sensor patches
Message-ID: <oke7s4zbyy4kmou6v2jm3hl7zap47t2b3rb5d7zscjttakpn6t@vpan6qdzqytc>
References: <ZSaXrKkhP4AOH+Rh@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gipcwnop7bpcduea"
Content-Disposition: inline
In-Reply-To: <ZSaXrKkhP4AOH+Rh@valkosipuli.retiisi.eu>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--gipcwnop7bpcduea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari, Hans, Mauro,

On Oct 11, 2023 at 12:40:12 +0000, Sakari Ailus wrote:
> Hi Hans, Mauro,
>=20
> Here's another set of patches for 6.7. Included are, in particular:
>=20
> - DT binding improvements by Jacopo,
> - Pratyush's nand Jai's CSI2RX driver

I have posted two minor fixes for warnings reported by Intel LKP bot=20
introduced by my CSI series.

1. https://lore.kernel.org/linux-media/20231013-maintainers_path-v1-1-e28bd=
cc96ef2@ti.com/
2. https://lore.kernel.org/linux-media/20231017-cdns_phy_config-v1-1-583243=
d1c187@ti.com/

Hopefully these can be applied before the PR is sent out for 6.7-rc1.

--
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

> - Fixes for recently merged CCS patches and mt9m114 driver
> - Miscellaneous small stuff
>=20
> Please pull.
>=20
>=20
> The following changes since commit a1766a4fd83befa0b34d932d532e7ebb7fab1f=
a7:
>=20
>   media: imon: fix access to invalid resource for the second interface (2=
023-10-07 10:55:48 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://linuxtv.org/sailus/media_tree.git tags/for-6.7-3.1-signed
>=20
> for you to fetch changes up to f4f5a574664f77796613401ccb9cc1d01a546dbd:
>=20
>   media: ccs: Fix a (harmless) lockdep warning (2023-10-11 15:37:41 +0300)
>=20
> ----------------------------------------------------------------
> V4L2 patches for 6.7
>=20
> ----------------------------------------------------------------
> Jacopo Mondi (6):
>       media: dt-bindings: hynix,hi846: Add video-interface-devices proper=
ties
>       media: dt-bindings: ovti,ov02a10: Allow props from video-interface-=
devices
>       media: dt-bindings: ovti,ov4689: Allow props from video-interface-d=
evices
>       media: dt-bindings: ovti,ov5640: Allow props from video-interface-d=
evices
>       media: dt-bindings: sony,imx214: Allow props from video-interface-d=
evices
>       media: dt-bindings: sony,imx415: Allow props from video-interface-d=
evices
>=20
> Jai Luthra (2):
>       media: dt-bindings: cadence-csi2rx: Add TI compatible string
>       media: ti: Add CSI2RX support for J721E
>=20
> Laurent Pinchart (1):
>       media: i2c: mt9m114: Fix missing error unwind in probe()
>=20
> Pratyush Yadav (11):
>       media: dt-bindings: Make sure items in data-lanes are unique
>       media: cadence: csi2rx: Unregister v4l2 async notifier
>       media: cadence: csi2rx: Cleanup media entity properly
>       media: cadence: csi2rx: Add get_fmt and set_fmt pad ops
>       media: cadence: csi2rx: Configure DPHY using link freq
>       media: cadence: csi2rx: Soft reset the streams before starting capt=
ure
>       media: cadence: csi2rx: Set the STOP bit when stopping a stream
>       media: cadence: csi2rx: Fix stream data configuration
>       media: cadence: csi2rx: Populate subdev devnode
>       media: cadence: csi2rx: Add link validation
>       media: dt-bindings: Add TI J721E CSI2RX
>=20
> Ricardo B. Marliere (1):
>       staging: media: ipu3: remove ftrace-like logging
>=20
> Sakari Ailus (2):
>       media: ccs: Rework initialising sub-device state
>       media: ccs: Fix a (harmless) lockdep warning
>=20
> Umang Jain (1):
>       media: Documentation: ccs: Fix spelling mistake
>=20
>  .../devicetree/bindings/media/cdns,csi2rx.yaml     |    1 +
>  .../devicetree/bindings/media/i2c/hynix,hi846.yaml |    7 +-
>  .../bindings/media/i2c/ovti,ov02a10.yaml           |    8 +-
>  .../devicetree/bindings/media/i2c/ovti,ov4689.yaml |    6 +-
>  .../devicetree/bindings/media/i2c/ovti,ov5640.yaml |    7 +-
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml |    2 +-
>  .../devicetree/bindings/media/i2c/sony,imx415.yaml |   10 +-
>  .../bindings/media/ti,j721e-csi2rx-shim.yaml       |  100 ++
>  .../bindings/media/video-interfaces.yaml           |    1 +
>  Documentation/driver-api/media/drivers/ccs/ccs.rst |    2 +-
>  MAINTAINERS                                        |    7 +
>  drivers/media/i2c/ccs/ccs-core.c                   |   62 +-
>  drivers/media/i2c/mt9m114.c                        |    4 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c       |  176 ++-
>  drivers/media/platform/ti/Kconfig                  |   12 +
>  drivers/media/platform/ti/Makefile                 |    1 +
>  drivers/media/platform/ti/j721e-csi2rx/Makefile    |    2 +
>  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 1159 ++++++++++++++=
++++++
>  drivers/staging/media/ipu3/ipu3.c                  |    6 -
>  19 files changed, 1506 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,j721e-csi2=
rx-shim.yaml
>  create mode 100644 drivers/media/platform/ti/j721e-csi2rx/Makefile
>  create mode 100644 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>=20
> --=20
> Sakari Ailus


--gipcwnop7bpcduea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmUuPN8ACgkQQ96R+SSa
cUUf/Q//cCit1VWsQ1uWtE8aOUPviskF+JsvSRAruc8dmXg0wVeo+a0Js/yh4y76
466Q+CEDzG93y0TlP/azcITcuDKe4Rw5E6zpHFxpT7uxT1OWNr1bOQXuVgpQTJhn
4/9hLTdLB6Nfeoa/15bx6LuVo6albFJrtK2GgAV4BofPy8JdCwBGjM9R6oyTLevu
lelm3Axu8oo8LofsCFNX+3huo6cgAZ1C/siyxmP4ZZF04FlimBw3MAMdVLJSUG7a
PPrg50RRf1yLZAhqnbMivA8aXiPESwRmapPfTWOnO6i5bMpUGbIfm2gLkbnDZlVe
ma5u1k3Uxyn8ndk9HACggGLeQgQhB2cfwDFLHpmDW/nmoug7Cotvq45o7ooHg06b
Ya6rz1280qpXb7n8i4Txac/IiQx9vlfEUBFv+6zhjIGHNvVwt2foyTGzsSOcWp66
gAKPcZFD5skRaD2sPcMaBsICc0vF/F0/RTij5LXcUOJp4SGjkjeGwho1QX0Kn0Lq
in29Bg6kKTJtAz3Q4/FpeH4Png9gGEd61wQX0fiV/ltj64Lv46cJI3VwT470/bWU
EbWSwjmo9kjlWvJfpWuVC2++LF0cB7vIZSJNQthG6BfnjbAyAfbqLk+OELku8LAQ
P39uLomSkKgh9oPZVYzXebEOIWAPUVv0KXR+daE2vjDj0JynXYo=
=Qwm7
-----END PGP SIGNATURE-----

--gipcwnop7bpcduea--
