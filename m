Return-Path: <linux-media+bounces-56550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNb/EPZ/vWnH+QIAu9opvQ
	(envelope-from <linux-media+bounces-56550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:12:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA32DE5C8
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A62E23039EFD
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1553CCFBD;
	Fri, 20 Mar 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jKasniiS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253D3C13E8;
	Fri, 20 Mar 2026 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774026092; cv=none; b=UZCwnW7CQKMeRLbxOUq1IBEPXZTUDCOm6cYe+bzxgGyRfbjbbM+WnSFZyUiMFdIkCcTdjTtZk5CVfBnPWSSGPbCxuOCSanBoBrVU8gGxYmhsrdu3f1A44jUj6+y2W1KBKN1ShBF0W3HEOZXQwq40f+n6NQHLPaWNurYxFavTo/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774026092; c=relaxed/simple;
	bh=hEYUcHp2UzjNb2FhAXRp3xfwYkQiS3s+QoOPB89ejDg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHC2mPVifzT7RuWeQ8h7i8UKAAa5+oNgLb/fLI8ZBp/xW75zzKjAtAR0qHhvGVnLYXbByIDnS9900xMpRXkt9eTuoYeRwDE57BtyP1Vo8OJMYwzC0CPaYKsDs6wo/dZDUm7An7KI253VOGzno5n1TUeJamnI7JyFXB+rJ+hSRoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jKasniiS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774026016;
	bh=hEYUcHp2UzjNb2FhAXRp3xfwYkQiS3s+QoOPB89ejDg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jKasniiSRvOBhPqe9ZiRmk3CeyRlY8JssRD/0ShxYskySx3hV6FH9tx2ZimItOMgl
	 0HhJpuMOalrxYlO56TOSKsvixAbAc2XxgLBa1Br6GKRcYICbIJuBDT76YLUWdoLG+z
	 cOSLJxU3HZWoeEQhAKoPtjBa7Rv1F9XBIETEV+34PzDbLegxOOFDa/t0py9RgxXIQM
	 u0GiLD3m80vfpxdgGzkHwyf3Pi/M+DIJZFFKeoEpD61xAT349JPZeI9c8rr3UnwdGi
	 DyESjfClRSKaDYs6fGTr+t7ockmCOo3nY7Dg0R/IBLVo69yY+64VmwSXF2tdJSc6J0
	 s/tmDXuO+Avwg==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34E0E17E05B5;
	Fri, 20 Mar 2026 18:00:15 +0100 (CET)
Message-ID: <86a603a4bebd12ac854d201627d47d0eedacebe0.camel@collabora.com>
Subject: Re: [PATCH v0 1/3] media: chips-media: wave5: Add Support for
 Background Detection
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Fri, 20 Mar 2026 13:00:12 -0400
In-Reply-To: <PU4P216MB1149B5B5B7BABB4176BF5C87ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
		 <20260319053210.90-2-jackson.lee@chipsnmedia.com>
	 <c6ddf8a7cc7224921b62f74b87d1c8e5c9c4a120.camel@collabora.com>
	 <PU4P216MB1149B5B5B7BABB4176BF5C87ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-YeU73vwfCghjUcKVMzXC"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	TAGGED_FROM(0.00)[bounces-56550-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[chipsnmedia.com,kernel.org,xs4all.nl,collabora.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 60CA32DE5C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-YeU73vwfCghjUcKVMzXC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 mars 2026 =C3=A0 01:34 +0000, jackson.lee a =C3=A9crit=C2=A0=
:
> Hi Nicolas
> > >=20
[...]

> > >=20
> >=20
> > The hard question, last parameter here is def, so I read this is disabl=
ed
> > by default. What's the side effect of having this enabled by default ? =
Did
> > you already considered that option ?
> >=20
>=20
> Background detection is disabled by default because not all use cases ben=
efit
> from this feature.
> When enabled, detected background regions are encoded with fewer bits or =
skip
> mode,
> which reduces bitrate but may not be desirable in every scenario.
> We chose to let the user explicitly opt-in rather than enable it by defau=
lt.

Ack

>=20
> Thanks for your review.
> Jackson

--=-YeU73vwfCghjUcKVMzXC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab19HAAKCRDZQZRRKWBy
9NRLAQDQ4T/PPuVofR2Wn9g0U8rD2BOC9EdvTR4aHifM/dheDQD5AWry1ZXWC+MS
hSba1L4IzMzuVOZGopWSUVceTAs4NgA=
=WhGp
-----END PGP SIGNATURE-----

--=-YeU73vwfCghjUcKVMzXC--

