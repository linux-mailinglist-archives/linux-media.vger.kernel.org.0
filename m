Return-Path: <linux-media+bounces-54117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIN+JOrcpWkvHgAAu9opvQ
	(envelope-from <linux-media+bounces-54117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 19:54:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F541DE7F6
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 19:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1987730D546B
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 18:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F4432FA14;
	Mon,  2 Mar 2026 18:50:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE27430BAA
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477428; cv=none; b=d9jD3qfz2D0iPawe7DQf1L+cLRl/pZYbACMHEqysAfx9IMPC5lXlU2J3pAkeypdS5stvmBfYPhRYSIn1PjQ8TULssXaJVIQQT69nGj5WIKbT0iYxSlm5ur+lyYRZYigA4NdAwkb7GrQlZTQxX8AqhD9wsrVKbpUZPWmqZTtyKgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477428; c=relaxed/simple;
	bh=AUZd2qeBB4ymh338SP2zH0V8AeyE+PzYBbT3I+g2Y2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnlH+VnhQvOgKApOmi+b4PD0Od8ppW6aknXEvI5FpQBqRnhw5D0sv9LpFe3nmRxPCCF+lVKX+MWhOnQwtxbYLZIC7C9MJtIyhcB+LwkprKXpkhU+pQJJCUD8xSNYnee0GbsTMwyRjLfOnMh++dgcl0z2pTmBLf7gKxQizXtCNJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B67D81F8004A
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 18:41:31 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 497FAB24E3A; Mon,  2 Mar 2026 18:41:29 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 93D00B24E34;
	Mon,  2 Mar 2026 18:41:26 +0000 (UTC)
Date: Mon, 2 Mar 2026 19:41:24 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans de Goede <hansg@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit on May 26th in Nice, France
Message-ID: <aaXZ1AImO_PRzpqC@shepard>
References: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
 <2f0c3f41-93fa-4a1f-aad2-b59ebbc59909@kernel.org>
 <20260301150259.GD2860169@killaraus.ideasonboard.com>
 <77aff6321715c2141257d1f114c6bd70c7ac2d29.camel@collabora.com>
 <20260302140154.GA3360678@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TaKVmHRiGDv6tWVK"
Content-Disposition: inline
In-Reply-To: <20260302140154.GA3360678@killaraus.ideasonboard.com>
X-Rspamd-Queue-Id: E6F541DE7F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54117-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.937];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--TaKVmHRiGDv6tWVK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 02 Mar 26, 15:01, Laurent Pinchart wrote:
> On Mon, Mar 02, 2026 at 08:55:05AM -0500, Nicolas Dufresne wrote:
> > Le dimanche 01 mars 2026 =C3=A0 16:02 +0100, Laurent Pinchart a =C3=A9c=
rit=C2=A0:
> > > I would also like to revive efforts to properly support dmabuf import
> > > for multi-planar formats with configurable plane offsets (a.k.a. data
> > > offsets), but I think this requires a champion to resume the work more
> > > than a discussion at the media summit.
> >=20
> > I haven't sent my RFC yet about that subject, that will probably be aft=
er
> > Embedded World. But I think it can serve as example of "possible" way f=
orward.
> > And I believe the ChromeOS request should be cited. I think we need mor=
e then a
> > champion to resume the work, since I personally don't believe in the an=
cient
> > proposal from Collabora. I'd say plan for a little more time on this su=
bject.
>=20
> Maybe it could then make sense to brainstorm the topic during the media
> summit.

I'm also interested in the topic and had a first go at it a few months back,
with code at: https://git.paulk.fr/projects/linux.git/log/?h=3Dmedia/dmabuf=
-offset

This is based on our discussions on IRC, with the main concern that hardware
units may have specific alignment constraints that apply, so not all offsets
are valid and drivers need to provide their alignment constraints. So the
feature is disabled by default and drivers that want to support it need to
provide their alignment constraint. It is then reported to userspace via
create_buffers and a new flag is added to indicate that the driver supports
the feature.

Then it comes down to adding the offset down to videobuf2, which is
straightforward in some cases (that I implemented) and less so in others, l=
ike
sg tables (which I didn't implement).

So it feels like more work would be needed to get the vb2 side right.

Nicolas, did you have another approach in mind or is your RFC based on the =
same
ideas?

> > If possible, I would like to add to the agenda a short update related t=
o Vulkan
> > Video side of CODECs, what are the viable options for Linux Media and w=
hat is in
> > preparation outside of our subsystem. The second aspect is informative =
as these
> > discussion don't seem to lean toward our subsystem as the foundation. B=
ut I
> > think its rather useful for everyone to understand why and what is incl=
uded.
>=20
> I'd be interested in hearing about that.

Yes me too. I guess this more or less boils down to the long-time debate of
generic uAPI with complexity in the kernel vs driver-specific uAPI with
complexity in userspace. I still think a generic uAPI for codecs makes good
sense, but I understand the appeal of something more similar to drm accel.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--TaKVmHRiGDv6tWVK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmml2dQACgkQhP3B6o/u
lQytMQ//dXN29UvsKv8aI4loVMsgNA+/LoZ0LZjlK1uoISwnuW1H0hxVXLWIMj+j
te6m76I75UiI5xPuEOl/e84eolyAF/jhcciWaMCFRze8efpvy4JikHxdS/rPKdqB
zWFpNb8vgzhjFwbmTWjtfM9HeP6SZpBzdf/CoM2oVhxz1RATTl1GT921NZh1yxN7
oT8l8k4HgCid8OUpxBKo6uvbs74v/bF84hdVo13erPLx4Xjf/JHARIKvYJKvK7Kg
4DdVorp7+XR9FSGX+imuvkVeq7ivZtAeUEra5gIN8CVlnCyYivQsPP/blrAOixOu
DIlG52Tmu/X8G+PC810jVPOFgeZ17sgQINofoVV/lBGLCKijO0ATWVxtk5/nswZf
7FhErTSYe7iU0lX3/cIXa8y5YD4IuSb8x03byu2nx5fn/UPivEjAxOtAaebv+aFV
wBUnSoNhQtv+hfM4IwEPJ7s2X/89Q/nxZ2zKfgdAiEMbVmwlgDGW+umXiBcRv2Cl
XGs9Se61X3IKyJOKnb3+sGkcukmPIEvi87DymbZtrMy8RFFCgIlHhprUysjx4Lnp
Rbf2O/59zqW/szJ2entVuzUhB9eHP+vnkVvAq1tJZ3NJ3zUCI/8xkL71Kn3uM2jR
QiR9SlJhEd8CYf29lKyiYmHp8dlcyibLvFIYe/bbOSfc1MUdQ7w=
=c494
-----END PGP SIGNATURE-----

--TaKVmHRiGDv6tWVK--

