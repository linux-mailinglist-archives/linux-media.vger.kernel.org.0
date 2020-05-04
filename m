Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6A91C3F88
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 18:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbgEDQPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 12:15:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:58364 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbgEDQPK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 12:15:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C539EAEBD;
        Mon,  4 May 2020 16:15:09 +0000 (UTC)
Message-ID: <5f4da16c6964f1885a3d63fb372df2545de1ef11.camel@suse.de>
Subject: Re: [PATCH v2 00/34] Drivers for the BCM283x CSI-2/CCP2 receiver
 and ISP
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 04 May 2020 18:15:06 +0200
In-Reply-To: <20200504153818.GE4365@pendragon.ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <8ef4ab2d73ff9b4d1135ed8362aff2fe0fe21c41.camel@suse.de>
         <20200504153818.GE4365@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Tw7+WzXEwnhXw/wtJ7EL"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-Tw7+WzXEwnhXw/wtJ7EL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-04 at 18:38 +0300, Laurent Pinchart wrote:
> Hi Nicolas,
>=20
> On Mon, May 04, 2020 at 05:15:42PM +0200, Nicolas Saenz Julienne wrote:
> > On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> > > Hello,
> >=20
> > Hi Laurent, thanks for the series!
> > Would you mind CCing on further iterations, I was lucky enough to find =
this
> > referenced in twitter, and I'll be more than happy to review/test it. I=
'm
> > the
> > BCM2711/BCM2835 arm architecture & vc04_services maintainer :).
> >=20
> > An please also CC:
> > bcm-kernel-feedback-list@broadcom.com
> > linux-rpi-kernel@lists.infradead.org
> > linux-arm-kernel@lists.infradead.org
>=20
> Sure. I was so focussed on the userspace part and on getting everything
> ready for today's release that I completely forgot to run the patches
> through get_maintainers.pl and CC the appropriate people and lists.
> Sorry about the oversight, I'll make sure to fix it next time.

No worries!

> Speaking of BCM2711/BCM2835 maintenance... :-) This series isn't
> complete as it's missing full DT integration of camera sensor modules.
> This is handled through DT overlays in the Raspberry Pi downstream
> kernel, which are applied to the base DT by the boot loader (a neat
> solution in my opinion). I wonder what we should do for mainline.
> Ideally we should be able to at least use the DT overlays from the
> downstream Raspberry Pi kernel on mainline, but that's not possible
> today due to incompatibilities in the base DT (in particular related to
> the I2C port to which the camera sensors are connected). Dave, have you
> given that a thought by any chance ?

Could you point out the specific overlays? I'd suggest to add an example in=
 the
bindings and/or sending a 'not to be picked-up' patch to the mailing lists
showing how it's meant to work. That way people messing with that interface=
 can
at least find it and work from there. See here for example Eric Anholt deal=
ing
with a similar issue as yours https://lkml.org/lkml/2016/12/14/483. I can't=
 say
for other distributions, but in openSUSE we try to support the downstream
overlays.

BTW, is the I2C issue you mention related to this downstream patch
5bb4694516761 ('dt: Implement an I2C pinctrl mux for BSC0')?

> Another more general question for Nicolas, is there a plan to try and
> get vc04_services out of staging ?

There's noone going at it seriously. I try to make the occasional cleanup h=
ere
and there, and the occasional patch might show up. But that's the extent of=
 it.
I'm interested in biting the bullet but I've been fairly busy.

Maybe this series can motivate people into investing more time into it :).

Regards,
Nicolas



--=-Tw7+WzXEwnhXw/wtJ7EL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6wP4oACgkQlfZmHno8
x/5muQgAt2YWufn6/NQxEgQxdrI3fcczhpO3VhS2DlUYQ2arf8eH0m3iHLKK/Jht
LH/Sd3OYn43NdU+U6i+dRpBNQRg+PUtFUW5Jm7eDRCG90+ozAOFqtZZcXYoJdPgF
ux7jfd2CTT572PY6oL6U3FmfnIrGFQnH/hQOON/mxIarywmkUZOnN2UHFiq3BIUc
jWGi7p3dkfR5vkLBkVYE2tFbbl+g05HAtN/RaJOoO0ovpCdO3Z20hgsqKa2QRy2D
MYo7jMf6lQfNdWC8kewSCuZ0Omo85Ic+lQ3mex4CvGH4CgBC9t4vMroeDvzmIbCy
CZqIr45wEbdd0s6ntr/F2RvWI/Vuzw==
=C68s
-----END PGP SIGNATURE-----

--=-Tw7+WzXEwnhXw/wtJ7EL--

