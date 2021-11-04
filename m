Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BD444526C
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhKDLrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:47:51 -0400
Received: from comms.puri.sm ([159.203.221.185]:37274 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230494AbhKDLru (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 07:47:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 2715CDFE2A;
        Thu,  4 Nov 2021 04:45:13 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HJPM6ySCSBuD; Thu,  4 Nov 2021 04:45:12 -0700 (PDT)
Date:   Thu, 4 Nov 2021 12:45:05 +0100
From:   Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Subject: Re: [PATCHv2 4/4] media: imx: Use dedicated format handler for
 i.MX7/8
Message-ID: <20211104124505.2e0f655d.dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211103104100.GM2794@kadam>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
        <20211017102904.756408-4-dorota.czaplejewicz@puri.sm>
        <20211103104100.GM2794@kadam>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N4/v8hcjiT.3zfcCOpzn9O8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/N4/v8hcjiT.3zfcCOpzn9O8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 3 Nov 2021 13:41:00 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Sun, Oct 17, 2021 at 01:08:37PM +0200, Dorota Czaplejewicz wrote:
> > +static int imx78_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> > +					   const struct v4l2_mbus_framefmt *mbus,
> > +					   const struct imx_media_pixfmt *cc)
> > +{
> > +	u32 width;
> > +	u32 stride;
> > +	u8 divisor;
> > +
> > +	if (!cc) {
> > +		cc =3D imx_media_find_ipu_format(mbus->code,
> > +					       PIXFMT_SEL_YUV_RGB);
> > +		if (!cc)
> > +			cc =3D imx_media_find_mbus_format(mbus->code,
> > +							PIXFMT_SEL_ANY);
> > +		if (!cc)
> > +			return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * TODO: the IPU currently does not support the AYUV32 format,
> > +	 * so until it does convert to a supported YUV format.
> > +	 */
> > +	if (cc->ipufmt && cc->cs =3D=3D IPUV3_COLORSPACE_YUV) {
> > +		u32 code;
> > +
> > +		imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);
> > +		cc =3D imx_media_find_mbus_format(code, PIXFMT_SEL_YUV); =20
>=20
> Do we need a if (!cc) NULL check after this assignment?

In v3 of this series, this statement is only present in the IMX56 code path=
, which is unmodified compared to the original.

However, there's a missing check in the IMX78. I'm not sure if those can fa=
il in practice, but for the sake of correctness, I rolled out an updated v4=
 series, where both checks are present. Message-id: 20211104113631.206899-1=
-dorota.czaplejewicz@puri.sm

Cheers,
Dorota
>=20
> > +	}
> > +
> > +	/*
> > +	 * The hardware can handle line lengths divisible by 4 bytes,
> > +	 * as long as the number of lines is even.
> > +	 * Otherwise, use the value of 8 bytes recommended in the datasheet.
> > +	 */
> > +	divisor =3D 4 << (mbus->height % 2);
> > +
> > +	width =3D round_up(mbus->width, divisor);
> > +
> > +	if (cc->planar)
> > +		stride =3D round_up(width, 16);
> > +	else
> > +		stride =3D round_up((width * cc->bpp) >> 3, divisor);
> > +
> > +	pix->width =3D width;
> > +	pix->height =3D mbus->height;
> > +	pix->pixelformat =3D cc->fourcc;
> > +	pix->colorspace =3D mbus->colorspace;
> > +	pix->xfer_func =3D mbus->xfer_func;
> > +	pix->ycbcr_enc =3D mbus->ycbcr_enc;
> > +	pix->quantization =3D mbus->quantization;
> > +	pix->field =3D mbus->field;
> > +	pix->bytesperline =3D stride;
> > +	pix->sizeimage =3D cc->planar ? ((stride * pix->height * cc->bpp) >> =
3) :
> > +			 stride * pix->height;
> > +
> > +	return 0;
> > +} =20
>=20
> regards,
> dan carpenter


--Sig_/N4/v8hcjiT.3zfcCOpzn9O8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmGDx8EACgkQADBpX4S8
ZndvfA/8CulOyvDt2hPzMe9ypnW5EvQv062bYWIlWV01qaneQE6DLHwaSB6qJa67
rOscFWIHb7TLog5W3Gii10zpWRNBU4CPJETqbdaKiM8WsXh7iiIF7pyzyfhJQCXu
tGg0bWq+IVyOQfO84dlT+JvVDM0X+vWrqUmv7YerRvnJsMOXX9zL2cK4x4cMPsSl
I7zXzC79aNzJHI/oAgSSNmM7Leuyw2VuXSrEUR4aInELa/GUdjNajd55em3BBf6F
0ZCGaYw4hRq50JbJ5jqz63kVe7BI4+Uo7Y/qtW7DJ5hoc36DV4m7rKrFpCUSbKUW
HdIRWQCynux2UCtN11/ayc9z6w9mSL2Tee6zZSCiURyWYxQldoHDkqI540QF/kkE
wh8Y1MC+Ymi/e8SoMLegms/fdo0LTLcYPLbkX0qeWZuXX/7VxDY8Tk5y+NB3tLcI
jT/WQulBu0AlZNhjaGw/ZCYkvhgkPHJUf5+3Uf5oQlcAP/S+dVtTWeMJHWwH9z7E
Wm0347mj1LXxq9EG8Sux9HAbSE7ehgbV7VH1TvKzB1I+JF1CdEYnZbEPXYbv6G3G
W2hGL2s+IMDYjkz7ASbRky1bCmJeHPvu2gI8qxRaqZNtRRa/7CQWmNV32iki2Qzm
cwB/lXW9QCklagjT7NCjY73DIKuOMLACUAVBS4+W3H7fSp/BW0E=
=m0hN
-----END PGP SIGNATURE-----

--Sig_/N4/v8hcjiT.3zfcCOpzn9O8--
