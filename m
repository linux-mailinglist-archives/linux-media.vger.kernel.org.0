Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7636D50F2CC
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344142AbiDZHm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344155AbiDZHmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:42:15 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD7F135380
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:39:07 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A2192E000D;
        Tue, 26 Apr 2022 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650958746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=arsiKzPnEyF2K1/BzOvkvzG8lC0x6Q6kwRJkhLhmhqc=;
        b=pB+4G01PCbX6vzjTny2tsNFd2/EdAjTXpjMNgF30NWkaBIWJDVskdSErgd8gtY8QT+klgm
        bibLmZ9TFbs6AIZAWLI5+rDPsRPIu2nTCdaxwa2UB8JZIcn6gNGwTza4gOSFYIbNOYjn/1
        WZDb/no7BWnlepJbynBFyQ20U6TQvpV4t92ZPIggULIbw75b6R5UbCEZgcuO1onm3KRdn8
        78lzbNoBFN1U1hovxWSaOnH05KI9YiGdnocRj6B+4h/kaS+xZOKpeNWwJR6L8B6xdGs2hE
        ITTKj6Y5V/eU9aw7iWl4MG6Fg0ZPTz2nhbSEcB6sqQHoParsxZ9gqdQzBukCww==
Date:   Tue, 26 Apr 2022 09:39:03 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ian Cowan <ian@linux.cowan.aero>, mripard@kernel.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Message-ID: <Ymehl27gmW41a3FY@aptenodytes>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
 <20220425092048.GL2462@kadam>
 <YmZp+qgSLpT5PP2u@aptenodytes>
 <20220425100057.GB2090@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eOxEJt1XwXWGH2/R"
Content-Disposition: inline
In-Reply-To: <20220425100057.GB2090@kadam>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--eOxEJt1XwXWGH2/R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon 25 Apr 22, 13:00, Dan Carpenter wrote:
> On Mon, Apr 25, 2022 at 11:29:30AM +0200, Paul Kocialkowski wrote:
> > >=20
> > > No.  You are just making the code ugly and complicated for no reason.
> > >=20
> > > I work in static analysis so I have focussed a lot of attention on
> > > locking bugs.  In real life this theory is totally bogus.  Single exit
> > > paths only cause bugs, they don't prevent bugs.
> >=20
> > I'm really surprised by this and honestly it feels a bit dogmatic.
> >=20
> > It reminds me of CS teachers telling me "gotos are evil and you must
> > never use them". In practice there are many situations where they make
> > the code more readable and don't introduce any significant incertainty.
>=20
> Gotos are fine.  Backwards gotos are horrible, but sometimes necessary.
> But pointless gotos are bad.  And "out" is a bad label name.
>=20
> 	return -ENOMEM;
>=20
> That's perfectly readable.
>=20
> 	ret =3D -ENOMEM;
> 	goto out;
>=20
> That's vague.  The out label is likely to do nothing or everything.  The
> problem with do-nothing gotos are that people forget to set the error
> code.  Also it interrupts the reader, now you have to scroll to the
> bottom of the function, you have lost your train of thought, and then
> you have scroll back and find your place again.

Okay I think these are good points, fair enough.

> Do-everything gotos are the most bug prone style of error handling.
> Imagine the function is trying to do three things.  It fails part way
> through.  Now you're trying to undo the second thing which was never
> done.  Just moments ago I was just looking at one of these do-everything
> bugs where it was using uninitialized memory.

So by that you mean having just one label for all error handling instead
of labels for each undo step?

I've also seen conditionals used in error labels to undo stuff.

Would you recommend duplicating error cleanup in each error condition?
It feels like another set of issue on its own, besides the obvious downside
of duplication.

Thanks for the explanation!

Paul

> Another problem with do-everything error handling is that eventually it
> gets too complicated so people just leave the error handling out.  It's
> hard to audit to see if everything is freed.
>=20
> With static analysis, I'm mostly looking at error handling instead of
> success paths paths.  The one error label style is the by far the
> worst.
>=20
> People think single labels will prevent locking bugs.  It doesn't work.
> There is two people who use indenting to remind them about locks:
>=20
> 	lock(); {
> 		frob();
> 		frob();
> 		frob();
> 	} unlock();
>=20
> And occasionally they still forget to drop the lock before returning on
> error paths.  Nothing works for forgot to drop the lock bugs except
> static analysis.
>=20
> regards,
> dan carpenter

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--eOxEJt1XwXWGH2/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJnoZcACgkQ3cLmz3+f
v9HEIgf/fqx7Nzmz0NvFjvbT/W0lmADI86JNWqQP/iDKn1QlEeLYz3mPwuyA37mL
fq8FY7krBUUbrfpZRiN7H+6GHnnwmSY6Sm+UWmUqtUaF7fC7a5qDvHbVixCLTG36
g1f4pSb4+HUyEmsyDYpFilc0H+Vl2EzhfACwQlnntcF/CLl10TOUGDDx5tdSdtKn
zuAGHHs+jF/8/xvp2UaYI5OlFc0NiZbbmXwzgcD4o78EkG2mBRGr0byLljRjs+uA
8ZcfLW5e9RNkhJWf0EFWcV0DdjBk0Uamb9cMpNn7d266/wnKCRbTGDrOhGfJIB+I
Pb8BSp21xxHPNen+dwP6BcZEkRgc7Q==
=hGdZ
-----END PGP SIGNATURE-----

--eOxEJt1XwXWGH2/R--
