Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40E051331E
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 13:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346038AbiD1MAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 08:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345977AbiD1MA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 08:00:26 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D224288B29
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 04:56:57 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CCC2760013;
        Thu, 28 Apr 2022 11:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651147016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+kqXswugkVGOFt41Krx7tQpUugV0n6joxlQ9XVQuB0Q=;
        b=Fq3Bt+Ci0xehqSuJ8c4Y2n0tntzUcIy4uISssoFKE3gVIVGz24SRm8YajWiw56CEid62UO
        bzcCDEibxZfLI6JORx8JgBK78pdymi0UvXomDrtLSSLTawuQOQy4GFRVZOAJFhq4/3IqGq
        2MYAzLKD6HLGa+9Jt+c2V00sUm+vXY/tCBHqmUeEIgF5paLxsa4op4XmJaA4vNSpduBqm4
        tsODikDhsvqZBAxV8MxYUJ0q1CleG8naewtqWIIeQepk6XHhoaQnOXkeyy6K4lIaO/MqyE
        8gd6XI2JU7yYvXpT9fEk8mJyJ/MtMRMjsCNlJmzHTqY6ahOv4NnOPuRfQ6i0ng==
Date:   Thu, 28 Apr 2022 13:56:49 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ian Cowan <ian@linux.cowan.aero>, mripard@kernel.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Message-ID: <YmqBAZwdiE6GuarU@aptenodytes>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
 <20220425092048.GL2462@kadam>
 <YmZp+qgSLpT5PP2u@aptenodytes>
 <20220425100057.GB2090@kadam>
 <Ymehl27gmW41a3FY@aptenodytes>
 <20220428102608.GU2462@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="llYjTutXsM3Kb7Ne"
Content-Disposition: inline
In-Reply-To: <20220428102608.GU2462@kadam>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--llYjTutXsM3Kb7Ne
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu 28 Apr 22, 13:26, Dan Carpenter wrote:
> On Tue, Apr 26, 2022 at 09:39:03AM +0200, Paul Kocialkowski wrote:
> >=20
> > > Do-everything gotos are the most bug prone style of error handling.
> > > Imagine the function is trying to do three things.  It fails part way
> > > through.  Now you're trying to undo the second thing which was never
> > > done.  Just moments ago I was just looking at one of these do-everyth=
ing
> > > bugs where it was using uninitialized memory.
> >=20
> > So by that you mean having just one label for all error handling instead
> > of labels for each undo step?
> >=20
>=20
> Yes.  Don't do that.  If you try to free everything, half the stuff is
> not allocated so you will undo things which have not been done and it
> leads to a bug.
>
> > I've also seen conditionals used in error labels to undo stuff.
> >=20
>=20
> I don't understand what you're describing?

Typically that would look like:

void *foo =3D NULL;
void *bar =3D NULL;

foo =3D alloc(...);
if (!foo)
	goto single_error;

bar =3D alloc(...);
if (!bar)
	goto single_error;

=2E..

single_error:
	if (bar)
		free(bar);

	if (foo)
		free(foo);

> > Would you recommend duplicating error cleanup in each error condition?
> > It feels like another set of issue on its own, besides the obvious down=
side
> > of duplication.
>=20
> Let me write a blog about it:
>=20
> https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

Good writeup, thanks! The part about unwinding loops especially, I've always
wondered about the right way to go about it.

Cheers,

Paul=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--llYjTutXsM3Kb7Ne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJqgQEACgkQ3cLmz3+f
v9H8zgf/USKoNw7Qr8vIWY2/+HjO33Pop6QIuHHsAlwlS/ThzGh7qy0+ZldEXwEt
Phh7ZRqCl9Y38R7uF2W3dRzOGdq10Ra4wUQUM/zX/TGeSCneOoljbtMoXvaHiZSc
ui9HWxYRLC9QAGU0cDvU4peogw+qbWFG9jqWfxTfxuj6SRK/Lo/Gsd+KHa3rHt+7
sS0k0oarxxVrg5bJaBOrL/yO1THV+e/0buB4zvCUFuGyQ1SBzEyGG8jCg5kw0tCp
gouOJjLf1t/oGPRLNvVq6WywSEMFkR4T96zXuMkn5aB8HaoLndbaSYkC0gXnOTiy
30hHyTS8W5/fOFGguzpbD3XKUqwTUw==
=jQV4
-----END PGP SIGNATURE-----

--llYjTutXsM3Kb7Ne--
