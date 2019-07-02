Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3125CCF6
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 11:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfGBJvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 05:51:38 -0400
Received: from mout.gmx.net ([212.227.15.19]:45561 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbfGBJvh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 05:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562061072;
        bh=FGM5WXyOI1pXMifsCCwhO9soc1ANArWFrlQ2lZN8tTQ=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=CN/HkxfCLv1B4CD87a9WrW6LKKkgb0CwQ3XEaBmdDQ3ObqzNk5DLrG0kALBpaOjWw
         uA043edWLxP62RdSCvDQjGDmwLeAzpWQ7IK0gJ2qFvait18MWgfcO2riRf9tz6gE31
         5O31tl9G//BCar1XWX38JIf6kyd7An6k+1DLg4Wc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lvkwm-1icWvk2Pds-017RP0; Tue, 02
 Jul 2019 11:51:12 +0200
Date:   Tue, 2 Jul 2019 11:51:09 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brad Love <brad@nextdimension.cc>
Subject: Re: [PATCH v1] media: si2168: Refactor command setup code
Message-ID: <20190702095109.GC22408@latitude>
References: <6a8f9a5b-2e88-8c26-440b-76af0d91eda6@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <6a8f9a5b-2e88-8c26-440b-76af0d91eda6@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:meVnSL0vkDuUwFstQh5OanUzm5dthphT8V4mbTD14FxbGuHVDs6
 FeqySYV+ms5Yw43+AuYlRt9/9CHHw4z1szwTYsUW2yemNKOomvosKKGm2dhcKMJs7cGyKfP
 auUSUdQJsVEcZsmoiXExB6vQDesJoobtg2sy1Qd6IWVkKZUGtu4zzo3srS+11sQlEHN1qau
 e+fzYIbkty7SjWbfhnRew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1037Dn98csI=:xzpDmgYxeaJVGHc3FJvXiN
 bJIQpn/qbD55TI5fpa4LXWOS78BYLi8v/denNJu9at/B5LpDuXSi1Rhfu+8G39yNyvkHr62zK
 JD/Ozn1TKpuaJcMFzimWL6EzoMMnnqQH9rCdOfUOE4s3bw3jjSkpvC1qg9Cc0xXpDlmtPSNSP
 5zT5+BCxv08oZNjcxJF8deFxVnJ4PT9k20PM9pvq/lkFVDcXYy0e2ADXBDKu+Wrke0WqOiRrs
 OLKxG5PfSHvtfqn2DZNeRiCVlk38kcnVnE7Dbtym5G7AJxZQAPe0tjnw+82tzReiardtZgU3f
 QmLJWKCyhUTPI9QGjRTz2cXd6RSO7gp8/nS+wN4ipQj60KEgOUnvQVsUOouvvpD4djOGhSaUJ
 9h9Mzp0EuDV8ZMrSaMupvNLjMpHDpBQ5OpYYECOZEKWARmVfbn06B0xzI7/sVccFG/hr3AYl1
 8kASndiedP/ulQRncXEBKfYpOsFtJ9xIJB7Lr0LTPk01dWAXiA369L9n0B3GNVK98enOFkZyl
 1TFs6DPR2Iy98xIdShnZRcOKydA0+Nj4Wn4UkoU+ydp3AzsVogkb8n8l1hUQOmcuBSGHF2PKp
 5mSOPre4Jp32M8Zp5mU4YnPlOg6rLUqQvDECUPOdqaXB8QrzlsTtY2PGiVMSVz81uuFriZyD9
 ulrJPwuM7gFZQP23+lRl1y7YV2Il+iX/6V9rFGb3XQ8bzqZQlNSrSurCds+OTSZ4EyRG1y5OA
 /guTzcwqax9wu6zVE78ogzCyXiMU7BM2Jz4de7t4uAEPV0WZdN+LlTpKjpy8PO67/xDsvBxSB
 YFo0afMkK7rmmcjwu1fIehylG0sWuA7gsTo3j6FBhj3HxTHIgI3+zEsnaEet1PDz4bYEKf1Gl
 nEqIlAOP3XUxhAV8EYI1DrD7QAO+6SSlEBZskNR0padkK1UjX6mB7XIEduUcv/rSgNsxVC5mj
 BWFAMNVtrJa3wpFScEdqpFJPxFxBP8UM+sDOpQEZfmbjIwmitPwlTJF8cOXSkalgEsyJswD+y
 88TGH8Sc5qzpn4mM6noKsJi0yqQE3tbxbY1Izo7mEutSWTmSm+N3q4bp3fmDXFbh4mBlIzj2j
 YhlNUT6b/2ndtU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 01, 2019 at 01:44:09PM +0200, Marc Gonzalez wrote:
> By refactoring the command setup code, we can let the compiler
> determine the size of each command.

I like the idea, it definitely saves some code.

The conversion also looks correct.

> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>  drivers/media/dvb-frontends/si2168.c | 142 ++++++++-------------------
>  1 file changed, 41 insertions(+), 101 deletions(-)
>=20
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-fro=
ntends/si2168.c
> index 168c503e9154..19398f041c79 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -11,6 +11,12 @@
> =20
>  static const struct dvb_frontend_ops si2168_ops;
> =20
> +#define CMD_SETUP(cmd, __args, __rlen) do {	\
> +	int wlen =3D sizeof(__args) - 1;		\
> +	memcpy(cmd.args, __args, wlen);		\
> +	cmd.wlen =3D wlen; cmd.rlen =3D __rlen;	\
> +} while (0)

It would be nice for casual readers to have a little comment here, that
explains (briefly) what this macro does, and what the arguments mean,
and their types.

Why cmd rather than __cmd? This seems inconsistent.

The wlen local variable can be avoided by a bit of suffling:

	#define CMD_SETUP(cmd, __args, __rlen) do {	\
		cmd.rlen =3D __rlen;			\
		cmd.wlen =3D sizeof(__args) - 1;		\
		memcpy(cmd.args, __args, cmd.wlen);	\
	} while (0)


[from the other mail]
> I'm planning on sending a v2 where drivers/media/tuners/si2157.c
> is refactored the same way.

Makes sense.

> Not sure where to store the macro. Maybe include/media/dvb_frontend.h?

Then include/media/dvb_frontend.h would contain information about the
private structs of a few (two) drivers. This doesn't seem like a good
idea to me.


Greetings,
Jonathan Neusch=C3=A4fer

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl0bKMwACgkQCDBEmo7z
X9v5PhAA0ywTpuolHgb0WWPyGBKYIBUbCWzyB7tfctjB1AIjKcW2/Y3pNYuAB/rQ
AfguO8KOAP48SZD29BEYvlOIfY7xZ6MJs39cMfJbuV8YahtJZ79T6oEDFzblXo9o
KB800d2BBB6O1tffQH465mOxHjsD32hTzRT+QZsPljNIi3x24ujBVhP6LqGjJI3z
imBmoUuwk8RVoSFrrxWrhJuQ5OtbSxRn/oZ3A/GMXrx9RpOU62H63brSEDEv6vzw
CpfqaIkEvpDPbbo7BZj37LYqUOWlbi/MnC5O5l0HbXbp7+xnJZcNdn6EsE+6E08S
cbH1ySFBHp17zZdBtv4qu3zwULGNPCvM8iN1WNf3rI1U1iTjfqZmZcJkTHCRmdMh
bSQ/EAQSEm5KTAIAvA2X62/x5SAsRursdejB7q8aLPJ6y6wKsQoN0wPGtJqT9DBQ
I5FnKjJ7NbHpcBH8Fg2kyZxLJUVyiAcnoseKnvorRfJ+Au2TBlXc9k3NnCoZIAPs
sP19WmTDeh3KLU24Otumut9qB5KveR763T9I0u2U9wBwgK3NJw/+S+6Y2XPUxrNW
ArlOEtFaEi7Lznv9PmWfgyvKZz9WI24tpRPn0B//3OoYZ1la1ZboJICyeUJ8/sNc
tZVA1Ylz3xlhzUnU2HaQ2sxwhvZzPFEv/I8EI80M90NHeCqPd5M=
=aW/y
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
