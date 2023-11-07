Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101617E41C7
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 15:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbjKGOZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 09:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjKGOZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 09:25:35 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E95C1
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 06:25:29 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16F3A240010;
        Tue,  7 Nov 2023 14:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1699367128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mFiVQx+dhyFZ4SD4U5GxoDaEnxmWz9U1OSjCpcYt9x8=;
        b=Fp3RarlXyxde9Y0WXNSyiP9SJbhiJe2sF5LzShb2t2GWN13M7u0yMWc1e0w0Pkhwad4Eq4
        QDKs3sHCILItEL67fxeh9NAe5AeN3tHn2+pbpn1L01US4l217BUIm85DUOPlwhf3rLlFAY
        QvrLmqBU0+cTb8U/fjdpl1H3pWXpAWrKtUxCHj6QhOsDN2TLbrox93LyelS5Ibah8wlTPv
        k+HBuOeZIvK3b3aZt08Hk92eFHCmAZxGoBrCbdu93zKh40/7yQlno9+lRN/QqwxL0nKhWB
        bCbIZgCRlDXoSV3VcZDAsrNMs4QL1J+E7aV9OGGx9U03LzhIlvPA/L6xiaqB0Q==
Date:   Tue, 7 Nov 2023 15:25:27 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: RFC: cedrus: time to more to mainline?
Message-ID: <ZUpI151wvt455TcF@aptenodytes>
References: <c7accc1c-57a8-4722-a4f7-2278eb035429@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f0UpNHmNtMaPgx+A"
Content-Disposition: inline
In-Reply-To: <c7accc1c-57a8-4722-a4f7-2278eb035429@xs4all.nl>
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--f0UpNHmNtMaPgx+A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue 07 Nov 23, 14:54, Hans Verkuil wrote:
> Looking at the cedrus TODO:
>=20
> Before this stateless decoder driver can leave the staging area:
> * The Request API needs to be stabilized;
> * The codec-specific controls need to be thoroughly reviewed to ensure th=
ey
>   cover all intended uses cases;
> * Userspace support for the Request API needs to be reviewed;
> * Another stateless decoder driver should be submitted;
> * At least one stateless encoder driver should be submitted.
>=20
> I would say that all items are done, except for the last item.
>=20
> But this is a decoder driver, so I'm not sure why the TODO would mention
> something about encoders.

I agree. This didn't prevent the hantro driver form being unstaged anyway.

> Anything else that needs to be done before it can be moved out of staging?

I'm actually working on a big rework of the driver, because its architecture
is vastly sub-optimal and overall very messy. This is in particular needed =
for
the work to support H.264 encoding.

The plan for now is to publish this work in a downstream repository (at Boo=
tlin)
since we don't yet have a uAPI for encoding. The rework is also not split i=
nto
nice transition commits but it's instead a big all-in-one commit for the mo=
ment.

However I would like to see this rework hit mainline after the publication =
of
the encoding work, because it's a much needed cleanup for the decode side t=
oo.
I will of course split it into nice commits at that point.

So I'm not sure whether this conflicts with unstaging or not. It could make
sense to wait until the rework is achieved to unstage, but I would also be =
fine
with unstaging first. It would just make me slightly happier to bring big
changes to a staging driver instead of a fully-merged one.

What do you think?

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--f0UpNHmNtMaPgx+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVKSNcACgkQ3cLmz3+f
v9HYSwf/Y+BIH+56OKtG3a1faY8KGn2LwksaazPKFyCKtyrBtFBX+I1dyvojhI9b
fl1+7AFYqrVWu3UdJZHayjNOdyb5dilClVMWaHiJW0/1AxegS0qkYAj4UMl2EyJ/
8ZtY8td1efm7mWqQb4r8y8Cht7RUrvHNuwXCJZV5fCMvywWOLkVygu0T8ejedwo7
7TUv5YVCVJqFj+Tw7N77xZJpI1cRn7ZW5DuW1Sxodr1Q23tkSLvD/t3aC3pyrMfL
tnBVyRdp24PvCdzQVSzOleV6uqAm30YtguICe1e8nRb+Q09VtlHFI6gSFE1SxCGx
b+6JBq2TLoQ2PdxwPyhRL77dwniysg==
=g46p
-----END PGP SIGNATURE-----

--f0UpNHmNtMaPgx+A--
