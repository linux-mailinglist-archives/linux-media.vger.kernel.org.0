Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6734650DCBB
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238566AbiDYJe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239764AbiDYJck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:32:40 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26C4252BB
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:29:34 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7132FE0005;
        Mon, 25 Apr 2022 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650878973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YKzv1ibbkL+Zfwt0GByW99cd72aQfFOM4JCdsKdBRik=;
        b=GoSfRfVdxFoKl/EQ7hxdZ7xh4bRVmKqWujeyxBNOmgdVa8lmVgLxXbLhsFhVCyiFslICPE
        DSAr4HilQoA0TiDhIhKxLea5fnRsEUTpaef+zHSxsRDtw1Mj+5LUtw3kD2Uik4gEatoG+T
        12ARJ0gqrGhV5uN61cD3iepIh5MjUDYMWs3rBQqBrgfzI9jovCtwrbpTvUyIFwmciGdWwM
        7K8Pl4B8wKtzth8qYy7O9L4glPLaav++mCSWCp5FVA5MEIWpB+HNg0neowr8Yl0eNQTi/q
        8BDm0uY8lIqLKKdqGXiD4JINBPAZgIN9DYK2WtbJTgqOX3/uihf8f0GJAndccA==
Date:   Mon, 25 Apr 2022 11:29:30 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ian Cowan <ian@linux.cowan.aero>, mripard@kernel.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Message-ID: <YmZp+qgSLpT5PP2u@aptenodytes>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
 <20220425092048.GL2462@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Iehz5awTxslWO7de"
Content-Disposition: inline
In-Reply-To: <20220425092048.GL2462@kadam>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Iehz5awTxslWO7de
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon 25 Apr 22, 12:20, Dan Carpenter wrote:
> On Sat, Apr 23, 2022 at 02:01:11PM -0400, Ian Cowan wrote:
> > Refactor the cedrus_open() function so that there is only one exit to
> > the function instead of 2. This prevents a future change from preventing
> > the mutex from being unlocked after a successful exit.
> >=20
> > Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
>=20
> No.  You are just making the code ugly and complicated for no reason.
>=20
> I work in static analysis so I have focussed a lot of attention on
> locking bugs.  In real life this theory is totally bogus.  Single exit
> paths only cause bugs, they don't prevent bugs.

I'm really surprised by this and honestly it feels a bit dogmatic.

It reminds me of CS teachers telling me "gotos are evil and you must
never use them". In practice there are many situations where they make
the code more readable and don't introduce any significant incertainty.

In this instance I don't see what could possible go wrong and I agree it
makes the code more readable.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Iehz5awTxslWO7de
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJmafoACgkQ3cLmz3+f
v9EqQgf/VZcpY2zzvyYl4LKu31QOCfcDKz/X084DWxr1jKSYhOr3UfuVtC2AFJlI
qEaJ7/FafskosHOmqYzsjuqUpFBk+eF43w89Bs1Z3nMJy9skZ+UYRR6vfA5T8dxD
MLTcWauop5stT6z9rZjB94BnY3t1Rqrklm3S2474DdlWJbLRAQSfAvpNMrNKbxSe
oRmymVQ31Jne4yH7FP1KsMZ33pbpug4+ATwX+Nv/P977mejtmF3ZbXlwYERJ4oub
rOivnAJnTfWK7TPBti92/gYXi5W768utHlboFJr9taCbUi6msvpsH3DgLaZECn4b
xgAsbOsvbGtMXUPtiYkSFetcGK9sPA==
=dhtU
-----END PGP SIGNATURE-----

--Iehz5awTxslWO7de--
