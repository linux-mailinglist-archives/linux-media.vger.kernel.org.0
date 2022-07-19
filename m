Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5B7579E33
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 14:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242574AbiGSM6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 08:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242513AbiGSM6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 08:58:23 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12565E31E
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 05:23:31 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0A76320000B;
        Tue, 19 Jul 2022 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658233410;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ig6fOBUlH3qXjXoBOvjQi/M2vXTIutRmeAX+v+XwOwQ=;
        b=goIDegxAwLy4L7FN6xC8K+oG7eR/yVVNPI7koMoZp4mY49Glneb0LGCKq7lvdnLPHSvzZC
        0qa7973gIJkB1xImGL32H++ZJVxrUh155UltHqRp/K+zTHPKdBM8zmVkPMM9b+ntN3UCLj
        Dw7N+0TdRSCutDLlFbhRt8kuRG5sXvRjWeJqQrhnQK4vLGoJj8+Pd6k0mP6p/agPWRedc8
        hgKewu89knYB3evw8GZN7sstRd+JuwRbYnzloxWQVjVn5yOrVnZFKDi+X5FqkZ17PZFeh7
        R25uhvIvCaKIAcsbqj1Gv24/32uXlQgKqEBg13rhvJ8PZ0Ll1CRRbswtha6aSQ==
Date:   Tue, 19 Jul 2022 14:23:27 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Message-ID: <YtaiPx4Bfqt4mXRK@aptenodytes>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2iQTS7Kk1LviHReT"
Content-Disposition: inline
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2iQTS7Kk1LviHReT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Fri 15 Jul 22, 10:15, Hans Verkuil wrote:
> Hi all,
>=20
> The Linux Foundation organized a meeting room for us to use on Monday Sep=
tember 12
> at the Convention Centre Dublin. It is co-located with the Open Source Su=
mmit Europe,
> see https://events.linuxfoundation.org/open-source-summit-europe/ for mor=
e info.
>=20
> To attend this Media Summit no registration is required for the OSSE, but=
 you do need
> to register with me by sending me an email. There is a maximum of 20 part=
icipants.

Thanks for organizing this!

I'm interested in addenting too, but can give up the seat if there's too ma=
ny
people in already.

Cheers,

Paul

> I send out a request for topics in May and got quite a few replies:
>=20
> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.came=
l@ndufresne.ca/T/
>=20
> If you have more ideas for topics, then reply either to that message (pre=
ferred) or this
> one.
>=20
> See here for more details about the conference:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/
>=20
> It is primarily meant for media developers to meet face-to-face. Whether =
there will
> be a possibility to participate remotely is not certain at this time. Pas=
t experience
> shows that meetings like this are a poor fit for remote attendance, unles=
s you have
> a meeting room that is designed for such purposes, which we don't have.
>=20
> The actual agenda will depend on who will attend, I hope to be able to pu=
t that
> together around mid August. But the link above with the 'Request for Topi=
cs' thread
> will give a good indication of what to expect.
>=20
> So, if you want to attend, then let me know by email. Please reply as soo=
n as possible,
> even if you are not entirely certain yet if you can attend.
>=20
> The health and safety regulations will be those of the OSSE LF:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/attend/healt=
h-and-safety/
>=20
> Code of conduct:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-=
of-conduct/
>=20
> A final note: the total cost is at most $650 (depends on the number of pe=
ople):
> that's for a whiteboard, powerstrips and refreshments (coffee, tea, soda,=
 water).
>=20
> It would be nice if this can be sponsored by one or more companies. I'll =
ask
> my manager if Cisco can contribute to this (once he's back from vacation)=
, but
> if other companies want to contribute as well, then let me know and we can
> split the bill. And start off the meeting with a nice slide saying: "Spon=
sored by:".
>=20
> Regards,
>=20
> 	Hans

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--2iQTS7Kk1LviHReT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmLWoj8ACgkQ3cLmz3+f
v9F/nAf/TvBAN67wfgWNEjBI5CC+WdmGSKsx/PUiXxB6h+6dXvzW0Rg2osu6HWBM
FFt+30mKnn8wIN8oBvGOLx0r3XCE+UJSi6vguYuGwGwngd1/hTCC6kBBdzRSDdVO
oay1Qq9y4HbXyYCNn3BL2rM0RBR1PaPDgEHbTLTmM3UYiMN+llI/vT0ils88pt1r
KJNDgeWOzZYZyg/XngEBSoaboWscSCUZ5/GDEHG7DojE4HIitoISImcUrxzIweCM
YoB6qbCcUI25YO0Pu3OjK5M+qisc4WbP/kWSRSgWqqrbt6sqAQUe6Sbl6AvMt1sV
7WbtyXWIIhftYl3oGO91GUet4mkzAA==
=Pub/
-----END PGP SIGNATURE-----

--2iQTS7Kk1LviHReT--
