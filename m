Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F812EF050
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbhAHJ6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:58:42 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:33593 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbhAHJ6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 04:58:41 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 176011C0005;
        Fri,  8 Jan 2021 09:57:57 +0000 (UTC)
Date:   Fri, 8 Jan 2021 10:57:57 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/1] v4l: fwnode:
 v4l2_async_notifier_parse_fwnode_endpoints is deprecated
Message-ID: <X/gspYsUCNm+wcpS@aptenodytes>
References: <20201214213348.19675-1-sakari.ailus@linux.intel.com>
 <CAAEAJfADNg_RKuWfREAPbtpB86ZQsNKa5rc83sjB9BZViPhtHg@mail.gmail.com>
 <20210107220723.GV11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZgV3jPawdYB3TsJj"
Content-Disposition: inline
In-Reply-To: <20210107220723.GV11878@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ZgV3jPawdYB3TsJj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 08 Jan 21, 00:07, Sakari Ailus wrote:
> Hi Ezequiel,
>=20
> On Thu, Jan 07, 2021 at 04:31:58PM -0300, Ezequiel Garcia wrote:
> > Hi Sakari,
> >=20
> > On Mon, 14 Dec 2020 at 18:45, Sakari Ailus <sakari.ailus@linux.intel.co=
m> wrote:
> > >
> > > Document that v4l2_async_notifier_parse_fwnode_endpoints() is depreca=
ted.
> > > Its functionality has been replaced by other, better functions. Also =
add a
> > > reference to an example if someone ends up wandering here.
> > >
> >=20
> > I'm working on a series to clean up the v4l2_async API a bit,
> > and came across this patch.
> >=20
> > As far as I can see, the only user of v4l2_async_notifier_parse_fwnode_=
endpoints
> > is drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c.
>=20
> It may be that's the only one left. The intent was also to avoid anyone
> proposing new ones.
>=20
> > Adding Maxime and Yong Deng, it would be great to get rid of this,
> > so we can remove the API, which would also allow us to remove
> > some other internal functions and therefore make the API a bit cleaner.
>=20
> Yes, that'd be very nice. Then we could remove it altogether.

I've been touching that area a bit with my MIPI CSI-2 support series.
I'll try to get rid of it along the way if I need to respin the series,
or come up with a follow-up patch to remove the call to this function.

If I understand correctly, the preferred way now is to use:
- fwnode_graph_get_endpoint_by_id
- v4l2_fwnode_endpoint_parse
- v4l2_async_notifier_add_fwnode_remote_subdev

Is that correct? I think that's what I've been doing in the MIPI CSI-2
bridge drivers so far.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ZgV3jPawdYB3TsJj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/4LKQACgkQ3cLmz3+f
v9EnXggAkAHON2AlPsdHOB0qrmKfEi6ayb+4Kcc6LcU7hcyDjsB50cDTxwy2JWKf
SL85tiJ0fdV6RjmR8FYh1CDvMyGbnQ+sNo5boKg0OhDFklaHwga9g6QIZtZr+/jr
9T/qr2orX+4s1FkcPuo2WN4nNsrQ1d+4a1OIGq/8hsShVNP8yBsQuIyPcC7JmZ3O
jXyx0Ve7IdFy1ir/PfCPstl3ItI0bw3AmlLoGc9oFzSG4iv9XCo6lEnq9Wgsu6FX
TH2phtOGWRBrhkik+CsVN8a8fsFagccnkL5L2XoTQY0QDKcILaM0vMUK6wIeSxBU
iSSE4+1TB/wYm+fdaNMQq42ykBbzig==
=9bLe
-----END PGP SIGNATURE-----

--ZgV3jPawdYB3TsJj--
