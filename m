Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 750B4C10E6
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2019 14:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfI1MqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Sep 2019 08:46:25 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36243 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfI1MqY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Sep 2019 08:46:24 -0400
X-Originating-IP: 79.19.63.71
Received: from uno.localdomain (host71-63-dynamic.19-79-r.retail.telecomitalia.it [79.19.63.71])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7159FE0003;
        Sat, 28 Sep 2019 12:46:19 +0000 (UTC)
Date:   Sat, 28 Sep 2019 14:48:01 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20190928124801.q7h3jml3uqxorwze@uno.localdomain>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-2-jacopo@jmondi.org>
 <20190927152745.GA23113@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uqjl4oaob5an46il"
Content-Disposition: inline
In-Reply-To: <20190927152745.GA23113@amd>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--uqjl4oaob5an46il
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Pavel,
   thanks for input

On Fri, Sep 27, 2019 at 05:27:45PM +0200, Pavel Machek wrote:
> Hi!
>
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
> > index f884ada0bffc..e71b90a29d7a 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -89,6 +89,17 @@ Optional properties
> >    but a number of degrees counter clockwise. Typical values are 0 and 180
> >    (upside down).
> >
> > +- location: The device, typically an image sensor or a flash LED, mounting
> > +  location expressed as a position relative to the usage orientation of the
> > +  system where the device is installed on.
> > +  Possible values are:
> > +  0 - Front. The device is mounted on the front facing side of the system For
> > +  mobile devices such as smartphones, tablets and laptops the front side is the
> > +  user facing side.
>
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

>
> Notebooks usually have just "selfie" camera, tablets often have
> both... DSLRs have just "main" camera.
>
> Best regards,
>
> 									Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



--uqjl4oaob5an46il
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2PVoEACgkQcjQGjxah
VjzVwg/9GtebVm4JTnsXoysCORM++4THPFOcYKouY/E4uZRVxqlnAc7x7MRIqTQt
5De0iJJJwR6RM7iPtXbbeXuwnoShr2T8GqS3kAYVr6WmbHsrJ/eL7LEqietgsPii
nnN0dGv3v6vbSWxrtshyxF3iwLohx7ecKiJxqtZ3ajcMvwPmkCyp185VSGtK7qyC
S0yyP58ixWtnUo+FfKR3F5P9L2HCNjacX6WLKIAsO96j9RQyPjElNSEQQJuqpMpt
wyZ1YGQW8OADrFsVzi69aRRtFuBOsjj7tXvB6KCLS6wdXQL0hfdB7VElWxjeCIEf
ChSVg0fDyZFW2NAEhwd1opSSI0Xxd4/UecAuwQS9aQT0JWKfr0JQQ9tfVVpMC+8F
LmyeFo9DmDF60Euwr4aebGSkLBZFcWPmk3MKSl8DLubiFPU45ZV+SCOc98V4stbN
4ofhlXMTs2ERLFbGTNqW6UOa7/2xMV2Qu2kM/l9uRFOklwQvS+4g3APZ/P4khzZa
CSPTRxUHm99Qm5wqpGvhqDX5wO3I0zra5Cr251l3alUHahuIlH4USxd0Qv6eIKHp
2CBQ0achVkENFPPIEqOyrS0f4F1dA10jf3d9O8puKj0krTicXkAyIvrBM+gUb9A+
XIfXOKoZ9afYJUPMwqjP++xbpWA0sMsJyiURM0CeUfjHBtkXpwI=
=0fCI
-----END PGP SIGNATURE-----

--uqjl4oaob5an46il--
