Return-Path: <linux-media+bounces-65292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/W5AtRMNWqRrwYAu9opvQ
	(envelope-from <linux-media+bounces-65292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:06:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC816A6413
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=FrYlZxOJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65292-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65292-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70C7F303A126
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396C93750CB;
	Fri, 19 Jun 2026 14:04:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988D357D0F;
	Fri, 19 Jun 2026 14:04:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877889; cv=none; b=iEfIBl5lR/iCVy5K11srwg1KlPIFSblHVyxry2yEIOFEobIgntqElHz8syy895TiFOUIZshS5PBIueXZJH1Vwsm+vTAAoRaOjfwqoQsGym2Ua+GxSqPy9fOhC+FR4f4t3xMMDy0X+YP8+gk/PGciu1jZFZBZJ2cpMf1bvEt7rJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877889; c=relaxed/simple;
	bh=dftAusbDed3x4CEqHWz0NBcdVOyRFgzeGuvKwZh44Xk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Prxf9N4wBseiQYpNN7bHTrO+xV+a2HvOSf0mJYK8CrYQ/YVfVPumrhu03fu51clwlK2Ymt+RjPyNokXTOG7zsZ4VdGov7O1e3ZJf9EgExZiO5lY4LB7mSjh6W9Y9jZCgqwqZTY2+tXgz9Tu53gakC5ejpkan2alHfeeHZHAE/eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FrYlZxOJ; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781877885;
	bh=dftAusbDed3x4CEqHWz0NBcdVOyRFgzeGuvKwZh44Xk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FrYlZxOJ6WHcY31ScrSqmt/AjnOEiQsuQJxSKKyC93W9gO1AJ9SXkluz4HZhSuP84
	 nEVSweWXstdrA9NmpozeV3XI896JluhBPaTkyAK/xvNhUoitOzxf1zRRXpHNERe5u2
	 HjoJwj2ekLEZQcOZsaWpUDF5aGTIyxn7xS7vOCFJyjuY63DSIlZzSclQOLEEjBW521
	 SrYfV/FH60bEiOqRqdGS/BzJ50c14cKZvbM34RPz5eVqSh4GwIPeCj0imw6TS6TnZD
	 LRGyjBJw9VfTzTEdl5kxXygF6kft6nLs+hpRM7IttaAXfZEpA/l0pSSi1AtNLLreAE
	 yFMnGF/BjEoYw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3386417E0416;
	Fri, 19 Jun 2026 16:04:44 +0200 (CEST)
Message-ID: <0449f2bf75685e17034ada5ae3961518ceb04345.camel@collabora.com>
Subject: Re: [PATCH v2 2/5] docs: media: add documentation for media client
 usage stats
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>
Date: Fri, 19 Jun 2026 10:04:42 -0400
In-Reply-To: <755cf7c1-6bcc-45d1-afea-192d393256af@kernel.org>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
	 <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
	 <755cf7c1-6bcc-45d1-afea-192d393256af@kernel.org>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rzK9RmD6bezNfRyTV3+A"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65292-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:detlev.casanova@collabora.com,m:mchehab@kernel.org,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:healych@amazon.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EC816A6413


--=-rzK9RmD6bezNfRyTV3+A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 19 juin 2026 =C3=A0 14:58 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> Hi Detlev,
>=20
> Interesting, I had never heard of fdinfo, so if nothing else, I learned s=
omething new!
>=20
> On 17/06/2026 20:10, Detlev Casanova wrote:
> > From: Christopher Healy <healych@amazon.com>
> >=20
> > Document the media fdinfo interface for per-file-descriptor usage
> > statistics exposed by stateless V4L2 codec drivers via
> > /proc/<pid>/fdinfo/<fd>.
> >=20
> > This interface is designed for stateless (request API based) codec
> > devices where the kernel driver has per-job visibility into hardware
> > execution. Stateful codecs cannot support all of this because their
> > firmware manages job scheduling opaquely.
> >=20
> > The specification defines media- prefixed keys for engine utilization
> > time, and operating frequency, following the same conventions as the DR=
M
> > fdinfo mechanism documented in drm-usage-stats.rst.
> >=20
> > More fields can be added later.
> >=20
> > Signed-off-by: Christopher Healy <healych@amazon.com>
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > =C2=A0.../userspace-api/media/drivers/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0.../media/drivers/media-usage-stats.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 85 ++++++++++++++++++++++
> > =C2=A02 files changed, 86 insertions(+)
> >=20
> > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Docu=
mentation/userspace-api/media/drivers/index.rst
> > index 02967c9b18d6..61879738836c 100644
> > --- a/Documentation/userspace-api/media/drivers/index.rst
> > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > @@ -34,6 +34,7 @@ For more details see the file COPYING in the source d=
istribution of Linux.
> > =C2=A0	imx-uapi
> > =C2=A0	mali-c55
> > =C2=A0	max2175
> > +	media-usage-stats
> > =C2=A0	npcm-video
> > =C2=A0	omap3isp-uapi
> > =C2=A0	thp7312
> > diff --git a/Documentation/userspace-api/media/drivers/media-usage-stat=
s.rst b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
> > new file mode 100644
> > index 000000000000..d3dc07002f62
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
> > @@ -0,0 +1,85 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. _media-usage-stats:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +Media client usage stats
>=20
> stats -> statistics
>=20
> But are these really statistics? Isn't it just the current status?
> In many ways this feature looks to me similar to what VIDIOC_LOG_STATUS d=
oes,
> except in a nicer format. When VIDIOC_LOG_STATUS was first added, fdinfo
> didn't exist yet.
>=20
> And I wouldn't call it 'Media client': it's specific to stateless V4L2
> codec drivers.

While it is currently implemented for sateless m2m codec drivers as example
(because we can't implement this everywhere at once really, its not practic=
al),
there is no reason why we cannot track to a process fdinfo memory usage
associated with other video devices. In fact, I would pretty much want to s=
ee
capture devices showing up in v4l2top, as these are using a lot of memory t=
oo,
specially the new camera pipelines. And this is also perfectly suitable for
stateful codec, converters, everything.

So please, let's agree this is not "stateless V4L2 codec drivers" specific.

About VIDIOC_LOG_STATUS, this is effectively broken for m2m, only the ownin=
g
session process could call that. Its also pretty bad for tools to have to
monitor the dmesg and filter it up. fdinfo on the other end, does not requi=
re
opening the device and permissions are very clear, and bound to user proces=
s.

>=20
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +Stateless V4L2 codec drivers can optionally expose per-file-descriptor=
 usage
> > +statistics via ``/proc/<pid>/fdinfo/<fd>``. This is analogous to the D=
RM fdinfo
> > +mechanism documented in :ref:`drm-client-usage-stats`, but uses the ``=
media-``
> > +key prefix for V4L2 media devices.
> > +
> > +This interface is specific to stateless (request API based) codec devi=
ces,
> > +including both decoders and encoders. With stateless codecs, the kerne=
l driver
> > +explicitly submits each frame to the hardware and receives a completio=
n
> > +interrupt, providing a clean per-job boundary that can be attributed t=
o the
> > +submitting file descriptor.
> > +
> > +Stateful codec devices cannot support this interface because their fir=
mware
> > +manages job scheduling internally. The kernel driver submits bitstream=
 data
> > +but has no visibility into per-frame hardware execution timing.
> > +
> > +Implementation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The V4L2 core provides the plumbing: drivers implement the ``show_fdin=
fo``
> > +callback in ``struct v4l2_file_operations``, and the core wires it int=
o the
> > +kernel ``struct file_operations`` so that ``/proc/<pid>/fdinfo/<fd>`` =
output
> > +includes the driver-provided keys.
> > +
> > +File format specification
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +- File shall contain one key value pair per one line of text.
> > +- Colon character (``:``) must be used to delimit keys and values.
> > +- All standardised keys shall be prefixed with ``media-``.
> > +- Driver-specific keys shall be prefixed with ``driver_name-``.
> > +
> > +Mandatory keys
> > +--------------
> > +
> > +- media-driver: <valstr>
>=20
> I'd pick 'v4l2-driver'. Since 'media-driver' is too generic for this
> since that encompasses also DVB/CEC/RC drivers.
>=20
> > +
> > +=C2=A0 String shall contain the name of the media driver.
>=20
> 'V4L2 stateless codec driver'

With that said, we can refine, but not in that direction.

>=20
> > +
> > +- media-type: <valstr>
>=20
> Poor name.
>=20
> > +
> > +=C2=A0 String shall identify the type of media engine exposed through =
this file
> > +=C2=A0 descriptor. Standard values are ``decoder`` and ``encoder``.
>=20
> I think I would use 'stateless-decoder' and 'stateless-encoder'. It's mor=
e
> specific than de/encoder since that can be stateful as well.
>=20
> So I am missing the big picture here: right now this patch adds support f=
or
> this for stateless codecs, but what happens in the future if this is also
> added for regular video capture devices, ISPs, etc.?

We should work further on the type system, then we'd simply have to extend =
it.
Different type of driver will provide different key/value pair. We should w=
ell
document which key are mandatory for the type (or for all type, like giving=
 a
name for general identification purpose).

Of course, the current proposal is very torward processing cores, hence the=
 one
to one match with what GPUs present in fdinfo today in mainline, such are
frequency, core utilization time, etc.

Though, DMA devices such as capture may expose more of a bandwidth kind of
information. I really don't want to make up too may cases, so owners of the=
se
don't feel like this is mandated though. As we develop software using our
drivers, we should be able to figure-out what kind of things are important =
to
monitor. For CODECs, we have two majors things. a) core utilization (which =
can
be with a timer like this one, but ideally using cycle counters, or firmwar=
e
provided data). b) memory usage.

>=20
> The naming here matters, it has to have some sort of scheme so it can be
> extended to other types of drivers. So a 'media' prefix is too generic,
> and it also looks like it refers to the /dev/mediaX device.
>=20
> > +
> > +Utilization keys
> > +----------------
> > +
> > +- media-engine-usage: <uint> ns
>=20
> 'Media Engine': very vague.
>=20
> > +
> > +=C2=A0 Time in nanoseconds that the hardware engine spent busy process=
ing work
>=20
> Cumulative since creating the file handle? Or since the last read?
>=20
> > +=C2=A0 belonging to this file descriptor. The engine being measured is=
 identified
> > +=C2=A0 by the ``media-type`` key.
> > +
> > +=C2=A0 Values are not required to be constantly monotonic if it makes =
the driver
> > +=C2=A0 implementation easier, but are required to catch up with the pr=
eviously
> > +=C2=A0 reported larger value within a reasonable period.
>=20
> Does this make sense for codecs?
>=20
> I can tell that this is heavily influenced by the drm documentation, but =
that
> does not necessarily translate to V4L2.

I would guess this is bound to usage of cycle counter, which we definitely =
have
in some codec HW exposing. As the frequency fluctuate, I suppose there is w=
ays
you can get your calculation a bit off, as this is being sampled. Basically=
, the
frequence change is not strictly tracked by our drivers, which is ok. But I=
 also
don't seen why we wouldn't keep the counters monotonic, its really easy to =
do.

>=20
> > +
> > +Frequency keys
> > +--------------
> > +
> > +- media-maxfreq: <uint> Hz
> > +
> > +=C2=A0 Maximum operating frequency of the main engine clock.
> > +
> > +- media-curfreq: <uint> Hz
> > +
> > +=C2=A0 Current operating frequency of the main engine clock.
>=20
> 'Main engine clock'?

The word "engine" seems indeed alien in this subsystem. It is referring to =
a
system where you open one devices, so you have one fdinfo, but multiple cor=
es.
Each cores may be running at it owns frequency. But I think this is a littl=
e too
vague to my taste.

Hope this feedback does not cross to many wires, but tagging this as specif=
ic to
stateless codec drivers did spark a little in my head. And we are really in=
 need
for a way to monitor our drivers.

Nicolas

>=20
> > +
> > +Example output
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +::
> > +
> > +=C2=A0 media-driver:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 hantro-vpu
> > +=C2=A0 media-type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 decoder
> > +=C2=A0 media-engine-usage:=C2=A0=C2=A0=C2=A0=C2=A0 123456789 ns
> > +=C2=A0 media-maxfreq:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 600000000 Hz
> > +=C2=A0 media-curfreq:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 600000000 Hz
> >=20
>=20
> Regards,
>=20
> 	Hans

--=-rzK9RmD6bezNfRyTV3+A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCajVMegAKCRDZQZRRKWBy
9DL1AQCZmfSJoHNQPpqpzsC4896ggiXfXH2XoQU33O4qqJxSPwD7BDCvhtTzlMdv
WUHg51BEJq/37IpwRqHWwkt2TJBeiQ4=
=uO79
-----END PGP SIGNATURE-----

--=-rzK9RmD6bezNfRyTV3+A--

