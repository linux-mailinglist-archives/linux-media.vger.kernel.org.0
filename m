Return-Path: <linux-media+bounces-64449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DC7YFFZuKWojWwMAu9opvQ
	(envelope-from <linux-media+bounces-64449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:01:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA866A0D7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:01:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=lO1brDfs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64449-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64449-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75298300FABF
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFC2285CAA;
	Wed, 10 Jun 2026 14:00:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DCB231A23;
	Wed, 10 Jun 2026 14:00:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100058; cv=none; b=huQoFm8UUg1PwO6E892jqNlqb7+rCmA0mnFmG02SjtkMTkBulLaBJYBsfcClDY1UJAbKy5bdCSFZ6DtbxiNCgP93RiZGRFZmC6cEZyv8u2E6rhtkDgFZAabcc2L4mGqSMtO6DHG+lWnxtApMqtlLZ4c6hVrcsg25SSBpxzoFDDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100058; c=relaxed/simple;
	bh=87RRLeVKnzgD8o5adULajQe28VNRxsT1N+lRjMQcSVI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ftmtCQmqpncdEQEfnWFqjn1aISSZSx/0+JM13HPoA/ZbErdOXCyWA5L88705aTnk/LQ9VvDANtVwwxLFj9aU2ywHFt7+b246bPH96X//VS4oPdXE6ouhYicNbKhrBFDCXa5twyO+c/NOa/3vafyXD3u4hyfxN9c+LYB+OnQ90F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lO1brDfs; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781100054;
	bh=87RRLeVKnzgD8o5adULajQe28VNRxsT1N+lRjMQcSVI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lO1brDfs48kbRWi12zXffzIFMZTwUcsLzgrqE8mMVBJvWXO7zc0yKlxTJf+QtWL+4
	 AdaziWcAtfgdnLy0u1YvSOefWtwPX3luKad2igGu+nboKNIfhgKK7MkCpQYjhL+lIZ
	 P3TgC/BqAuYJSckoI4RYrziXQklO5qyDNYez6D6/RYUF5VpHpkSjZn6Habv0R02lof
	 jFrLOzc+m/CDsMkbRRvyGoJjWENQEH1joqrHS5JMo/LLnDm901XGSgrskLNC/5vhgz
	 7YBXSUrlbVyf7Lil3ZcyHmhIwv0iI9KipaagA994XOvvbzr9uwUbWXb9p363ETtSnt
	 BjlRFNIPky+NQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79DC917E013E;
	Wed, 10 Jun 2026 16:00:53 +0200 (CEST)
Message-ID: <a199bf51ac0d7123ba360bec5f47bf3f1ad5a3e3.camel@collabora.com>
Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
 V4L2_FMT_FLAG_DYN_RESOLUTION usage
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, "Ming Qian(OSS)"
	 <ming.qian@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
 "hverkuil@kernel.org"	 <hverkuil@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>,  "imx@lists.linux.dev"	 <imx@lists.linux.dev>,
 "Frank.Li@kernel.org" <Frank.Li@kernel.org>,  "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, Eagle Zhou <eagle.zhou@nxp.com>, Elliot
 Chen	 <elliot.chen@nxp.com>, Frank Li <frank.li@nxp.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Jun 2026 10:00:51 -0400
In-Reply-To: <349d6d48-9996-4791-833c-5c01e07883fd@kernel.org>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
	 <20260608040616.1A3EE1F00893@smtp.kernel.org>
	 <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
	 <e689df21c92861e35b6d11e391bea3404321484d.camel@collabora.com>
	 <aijOPSFPEDsVlYFY@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
	 <aijayrdr_rrz2x4B@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
	 <349d6d48-9996-4791-833c-5c01e07883fd@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-+gB4QBD4Sg+rOb4wvVUk"
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64449-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:ming.qian@oss.nxp.com,m:sashiko-reviews@lists.linux.dev,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:imx@lists.linux.dev,m:Frank.Li@kernel.org,m:linux-media@vger.kernel.org,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFAA866A0D7


--=-+gB4QBD4Sg+rOb4wvVUk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 10 juin 2026 =C3=A0 08:15 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> > The more natural fix would be to add V4L2_EVENT_SOURCE_CHANGE for the
> > initial resolution case as well, then properly report
> > V4L2_FMT_FLAG_DYN_RESOLUTION through VIDIOC_ENUM_FMT. If all existing
> > drivers that support mid-stream DRC can similarly be updated to fire th=
e
> > event for initial resolution, then perhaps the spec change to split the
> > flag isn't strictly necessary - drivers just need to be fixed to comply
> > with the current definition.
> >=20
> > I'd appreciate hearing others' thoughts on whether this unified approac=
h
> > is practical across all existing drivers.
>=20
> Just a quick reply to mention that the s5p-mfc driver predates a lot of t=
he
> newer uAPIs for stateful codecs. It's why it behaves in a not-quite-stand=
ard
> way. So there is history here. The resolution change support was added in
> commit 0520e4cc3bb9d back in 2014, three years after the driver was first
> added to the kernel. The stateful decoder spec as we have today was only
> introduced in 2019.

Fair point. Now, some clarification about the initial event. When this was =
re-
implemented in GStreamer, we explicitly don't prepare the capture queue (no
REQBUFS/CREATE_BUF, its not streaming). So effectively, the driver is force=
d to
start with only the output queue, and that was assumed to force the initial
event. The src_ch event indicates that the driver is stuck until the captur=
e
queue has been reconfigured (or configured in this cased).

I think you make a good point that this is not very clearly stated, but it =
was
also intentional to use that flag as a boundary before expecting this very
strict behaviour. From a HW stand point, it does make quite some sense, sin=
ce
the parsing of header and discovery should happen separately from the captu=
re
buffer requirement. This is the main difference between stateless and state=
ful.
In userspace, this workflow allowed to better decouple the output and captu=
re
threads, which very typically is a independent threads (true for GStreamer =
and
Chromium at minimum).

In the legacy path in gstreamer, the capture queue format is guessed, alloc=
ated
and set to streaming. In that case, the driver only have to emit the initia=
l
event if the capture queue configuration miss-match its requirements. I bel=
ieve
that was done so it aligned with some legacy flow. In theory this should wo=
rk
with earlier implementation of SOURCE_CHANGE, but remains a best effort. CO=
DA960
being the only legacy implementation I kept testing over time. With CODA to=
day,
if the guessed allocation failed, everything fails, which seems to be a bug=
 or
limitation from you analyses. Fixing it can be tricky, as we need to ensure=
 we
maintain backward compatibility with older userspace. Specially for CODA wh=
ich
is massively deployed. A lot of strangeness in CODA comes from its reversed
engineered nature. Note that, I do have spec for this one these days, and c=
an
answer questions. I do know that we actually get a subset of the SPS, which
should fully cover the needs for the DYN_RESOLUTION.

The thing that also comes with V4L2_FMT_FLAG_DYN_RESOLUTION, is also the dr=
ain
flow. There was just no drain flow prior to this and the matching decoder s=
pec.
So to drain the capture queue on SOURCE_CHANGE, we had to track the state o=
f the
queue, and avoid going back into polling once the queue was drained (since
polling previously blocked). That tracking have simply never been implement=
ed in
GStreamer. The only legacy draining flow we had, was the infamous zero size=
d
buffer, which was ambiguous, since there was 3 possibilities instead of 2:

- Failed decode
- Failed decode and drained
- Drained

If a decode failed at entropy decode, the resulting failed buffer would be
signalled and confused with the drain. And so the other infamous LAST flag =
was
added. But then MFC signals the drain state independently, not at the same =
time
as the last buffer, and so EPIPE on DQBUF was introduced. With the new spec=
, we
forced this drain flow onto both draining on end-of-stream (CMD_STOP) and t=
o
happen somewhere after any SOURCE_CHANGE, and if you use
V4L2_FMT_FLAG_DYN_RESOLUTION you must follow the DRC flow from the new spec=
.

I don't know if sharing the drain mechanism for DRC and actual CMD_STOP was=
 the
best idea in the world, but it is what is it now, and for sure, old or
unmaintained drivers endup with highly inconsistent state. I'm happy with t=
he
idea to improve the spec, and to improve the drivers concistency too, as lo=
ng as
we can actually test, since it too complex to change without testing. I thi=
nk,
if something could help, it would be to implement couple of the legacy flow=
 in
vivid driver, so we could test virtually.

Nicolas

--=-+gB4QBD4Sg+rOb4wvVUk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCailuEwAKCRDZQZRRKWBy
9Ln4AQD2Mp1EVR+oTYzzPh6u7yEg0CgiyLjBS++dpF/ZVakIeAD8CUKFKVo7m4t8
PIW9OF4ZIBBtZ1I3h94ZZleofSD5lAY=
=0sm3
-----END PGP SIGNATURE-----

--=-+gB4QBD4Sg+rOb4wvVUk--

