Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63810A518D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 10:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbfIBI1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 04:27:42 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35701 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbfIBI1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 04:27:42 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 2273A821DA; Mon,  2 Sep 2019 10:27:26 +0200 (CEST)
Date:   Mon, 2 Sep 2019 10:27:39 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190902082739.GE15850@amd>
References: <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
 <664fe7b3-9051-30da-736e-710a4e9cecde@xs4all.nl>
 <d60e4664-3a3f-1723-6c96-4fc822b6a7bb@xs4all.nl>
 <20190815143423.vaoswb4jvzd2blxp@uno.localdomain>
 <cb36e8a0-b941-ff37-e58c-0f9b7f62116a@xs4all.nl>
 <20190901172457.GC1047@bug>
 <20190902080002.GC4777@pendragon.ideasonboard.com>
 <20190902080657.GC15850@amd>
 <20190902081942.GE4777@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline
In-Reply-To: <20190902081942.GE4777@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-09-02 11:19:42, Laurent Pinchart wrote:
> On Mon, Sep 02, 2019 at 10:06:57AM +0200, Pavel Machek wrote:
> > >>> Single integer. It's read-only, so it just reports the location.
> > >>>=20
> > >>> It would be different if this was a writable control: then you need=
 to
> > >>> know which locations are possible to set, and that requires a menu =
type.
> > >>>=20
> > >>> But it doesn't make sense to set the location from software. Howeve=
r, the
> > >>> location might change as a result of other changes: e.g. if the cam=
era
> > >>> has motor control of the tilt and the tilt changes from forward fac=
ing to
> > >>> downward facing, then the driver might change the location from FRO=
NT
> > >>> to DOWN. A convoluted example perhaps, but this is just brainstormi=
ng.
> > >>=20
> > >> There are phones with exactly such camera setup. And yes, it makes
> > >> sense to be writable in that case, as software can move the camera in
> > >> such case.
> > >=20
> > > Out of curiosity, what phones are those ?
> >=20
> > This one:
> >=20
> > https://www.samsung.com/global/galaxy/galaxy-a80/
>=20
> Interesting device. I'm not sure we should control that through a
> location control though, as it seems there's more than the rotation of
> the camera involved. In any case I wouldn't care about it for now, and
> turn the location control from read-only to read-write later if needed.
> We need more information and more thought to support that use case.

Well, the mechanism is there just to rotate the camera.

Anyway, that phone is probably nowhere close to having mainline
support, so...

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1s0nsACgkQMOfwapXb+vLK8wCeOolmxDwSiEfrrMCLr1uKyMwC
x7oAnj1SKkwBc++DIAb84Xp8unM2RoHV
=noqu
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
