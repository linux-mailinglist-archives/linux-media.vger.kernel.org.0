Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDEEA50FC
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 10:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbfIBIL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 04:11:28 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60414 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729771AbfIBIL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 04:11:28 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 06F08821C8; Mon,  2 Sep 2019 10:11:11 +0200 (CEST)
Date:   Mon, 2 Sep 2019 10:11:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Message-ID: <20190902081125.GD15850@amd>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
 <20190815065635.GJ6133@paasikivi.fi.intel.com>
 <20190901172414.GB1047@bug>
 <20190902080211.GD4777@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline
In-Reply-To: <20190902080211.GD4777@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-09-02 11:02:11, Laurent Pinchart wrote:
> Hi Pavel,
>=20
> On Sun, Sep 01, 2019 at 07:24:15PM +0200, Pavel Machek wrote:
> > > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > @@ -89,6 +89,10 @@ Optional properties
> > > >    but a number of degrees counter clockwise. Typical values are 0 =
and 180
> > > >    (upside down).
> > > >=20
> > > > +- location: The camera device mounting position, relative to the d=
evice
> > > > +  usage orientation. Possible values are:
> > > > +  0 - Front camera. The image sensor is mounted on the front side =
of the device.
> > > > +  1 - Back camera. The image sensor is mounted on the back side of=
 the device.
> > >=20
> > > Would it make sense to make this a little more generic? Such as s/ima=
ge
> > > sensor/ device/, for instance?
> > >=20
> > > Is this also relevant for flash or lens devices?
> > >=20
> > > Flash (torch) devices could be present, at least principle, without a
> > > camera. There once was even such a Nokia phone, 1100 unless I'm mista=
ken.
> > > :-)
> >=20
> > Well, I'd call them LEDs, not camera flashes ... if there's no camera. =
And IIRC=20
> > these devices had LEDs on top of the phone... so neither front nor back=
 side.
>=20
> I would go for the name "torch" in that case. It really depends on the
> device, but in any case, the torch LEDs would have a location (and we
> would possibly need to expand this property to
> include the top, bottom, left and right sides).

Yes, but please let the torch devices be handled by LED subsystem
(/sys/class/leds). media/ subsystem is a bit too big and complex for
toggling LEDs on and off...

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1szq0ACgkQMOfwapXb+vKnHQCgjekAFWoxQmyBJvoBF9kp1qOf
E/0AoKfpZkQ0lr19PAOslOpMFN75pBfR
=f3wG
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--
