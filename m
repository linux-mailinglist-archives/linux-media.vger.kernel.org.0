Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A859EE1E1E
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 16:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392219AbfJWO1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 10:27:21 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35510 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389521AbfJWO1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 10:27:21 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 1AE3680222; Wed, 23 Oct 2019 16:27:02 +0200 (CEST)
Date:   Wed, 23 Oct 2019 16:27:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191023142717.GA22854@duo.ucw.cz>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd>
 <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
 <20191008080634.GC633@amd>
 <20191008082041.476a2soclry6qn3v@uno.localdomain>
 <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I'm skeptical about adding now a property for a device that we don't
> > support, because we -now- think it's a good idea. I might be wrong,
> > but my assumption is that when someone will want to support an
> > 'advanced' device, it's easy to add "movable" or whatever else to the
> > list of accepted properties values. Am I wrong in assuming this? As
> > long as "front" "back" and "external" will stay supported for backward
> > DTB compatibility it should be fine, right ?
>=20
> The basic rule is that you should not define things unless you KNOW that
> they will be needed. So when we actually see new devices for which
> "front", "back" or "external" does not fit, then new names can be
> created.

> It's impossible to cover all situations since we can't predict the future.
> The best we can do is to allow for future extensions.

Those devices are already being sold, and yes, they are running linux
(with some patches probably).

I believe it would be better to specify "this camera is selfie --
takes pictures of the user" vs. "this is main camera -- takes pictures
of what user is looking at".

Best regards,

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXbBjRQAKCRAw5/Bqldv6
8tNdAKCc8CMAqHx/EQYNMo1xeFuuu8ynZwCgm0bn7w0wqbnlPmDUnp8EjCQbJi8=
=qnpV
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
