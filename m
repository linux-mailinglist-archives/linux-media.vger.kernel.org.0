Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416D6A52FE
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 11:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731212AbfIBJjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 05:39:54 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:45071 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729489AbfIBJjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 05:39:54 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 99ED324000E;
        Mon,  2 Sep 2019 09:39:50 +0000 (UTC)
Date:   Mon, 2 Sep 2019 11:41:23 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190902094123.wixtn5dm2dwd62bu@uno.localdomain>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
 <664fe7b3-9051-30da-736e-710a4e9cecde@xs4all.nl>
 <d60e4664-3a3f-1723-6c96-4fc822b6a7bb@xs4all.nl>
 <20190815143423.vaoswb4jvzd2blxp@uno.localdomain>
 <cb36e8a0-b941-ff37-e58c-0f9b7f62116a@xs4all.nl>
 <20190901172457.GC1047@bug>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zuavsfa6rq46r5dn"
Content-Disposition: inline
In-Reply-To: <20190901172457.GC1047@bug>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zuavsfa6rq46r5dn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Pavel,

On Sun, Sep 01, 2019 at 07:24:57PM +0200, Pavel Machek wrote:
> Hi!
>
> > >>>>> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
> > >>>>>      value down. A value of zero stops the motion if one is in progress
> > >>>>>      and has no effect otherwise.
> > >>>>>
> > >>>>> +``V4L2_CID_LOCATION (integer)``
> > >>>>
> > >>>> Maybe V4L2_CID_CAMERA_SENSOR_LOCATION ? Same for the values below.
> > >>>
> > >>> Probably a better name, if a bit long. But we might need other location
> > >>> controls in the future (e.g. flash location), so CID_LOCATION is just too
> > >>> generic.
> > >>
> > >
> > > Thanks for the feedback.
> > >
> > >> Note that the location defines themselves can most likely be used with any
> > >> LOCATION control, so V4L2_LOCATION_FRONT would be fine with any control.
> > >>
> > >
> > > What do you think instead of the control type? Would a single integer
> > > control do or an integer menu one would be better? I see merit in both
> > > proposals actually...
> >
> > Single integer. It's read-only, so it just reports the location.
> >
> > It would be different if this was a writable control: then you need to
> > know which locations are possible to set, and that requires a menu type.
> >
> > But it doesn't make sense to set the location from software. However, the
> > location might change as a result of other changes: e.g. if the camera
> > has motor control of the tilt and the tilt changes from forward facing to
> > downward facing, then the driver might change the location from FRONT
> > to DOWN. A convoluted example perhaps, but this is just brainstorming.
>
> There are phones with exactly such camera setup. And yes, it makes sense to be writable
> in that case, as software can move the camera in such case.

Nice, I had no idea!

Support for those kind of devices seems a bit far-fetched at the
moment, and as Laurent suggested, I would make the control writable
once we have a use case for that. But let's keep in mind that could
happen sooner or later!

Thanks
   j

>
> 										Pavel

--zuavsfa6rq46r5dn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1s48MACgkQcjQGjxah
VjySHxAAj0VW0JBKc19IKqZ8qF2HxYIjAq54yckaYChexDAFzMmmib9ABkgjvRHy
3rA+qxUp2J37b14bs+rksQCli9Aej6quziNeKB2pCayBFoFhFJIKEQjgRSkj2Pbq
DABGGxWEAUg/NQzC0I/zbqch8yGE1KPy+Gw8OlgwwK7tqeffx5vVA3TC/ZE+7VhU
w3qBW7SpaMNKDPgkUkTTrfy4wQpnsPMhgozSEJso93+Ryr5wrh+OjtUBdSAYRVoH
xAw6Yq2lyNm1bl2R/G1QeOJ5yf8V+i5yYtlUWkSfnmrijWWaiEUD9JLxjd9VSSbA
byMxrCI2mYVNzvYMNPiSnfwb0ECrdkme3Zs+jfTSnGWj8fKllogppWP1QEwWQsVw
DmzJJbBnMivB8cygx4MUDBRDP0G4Op24V97x60m4wxJFShHcuKEDn2/e0Rj7QZH/
uNzu9ZvYXM8rN0fl5HP0uDXEqM2MmWu5khjHp7AP049t9NTyDrr9oyeK/WYQ8xO3
vUlG4yMr/8p9S6kniGmx5B9rpsBDlYxgmiamOBlhDALsEWM1cOzwP/qObxmrBz8K
vhkgOFxiUodw4ny9tDB9VRPH3awT9ge1uD4AO3LdyYD22dHO/DzZ9VRz9RpG9s2i
Bd+h47u7Jhk5WTz0KzXWvCykIYaKYu0fP+3zO1rwm+cj7JROg9g=
=pHsq
-----END PGP SIGNATURE-----

--zuavsfa6rq46r5dn--
