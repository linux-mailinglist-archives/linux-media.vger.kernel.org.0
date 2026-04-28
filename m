Return-Path: <linux-media+bounces-59888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJzwHcQQ8WmXcQEAu9opvQ
	(envelope-from <linux-media+bounces-59888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:55:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E448B613
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86F6B3072853
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706B02FFF99;
	Tue, 28 Apr 2026 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I7y91iV6"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784393B27DF;
	Tue, 28 Apr 2026 19:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405941; cv=none; b=G5HXCQk94RgwVmuX64QfZ7FlxmmupvVfts0cCKq9omiD9vd2ezbA3YIq/50vVAuuov3SAcCUwhjuFKW1mvkVsnwZsPJFB6yqDa2cD7ANP9OUSK+OE2kmKoAtWsn/L2ImZvkBfEOCizb9KEApSlC6I/nSO/33ML1wtzBVLsM5foE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405941; c=relaxed/simple;
	bh=AH3leimZQNaQooLaaL2o5U1miRlZsWgMsWKgQcdZ0xs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=irzKotzEodkNKFbeJ8CGwBKa6QfTRAvBZRTP8K6oL3yo1dx/QLK6jnqHmfdRyV3fDsa3n0ZIRMAs2JfQtqjphsf+Kr3lSfQenX1MLNOExXgbJlCsvbu2ZdnPVpFJRpNDQO8XuFeXdm1UmOwY6Yl3I+gsI8no4TA/tKwqM4nXkzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I7y91iV6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777405938;
	bh=AH3leimZQNaQooLaaL2o5U1miRlZsWgMsWKgQcdZ0xs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=I7y91iV6D1SxsKsac2nK4RZTn3J3s0OIzeLhio2TgvqoWHsTZlcAbxbLFQkeSs83A
	 GTucjVJM9ARxjT849GroUfTYbJeWhfIalwjqLEksLLQ1gqfDk2wF2JHRzq8EbCl6IP
	 wm4rWguC4Lf7aL9kITGUIna8aOXFvWwWH3SyNCNK+G2I7blZN2dCRm1Sjj7yHN9Moq
	 v73c0b73UEvEz7T8W/7OG8I1E5CEBM+6WsdYURzfio0q2MNJhIIvzjy+88QXqxkrxw
	 a3e0UBQw7vtD+vo+5+by5oXqwC7/pQRFAR0YGQYCH6GWbRnsanxwj+r2LTtTxBV0SZ
	 rAzM/4SNGHZAQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CE4117E0EB6;
	Tue, 28 Apr 2026 21:52:15 +0200 (CEST)
Message-ID: <4c216c195d237e71188dfbdd54bbc1e234eff434.camel@collabora.com>
Subject: Re: [PATCH 00/11] v4l2: Add tracing for stateless codecs
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Rostedt	 <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi	 <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, 	kernel@collabora.com
Date: Tue, 28 Apr 2026 15:52:14 -0400
In-Reply-To: <20260212162328.192217-1-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-dFN5ga/fGZ8ocfYM8b1y"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: F03E448B613
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59888-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:url,collabora.com:dkim,collabora.com:mid]


--=-dFN5ga/fGZ8ocfYM8b1y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> Hi !
>=20
> This patchset aims to improve codec event tracing in v4l2.
>=20
> The traces added in visl by Daniel Almeida are moved to the global trace
> events and slightly reworked to be printed in a more consistent format.
>=20
> To each trace are also added a tgid and fd fields, helping userspace trac=
k
> different decoding sessions (contexts) based on the given file descriptor
> used by the given process id.
>=20
> Also for better tracking, stream on and stream off events are added as
> well as HW run and HW done events to track decoder core usage.
>=20
> Finally, add a show_fdinfo callback on video device files, allowing drive=
rs
> to expose usage information.
> Currently only used for frame buffer memory usage.
>=20
> The main focus is to be able to generate perfetto traces to show VPU usag=
e,
> a perfetto producer using this can be found at [1].
>=20
> [1]:
> https://gitlab.collabora.com/detlev/hantro-perf/-/tree/hantro-improved-in=
fo

I would recommend renaming this repo, as its not really evolving toward
something truly hantro specific anymore, same goes for the code below appar=
t
from the run/done traces and the fdinfo that has to be opted in.

There is effectively a bit of an overlap with the v4l2-tracer, but there is=
 also
advantages having it in the kernel, as you source all the event, for the en=
tire
system, in one place, so I'm fine with that. Considering the possible large
overhead of the full trace, I'd like to see the ability to filter what we w=
ant
to trace, with some level of granularity. Maybe we only need decode_params =
for
specific use case to be debugged, and don't care about large scaling list/m=
atrix
? I would also like to see some Documentation on the tracing, so that its u=
sage
is not only explained in a tool.

To Hans, there is nice tools idea in there, the perfetto producer is simply=
 C++,
and the v4l2top utility is Rust. Would you see these as tools v4l2-utils ? =
For
the rust part, we can either leave the build independent, and cargo would b=
e
used to build and run, or we can implement a meson wrapper around cargo. Bu=
t I
don't believe its a good idea to use native rustc support in meson for that=
 one
because of the large number of third party crate needed.

I like the direction, hope the feedback suite you well.

Nicolas

>=20
> Detlev Casanova (11):
> =C2=A0 media: Move visl traces to v4l2-core
> =C2=A0 media: Reformat v4l2-requests trace event printk
> =C2=A0 media: Add tgid and fd fields in v4l2_fh struct
> =C2=A0 media: Add tgid and fd to the v4l2-requests trace fields
> =C2=A0 media: Add missing types to v4l2_ctrl_ptr
> =C2=A0 media: Trace the stateless controls when set in v4l2-ctrls-core.c
> =C2=A0 media: Add stream on/off traces and run them in the ioctl
> =C2=A0 media: Add HW run/done trace events
> =C2=A0 media: hantro: Add v4l2_hw run/done traces
> =C2=A0 media: v4l2: Add callback for show_fdinfo
> =C2=A0 media: hantro: Add fdinfo callback
>=20
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 2 +
> =C2=A0.../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 25 +
> =C2=A0.../media/platform/verisilicon/hantro_v4l2.c=C2=A0 |=C2=A0=C2=A0 10=
 +-
> =C2=A0.../verisilicon/rockchip_vpu981_regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../platform/verisilicon/rockchip_vpu_hw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 4 +
> =C2=A0drivers/media/test-drivers/visl/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/test-drivers/visl/visl-dec.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 76 -
> =C2=A0.../media/test-drivers/visl/visl-trace-av1.h=C2=A0 |=C2=A0 314 ---
> =C2=A0.../media/test-drivers/visl/visl-trace-fwht.h |=C2=A0=C2=A0 66 -
> =C2=A0.../media/test-drivers/visl/visl-trace-h264.h |=C2=A0 349 ----
> =C2=A0.../media/test-drivers/visl/visl-trace-hevc.h |=C2=A0 464 -----
> =C2=A0.../test-drivers/visl/visl-trace-mpeg2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 99 -
> =C2=A0.../test-drivers/visl/visl-trace-points.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 11 -
> =C2=A0.../media/test-drivers/visl/visl-trace-vp8.h=C2=A0 |=C2=A0 156 --
> =C2=A0.../media/test-drivers/visl/visl-trace-vp9.h=C2=A0 |=C2=A0 292 ---
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-api.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 10 +
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 114 +
> =C2=A0drivers/media/v4l2-core/v4l2-dev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
> =C2=A0drivers/media/v4l2-core/v4l2-fh.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 37 +-
> =C2=A0drivers/media/v4l2-core/v4l2-trace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 48 +
> =C2=A0include/media/v4l2-ctrls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 19 +
> =C2=A0include/media/v4l2-dev.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0include/media/v4l2-fh.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 4 +
> =C2=A0include/trace/events/v4l2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 58 +
> =C2=A0include/trace/events/v4l2_requests.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1836 +++++++++++++++++
> =C2=A026 files changed, 2178 insertions(+), 1831 deletions(-)
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.=
h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.=
h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-hevc.=
h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2=
.h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-point=
s.c
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
> =C2=A0create mode 100644 include/trace/events/v4l2_requests.h

--=-dFN5ga/fGZ8ocfYM8b1y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEP7gAKCRDZQZRRKWBy
9NTJAP0YqNvV/84O5hkBh9cwbKajYgaeQztw7Mq1P5Rs+Ez7NQEAyYF4bxhDutfM
ReHPqltREMum1sN79ByfaFmlDan+wQ4=
=9UP6
-----END PGP SIGNATURE-----

--=-dFN5ga/fGZ8ocfYM8b1y--

