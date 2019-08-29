Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 780F4A1A5C
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 14:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfH2MpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 08:45:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58973 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfH2MpL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 08:45:11 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 18781C000C;
        Thu, 29 Aug 2019 12:45:07 +0000 (UTC)
Date:   Thu, 29 Aug 2019 14:46:40 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
Message-ID: <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-2-jacopo@jmondi.org>
 <20190827122126.GQ5054@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="siklwweqobuuvov4"
Content-Disposition: inline
In-Reply-To: <20190827122126.GQ5054@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--siklwweqobuuvov4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 27, 2019 at 03:21:26PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> > Add the 'location' device property, used to specify the camera device
> > mounting position. The property is particularly meaningful for mobile
> > devices with a well defined usage orientation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index f884ada0bffc..865f4142f432 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -89,6 +89,16 @@ Optional properties
> >    but a number of degrees counter clockwise. Typical values are 0 and 180
> >    (upside down).
> >
> > +- location: The camera sensor mounting location, expressed as a position
> > +  relative to the usage orientation of the device the sensor is installed on.
>
> DT bindings being ABIs, we need to be precise and thorough there. One
> particular point that bothers me is that the property is named location,
> and its description refers to camera sensor mounting location.
>
> I see two options to fix this. One of them is to rename the property to
> camera-location, but that would limit its future usage for other types
> of devices. The other one is to document the property as applying to a
> "device" instead of a "camera sensor", and add one sentence stating that
> this property is valid for camera sensors only.
>
> This will require finding another name for the device that the device is
> mounted on though, as using device twice would be very confusing.

I had the same concern, but I cannot find another term to convey
this... suggestions?

>
> > +  Possible values are:
> > +  0 - Front. The image sensor is mounted on the front facing side of the device.
> > +  For mobile devices such as smartphones, tablets and laptops the front side is
> > +  the user facing side of the device.
> > +  1 - Back. The image sensor is mounted on the back side of the device, which is
> > +  defined as the opposite side of the front facing one.
> > +  2 - External. The image sensor is connected to the device by extension cables,
> > +  and can be freely moved, regardless of the device position.
>
> It could be something else than cables (wireless possibly ?). I would
> phrase this along the lines of "The device is not attached directly to
> the [device], or is attached in a way that allows it to move to
> different locations."

Agreed, once we find a good term for [device] :)

>
> >
> >  Optional endpoint properties
> >  ----------------------------
>
> --
> Regards,
>
> Laurent Pinchart

--siklwweqobuuvov4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1nyS8ACgkQcjQGjxah
VjzL2BAAgqsNZgAW+vRkwt7RDjK6QpMnNwif5DzH5YXs/aZ9BFu0ZYLi+M9/OXq7
yiBXbMa7OrA/eYnDRY3Z4ILQ8sEUCBCB/eC733VdWIrThEpiBSNGLLncW1z+2RoS
fYMuCr2mBirGkyhGzu7vE4geW3FjMwJhB4oEdshuA7Wy8+mcz64LQZipOk/xo01I
gvmwNmtZltKU5tA6uzShpZ+/UxAitiUwOV6Sh7uBNkDc4V0yYfz+Bo7pU6XexoEd
W58m9Pprs40BUJ4T8cTGGRK9YqOi+RAAQ6Wv1GtZqgWZiBNO6uWLNC+hkOdmxgGB
kEznLvM9lw1KjJ9KVJFSX/wX8463gyejJUkTYBzl4pz5ZAWE3P1Un4BfbxrvnoXs
CFT+6SuRpSZUykGqxfGDLpJ/R+vUhP4QC+DgsNhbFV44jEqElbCmH/cirIdffZ5S
o29yngV5wfIjGR8uYuJbCqEgLk+o/SCn/Aw3UMzEDA+oJ836kq7pDt+SttlB4FOH
7dRlko11SeOEKDMJAUsCT1hhn94LshXqKRgqN9zP1CdScR947uQ8M51PRG+n0kKH
0a+ieydHAGKlQo26jBwkXfosHHLNzNlJ9YFcHXOi2GUS0IOet80eigwmP2zfq78h
d8SeO9FgcOQ9++h7YlixGBK8+bdxq/tdlNiYV+UZ5slu5IkJpzM=
=kIpu
-----END PGP SIGNATURE-----

--siklwweqobuuvov4--
