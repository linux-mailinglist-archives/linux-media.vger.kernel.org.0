Return-Path: <linux-media+bounces-54116-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAHyIGLcpWkvHgAAu9opvQ
	(envelope-from <linux-media+bounces-54116-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 19:52:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A91DE7C6
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 19:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60914306B4D6
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 18:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD34333F36B;
	Mon,  2 Mar 2026 18:47:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306352E8B83
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477271; cv=none; b=pHQGgcU/UloT3r0ufBbancj7OWa/dWikxM0D96Z0t3uwFoFlKav2eWUqi2r9WrM1nPGT65QKu9acBJ6Ees4akA5IE3x9pqzXGpm5z+7IZwOsXAEW3Q92yG0KrW/JLA4lC5CL7L03MWY1sHpyAUJnM+KgnysXgWcYrVazCiGoHW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477271; c=relaxed/simple;
	bh=NVWY405MeTXrIJnfV85gRyqUpHWeLm7gCsPcE8lvO10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oP9WzZLDLQ2LnVJPC24LakwTPb12QUDYRoDDUjpZkcEJUZQ7VSOsuWJNmNjZS+FfS8cPcE01LaCAJ08kcxQlBplNEJgCnXzw5MgYbkZdbnNIdsRx5McuPTyLk10BQSQmQh1l3uRV7RYhWNchr5xrve+kT3Ky3eygQ9i+HwnD+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 64AC61F8006A
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 18:47:40 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 67DD1B24E3B; Mon,  2 Mar 2026 18:47:37 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C2A15B24E17;
	Mon,  2 Mar 2026 18:47:34 +0000 (UTC)
Date: Mon, 2 Mar 2026 19:47:32 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans de Goede <hansg@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit on May 26th in Nice, France
Message-ID: <aaXbRDBcDLPlgG67@shepard>
References: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
 <2f0c3f41-93fa-4a1f-aad2-b59ebbc59909@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IGAwFjQSmDXkDJy6"
Content-Disposition: inline
In-Reply-To: <2f0c3f41-93fa-4a1f-aad2-b59ebbc59909@kernel.org>
X-Rspamd-Queue-Id: D13A91DE7C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54116-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,embedded-recipes.org:url]
X-Rspamd-Action: no action


--IGAwFjQSmDXkDJy6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon 23 Feb 26, 10:12, Hans Verkuil wrote:
> A gentle reminder to let me know by email if you will join this year's Me=
dia Summit.
> I only received 7 confirmations until now, so there is room for quite a f=
ew more.

I would like to attend as well, and sorry for the delay!

> Also, please reply to this email if you have topics that you would like t=
o discuss.
> Just 'Reply All' to this announcement and give the topic title, a short d=
escription and
> a guesstimate of the time you need for your topic.

I'd like to give an update about the stateless video encoding uAPI, which is
still in preparation (but may have a first version on the list before the m=
edia
summit).

Title: V4L2 Stateless Video Encoding uAPI Progress Update

Description: An update on the ongonig work to support stateless codecs in V=
4L2.
Some of the remaining open topics will be presented and discussed.

Guesstimate: 1 hour

All the best,

Paul

> And here is my topic:
>=20
> Title: Discussion of the media subsystem development process
>=20
> Description: Review of the multi-committer model: current status and next=
 steps.
> Are there any bottlenecks, any ideas for improvements, w.r.t. the develop=
ment process?
>=20
> Guesstimate: 1 hour
>=20
> Regards,
>=20
> 	Hans
>=20
> On 16/01/2026 14:29, Hans Verkuil wrote:
> > (Please pass this on to anyone you think might be interested in this!)
> >=20
> > Hi all,
> >=20
> > This year's Media Summit will be held on Tuesday May 26th the day befor=
e the
> > Embedded Recipes Conference in Nice, France:
> >=20
> > https://embedded-recipes.org/2026/
> >=20
> > The Media Summit will be held at Hotel Campanile and in the same meetin=
g room
> > as last year (Nikaia):
> >=20
> > https://nice-aeroport.campanile.com/en-us/
> >=20
> > It is close to the Airport and to the Embedded Recipes venue.
> >=20
> > The meeting room can hold up to 30 people and I will provide video conf=
erencing support,
> > just like last year. The location and the meeting room was quite nice l=
ast year, so
> > I saw no need to change it.
> >=20
> > That said, in-person participation is very much preferred. This yearly =
summit is meant
> > for active media developers to meet face-to-face and to discuss media s=
ubsystem issues.
> >=20
> > And it is also a good opportunity to talk to each other during the Embe=
dded Recipes
> > conference to discuss topics in a smaller group. But if you are an acti=
ve media developer
> > and are really not able to attend in person, then remote participation =
is an option.
> >=20
> > If you want to attend the meeting (either in person or remote), then se=
nd an email to me
> > directly. The deadline for in-person attendance is May 14 as the hotel =
needs to know the
> > final number of attendees by then.
> >=20
> > There is no registration fee, the meeting room is sponsored by Cisco an=
d Collabora, and
> > the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, =
it's very much
> > appreciated.
> >=20
> > If you have a topic that you want to discuss, just 'Reply All' to this =
announcement
> > and give the topic title, a short description and a guesstimate of the =
time you need
> > for your topic.
> >=20
> > See last year's Media Summit Report as an example of what to expect:
> >=20
> > https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298=
d@jjverkuil.nl/
> >=20
> > This announcement goes out quite early for once, usually it takes a lot=
 longer
> > to organize, but having it in the same place as before made life so muc=
h easier.
> >=20
> > Regards,
> >=20
> > 	Hans
> >=20
> > PS: Be aware that May 24 and 25 are public holidays in France. So many =
shops may be
> > closed those days.
> >=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--IGAwFjQSmDXkDJy6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmml20QACgkQhP3B6o/u
lQyh7w/7Bd6VCAY6ykaHetj9J1i26JkdsxHvzQKSw4d2PurOl7AY1PNLKBDln5R0
rj9io6q7NyApyt7ezjt4pcWW1X3Wl1Gd8oYkXTt19ZmOGlVo8Qp++4XdlwhpH3UO
jvyheED//vwWIXx1nXy6ypk30VXH9KQTEcAAqdcn8CSHcPjcP9/tGJuojBnu9sS3
HNJsEBOaEbsp7XdRUOxLJTMaGQNBNvG1qJwS9bMETASYZpMd2PFzQehcIa9dac0R
T3LGIEfVzAnZvnR/iPCaD8QtwEtZjz6PIbqinu8ir7Zk6E18F8H2IZwObUqFuUhd
CknqKUAiiyOoV3Poo5kwtl5Nu5TiE8LrIq4hA1tKWOgjAhCPidWJHHZZfyYe2MoV
Z/jUkOFarDt0zG5htG3hwL2P0xPjeARpGUIFIN8N6ZVSBCifQ4Roi05zaqTCF3cT
u1eTDEva0bDXWFPai6K0lNK4UBSSu5wp6WPBakHcPUmgyHr/LpJ2BehGCC7veGmO
rnFCcjklvbpgqArobMb3Lkrad+p0jtoW1WQ6q/qxNgewW75J93/wwUYmUX2aORi2
GE9nBnDAmZng3SZQQ5NCbgInGFLbflvrMO0GPlwoHOCixA0l+GhDNjReWUoL7SVf
7is5cODluo+C0EqWt/ZXFGj9rFrWoAD2LQ4sOLr7NfeHQIO5VEk=
=CpiO
-----END PGP SIGNATURE-----

--IGAwFjQSmDXkDJy6--

