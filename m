Return-Path: <linux-media+bounces-63955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id st6yDQoVI2p6hwEAu9opvQ
	(envelope-from <linux-media+bounces-63955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 20:27:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED164A9B4
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 20:27:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=tGSSh1ob;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63955-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63955-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3BA1302771D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 18:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF623A4523;
	Fri,  5 Jun 2026 18:24:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3A5464D
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 18:23:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683841; cv=none; b=gw2/yANwhPfgz+510dxxDJ/r4yeaOry/10DHszAJD9tMFcigjJkuXFSpo39SZvYqemMXZ5z62n9gPAQqhCWR8NhxO9Qj9BNOsOayVfTDdOQMzKmsd8qy4Spnni4kczNHKO/MWitrVvKz4Fl8ZGfIauCvJS5hO3f1JyhUwPD7gVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683841; c=relaxed/simple;
	bh=6aWC21MrRhayhLZemUWVOJfghyTMNkuubJKJms/n5QQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gpPJ2dhwNS4/JbCjAEHRQRc+NKwr2YCmgCxJz7yIAao7f57Djp7L3cGmiBGHGKwWQoRiirnc96ZvCCAc6P2N88sIExq+Av0hDz6FHaWKoUza0zhtIZdkwVq/NRmOe34Ig4sMwn1rPX1Z00izhJyCaAEaKNBXglfvIohMt2rxnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=tGSSh1ob; arc=none smtp.client-ip=209.85.219.66
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8ccedaf0b54so13923496d6.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1780683839; x=1781288639; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6aWC21MrRhayhLZemUWVOJfghyTMNkuubJKJms/n5QQ=;
        b=tGSSh1obJuNYFvVRy5bY0GZPGoHCgorBcPkINLbLHDqTxYefchOho4kPOZPni1NhKQ
         aEHa0ct6PjgpI3/qnVBrtUhyJBIvFpX7KOwq1a10WC/is7I9YZiK+zpAvVhT3+d4xDoc
         icFwiHq+ZEazJ3vNDOoio89xB7Is9bI5JN/k6GXGyk+zUlqklch/7QuwW6SF2wCrNuAU
         1+PB1P9OGDnfCsVlE/1MxpqdLONFJywUTSZ5YdWXOlX6XeQdmF91nVKDWdHHp09fXJYA
         7E+IHWze8O8g7CdY9D71N7BwFhlDXzZ+x5u3TrG5Qa2iU+pASEnHxQobehxTygwzEXC7
         jILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780683839; x=1781288639;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aWC21MrRhayhLZemUWVOJfghyTMNkuubJKJms/n5QQ=;
        b=JBAwrbbterXNwYygujzf6koyDNiaz8pPiKa2dKBFwkL+gJMxDS1xBx/2wFnJ5Kinqi
         KJxkjjSumwlwdJqk+PWyBzjYpFaBjFcRm2/oqNwPWid2f1GruxUOzP8NBmyfi3bfdxuk
         WNepPL5NLrZk2Jg5saynGblGDcGU7bJEsa9JQsXccT1BXNhMEdCqoAZ8A6RwffH/ljMW
         Wa+zGfU1ffkh5rtJcrVILw6uqM+SphI79qPFi6n9I1N9z2KcDfA6Tw8AXMXNQRj98VmD
         fJsYqfZYhyVR7Yze7JHHRdlDySLicQsknWyjgJyQ6oBxn5B4Otz7pgwmoLKLFs0WkX4o
         58Rw==
X-Gm-Message-State: AOJu0Yz5vKUhshLYY3574ifrelVIAEK4ZEXB4Usg8nf8Nfa5ZI4CeF00
	NGOrtrTcbWgxjXGBFU75JFI6M26WIW71UFu2kPJAE06fzzO9q/TKW2GU7QxiimOs71X6/iA+kGd
	0krYfYCCfa+ra
X-Gm-Gg: Acq92OE7PkNmMrUyVPIqQWiBTBvTtfEDHJkzkYpl7Aps6MgW65gst61F3SJC9eVqMna
	j9Giz5g1M/mrGfNBbMk4EfqDgGX68p4cSzwnxAU+OSE98/mEYkndPXM6P1LTjfZRonTAnt7Mfu7
	kVSANrm69RO1fWjunQeacQml+vCiWSo8YJPqrYSzRgl6jg0Apcr3jEXJj0TD6923wOUfQMYCE5U
	rgeSXJBwu5IGhXMMYpvRTl9x/j/B6yv+wuJGahe/QQSDEX4kt7fhSLCig76EZQ9nv6l7uiUiagq
	pyfwfmyQf9ZmweBtJGD3gpdk7eL8utqH5tFe93toQTNZXDUsO/TepkBYDvHAYHXnkTdzUR6q6+c
	A9udeDbOzDpJSa7QmWbHWr0iWI3PgMAnCQ0Ojg+cmXtCDAqVP1Fc6uzCzXngZpvgD/hosLM914Q
	qfHOkp13jw4/MQ8uKosW8Y0B/XIlIvb3bNScYjgq6i75ioKZuSrca4KfuMOneGR6uBXYM8jezxB
	smHQKg=
X-Received: by 2002:a05:622a:99b:b0:50f:c2f8:4081 with SMTP id d75a77b69052e-51795c5b470mr68801321cf.53.1780683838981;
        Fri, 05 Jun 2026 11:23:58 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c297a8sm84407721cf.8.2026.06.05.11.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 11:23:58 -0700 (PDT)
Message-ID: <21425d0e18fd0afdfccef2a83cc5efaa153d5dbb.camel@ndufresne.ca>
Subject: Re: Adding Linux-media to Sashiko
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ricardo Ribalda <ribalda@chromium.org>, Jai Luthra
	 <jai.luthra@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Fri, 05 Jun 2026 14:23:57 -0400
In-Reply-To: <CANiDSCuMUdh6MWw5O+nhFJzexMcGJRTZ38Fq1anihe7=zu5K2w@mail.gmail.com>
References: 
	<CANiDSCunFkyGqz5n15ezW0LHCHqU92g6xeVK43zRcqohS-QsdQ@mail.gmail.com>
	 <177998407808.933414.10133969094530331086@freya>
	 <CANiDSCuMUdh6MWw5O+nhFJzexMcGJRTZ38Fq1anihe7=zu5K2w@mail.gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1GTSXS0XgS6T9mY61v+f"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-63955-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:jai.luthra@ideasonboard.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ndufresne.ca:from_mime,ndufresne.ca:mid,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98ED164A9B4


--=-1GTSXS0XgS6T9mY61v+f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 28 mai 2026 =C3=A0 23:44 +0200, Ricardo Ribalda a =C3=A9crit=C2=A0=
:
> Hi Jai
>=20
> I thought that we agreed to experiment with cc to the list to evaluate
> the quality of the review and then decide how to configure it.
>=20
> But I might also be miss-remembering it.
>=20
>=20
> The current PR in sashiko has landed, but it is very easy (and fast)
> to upload a change.

I was pushing against having the emails during the summit, so I am equally
surprised. We can of course let it run and see how it goes, first thing I n=
otice
is the amount of "existing issue" reports it adds is quite big. My a worry =
is
that people with low knowledge might try and fix them all, which just make =
the
process stalled until sashiko gets quite about a specific code base.

Nicolas

>=20
>=20
> Regards!!!
>=20
> On Thu, 28 May 2026 at 18:01, Jai Luthra <jai.luthra@ideasonboard.com> wr=
ote:
> >=20
> > Hi Ricardo,
> >=20
> > Quoting Ricardo Ribalda (2026-05-28 20:41:56)
> > > Hi
> > >=20
> > > As we discussed in the media summit, I just created the Pull request
> > > to add linux-media to Sashiko.
> > >=20
> > > https://github.com/sashiko-dev/sashiko/pull/224
> >=20
> > Thank you. Does the cc option mean the list will get emails from Sashik=
o as
> > well?
> >=20
> > I thought the consensus during the summit was to keep the replies only =
to
> > the author (and maintainers can check sashiko manually) but maybe I'm
> > misremembering it.
> >=20
> > >=20
> > > Please let me know if something does not work as expected
> > >=20
> > > Regards!!!
> > >=20
> > > --
> > > Ricardo Ribalda
> > >=20
> >=20
> > Thanks,
> > Jai
>=20
>=20

--=-1GTSXS0XgS6T9mY61v+f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaiMUPQAKCRDZQZRRKWBy
9D2RAP0drGaQSyYTJBNJoTq1WbQjIuz8Lx6UyR8/l46dMsOWLgD+LQllFtInIAcF
XQa5bn8u1iM4g3ET+1TX5qZ8Nwf8lAg=
=3t+L
-----END PGP SIGNATURE-----

--=-1GTSXS0XgS6T9mY61v+f--

