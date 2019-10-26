Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1601E59F2
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 13:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfJZLVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 07:21:38 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:43513 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbfJZLVi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 07:21:38 -0400
Received: from uno.localdomain (143.121.2.93.rev.sfr.net [93.2.121.143])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 04EC9100004;
        Sat, 26 Oct 2019 11:21:33 +0000 (UTC)
Date:   Sat, 26 Oct 2019 13:23:22 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191026112322.3e5kyik3p7o22fdq@uno.localdomain>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd>
 <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
 <20191008080634.GC633@amd>
 <20191008082041.476a2soclry6qn3v@uno.localdomain>
 <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl>
 <20191023142717.GA22854@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sarsiihztdivrdua"
Content-Disposition: inline
In-Reply-To: <20191023142717.GA22854@duo.ucw.cz>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sarsiihztdivrdua
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Pavel,

On Wed, Oct 23, 2019 at 04:27:17PM +0200, Pavel Machek wrote:
> Hi!
>
> > > I'm skeptical about adding now a property for a device that we don't
> > > support, because we -now- think it's a good idea. I might be wrong,
> > > but my assumption is that when someone will want to support an
> > > 'advanced' device, it's easy to add "movable" or whatever else to the
> > > list of accepted properties values. Am I wrong in assuming this? As
> > > long as "front" "back" and "external" will stay supported for backward
> > > DTB compatibility it should be fine, right ?
> >
> > The basic rule is that you should not define things unless you KNOW that
> > they will be needed. So when we actually see new devices for which
> > "front", "back" or "external" does not fit, then new names can be
> > created.
>
> > It's impossible to cover all situations since we can't predict the future.
> > The best we can do is to allow for future extensions.
>
> Those devices are already being sold, and yes, they are running linux
> (with some patches probably).
>
> I believe it would be better to specify "this camera is selfie --
> takes pictures of the user" vs. "this is main camera -- takes pictures
> of what user is looking at".

The intended usage of a component is something that really does not
belong to DT. The install location is a physical property of the
device, what the user is supposed to do with it is not. I would be
very uncomfortable to have anything like "selfie" in DT bindings.


>
> Best regards,
>
> 								Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



--sarsiihztdivrdua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl20LKMACgkQcjQGjxah
Vjw3qBAAwQuiXpq+GDjMXIQiTZlOMDOAco0rVeu6k5UmbzfuI3Ph/cICUtGDcrbG
KAQXH4hnoAPfSf97kCYXSfMgXDWbqb2m6Z+yHyAMkk7Sr5dBl6DC4J02/XJZulqp
DiYrJm0k6PAGjXM8259clYAVCh5Zx7X68/qLPgrgFO9svOjpIjIlmSqW9DAuxFIy
7tYeNpeggsfbfYBX0/R22aZVZyOuvvpUAHy3zkf3xjIX0CvlzH20GL0qnULcqWg4
LdOE8Jq4klQUOiqDZgO53UOCmYEv20XhBR1oZ9OG8z0+r+KjLqpnGVEsC2Xaj2bz
tpvCCobldrvA0ZOQzDEgBY+azEkaJm0qyKOTEE29uQxVN+dZBurQmpTYpVBMz5xB
K31nFnOs/kC7xg7mAmjHHFAfETZtInlJjD1pSgk5GkU1dfy4q6zJGfw0TR1UYFXd
axeeEg0A1QA7qbKif0tp85shntmaQvDi5P5esoCFAshuS8xd3n7CJfByQCfVOoRa
9uYkbf0UuaCrz/to2XyQOj0Ai0i8+sAuqxFMacARHKcH54ziIzV9/c1QJEyl3RCB
eJEgI6LEKKVXx54Y8crF9eaW1BqGUI34winC71dPN+mmidrUuSf82KpxShM0KdnY
Vi9mHihj4MItT//x+zdsBWCYHMqgCWPsI6E9c3w7pBALOUEdOVY=
=jX4R
-----END PGP SIGNATURE-----

--sarsiihztdivrdua--
