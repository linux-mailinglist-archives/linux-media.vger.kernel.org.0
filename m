Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D86F58EC02
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 14:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731665AbfHOMyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 08:54:25 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:42443 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729627AbfHOMyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 08:54:25 -0400
Received: from uno.localdomain (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9640A200002;
        Thu, 15 Aug 2019 12:54:21 +0000 (UTC)
Date:   Thu, 15 Aug 2019 14:55:48 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Message-ID: <20190815125548.kh2pdxzysafltswc@uno.localdomain>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
 <20190815065635.GJ6133@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="guiyz7n4y2542mup"
Content-Disposition: inline
In-Reply-To: <20190815065635.GJ6133@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--guiyz7n4y2542mup
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,

On Thu, Aug 15, 2019 at 09:56:35AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Aug 14, 2019 at 10:28:11PM +0200, Jacopo Mondi wrote:
> > Add the 'location' device property, used to specify the camera device
> > mounting position. The property is particularly meaningful for mobile
> > devices with a well defined usage orientation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index f884ada0bffc..819077b2649c 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -89,6 +89,10 @@ Optional properties
> >    but a number of degrees counter clockwise. Typical values are 0 and 180
> >    (upside down).
> >
> > +- location: The camera device mounting position, relative to the device
> > +  usage orientation. Possible values are:
> > +  0 - Front camera. The image sensor is mounted on the front side of the device.
> > +  1 - Back camera. The image sensor is mounted on the back side of the device.
>
> Would it make sense to make this a little more generic? Such as s/image
> sensor/ device/, for instance?

Laurent seems to be of the opposite opinion, but i think staying as
generic as possible might be a good idea. Now I have a linguistic
problem though.

 +- location: The device mounting position, relative to the device
 +  usage orientation. Possible values are:
 +  0 - Front. The device is mounted on the front side of the device.
 +  1 - Back. The device is mounted on the back side of the device.

So I need one "device" to indicate the lens/flash/image sensor and one
to indicate the device they're installed on :) Any idea?

>
> Is this also relevant for flash or lens devices?
>
> Flash (torch) devices could be present, at least principle, without a
> camera. There once was even such a Nokia phone, 1100 unless I'm mistaken.
> :-)

Not to mention that lenses are indeed installed in the same package as
the camera sensor, but they're described as separate device nodes as
flash leds are, so the mounting location might need to be specified in their
device node properties too, even if it would be the same as the image
sensor one.

>
> --
> Regards,
>
> Sakari Ailus
> sakari.ailus@linux.intel.com

--guiyz7n4y2542mup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1VVlMACgkQcjQGjxah
Vjzusg//X9PG4Cmjuk3pVya27qa6x9ghMPj/jf4z/DUsywmOUgyZ5iVpmOzJBCL0
FwHslnBZ03WbUjBVIvqnYNbLzd6yIbSE1EyTnjBDfhmeJ8iqTjN+qetPc1hM804S
5dKlthkP7UFG3PShJbFJoU+26eGfQi3rt94jtpX4I4WawodSCLf6neueow56V/O7
CBjH5d2oqkk0+gyXNwn8YZyeaUPaFlN7wKuGQqg/O7OgbuV0LZJCoFFEaKZNhJcJ
gzDXFk7I9ywmlySZ340gLNH3GUiCSqUQYTVkv0vUxihagAtA1HpYEeRde75DOe/4
1bCrHrb75K0AYOjza0sKoMo6qI6yulSkGepWU9QNwjinWV/3Z/g7GkTABVwCSBNH
wVOiwxqj834941oqb5vxCAKWrg4i3pA6YWgCJ5oMFuxrCE4FjjQm7V0kCyErSFUL
QFlt+KhM8AhQETJ/uS5u/nwh70WFpVpcI0A4yAbgbCIZLl7Ta4SaOJOiqDZs1XQU
c1nTGXbXOjo2bHqGRabHupNF876E38CHUYB+ubvjkzJEzczvk94gTFNfqeaEdiOq
XB17wFZT7UHTKaKrIEOnKvPdJd5hMp0fTkNoDM6g0is8m1vqXixf+aHQcJEpIA7S
i4IiRb6s4ipRLI9ymsmNBysjXJZ9z1SsHhUFbaJy6WbbhBKA668=
=+0WF
-----END PGP SIGNATURE-----

--guiyz7n4y2542mup--
