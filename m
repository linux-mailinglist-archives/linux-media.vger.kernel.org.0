Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8AF10564E
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 17:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfKUQAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 11:00:44 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:43827 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfKUQAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 11:00:43 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5044EE001B;
        Thu, 21 Nov 2019 16:00:40 +0000 (UTC)
Date:   Thu, 21 Nov 2019 17:02:44 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191121160244.s6nfgux27covvx7r@uno.localdomain>
References: <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd>
 <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
 <20191008080634.GC633@amd>
 <20191008082041.476a2soclry6qn3v@uno.localdomain>
 <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl>
 <20191023142717.GA22854@duo.ucw.cz>
 <CAAFQd5CjUH7QRg-oQOKB=YH9NPvSxwjrdRUPYZkYVAHgJh6dZg@mail.gmail.com>
 <20191026204815.GA28970@pendragon.ideasonboard.com>
 <CAAFQd5BgRrtjb_WfTi+C-F+SoWhV_=JLH4TQ5_HDWogM4APiVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b6wsmp4h4bf47sgh"
Content-Disposition: inline
In-Reply-To: <CAAFQd5BgRrtjb_WfTi+C-F+SoWhV_=JLH4TQ5_HDWogM4APiVg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--b6wsmp4h4bf47sgh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Tomasz,

On Mon, Nov 18, 2019 at 08:32:35PM +0900, Tomasz Figa wrote:
> On Sun, Oct 27, 2019 at 5:48 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Fri, Oct 25, 2019 at 03:29:49PM +0900, Tomasz Figa wrote:
> > > On Wed, Oct 23, 2019 at 11:27 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > >
> > > > Hi!
> > > >
> > > > > > I'm skeptical about adding now a property for a device that we don't
> > > > > > support, because we -now- think it's a good idea. I might be wrong,
> > > > > > but my assumption is that when someone will want to support an
> > > > > > 'advanced' device, it's easy to add "movable" or whatever else to the
> > > > > > list of accepted properties values. Am I wrong in assuming this? As
> > > > > > long as "front" "back" and "external" will stay supported for backward
> > > > > > DTB compatibility it should be fine, right ?
> > > > >
> > > > > The basic rule is that you should not define things unless you KNOW that
> > > > > they will be needed. So when we actually see new devices for which
> > > > > "front", "back" or "external" does not fit, then new names can be
> > > > > created.
> > > >
> > > > > It's impossible to cover all situations since we can't predict the future.
> > > > > The best we can do is to allow for future extensions.
> > > >
> > > > Those devices are already being sold, and yes, they are running linux
> > > > (with some patches probably).
> > > >
> > > > I believe it would be better to specify "this camera is selfie --
> > > > takes pictures of the user" vs. "this is main camera -- takes pictures
> > > > of what user is looking at".
> > >
> > > FWIW, Android and Chrome OS call those "user-facing" and
> > > "world-facing" respectively.
> >
> > Isn't that equivalent to what Jacopo is proposing though ? If we define
> > the orientation of the device relatively to its user (e.g. for all
> > cellphone devices the front is defined as the side facing the user), and
> > the location of the camera relative to the device, we get the same
> > information.
>
> Yes, it is the same. Although having some consistency in the naming
> isn't necessarily a bad idea, is it? :)
>
> That said, looks like the naming in the Android world isn't consistent
> either. The high level Java/Kotlin API uses "front" and "back":
> https://developer.android.com/reference/android/hardware/Camera.CameraInfo.html#summary
>
> How about making this property a string instead? It would make it more
> readable in the dts and more expressive for some weird cases in the
> future, e.g. "front+30deg", "vector" (and a vector could be given in
> another property), etc.

Why do you think this would be better ? We could provide macros if we
want to have users expressing location in a more 'expressive' form
than using a numerical id. I would avoid parsing strings to be honest.

Would you be ok with this ?

I don't see any core v4l2 header in include/dt-bindings/media/ but
that could be a good occasion to add one ?
>
> Best regards,
> Tomasz

--b6wsmp4h4bf47sgh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3WtSQACgkQcjQGjxah
VjwV9Q/8DvYtw78W1RQeKr5OIB3YuYmMLv78N0CjG2nA/jwA5nmYqA/kIDePyEWH
mXsggVD+EgV+pCri75trQ+wls7oyGKkaK4H1zbGMwbzguEuvvS1KTKM8buAlYUvm
Wg7XU+mxXrWxU8tiTyXQRglDSbtDULT9VulsNcpxGjtVphy73bPUQYqm1P84wV7x
vfGWXHRBUSWIHW61jraLckA5qMJLhT8eh1tj1nwfx98we9HMJKHHwD75pypeoHTu
S/8CbRVmawI2YKsRSpfm17grPs6SK8dyAPVkv1WzKFd2QwdRv8Z4pc0Hv8ZRAnQW
xxnDVN6r4eIDkcDuKE0f+szm/odMgsSkdMLtBylxc/sXBTNVAfJMHbJ5cpHtEO3f
hzbNy/kro1tM4TwuMmNmLUTcZyhAT6UIhpFYnO8JzwmTkAqjjqCy3iJ7wQBq/ijt
aPPE0t7gCzWvDJksZhMi03Ru8erOJ2vHoB0+W52LBsUrLAHBimmYzlO2FE+GWBnU
cJPJWyyBWhypFFI1Hf9MXkLwhpTUKSvO6Lxr5YZN2tn0sF+bgihX/BTbkz3zozw2
6r62jo6YwBti8Dk/G1wGnVHn3ROyZVmVv79VYoNdZz1MgdbjZbeRv4EAPkwqo3ze
r9/nl9PwFuOgZ87f2stWfZLkSQljsTsRisfjfMM/phsnjuJLokI=
=rRrO
-----END PGP SIGNATURE-----

--b6wsmp4h4bf47sgh--
