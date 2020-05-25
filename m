Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B1C1E0EA3
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 14:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390594AbgEYMnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 08:43:43 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52669 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390556AbgEYMnn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 08:43:43 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E226720000B;
        Mon, 25 May 2020 12:43:37 +0000 (UTC)
Date:   Mon, 25 May 2020 14:46:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, tfiga@google.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 02/13] dt-bindings: video-interface: Replace
 'rotation' description
Message-ID: <20200525124657.umnvfzpyo7moutp4@uno.localdomain>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
 <20200509090456.3496481-3-jacopo@jmondi.org>
 <20200525111621.GE27989@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cozzvhkmmtid52ks"
Content-Disposition: inline
In-Reply-To: <20200525111621.GE27989@amd>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cozzvhkmmtid52ks
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Pavel,

On Mon, May 25, 2020 at 01:16:21PM +0200, Pavel Machek wrote:
> On Sat 2020-05-09 11:04:45, Jacopo Mondi wrote:
> > Replace the 'rotation' property description by providing a definition
> > relative to the camera sensor pixel array coordinate system and the
> > captured scene.
> >
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../bindings/media/video-interfaces.txt       | 359 +++++++++++++++++-
> >  1 file changed, 356 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index b1ff492c7da7a..3920f25a91235 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -85,9 +85,362 @@ Optional properties
> >
> >  - lens-focus: A phandle to the node of the focus lens controller.
> >
> > -- rotation: The device, typically an image sensor, is not mounted upright,
> > -  but a number of degrees counter clockwise. Typical values are 0 and 180
> > -  (upside down).
> > +- rotation: The camera rotation is expressed as the angular difference in
> > +  degrees between two reference systems, one relative to the camera module, and
> > +  one defined on the external world scene to be captured when projected on the
> > +  image sensor pixel array.
>
> So.. how is this supposed to work. There's a phone, with its main
> camera. It is designed to be used in both portrait and landscape
> modes, internal accelerometr can tell between the two.
>
> Plus you have phone with a keyboard. Common usage is portrait with
> keyboard closed, and landscape with keyboard open...
>

While I agree for 'orientation' we're far from perfection (and that's
why I've been asked s/location/orientation/ to reserve 'location' for
the future), 'rotation' is only defined by the camera sensor mounting
rotation and the external scene. The way you move your phone should
not impact the pixel read-out sequence.

All phones can be used in portarait or landscape mode, I don't see why
having a mechanical keyboard is different. You can type in landscape
mode on a touchscreen keyboard, if you like to.

The property gives you the rotation correction (actually, the control
gives the correction) for display in the 'intended usage orientation'.
If your concern is displaying the image,  as you sense the
accellerometers to rotate the UI, the application that display the
image will be rotated too, adding to the corrected image (capture image +
rotation here specified) the required UI rotation.

On the 'intended usage orientation', as there is one for the UI, there
is one for all other components in the phone, so if your system
establishes that 'portrait' is the (rotation = 0) point for the UI,
this applies to the rest of the system.

> And yes, there's linux with v4l2 working on Nokia N900.
>

How is this and orientation handled there ?


> Best regards,
> 								Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



--cozzvhkmmtid52ks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl7LvkAACgkQcjQGjxah
Vjxq8hAAljqol8NiaXSAxpR71YqCmW2eWVsGdPZPKCf2WKu/V/d9VlWiTwwS3Vm6
L3K0ezJnJvxFGJTj7hroP5baKUfxA4SbEWTyNyOmg+3YMVuKPO/SHS4Ht3cILU7R
+3idH4ROYuTzidjQkSHcvzM870PKBwjgzV39o8Z2/zyz1JvJ5AiByRhcMlI+fg/m
TupKZ/BO/4gl36DUNawXYkhTVOU4EltgDGP2vUqcjlpAmqw3kDng5Mw2sEijhxwI
hD0r2OCM5UvJok+frt3FXlDo7QG0TNrue6n+tdoCASXdLmXbHsKtHd7KS7ht071l
qcFhLxlS/koWlnpJp0ydPuWhdQP6aPiAl/fpMlar/rSrnV3KQja7m92cG/ViqB7v
iWgzt9RZSwDnXQPB3LF87HoFhI6ka+l921HeESNJ6+eWge5zvf29co1A4uLny2Oj
ATVpVpKtCLuzHlqWqg8fkFbJcYR9wYun76lzQ49R/pIjhvXu/8HoLhAB38ABrEtT
5+b7mtTGUKANQ7lvMFcXRg0W3VYEBrhduHZl9ADS9bmpJZx62tOlM5h/FDJEd35t
mqfh/HQY5ATS3TXJ1H5nIK26iDayJfwrXb289bZOYK6VktxiCNShdK6Y+nXzK2M4
VW63OZ0747WJ8Lpfvl8jBQBiRqk3XGtpbqDdZxVerD3lWh+pY3c=
=paVC
-----END PGP SIGNATURE-----

--cozzvhkmmtid52ks--
