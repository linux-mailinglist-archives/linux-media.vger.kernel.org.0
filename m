Return-Path: <linux-media+bounces-59407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JGqFTAg6mntuQIAu9opvQ
	(envelope-from <linux-media+bounces-59407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:35:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0009453061
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 695B1300D92E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2152936EAAE;
	Thu, 23 Apr 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="q8VeNQfl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0351E834B
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776950964; cv=none; b=TbpIwF0J5dktNcslOoH3G1ecto6CJ7bblD/eju3vxbP7sJVvaQCx8C3l193l57n1DN/M1XDeDTBTNGVplgF6YqniK2duFe6H5Jvj6t7jJWX4mEVCDJsx0c32zClqgX6nFfUbiPWb2OCwjPuVcv401cnJB210D+j4xoIUtpTkuDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776950964; c=relaxed/simple;
	bh=PAkzXQ58lJzQKOEibF4UnbcevOR9SAAckb1YWr9Tk6Y=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H67icSvlp5uRqu/zGGAIqGevEOVumSD36oA8VHSyK5Tl7Si8qzZk38iJcVi4fg4kJ1gxHr3ZnUGVPxHnFMsA01fpAlV5f2JvMnzp5paTLuYZlmKAFK42SP2ifGrKZDDGiOr2IZr9kBPiYx83E7bj/jlCXwUJf8T3sTGqlXC+v38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=q8VeNQfl; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ef45a6d9dfso281251685a.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1776950962; x=1777555762; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vho0uIgMNPAyLeZ3YIouXu/S7NzkSmQrK1oUazVExTY=;
        b=q8VeNQflyu03sSNXv17Zo5eLxgZh6Up66EAUci5I6f7eH6SysYYvjSuCkPwNZTPLrC
         npPFwQinyZ169Wh7zWTFGwoEV2IqmyXdNLJ9mCjkiW7+Cge+TtjMWrrUpd46gULhNJgK
         4pwFC55D42APB2+Rem5dauxhJI8FolqiCMgQjZRhRfApLEGqGPfwZq1xLrZ1mWVMjM9G
         nLvXdyBJWxX6MhjP+it1P2iyBCKryH5csBQB4zknXkdylH7Qhy6zCXbB/ttqknbtlYAT
         qH+pCWB908+56hahpxyBMPJlnKOst8g9YKmy8dsDreWoLDEtIjfDgNFNQW+/vJAJoOpc
         0Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776950962; x=1777555762;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vho0uIgMNPAyLeZ3YIouXu/S7NzkSmQrK1oUazVExTY=;
        b=JtiEOvZ6/V1o3X4yZrYjLgriKcsV21FCSr8hX9Qd+UyEInpZYb+gPKAZ8ScAG4VfZm
         zyuWwgppKdyEY4pWkobE+fUfSTJ+fP6ODYFhGHLXDMj5Vusqcj5gXvsvECXKab8TR/Nd
         CZn2s21QITm7QcxN8ZTOfIecK9Azto8JVnLgA4jawcmplFuddfFGh0qT1hHLGEd+CZG5
         cCDQkmM3RIh08F5tnmBHMpH2AS5wTK1oOHYrbm6F6Znplm4orAI6TPicFL+kTXs5Jmh+
         vF6eF/1DiCdoYWN2WYSAfadCLlVac2xCuH5veLyjuI2qp+m9W6tjqC8uOypetFl9XS4R
         rGxA==
X-Forwarded-Encrypted: i=1; AFNElJ9Sj9yvKX6AFFUEDk7dDLG/LfTOnpl7XTOkC4OIfufl43ahdBIkBYspwN0KXEruuCEvFqyKRyIhwh6KtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfa2eptR/IxAb49H3FVPqqQI1rYxJxhUi9wt9KkVIcUQTmBAL
	cobTUzC2y/9xzfQtKgrjNAhd5coG06zNw8NdqFO+42O3PhT3usnb3G4aAE3Ql3oZTXlb1BwRqqH
	ZWhJG
X-Gm-Gg: AeBDieu6ZsLxcPyty9vUoxYD/XKf4y+N/sW+xbDNjLurlBTw3HW7RuQOVgVT5Gf+VXf
	6ZQOxgRRSs7rn6p6dg14WVkYsk8kY/GDgQmWv27a5IIR4hW+iyCJ9a1z0FykyiDu84cGi5I3Gqk
	itH4eNbEoa29Eihyp4fp/qijxLqCl37c8dQJDry7aNClvUJEDC9yCRQtG+V74tq/p5/j7MO+dgi
	lOnqcOjVb3iL0m87KphtjBOx/vwrAL4JJEEyZrxMQvdUYWTYLv17SVIUAZW8IcUp7xusxnAvoPp
	rBKaDhIEVPIPyb11YcP5KAB2OyCbPa2QicUFrxB0dkB3zU0+R/yXyeE3TVpnKY4h+LooDbXQkgx
	/dnA1m7a6uWNMEJ1o7ujcR006n+PfFAJ5u69jU3VjFV4jprYv5lky7c5CcbEiFiLoAj6NOpeQ9H
	zcDFg1l7jtSqrNf3DY0FailTZA0pUJovdvYbLOuY8=
X-Received: by 2002:a05:620a:a2c3:10b0:8e8:bedd:14b2 with SMTP id af79cd13be357-8e8bedd1701mr2353783185a.43.1776950961799;
        Thu, 23 Apr 2026 06:29:21 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d64cce76sm1680070485a.14.2026.04.23.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:29:20 -0700 (PDT)
Message-ID: <40fbd3af0b7f502ccbd05ff165ae2344f2019588.camel@ndufresne.ca>
Subject: Re: [PATCH v4l-utils v2] v4l2-tracer: retrace: support all mplane
 planes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Esther Zilberberg <esty5664@gmail.com>, linux-media@vger.kernel.org
Date: Thu, 23 Apr 2026 09:29:19 -0400
In-Reply-To: <20260413094639.8615-1-esty5664@gmail.com>
References: <20260413094639.8615-1-esty5664@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-rjoFtftU9EVDmJyNm4HO"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59407-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: D0009453061
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-rjoFtftU9EVDmJyNm4HO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 13 avril 2026 =C3=A0 09:46 +0000, Esther Zilberberg a =C3=A9crit=
=C2=A0:
> For V4L2_BUF_TYPE_*_MPLANE buffers, retrace_v4l2_buffer()
> only restored the first plane from the JSON trace.
>=20
> Restore all planes by iterating over the "planes" array and
> reconstructing each struct v4l2_plane entry, assigning them
> into a properly allocated array.
>=20
> This ensures consistency with trace output and prevents
> incorrect buffer reconstruction for multiplanar formats.
>=20
> Signed-off-by: Esther Zilberberg <esty5664@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> v1 -> v2:
> - allocate planes as a single array and populate it directly
> - change retrace_v4l2_plane() to fill a provided struct instead of alloca=
ting one
> - fix indentation to use tabs instead of spaces
> - add blank lines between scopes for readability
> ---
> =C2=A0utils/v4l2-tracer/retrace.cpp | 23 +++++++++++++++--------
> =C2=A01 file changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cp=
p
> index 010936c0..f4e4d3c7 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -199,10 +199,8 @@ void retrace_vidioc_reqbufs(int fd_retrace, json_obj=
ect *ioctl_args)
> =C2=A0	free(ptr);
> =C2=A0}
> =C2=A0
> -struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memo=
ry)
> +void retrace_v4l2_plane(json_object *plane_obj, __u32 memory, struct v4l=
2_plane *ptr)
> =C2=A0{
> -	struct v4l2_plane *ptr =3D (struct v4l2_plane *) calloc(1, sizeof(v4l2_=
plane));
> -
> =C2=A0	json_object *bytesused_obj;
> =C2=A0	json_object_object_get_ex(plane_obj, "bytesused", &bytesused_obj);
> =C2=A0	ptr->bytesused =3D (__u32) json_object_get_int64(bytesused_obj);
> @@ -222,8 +220,6 @@ struct v4l2_plane *retrace_v4l2_plane(json_object *pl=
ane_obj, __u32 memory)
> =C2=A0	json_object *data_offset_obj;
> =C2=A0	json_object_object_get_ex(plane_obj, "data_offset", &data_offset_o=
bj);
> =C2=A0	ptr->data_offset =3D (__u32) json_object_get_int64(data_offset_obj=
);
> -
> -	return ptr;
> =C2=A0}
> =C2=A0
> =C2=A0struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
> @@ -284,9 +280,20 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object =
*ioctl_args)
> =C2=A0	=C2=A0=C2=A0=C2=A0 buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPL=
ANE) {
> =C2=A0		json_object *planes_obj;
> =C2=A0		json_object_object_get_ex(m_obj, "planes", &planes_obj);
> -		 /* TODO add planes > 0 */
> -		json_object *plane_obj =3D json_object_array_get_idx(planes_obj, 0);
> -		buf->m.planes =3D retrace_v4l2_plane(plane_obj, buf->memory);
> +		buf->m.planes =3D (struct v4l2_plane *) calloc(buf->length, sizeof(str=
uct v4l2_plane));
> +
> +		if (buf->m.planes =3D=3D nullptr) {
> +			line_info("\n\tMemory allocation failed.");
> +			free(buf);
> +			return nullptr;
> +		}
> +
> +		for (__u32 i =3D 0; i < buf->length; i++) {
> +			json_object *plane_obj =3D json_object_array_get_idx(planes_obj, i);
> +			if (plane_obj =3D=3D nullptr)
> +				break;
> +			retrace_v4l2_plane(plane_obj, buf->memory, &buf->m.planes[i]);
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	if (buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE ||

--=-rjoFtftU9EVDmJyNm4HO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaeoerwAKCRDZQZRRKWBy
9H7bAQDnkgTM2ZgxaSsB0Ysz8QmyRx8b+e+I3112g6JfqxIxiwEA01TaxwmxCcPh
zufYogHQ3MJ+LP1BnKyWJ42vXBokzQo=
=LWyg
-----END PGP SIGNATURE-----

--=-rjoFtftU9EVDmJyNm4HO--

