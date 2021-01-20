Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 264322FCEAE
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 12:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388202AbhATKtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:49:10 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:42615 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387777AbhATKou (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 05:44:50 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 42AAD1BF20B;
        Wed, 20 Jan 2021 10:43:58 +0000 (UTC)
Date:   Wed, 20 Jan 2021 11:43:57 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, lkp@intel.com, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [linux-next:master 2460/4407] drivers/media/i2c/ov8865.c:2852
 ov8865_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <YAgJbe/7VymnpFIZ@aptenodytes>
References: <20210119185750.GO2696@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PD8IyB+9PRBc5eQP"
Content-Disposition: inline
In-Reply-To: <20210119185750.GO2696@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--PD8IyB+9PRBc5eQP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 19 Jan 21, 21:57, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   b4bb878f3eb3e604ebfe83bbc17eb7af8d99cbf4
> commit: 11c0d8fdccc56fa15cb15906480b4737c31dd085 [2460/4407] media: i2c: =
Add support for the OV8865 image sensor
> config: i386-randconfig-m021-20210119 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> smatch warnings:
> drivers/media/i2c/ov8865.c:2852 ov8865_probe() warn: passing zero to 'PTR=
_ERR'

Thanks, this was already reported and the fix is on its way :)

Cheers,

Paul

> vim +/PTR_ERR +2852 drivers/media/i2c/ov8865.c
>=20
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2840  	/* DOVDD: digital I=
/O */
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2841  	sensor->dovdd =3D d=
evm_regulator_get(dev, "dovdd");
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2842  	if (IS_ERR(sensor->=
dvdd)) {
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2843  		dev_err(dev, "cann=
ot get DOVDD (digital I/O) regulator\n");
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2844  		ret =3D PTR_ERR(se=
nsor->dvdd);
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2845  		goto error_endpoin=
t;
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2846  	}
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2847 =20
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2848  	/* AVDD: analog */
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2849  	sensor->avdd =3D de=
vm_regulator_get(dev, "avdd");
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2850  	if (IS_ERR(sensor->=
avdd)) {
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2851  		dev_err(dev, "cann=
ot get AVDD (analog) regulator\n");
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31 @2852  		ret =3D PTR_ERR(se=
nsor->dvdd);
>=20
> typo.  s/dvdd/avdd/.
>=20
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2853  		goto error_endpoin=
t;
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2854  	}
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2855 =20
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2856  	/* External Clock */
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2857 =20
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2858  	sensor->extclk =3D =
devm_clk_get(dev, NULL);
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2859  	if (IS_ERR(sensor->=
extclk)) {
> 11c0d8fdccc56fa1 Paul Kocialkowski 2020-12-31  2860  		dev_err(dev, "fail=
ed to get external clock\n");
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--PD8IyB+9PRBc5eQP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmAICW0ACgkQ3cLmz3+f
v9Hu9gf/RZlVOQmcD2HkqYJhoGw4NpthsWhb3oAOHS5f9m2bM6hv+TlNcwPR2rCF
KrG1vvMpPfI9bdCDTS1/v64/A5RLxkZVc+plDdk7LTElWGnNOtTUTbNBcHRzVMFC
h1BqxKAWFZWXsPnrugngRcc5H3dxXplnAB7fzXyOCnOm+d1nb4njcCA/x8ucvMMa
ciq007w9zB7GbfTVezfnyauQ095oTLDibgpSxu3bOu66mTxDAlZFSVL06MUMF0jf
KPPvmLck5scJ3jPdckoerpn0ZL28iDKWACRBAN/HnH9ZSzkvYHWegyj6arqVYlPe
Dzfb8heSJrWgya4Prcf7ublMOOpqBg==
=qoPW
-----END PGP SIGNATURE-----

--PD8IyB+9PRBc5eQP--
