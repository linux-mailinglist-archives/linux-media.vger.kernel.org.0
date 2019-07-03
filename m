Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D225E939
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 18:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbfGCQfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 12:35:20 -0400
Received: from mout.gmx.net ([212.227.15.15]:56345 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbfGCQfU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jul 2019 12:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562171702;
        bh=8VzoVQDGFFnEz0ri0l+Y/Z3hothQojcZPEg+LYQvm6c=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=lsPQ/7+ACfxH4XJN0KAunTO1RYoDviygZKHIgsqoP5khHrEjnKAuLxeEBpzKDjsZw
         URuvGbhwGn6R6GO6VV0nAC3IN/D/2Hi/yOEn/W9r0JmsOXsp1qjQFNvAz21BktspJ1
         cqLlCT1s8shlOL/gHQfjByL8fFOYY+2yR92AOA0k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MAyZg-1hqRyk0Q7A-009u5L; Wed, 03
 Jul 2019 18:35:02 +0200
Date:   Wed, 3 Jul 2019 18:35:00 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brad Love <brad@nextdimension.cc>
Subject: Re: [PATCH v1] media: si2168: Refactor command setup code
Message-ID: <20190703163500.GF22408@latitude>
References: <6a8f9a5b-2e88-8c26-440b-76af0d91eda6@free.fr>
 <20190702095109.GC22408@latitude>
 <6a644c94-f979-b656-472b-c7fe9303e08c@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline
In-Reply-To: <6a644c94-f979-b656-472b-c7fe9303e08c@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:WQd0V52qJoVeoLKv1xigM+RVdu80dTt+As10wjnu6CY7oqAbW/j
 n+Kk1KT1MXMPotgGb1nZzxGqnfhL2GO6J8sXtvtJsiEHL7O7eYRzWcoE8gYWMH7H3Elm97K
 eBMNAkdwxg1rEj/GijDvIFtkO54Cl5lupVW7Fn/nMjr64s+UAmiEq0Han85gyvYoHgbQXeL
 FGye6kOzopyCJh/uotxFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+6SDHD+wb8M=:YP2UxXWkEd7kPt4ksectbJ
 wDbWyC4H3AISQTuMF5S4YWd9U9H63g47g1f7oOzqdUhg/yk2iu9eGWyE5fEf6q4VPakq+YnPf
 JvGU0n9VOexJ2GaiOHjI5bEjoPFhjb0WvFgz7x8ithIKW9hC8QxczjFJLaKTFMl02/HU3mkPU
 dvjTIYifN4sV9QAqm6vG6FhmQGLaoYfkO8ZIOKGT1mEgt5Fc+EDGXonGzR3ZFAGQZy4dDNEgm
 x3M4oVYoSlgcfbLxz0gLgcO3UNRujcEZVe6KoA+Cz+7rYOnnXX+5RODln+4ZAQQk6Ljde+LuV
 EqHMJjyaZ2ojQ+9JJa2kfMRsjk+EIFBrcOA02ydth9BrS/WnKXgZax+skGyKODXqjqSrK0bxH
 GrL8hn3Rp56af7pjoGBKWE9Rc2gdhc1yeXzNfgWwu+8PBy1fvokGz4iHPRoK4Rt0i9WK02FUU
 OLxYC18RkrKGTHT1ZtMxCRNzbbBIm8jd1GdYwO/Mm5Oi6Nnta7iYvD0NKcsdr5oR6eIcbkJ1b
 O4Z219cloZnj2c/xAyDDJ7+UYh4LRUBfEiqBe/+jiF6rEUHriJV0d8kdPAiq+E3mq16mryqMj
 59n7nJCxEJXvK+e7ONOYic4mgFPh2mftXKargwDQaChRaec4yg0KY+Pkiyv94AWmSDzTDVfp9
 j22lMQaVsCJU9AC1k13i1VFTxpO9Fi1Kxs0A19xfZya62eqAT9hIrN8CyDdGGZCM5uoIxmuRl
 5j8mE7onlBzpevbU82xf8eJFGL1DjtlHSEk84vhrLWYphafxOAXY1taad4+XtIvi/aRPe+tS/
 vJeFRS2EmDPKdrK/O0QrQh1L+AKftZMLhXABOwN7feWNvaxUqgiKTH2ifJ36Ob7ru0L8qD/Xx
 MOK5HE4G3pWuaGGQJ7M1CrJ/PBJY/BdYGIzZkazuNNMCQAKnLv6wv1qq+1+G+d60nfE81kQFh
 YVZp9jFors8QjJ6ltkCiL78jUbR+uT/afzE0PRLBR8zYqR+ud7FYH+KS3g2YIEkf1lQkfBjIk
 rDjUDytGdjbTXo5rZewV02y+Dki8C1EHiy9HVNowEeSuBS98ybiogU7TNMtLjLKKkeueC/iNm
 yh0/CWaI8k9gaI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

On Wed, Jul 03, 2019 at 02:47:59PM +0200, Marc Gonzalez wrote:
> On 02/07/2019 11:51, Jonathan Neusch=C3=A4fer wrote:
> > On Mon, Jul 01, 2019 at 01:44:09PM +0200, Marc Gonzalez wrote:
[...]
> >>  static const struct dvb_frontend_ops si2168_ops;
> >> =20
> >> +#define CMD_SETUP(cmd, __args, __rlen) do {	\
> >> +	int wlen =3D sizeof(__args) - 1;		\
> >> +	memcpy(cmd.args, __args, wlen);		\
> >> +	cmd.wlen =3D wlen; cmd.rlen =3D __rlen;	\
> >> +} while (0)
> >=20
> > It would be nice for casual readers to have a little comment here, that
> > explains (briefly) what this macro does, and what the arguments mean,
> > and their types.
>=20
> Just a bit of background.
>=20
> A macro is required /at some point/ because arrays "decay" into pointers
> when used as function arguments.

*nod*

[ I should have been more specific: By "here" I meant at that spot in
  the code, and by casual readers I mostly meant casual readers of the
  code once it's merged. ]

> Come to think of it, I'm really not a fan of "large" macro functions.
> I'll outline a different option in v2.

The v2 approach looks nicer to me, thanks.

> > Why cmd rather than __cmd? This seems inconsistent.
>=20
> Note: I hate using underscores in macro argument names, but they clashed
> with the struct field names. There was no such clash for 'cmd'.

Hmm, ok.

> > The wlen local variable can be avoided by a bit of suffling:
> >=20
> > 	#define CMD_SETUP(cmd, __args, __rlen) do {	\
> > 		cmd.rlen =3D __rlen;			\
> > 		cmd.wlen =3D sizeof(__args) - 1;		\
> > 		memcpy(cmd.args, __args, cmd.wlen);	\
> > 	} while (0)
>=20
> Do you think it is important to avoid a local variable?

Not exactly important, but wlen would be another name that can collide
with the name spaces of the functions where the macro is used and
trigger -Wshadow.


Greetings,
Jonathan Neusch=C3=A4fer

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl0c2QoACgkQCDBEmo7z
X9vqIQ/9F6XYipBcpNCZYGQUrxmhVQAySFpGgnw4LXFN/OS1wwFkzq3dOEMQgCnf
4hd7FvCcWKWnPOgMnbo9LcX6YulRh3WY44n4HF6d0HF3wGF91zvCn6Z7a9HieFhO
BvrUfELL9/t1gC93iEnXeLBvz5gVUkLQfsHgIxlOuZ6/zej2ZiWvDh9c0jBix23Q
0DqHwEWjjWkVTwm5m4G/pSzjAEUGoVjBK8r8Y8QhrDEm7y/FyZZXbdcXxka6OMYP
Ij6PEb7SH8oLCuSpttWvjVVb0mcH6HY6frhpkO140iZ3gLe4THBbkPA+NCDIWN/c
hx68+4FbnTif+k0Ds/hWRMmAzGvA2EnEi/cFOOSv3RWXh8D1op9p6PO/T5Urq22I
hxgYhUeFTdONMRFPqjCP0nnmZQ1Bzf5TKFPKBjrGnX7tYy1F9QIDFcM7FXRz/7Fx
zPO96Sh4/XiK6Cg+bL1rVAge8g85sjyIZgJpL9eF8lXmCqCoLXeI33nOuDaS5LnA
N0tbwzXJAqM2aTF+nV+JMebRNFqzGnuA3bQgwx283fAO1P5jOOgqxNC+Y7jIO0lG
3yEe07IqpP1d2z5Q5y8/XwBIpEYOThX64PH+09TpM3mmMkBqNy/WpSRnjtr/XuKK
c0Fa4E4EDkwIDOmPmf7Nj6/MUny4Jmgo6vfa0Dlb4YSyV/VSMks=
=gWpD
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--
