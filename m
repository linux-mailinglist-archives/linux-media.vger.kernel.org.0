Return-Path: <linux-media+bounces-53610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKLxObqeoGlVlAQAu9opvQ
	(envelope-from <linux-media+bounces-53610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:27:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DE1AE547
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5CCB30AF704
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C6A44D689;
	Thu, 26 Feb 2026 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="SSzSE33z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4603603E3
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 19:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772133747; cv=none; b=XmOVKIMktrySq6iKU+HdoIvi0OsDAgqft5BtK14l/1xMsnf4D5egMxn2BGv6xjVAeDb5aCr0HTfjtLlvZNZwHTLOWNz/o3rO0ci7f0Mxl1Z3B5wKRbQ053w/gTtnEym0PzblJQkxxTWx0EAmMQ0pHtLJhew8P7YpxzOvpFRR8dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772133747; c=relaxed/simple;
	bh=NwFBUuqKaqhSaZl/uA6FFg9m8fZIOqYHlvqtNFLVhUg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pdfMxiBEBVo6v7BAwICECY8UgTzgHb/h7FMMOPOyTDmP0P19TdU6/he2cbrF4c10J9Pfv7HAkCM8f27eODuMJGoHaX4arv+0+x7e+xcNMGjTcM26ix5+BegL+IK0V51g2CtEWKI5jS7Y0U14Rc4X2N4FXWJwdsKixMDl/l0wgxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=SSzSE33z; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb40149037so121950085a.2
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 11:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1772133744; x=1772738544; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A935CS+pFCJwHqIuD5r3ZdEwCRjg2qHSUmFznr1ziQY=;
        b=SSzSE33zQ6QuZKphjcKPw/MDc9kBHsn6YaXDnQMVe9HhrvbD6+iKsfGNz063t4ryWX
         4zi3Vz4EWm8DCqn5ivNZsVOm/buEQNF0HszsJqLToUgjS98kk2992bwsNd++X98Bw7HZ
         LBsOAXBmk/a3k7W+JAxRzuXV9N48cGE8ofj/xWfAsoCR+hhJJJkHHzaR4axU0PU/SwsH
         WLwPfqi5BKkMlfYJR61DB2/0QmCkD3Qy1sb6Z+AEC7XDqPYaPrTY8iJzwG0SlCTGMq7j
         uMvEErjEgxGzhE2gx5P5lGfc8T9KsVajM8a/SP4IbtA6Sjo3tnFcxRXIgWj0n0/05Jh6
         cPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772133744; x=1772738544;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A935CS+pFCJwHqIuD5r3ZdEwCRjg2qHSUmFznr1ziQY=;
        b=pG2t4XWF5+ZDgCDR5eljZf2b6JbLc97DCxh/XF1l6Q3AtO5hB2/6TPPgCvUiHaFO2M
         cgkku/M5+2EMnU8qcSiEqO4623DOT7bTuQT2sC9Lef9ZDxKj0pcFueZQl3Vh/3QPcUka
         PVvzGFLfk+qNAsQV/uKqsq3ysK4jFP8VT9VZ+TUTPKaFQuG+tt/fLWfSe2LTSVQYvkQO
         S0ENwGGV8K+IrKzwg9AurBae7SunHomPCIcRnkK9rMLaucKDLGV8CdbzwIKP3kZ98EtC
         UGblykeDpNNblZYsXql8arqi+rAMC3RzLnefiJq82xESLhlbF+CetLWdXy0GYnNE4sTG
         kamQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmIl4Oq5LNTjclwjjiExDYBXYTzO3ZXjFo+M3S8DlpTlkVOyW6vux41IUwK++FsH0FMwxsZIM48RjzEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycF2busgQt/dCBiyzYwLMBI2DsrOP31yvWb6Y7oTmvF8DNhH5I
	9cZXnAT6swPTkoP8M50y+hE1W9CoNIDgEeeRPON45kmxs7Vk0UI5/ZhJThZbtdMm/PgZRGGR52g
	6RTMa
X-Gm-Gg: ATEYQzzChDj+KzKFyLHa49Z4P0/+iFlgMC7h8qJFOFt73E325FA7Fe/017XQO1BwUfs
	303ixJ1RQyVp3LgdIns5lWJoFJI2f8Pzg5f1Pmk1F/8hRl/GyltQ+5DoV1avhL0CK3+O1vJeu8s
	l2eGDYKVxuvQfR24HMII0nYwEdcQGKBhwObSZKgBRR1dF6YBLzI10SB1FidSom0s6V5EW4W/4gd
	edMcfKhWz1AuqFDiQ/AUjdrlxVQsVLHwKI8Hwm23z7WCiKNALCBh8XbwEPvE4nuJ4WyLss1RcWt
	thZbwru81OYfYCptbK3dVWZddJKmNyI7nDzBB21GAMVv6tdO35jC89OeQef9kgzOIiNRmCPpvEQ
	DtHcniUgnQmMhDcJkKGomb0BFAxXkm2oaA0tOqR3XJiSuGu8iIkyUd4NonlakqljJTHuBsdIypP
	qwB5I3e6EAD/cPX6GNAlaeaJ2tedB9
X-Received: by 2002:a05:620a:472c:b0:8c5:3574:90a7 with SMTP id af79cd13be357-8cbc8e30b8dmr13633685a.80.1772133743962;
        Thu, 26 Feb 2026 11:22:23 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7159b72sm25555856d6.7.2026.02.26.11.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:22:23 -0800 (PST)
Message-ID: <e18a526c3a4822d516cab634afa1e72704d23205.camel@ndufresne.ca>
Subject: Re: [PATCH v4l-utils] v4l2-tracer: trace: serialize all mplane
 planes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: yehudis9982 <y0533159982@gmail.com>, linux-media@vger.kernel.org
Date: Thu, 26 Feb 2026 14:22:21 -0500
In-Reply-To: <20260225120048.156888-1-y0533159982@gmail.com>
References: <20260225120048.156888-1-y0533159982@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-7hqoMui/MssQ9K23HbvM"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-53610-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim,ndufresne.ca:mid]
X-Rspamd-Queue-Id: 605DE1AE547
X-Rspamd-Action: no action


--=-7hqoMui/MssQ9K23HbvM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 f=C3=A9vrier 2026 =C3=A0 14:00 +0200, yehudis9982 a =C3=A9cr=
it=C2=A0:
> For V4L2_BUF_TYPE_*_MPLANE buffers, trace_v4l2_buffer() only serialized t=
he first plane.
> Serialize all planes by iterating over buf->length and appending each ent=
ry to m.planes in the JSON trace output.
>=20
> Signed-off-by: yehudis9982 <y0533159982@gmail.com>
> ---
> =C2=A0utils/v4l2-tracer/trace.cpp | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
> index 996fb043..8e9039ef 100644
> --- a/utils/v4l2-tracer/trace.cpp
> +++ b/utils/v4l2-tracer/trace.cpp
> @@ -252,8 +252,8 @@ void trace_v4l2_buffer(void *arg, json_object *ioctl_=
args)
> =C2=A0	if (buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPL=
ANE) {
> =C2=A0		json_object *planes_obj =3D json_object_new_array();
> -		/* TODO add planes > 0 */
> -		json_object_array_add(planes_obj, trace_v4l2_plane(buf->m.planes, buf-=
>memory));
> +		for (__u32 i =3D 0; i < buf->length; i++)
> +			json_object_array_add(planes_obj, trace_v4l2_plane(&buf->m.planes[i],=
 buf->memory));

Have you verified that it works with the deserializer ? (retrace function).

Nicolas

> =C2=A0		json_object_object_add(m_obj, "planes", planes_obj);
> =C2=A0	}
> =C2=A0

--=-7hqoMui/MssQ9K23HbvM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaCdbQAKCRDZQZRRKWBy
9CLvAP988x89j1He1gPCU2vI5cWXhaY7zlNBUPfD570iKV41OQEAnfCKCTbWAEXl
Wh4WkfdGWRiUB7w2WaCr4qnrGPy5+QU=
=72vR
-----END PGP SIGNATURE-----

--=-7hqoMui/MssQ9K23HbvM--

