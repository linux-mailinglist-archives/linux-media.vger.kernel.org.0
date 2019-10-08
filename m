Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 835FECF4D5
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 10:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbfJHIS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 04:18:59 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:35133 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730457AbfJHIS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 04:18:59 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5F6FF6000B;
        Tue,  8 Oct 2019 08:18:55 +0000 (UTC)
Date:   Tue, 8 Oct 2019 10:20:41 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191008082041.476a2soclry6qn3v@uno.localdomain>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd>
 <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
 <20191008080634.GC633@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gwuqoit774htqzpv"
Content-Disposition: inline
In-Reply-To: <20191008080634.GC633@amd>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gwuqoit774htqzpv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 08, 2019 at 10:06:34AM +0200, Pavel Machek wrote:
> On Tue 2019-10-08 09:58:28, Jacopo Mondi wrote:
> > Pavel,
> >
> > On Tue, Oct 08, 2019 at 09:40:52AM +0200, Pavel Machek wrote:
> > > On Mon 2019-10-07 18:29:03, Jacopo Mondi wrote:
> > > > Add the 'location' device property, used to specify a device mounting
> > > > position. The property is particularly meaningful for mobile devices
> > > > with a well defined usage orientation.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > index f884ada0bffc..1211bdf80722 100644
> > > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > @@ -89,6 +89,17 @@ Optional properties
> > > >    but a number of degrees counter clockwise. Typical values are 0 and 180
> > > >    (upside down).
> > > >
> > > > +- location: The mount location of a device (typically an image sensor or a flash
> > > > +  LED) expressed as a position relative to the usage orientation of the system
> > > > +  where the device is installed on.
> > > > +  Possible values are:
> > > > +  0 - Front. The device is mounted on the front facing side of the system.
> > > > +  For mobile devices such as smartphones, tablets and laptops the front side is
> > > > +  the user facing side.
> > > > +  1 - Back. The device is mounted on the back side of the system, which is
> > > > +  defined as the opposite side of the front facing one.
> > > > +  2 - External. The device is not attached directly to the system but is
> > > > +  attached in a way that allows it to move freely.
> > >
> > > I explained why this is not enough, and it did not change.
> >
> > I replied to your email and you did not answered back.
> >
> > I appreciate constructive inputs but just NAK, or throwing a proposal
> > without following up as you did, doesn't help much in improving the end
> > result.
> >
> > I'll paste here my previous reply, so you get a chance to continue the
> > discussion. Please follow up if you're interested in contributing.
>
> Yes, you are basically saying someone can solve those problems in
> future :-(.

Not really, what I'm saying is that the property definition itself
leaves space for future extensions. As of now the accepted property
values cover the most trivial use case, but they can be expanded to
accommodate more complex setups, possibly with an extended parameters
list (in example something like "movable" with an associated rotation
matrix). In any case, I don't think we're tying anyone's hands by
adding this new property with the most basic locations that covers
99% of devices.

>
> I'd add note that for camera-style devices, main sensor would be the
> "back" one, and that for phones, selfie sensor should be marked as a
> "front" one.

I'm not sure if 'main' or 'selfie' as concepts belongs here at all. I
just want to report where the camera is installed, not the intended
usage.

The most common use case is to make simple for application to pick one
of the cameras based on the position. The front camera in a phone will
likely be for selfies, but in a laptop will mostly be for
'videoconference' or whatever. This is a definition that totally
belongs to userspace, and kernel should just report the mounting
location and that's it.

>
> Plus, I believe you need to add a value for moving sensors, as there
> are already devices that use same sensor for "front" and "back".

I'm skeptical about adding now a property for a device that we don't
support, because we -now- think it's a good idea. I might be wrong,
but my assumption is that when someone will want to support an
'advanced' device, it's easy to add "movable" or whatever else to the
list of accepted properties values. Am I wrong in assuming this? As
long as "front" "back" and "external" will stay supported for backward
DTB compatibility it should be fine, right ?

Thanks
   j

>
> 								Pavel
>
>
> > ------------------------------------------------------------------------
> > > I don't think this is nearly enough of description. We have phones
> > > with displays and cameras at both sides, where both sides can be used
> > > to operate the system.
> > >
> > > We have phone with display spanning both sides -- Mi Max.
> > >
> > > https://www.idnes.cz/mobil/telefony/xiaomi-mi-mix-alpha-predstaveni.A190924_105858_telefony_oma
> > >
> > > We have Galaxy Fold.
> > >
> > > https://www.samsung.com/global/galaxy/galaxy-fold/
> > >
> > > What is front side when device can be used in different
> > > configurations?
> > >
> > > Could we instead say that it is "main" vs "selfie" camera?
> >
> > I'm not sure the intended usage is something that belongs to DT. And
> > 'selfie' implies you have a device side facing you, most like the
> > 'front' one I have defined here.
> >
> > Not to mention again this devices are all but supported by mainline,
> > which is just a partial justification as they might be an indication
> > of a trend.
> >
> > There is no usable reference place, reference side, reference usage
> > mode that applies to -all- devices in the world, not one I can think
> > of.
> >
> > I still think defining a location property is not blocking any new
> > extension that accommodate more advanced use cases. It's not like we're
> > adding a "front-camera" property, it's a "location" and you can expand
> > its accepted values with "front-when-device-folded" or whatever you
> > need for future devices.
> >
> > In the description I mentioned the "usage orientation" to leave room
> > for possible device-specific details in the definition of the values
> > accepted by the property.
> >
> > > > +  location expressed as a position relative to the usage orientation of the
> > > > +  system where the device is installed on.
> >
> > 99% of devices in the world have a front and a back, as well as they
> > have a top and a bottom. I still don't see why if a device does not
> > simply has a front it cannot use something different. The property
> > definition allows you to do so.
> >
> > ------------------------------------------------------------------------
> >
> > >
> > > NAK.
> > > 									Pavel
> > >
> > > --
> > > (english) http://www.livejournal.com/~pavelmachek
> > > (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> >
> >
>
>
>
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany



--gwuqoit774htqzpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2cRtkACgkQcjQGjxah
Vjza0RAAhq/Hk/zypcj0X7qsJcYIk34lu5MbV2GzxshDTexA+t9j3zti70wTruDG
DeW/Nx36oz8VPsA3IF+4d31e91I92JYxb2eUhInr7+0seXJ5ktY8foqHqm4QKnVT
clQJbdRpxSszHJ0cJurLCUlSAwyHYVQkAFCBoY2wtfHSumsUNg2x+hlPkdMh1689
XDh/jtxV5DRYelNPswBpH+RVU2+pCNRpETCleoVwmgqc6iw33/Qe5Be2rYOdQAws
gyxFosAVfxTC3CLHrI1OKCNkeJZxIX+qBn9wqiJpu4/FmYWbMKWgK1QTGomSKQWY
u7gTWR4l/DaBxJC+OeyQpC/3Ux3a/cjn8z2KhEmw4swTkNIbku2ue/z2KkBYKTJ/
LsVXeqjFCzgokYL0kXKJ6pX/2Xlc6c1UOBOvOgoekAIb4YpMbA1oYOFot7iQQ4Wy
keeOle6+Gc5z9BEPeYNdhLHBgvK1dQ7neQWx8Ts2tM4oZ5Uy4/FS2QnwtLRete9B
Ki5ox8ok3HslLI3i+DFjfB8UgHgi0wGkALD+WWBhlrq72uhOyK75a+7M6+2C042W
NknUCGsFwMltlgCmXxd1LfeWk8BZ4+3rP8m0oS5jeTzisuseOH0Fy3qINVIWiXiV
xr/gJPiRRriTxOmVdROcM3EB2B33Mu/xFRZOyWrkuTw+S6H10fA=
=cKwC
-----END PGP SIGNATURE-----

--gwuqoit774htqzpv--
