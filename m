Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B00CF459
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 09:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730384AbfJHH4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 03:56:46 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55717 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730177AbfJHH4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 03:56:46 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 84C1520005;
        Tue,  8 Oct 2019 07:56:42 +0000 (UTC)
Date:   Tue, 8 Oct 2019 09:58:28 +0200
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
Message-ID: <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="imyyzy3pvolqtq3x"
Content-Disposition: inline
In-Reply-To: <20191008074052.GA633@amd>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--imyyzy3pvolqtq3x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Pavel,

On Tue, Oct 08, 2019 at 09:40:52AM +0200, Pavel Machek wrote:
> On Mon 2019-10-07 18:29:03, Jacopo Mondi wrote:
> > Add the 'location' device property, used to specify a device mounting
> > position. The property is particularly meaningful for mobile devices
> > with a well defined usage orientation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index f884ada0bffc..1211bdf80722 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -89,6 +89,17 @@ Optional properties
> >    but a number of degrees counter clockwise. Typical values are 0 and 180
> >    (upside down).
> >
> > +- location: The mount location of a device (typically an image sensor or a flash
> > +  LED) expressed as a position relative to the usage orientation of the system
> > +  where the device is installed on.
> > +  Possible values are:
> > +  0 - Front. The device is mounted on the front facing side of the system.
> > +  For mobile devices such as smartphones, tablets and laptops the front side is
> > +  the user facing side.
> > +  1 - Back. The device is mounted on the back side of the system, which is
> > +  defined as the opposite side of the front facing one.
> > +  2 - External. The device is not attached directly to the system but is
> > +  attached in a way that allows it to move freely.
>
> I explained why this is not enough, and it did not change.

I replied to your email and you did not answered back.

I appreciate constructive inputs but just NAK, or throwing a proposal
without following up as you did, doesn't help much in improving the end
result.

I'll paste here my previous reply, so you get a chance to continue the
discussion. Please follow up if you're interested in contributing.

------------------------------------------------------------------------
> I don't think this is nearly enough of description. We have phones
> with displays and cameras at both sides, where both sides can be used
> to operate the system.
>
> We have phone with display spanning both sides -- Mi Max.
>
> https://www.idnes.cz/mobil/telefony/xiaomi-mi-mix-alpha-predstaveni.A190924_105858_telefony_oma
>
> We have Galaxy Fold.
>
> https://www.samsung.com/global/galaxy/galaxy-fold/
>
> What is front side when device can be used in different
> configurations?
>
> Could we instead say that it is "main" vs "selfie" camera?

I'm not sure the intended usage is something that belongs to DT. And
'selfie' implies you have a device side facing you, most like the
'front' one I have defined here.

Not to mention again this devices are all but supported by mainline,
which is just a partial justification as they might be an indication
of a trend.

There is no usable reference place, reference side, reference usage
mode that applies to -all- devices in the world, not one I can think
of.

I still think defining a location property is not blocking any new
extension that accommodate more advanced use cases. It's not like we're
adding a "front-camera" property, it's a "location" and you can expand
its accepted values with "front-when-device-folded" or whatever you
need for future devices.

In the description I mentioned the "usage orientation" to leave room
for possible device-specific details in the definition of the values
accepted by the property.

> > +  location expressed as a position relative to the usage orientation of the
> > +  system where the device is installed on.

99% of devices in the world have a front and a back, as well as they
have a top and a bottom. I still don't see why if a device does not
simply has a front it cannot use something different. The property
definition allows you to do so.

------------------------------------------------------------------------

>
> NAK.
> 									Pavel
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



--imyyzy3pvolqtq3x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2cQaQACgkQcjQGjxah
VjyIMw//ZZNqxfh5k76itXoBHUAuQVP6hjdVPFc5F4gDNuQGQBLCMKjle0S7VL6+
QArGv3LyTJGQeKT0Dq9eW8tbZQcq2OejYpXmv6TAshKAMItYEq82MNopVoXBC2/b
PFBVJAbBOXcz1ITVErQ4bu48r5Oo0M2yeuM5R04/ls1u38MDGEJBb4yWvrQRFSQY
akIvlPz+A/ySeci6k2Vgbhc5q4RMFEWgQtBjMBeuVgs+EFnMMBdjx+eo9SF2O88a
qB58OSBkNoK6UY2pZ71aWpBFU8pW89WIbgtwKq4P++HHicp0NLzWggeEbEoO0ZRE
JBipLiawhejzNGxGHa5N2agqkNUBMG2Pl/mXkU5zef46bI0pX7tgHretDpKlRYVP
Ah/+ZV1hMH2YmbE6PZ23d9A6YLlnBooK9Hg3w3NpzY/ijOCRFS+d/5qmGUI81x5A
mddXdyp2aTcLMcIIggTd1OGQCRP7SRV8fGcE/wL9+AjFYkLZ4qC6guBNaewZ9Oqn
am45S+Xics77vF7vH3R7Cp7MS5yTsYepNcp/NR2qS9FwjeWmwRSf35GyMhE/v22A
Vs+dj+k8gFwYWIqgpaRnt0pjwDKXiXHqw5d/gxwua09/5nyvquvYFcdDZnNgL1pI
hNnvnYR2hioHxEB1Obg5it01Lfcb6JLj7+OPal6+zOMV+6Hqr10=
=n85u
-----END PGP SIGNATURE-----

--imyyzy3pvolqtq3x--
