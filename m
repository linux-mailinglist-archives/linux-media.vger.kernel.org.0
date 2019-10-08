Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A098CF48F
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 10:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730492AbfJHIGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 04:06:38 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:32853 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730414AbfJHIGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 04:06:37 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 813F58048C; Tue,  8 Oct 2019 10:06:20 +0200 (CEST)
Date:   Tue, 8 Oct 2019 10:06:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191008080634.GC633@amd>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd>
 <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-10-08 09:58:28, Jacopo Mondi wrote:
> Pavel,
>=20
> On Tue, Oct 08, 2019 at 09:40:52AM +0200, Pavel Machek wrote:
> > On Mon 2019-10-07 18:29:03, Jacopo Mondi wrote:
> > > Add the 'location' device property, used to specify a device mounting
> > > position. The property is particularly meaningful for mobile devices
> > > with a well defined usage orientation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++=
++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces=
=2Etxt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > index f884ada0bffc..1211bdf80722 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > @@ -89,6 +89,17 @@ Optional properties
> > >    but a number of degrees counter clockwise. Typical values are 0 an=
d 180
> > >    (upside down).
> > >
> > > +- location: The mount location of a device (typically an image senso=
r or a flash
> > > +  LED) expressed as a position relative to the usage orientation of =
the system
> > > +  where the device is installed on.
> > > +  Possible values are:
> > > +  0 - Front. The device is mounted on the front facing side of the s=
ystem.
> > > +  For mobile devices such as smartphones, tablets and laptops the fr=
ont side is
> > > +  the user facing side.
> > > +  1 - Back. The device is mounted on the back side of the system, wh=
ich is
> > > +  defined as the opposite side of the front facing one.
> > > +  2 - External. The device is not attached directly to the system bu=
t is
> > > +  attached in a way that allows it to move freely.
> >
> > I explained why this is not enough, and it did not change.
>=20
> I replied to your email and you did not answered back.
>=20
> I appreciate constructive inputs but just NAK, or throwing a proposal
> without following up as you did, doesn't help much in improving the end
> result.
>=20
> I'll paste here my previous reply, so you get a chance to continue the
> discussion. Please follow up if you're interested in contributing.

Yes, you are basically saying someone can solve those problems in
future :-(.

I'd add note that for camera-style devices, main sensor would be the
"back" one, and that for phones, selfie sensor should be marked as a
"front" one.

Plus, I believe you need to add a value for moving sensors, as there
are already devices that use same sensor for "front" and "back".

								Pavel


> ------------------------------------------------------------------------
> > I don't think this is nearly enough of description. We have phones
> > with displays and cameras at both sides, where both sides can be used
> > to operate the system.
> >
> > We have phone with display spanning both sides -- Mi Max.
> >
> > https://www.idnes.cz/mobil/telefony/xiaomi-mi-mix-alpha-predstaveni.A19=
0924_105858_telefony_oma
> >
> > We have Galaxy Fold.
> >
> > https://www.samsung.com/global/galaxy/galaxy-fold/
> >
> > What is front side when device can be used in different
> > configurations?
> >
> > Could we instead say that it is "main" vs "selfie" camera?
>=20
> I'm not sure the intended usage is something that belongs to DT. And
> 'selfie' implies you have a device side facing you, most like the
> 'front' one I have defined here.
>=20
> Not to mention again this devices are all but supported by mainline,
> which is just a partial justification as they might be an indication
> of a trend.
>=20
> There is no usable reference place, reference side, reference usage
> mode that applies to -all- devices in the world, not one I can think
> of.
>=20
> I still think defining a location property is not blocking any new
> extension that accommodate more advanced use cases. It's not like we're
> adding a "front-camera" property, it's a "location" and you can expand
> its accepted values with "front-when-device-folded" or whatever you
> need for future devices.
>=20
> In the description I mentioned the "usage orientation" to leave room
> for possible device-specific details in the definition of the values
> accepted by the property.
>=20
> > > +  location expressed as a position relative to the usage orientation=
 of the
> > > +  system where the device is installed on.
>=20
> 99% of devices in the world have a front and a back, as well as they
> have a top and a bottom. I still don't see why if a device does not
> simply has a front it cannot use something different. The property
> definition allows you to do so.
>=20
> ------------------------------------------------------------------------
>=20
> >
> > NAK.
> > 									Pavel
> >
> > --
> > (english) http://www.livejournal.com/~pavelmachek
> > (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
>=20
>=20



--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2cQ4oACgkQMOfwapXb+vJaAACfTYlck7TgLV+zJAseGNT2DE68
h0AAoKMRQFAyEou1K4F59k19uhkiCDiv
=iauj
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
