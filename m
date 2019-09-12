Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4128B12D5
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 18:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733242AbfILQfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 12:35:12 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:58153 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbfILQfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 12:35:12 -0400
Received: from uno.localdomain (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2FC86100015;
        Thu, 12 Sep 2019 16:35:07 +0000 (UTC)
Date:   Thu, 12 Sep 2019 18:36:40 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
Message-ID: <20190912163640.gacucembu63nudku@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-2-jacopo@jmondi.org>
 <20190827122126.GQ5054@pendragon.ideasonboard.com>
 <20190912095120.4a592631@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ygzrvf6kbmbtj5sc"
Content-Disposition: inline
In-Reply-To: <20190912095120.4a592631@coco.lan>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ygzrvf6kbmbtj5sc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro,

On Thu, Sep 12, 2019 at 09:51:47AM -0300, Mauro Carvalho Chehab wrote:
> Em Tue, 27 Aug 2019 15:21:26 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> > > Add the 'location' device property, used to specify the camera device
> > > mounting position. The property is particularly meaningful for mobile
> > > devices with a well defined usage orientation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > index f884ada0bffc..865f4142f432 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > @@ -89,6 +89,16 @@ Optional properties
> > >    but a number of degrees counter clockwise. Typical values are 0 and 180
> > >    (upside down).
> > >
> > > +- location: The camera sensor mounting location, expressed as a position
> > > +  relative to the usage orientation of the device the sensor is installed on.
> >
> > DT bindings being ABIs, we need to be precise and thorough there. One
> > particular point that bothers me is that the property is named location,
> > and its description refers to camera sensor mounting location.
>
> Yeah, "location" doesn't sound a good name for me neither.
>

I think Laurent referred to the fact that as we changed the property
name to 'location' it is not a good idea to refer to 'camera sensor'
as it could refer to flash leds too (and potentially other devices).

In v3 I have
s/camera sensor/device
s/device/system

How would you name the property?

> >
> > I see two options to fix this. One of them is to rename the property to
> > camera-location, but that would limit its future usage for other types
> > of devices. The other one is to document the property as applying to a
> > "device" instead of a "camera sensor", and add one sentence stating that
> > this property is valid for camera sensors only.
> >
> > This will require finding another name for the device that the device is
> > mounted on though, as using device twice would be very confusing.
> >
> > > +  Possible values are:
> > > +  0 - Front. The image sensor is mounted on the front facing side of the device.
> > > +  For mobile devices such as smartphones, tablets and laptops the front side is
> > > +  the user facing side of the device.
> > > +  1 - Back. The image sensor is mounted on the back side of the device, which is
> > > +  defined as the opposite side of the front facing one.
> > > +  2 - External. The image sensor is connected to the device by extension cables,
> > > +  and can be freely moved, regardless of the device position.
>
> Hmm...
>
> Besides the point that Laurent and Rob already commented, just those 3 options
> doesn't seem good enough. I was reading a public article yesterday about a new
> device (Samsung Galaxy Fold[1]) with comes with 6 cameras, being 3 at back,
> 1 at front, when the device is opened, and 1 camera that could be either at the
> back or at the front, depending if the device is opened or not.
>

Pavel linked a similar device in a previous reply:
https://www.samsung.com/global/galaxy/galaxy-a80/

I understand the above options might not get enough in future, but
right now they cover the 99,9% of devices in the market, and those
phones are far from being mainline supported I presume.

> Btw, on a device with multiple cameras at the same side, it would
> make sense to also be able to uniquely identify the location of each
> sensor somehow.
>

I think the location property should not identify devices, but just
report where they are installed. Does having two cameras reporting the
same mounting location bother you?


> There are also some other new devices with a front motorized slider camera
> that sits hidden inside the phone, until when someone uses it.
>

So it's an HIDDEN_FRONT_CAMERA ? :)

Thanks
   j


> Thanks,
> Mauro

--ygzrvf6kbmbtj5sc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl16dBgACgkQcjQGjxah
Vjx9ixAAr4KSp2m0hEzIyNtcMrjjiEZaRADD4azwXYMQrm4v6ZCr56vlZff6i37z
MoqJ/QNxf3cKMkiBgfTIfmP2GryFVGzhu2CpOJ0T33FcTuJ7x5JBZaGKNCfy5kZs
4ODxynf9BZkWAPwT5/f2KybvbwO+8OD4PC09eAOEqOpsxwS75nWzjJ+aKzeT2WaG
XM4aUP5zDKTXDhRYCzpW6gABHKv4+DFqDtyz3S2K8oYceGaIISiG0xY9k7HYkg3/
VyD0cYAoPIq1+OFRI4i/XzMSRuAOIjX1bq1KrMXJ7QeBEFF21eknhy20ZiyRymjA
fenVjSDGRYNs+me1K5X3wF7KOa5yeYQGZ/WL6y4fTx0C2o+pLZI6qDTGSs4ps8QN
qQ8Nqxo/GmE4jcA1CWntZ1WxEE01fBSIEZjzKhAgrh//jQ127aovSBdVLngFrbhl
RU0hi8gpIWRE1r7lQJAYeIm35ftkOA69uCmvldK1aark2cOKWRN3UuBZd4H9EJXU
xuk9626CYOzNWiEoUbioXsMVDp69MbB6NBF2Ukqy3UmZXvi1m1Sh3WMHDMZY2Jel
NraE5ll86JGX+aYunB/br5R2kDSx7JB2jl6QMVWZ/afiKzmsYFYN0+1OW6B67x/O
raZCNVroouTwqpHoEzC4tRwKndIByTBzSlmcoydSjJ7A0fY1UOI=
=A7Hw
-----END PGP SIGNATURE-----

--ygzrvf6kbmbtj5sc--
