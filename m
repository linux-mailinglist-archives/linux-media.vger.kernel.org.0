Return-Path: <linux-media+bounces-59897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBNtERsa8Wm3dQEAu9opvQ
	(envelope-from <linux-media+bounces-59897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:35:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B448BCD3
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E1303011510
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA55030EF84;
	Tue, 28 Apr 2026 20:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="yqrm98qq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3BA2C0F81
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408527; cv=none; b=QH7iEnrzqCGoRqYqS26tMrsH7R+zbfjcQVwHGZkms2Ebnu+d/s0pv13JpA40IbN55ZMdE6MkhNtVKiawssFTfJmSqwiELgzxGWPi/5ZdDnTks1GS6G6fpXs04QINivx9ex7cFL1nNRq3zdw06jN4xcNGyMVAxT9d1sBAiruLIAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408527; c=relaxed/simple;
	bh=DpwCPyBht/KuywC2kfTeJdCwJw5ib0jMlqQTXCR16uk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SkJ/ChCp5esAIzmD52qstuZ8lzOiJBWoBO+QK4MpdH7NTFZTluAoLwiTLMwmPZLnAVmR8dl4O8PRDDvUQw0i6wu/79XsIi6T91ZnWB4pQegqBvoGd4IF13h5b6xIfx4BI5vtBbpRDE+LYCZl69eoKLbpyaJAfyEazW7jtzjgKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=yqrm98qq; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50e97863425so91223441cf.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777408524; x=1778013324; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AaIfLAokMdpz1ds5EXxIXoKOS9Wl/EtwVtRKaiR6GHI=;
        b=yqrm98qqD1pg4BwyH43diLYWyam5V3C0q/zJnw8nqzpucm3Eo9IclRyNorZVtck7jp
         yTcBPd5UL1BZXXrJToxJnh7VhUVQ1F915SZzbkdLGg4XLTTild/0Nv6ybPm5h7C1atO3
         YlUG6HLGuW9s0m2rK766CpsWvlGUJwTRiIrFdbSJkNyfNVY819AmXn0hEhpKZSi1pTNk
         v+9iS6TLEW25/upCWVUImNXcZoy4/j4CAnko2lVjXiFXDVY1UeXFt51Bok5fMALmlCaI
         T73EjwaKa3UCd8mcLiEalNlm+UrVzfS/QzYADhxrYYNbYcxhUx5WwQV4y9415x1aTRdW
         +AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408524; x=1778013324;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaIfLAokMdpz1ds5EXxIXoKOS9Wl/EtwVtRKaiR6GHI=;
        b=FqBRsXz2VW1c316kFIqjOgRI8W9NKm5ZGxyEz88jpn5bOth/SzAL8RyBwZHKr7CSiL
         TYy8nG7iENjHgG4rvQuMNie9ZmwN6ISL2d4aaMcB/kSBl0l9kOYQW6AwUCGjB8h9GlPM
         rF+UNIsJAlI0JuGF7PjqgoCid/HZeNambfVdlHCDW15YHbpOad6bT+3eG7szF4yB/VFQ
         eNQI3JVXx32CwWGqRLdy5G4Jg+BN5wwSFJElMuz4IQowHhrz/acEmg+FhXiSeREUexoT
         UjkI9rqRBTXqb9co8qsnJ8dLJ9HRL+arvdvBCvwated05NUHANqMhZkJYaT/G3AKn2cV
         /ytA==
X-Gm-Message-State: AOJu0YwM++1wNccFbpOb8+dbqVFbPHTZntkBxfTnaF6+wAJNBM3iwoP8
	026lyDv2oCwrnVXGWaGpwzsXnPnDhIkfYsgPrUKC6n27ihO2geyiczA3kCcYmCnH8+k=
X-Gm-Gg: AeBDieu33eM8lATp9uL1huDt9pOrrF22fLXIn9d2PTbK36323GhbWSvKQ5l5pGToBAk
	Vkj/TW3aRGsOTcMrxeMZXyKhv6i+7ibTYAQyNRpLmsAYYZLvp0FakC9AB5NIhHuq7YZdRJe0ABq
	44AUDyWLko2u5fIfyoJcLLGdtAbMBCOIoB71lTQyejDaPLjq4up13jdtb6ZO63GwvB/s4RtG9pY
	/b6ipyLKTsG+zsv2iCJJZWC1zDl8UFFTvoNX2rJHhJEokfgxokq32KqDNEpUfkC/9L7Jk0OO3a3
	TwYk2VL3yDTsL1xrD8V2q4U6ljuYA7TjuVWWxGn6tD7mGHnexqCTG6wfg4Xg+EQHDTmJEuROWCD
	zStN/JrVEajFY8uJUAy8YMe88MxBJXxcMzhDVt41zY3zbwGPi7OZwWBBXjvJvFIkAFZl6oseJZ8
	fR3IOv5YfBj1xj0wGoOknUyGY9xxG1dmKYJy9ze68=
X-Received: by 2002:a05:622a:347:b0:50e:60d7:b272 with SMTP id d75a77b69052e-51018a79483mr17709131cf.41.1777408523633;
        Tue, 28 Apr 2026 13:35:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100dbaa48asm24893241cf.29.2026.04.28.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:35:22 -0700 (PDT)
Message-ID: <48ec46cc064fb5d367be6336bfafd888586f7857.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: free working buf on error path
 in vdec_vp9_slice_setup_lat()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de,
 george.sun@mediatek.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Tue, 28 Apr 2026 16:35:20 -0400
In-Reply-To: <20260330020224.2729252-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260330020224.2729252-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-rldXSCr7JE/S7Fo4lx/T"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6A8B448BCD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-59897-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[isrc.iscas.ac.cn,mediatek.com,kernel.org,gmail.com,collabora.com,ideasonboard.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20251104.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne.ca:mid]


--=-rldXSCr7JE/S7Fo4lx/T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 30 mars 2026 =C3=A0 10:02 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_lat()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer to prevent potential memory leak.
>=20
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 deco=
ding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0 | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index cd1935014d76..3dadb5cc8876 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1168,7 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9=
_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf=
);

This function never fails, please remove its return value and remove the er=
ror
code below instead.

> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> =C2=A0
> @@ -1176,14 +1176,16 @@ static int vdec_vp9_slice_setup_lat(struct vdec_v=
p9_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);

Same issue, that function should not have had a return value.

> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;

Ack for this one.

> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}


cheers,
Nicolas

--=-rldXSCr7JE/S7Fo4lx/T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEaCQAKCRDZQZRRKWBy
9I7mAQCKtYOYjxEZtyyws6YnoZefw8GOxDT6CrR4VAMH4mJxOAD9HYVii/B6UZO/
0E2YLN5lf+OdoZWjC16cj/8Y7uLZaAE=
=+BZO
-----END PGP SIGNATURE-----

--=-rldXSCr7JE/S7Fo4lx/T--

