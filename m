Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77B2D30B8D
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 11:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfEaJaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 05:30:55 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51248 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfEaJaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 05:30:55 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 3CE6F80225; Fri, 31 May 2019 11:30:43 +0200 (CEST)
Date:   Fri, 31 May 2019 11:30:52 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Pavel Machek <pavel@denx.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] media: stm32-dcmi: fix irq = 0 case
Message-ID: <20190531093052.GA23111@amd>
References: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-05-31 11:18:15, Fabien Dessenne wrote:
> Manage the irq =3D 0 case, where we shall return an error.
>=20
> Fixes: b5b5a27bee58 ("media: stm32-dcmi: return appropriate error codes d=
uring probe")
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Acked-by: Pavel Machek <pavel@ucw.cz>
Reported-by: Pavel Machek <pavel@ucw.cz>

:-).
								Pavel

> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1702,7 +1702,7 @@ static int dcmi_probe(struct platform_device *pdev)
>  	if (irq <=3D 0) {
>  		if (irq !=3D -EPROBE_DEFER)
>  			dev_err(&pdev->dev, "Could not get irq\n");
> -		return irq;
> +		return irq ? irq : -ENXIO;
>  	}
> =20
>  	dcmi->res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzw9EwACgkQMOfwapXb+vI91gCgrymhw+fLQG9ycygMMLdOh9Mv
Ao8AoKLSVLOH71CRZXNcxqg8QDUQpczh
=7mwO
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
