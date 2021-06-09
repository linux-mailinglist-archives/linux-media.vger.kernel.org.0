Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2195E3A152C
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 15:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235982AbhFINNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 09:13:34 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:45569 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236010AbhFINNa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 09:13:30 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 2B1C7C6E7F;
        Wed,  9 Jun 2021 13:01:40 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AD15FFF80F;
        Wed,  9 Jun 2021 13:01:17 +0000 (UTC)
Date:   Wed, 9 Jun 2021 15:01:16 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] media: v4l2-async: Make subdev notifier cleanup
 conditional
Message-ID: <YMC7nNOpy9MX8/2W@aptenodytes>
References: <20210609115457.822085-1-paul.kocialkowski@bootlin.com>
 <20210609115457.822085-2-paul.kocialkowski@bootlin.com>
 <20210609122735.GE3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AzBaB1s6CT6YEqV4"
Content-Disposition: inline
In-Reply-To: <20210609122735.GE3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--AzBaB1s6CT6YEqV4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed 09 Jun 21, 15:27, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Wed, Jun 09, 2021 at 01:54:57PM +0200, Paul Kocialkowski wrote:
> > A dedicated subdev notified is registered when using the helper
> > dedicated to sensors (v4l2_async_register_subdev_sensor_common),
> > but this is not the case when a driver uses v4l2_async_register_subdev
> > directly.
>=20
> Is this a problem?
>=20
> The notifier unregistration and cleanup functions should be safe to call =
on
> a notifier that's not been initialised or registered. The same goes for
> kfree with NULL argument.

I think you're right, the functions and kfree are indeed safe.
I think I mixed things up with debugging an issue and assumed this was part
of the fix I needed.

Sorry for the noise!

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--AzBaB1s6CT6YEqV4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmDAu5wACgkQ3cLmz3+f
v9HF/Qf+OjR8sDbDhQXIYt4fJNAlq0oavVO+WgubhlHOIZ/BJNmmb8xbys7MvpZM
pTbUgUs10Q+4PTt2kTM4Wg6TYP4stLvT15dhhwz/xMqjS28wZi+FtirgNJjs9xAl
AyPTaFzESK5J0eHTnhkXJdsCnvmmt+GdGMJAay8JoSM5XoZaAUbMYZ21/czJ9Uf7
by8kM23HgsoTUOQ15SYT4Bf6Q7a6mhC7RnDG/8dJVJPdyyKHEpblqHrpRvTthTEj
zUgpyRrocg9aBdhujvRCSHpqwEGbiT6fdi24LmaPF+uapXoNZDbrhPv45sD/cORA
JtfvBauxeBEMlUDsejlWWhVgxXizVA==
=bfKH
-----END PGP SIGNATURE-----

--AzBaB1s6CT6YEqV4--
