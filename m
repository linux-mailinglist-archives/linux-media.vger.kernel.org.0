Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7007A5B75
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 18:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfIBQjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 12:39:03 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:32941 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfIBQjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 12:39:03 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8360D240007;
        Mon,  2 Sep 2019 16:38:58 +0000 (UTC)
Date:   Mon, 2 Sep 2019 18:40:31 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/10] media: dt-bindings: Document 'location' property
Message-ID: <20190902164031.yllajoj6duz27mun@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-2-jacopo@jmondi.org>
 <20190827122126.GQ5054@pendragon.ideasonboard.com>
 <20190829124639.tzjp63tqnojnytlq@uno.localdomain>
 <5d6d1b60.1c69fb81.f3a3a.1619@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="abwkop6rms7tuuey"
Content-Disposition: inline
In-Reply-To: <5d6d1b60.1c69fb81.f3a3a.1619@mx.google.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--abwkop6rms7tuuey
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Rob,

On Mon, Sep 02, 2019 at 02:38:40PM +0100, Rob Herring wrote:
> On Thu, Aug 29, 2019 at 02:46:40PM +0200, Jacopo Mondi wrote:
> > Hi Laurent,
> >
> > On Tue, Aug 27, 2019 at 03:21:26PM +0300, Laurent Pinchart wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for the patch.
> > >
> > > On Tue, Aug 27, 2019 at 11:23:27AM +0200, Jacopo Mondi wrote:
> > > > Add the 'location' device property, used to specify the camera device
> > > > mounting position. The property is particularly meaningful for mobile
> > > > devices with a well defined usage orientation.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  .../devicetree/bindings/media/video-interfaces.txt     | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > index f884ada0bffc..865f4142f432 100644
> > > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > @@ -89,6 +89,16 @@ Optional properties
> > > >    but a number of degrees counter clockwise. Typical values are 0 and 180
> > > >    (upside down).
> > > >
> > > > +- location: The camera sensor mounting location, expressed as a position
> > > > +  relative to the usage orientation of the device the sensor is installed on.
> > >
> > > DT bindings being ABIs, we need to be precise and thorough there. One
> > > particular point that bothers me is that the property is named location,
> > > and its description refers to camera sensor mounting location.
> > >
> > > I see two options to fix this. One of them is to rename the property to
> > > camera-location, but that would limit its future usage for other types
> > > of devices. The other one is to document the property as applying to a
> > > "device" instead of a "camera sensor", and add one sentence stating that
> > > this property is valid for camera sensors only.
> > >
> > > This will require finding another name for the device that the device is
> > > mounted on though, as using device twice would be very confusing.
> >
> > I had the same concern, but I cannot find another term to convey
> > this... suggestions?
>
> For accelerometers and/or gyroscopes, we already have 'mount-matrix'.

Pardon my ignorance, but I could not find it documented. Some binding
files refers to an iio/mount-matrix.txt file which I cannot find. Has
it been removed? Anyway, some individual bindings report examples of
mount matrices (ie
Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt)

> That would replace 'rotation'. Maybe we can do something similar here?

I think 'rotation' simply expressed as degrees is fine here, our
problem was to find a term that would make it possible to specify that
rotation/location are applied to a 'device' mounted on a 'device'.
Sakari suggested on irc to use 'system' in place of the second
'device' and that seems to work well to me.

Or were you suggesting to use a construct similar to mount-matrix for
a purpose I didn't get :) ?

Thanks
   j
>
> Rob
>

--abwkop6rms7tuuey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1tRf8ACgkQcjQGjxah
Vjxt6g//YkWamSDZj9rOMLbyqJftZwA2z/xxY5ff90I6+m2k3fb5UiFxK2i+hpLX
LWrE2T9nRfQTf7bO4ScX8MgHhzBxgniF0OTynAtcNSXz1864k7XSlYjyudOP3NLL
dI7tBh8bkwoTudXNgz7OIs+4tjNYkgnwBaUCdgoJ/0MTHr44CDnvO8kpR01tydkl
/baLkP7vaswe5jr9ShUxBx1GjJkltBhTng50oorjfcd7WBa4J5Ln0cs38YjC+U4o
3QyJrYgnxvUZGCsoQC1AsxYLXqpEfS3/44Q92DbHnIS/PTSJl07G6vs6+WcnWvjm
UB6iDQvWj3XnPghXGxhMMA7tWDnQrz3FmCLaKcRszu43kAV+YU+L5TnEchvseXJH
yj02q0HKSi33jh8J/+E6IiyVu1tSw1orrIVUahPbWgXRaH6VMdwdfimk4SxIhkTm
hPCCmpNdjgSX9A7hGVI+lF9Xdy5namPJ43WN/4kfMEz4i7KsVhdC44pEcbszt/HF
i248dF7HF+cIC9jYCCxkt6D0xclGbrh1YXdncJn9QKKMZtItDsFZwgWePD83Cm6Z
aS+wbb2juiNEIEw6p/UHkimGJFb5Mp/l9uTT1FBz0M9D4Ud4bPTzt4m79VH1vVDT
95R3MuaPgIW3XeTRBlPQKpayJ8wRggTisMDkST1D29DayBii0dE=
=LfvL
-----END PGP SIGNATURE-----

--abwkop6rms7tuuey--
