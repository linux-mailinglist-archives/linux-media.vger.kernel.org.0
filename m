Return-Path: <linux-media+bounces-57663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFQqBBukymmx+gUAu9opvQ
	(envelope-from <linux-media+bounces-57663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:26:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0BC35EBCD
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 356573020841
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05880377EC6;
	Mon, 30 Mar 2026 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Wb97IPw9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B337754E
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887924; cv=none; b=MLmyRN486D+dyIK9POvDN4w2+PpKtqERBS3djWW956DtT+toJb3AQ2LKOPzaOv6Rx7Kc7wq40/OhZ9MCmS9YKNLvC0gOn9a0EUBu2/wQ6tacP+Cf9eGEsak7DTfcjn2vBcuQPLFhxUIEyvFSJLo3lNwYv/j/8LaNuEAb/2kUjiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887924; c=relaxed/simple;
	bh=TgeS4uXvThbKjZ2zgtFjmCQiZIFJ4qXW+Xww/Mrr05Q=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ewbOsEa2iKvE3EWVIoyrhKV1zcrEq2VHgVRRtZwMhTMcF6MweZIi1UTdtFDd1c0lG6QCuGDCbSXFGP5mEtVAuwyZZOrPnpuY+wJt6YYF9obMBE9M4mzGczHnlQwptKqKYl48XO1YrlnGSCuV0GSBfQC5qJhHfZJa1NGiMZ2jTjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Wb97IPw9; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-41708f6aa5fso3364082fac.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774887922; x=1775492722; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yTGl7aQCydLh9tNxAl7E8SZTneilCyWUsD+zFumtUYw=;
        b=Wb97IPw9gGC4vkuq+PV6CHFnVyp4um3CjxmofMSwiI2vnIFYxqluPGzHGmtnNELW+S
         2TJ5Zo2NjhAy6lqTs++fZAUSU4wiDV5MDx8pG/kg2HOT71i9a7t7douQecod1tPZp6XO
         X042+oa6SLbv3f4n3PsLYR3Z8t2eDoC8Tc1odcAUgFEiCqKvkGJTJ9yw8ASBv0Ws5RY/
         RV5Ix87u4EIDOcW3pCcmiTRJoFOjxpI5jmjKUz88g4oFfhB0AnpaHefck44g4jLj3cBE
         B3Nk8SuJG0uyIvbc2NpsxO7TALiDIY6F2pmsKR3HCh8xRYFVHbk91LaCeEQm6d1e3lWj
         wn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774887922; x=1775492722;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTGl7aQCydLh9tNxAl7E8SZTneilCyWUsD+zFumtUYw=;
        b=Ooxj0WgnYvcHAHxff6eJ8yeEl/zArxfns4B/CLNUDLQlijTM3mCvsnyRpforCq3vJx
         EhhxsPWBJ4GCItid3kbOT3k1KUiCVk7GpY3Wq4poip8sJyggKL4r464GE/DjHxEzkU8q
         A/ZgZNhQ3CBjcxNxg3r2fxEOX5TRcbDDUkD+Ap0Z2XBfczP/Ngw6mo7MJSv/E82Ab307
         ubC151vNQLiN6S55N0HyaRL176KnVBG1o/mwNGU4MOTY8yWKJt97AzvFt/SHHFYrYebi
         zcRsO9eLQg0CkQ/zAvH9+ROYpQ4T4eXXHSHBGrwkCKwf4N6+1mJASZNdsYbXURhmoj+z
         aKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNiSSfHCyPRQl2Xh7IkSFxOPTDJbEPD17ch15DSZx/My2iesD24YvfWA+kqacOBt4f5K0GkG4Tcdg9dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLPYEhp0PKlfdDjAgX0b56RXfaZ/fYZHL/+udFlZQi+2wErALt
	R1r7ytZKak2IDiBvMu20ZCJIU0QC4VCAPGqNt7YZyUuK0o8SQQXWbhJjk93C8hyq8HnXy2WfPu2
	fjKEz
X-Gm-Gg: ATEYQzyt9YoEGHU3hhE0s+PH64oK/ZJhj2sgSHD1OW0la6/QZpGShvRq6rcC11WpLWd
	bMkxV6OjZAlDL4dhstaQCtz+muCAbtZno/DwOea5WghMk2ZNyuYY6UbAqRKM8Vxc+ymyiPhyUTP
	JM75O/Q0nnnpBY3Mw2CxIFtyZiTUcpKW1iCGTRUMuoVOeFODZrpdLHrNQe6gEJ86aaYy0BrnElN
	MTmk1DWntQzy0gVuJYmYJoFXlHlpgkfWbf2r9qluLLJYLDzKNppTX7+I/uUqYcgJc+B/7U8W7sY
	+jBCWoi/JiDNqs8TneKrpXiSBq4UqAYcRqTVsj5T3CA0np0In+8avrF2EIhOFMqJFMqY/GBPdpy
	rL5MEmPiTspWFdru1lcCEEifgD+okZC/RLyVTOHt7LrSDkLNOdOgqdU7hABoKxQ5hHiuf+UmyZW
	1jViavtI0rbhyICiZG7tk1Zk0MUeSr
X-Received: by 2002:a05:6871:4706:b0:3ec:5267:cb6e with SMTP id 586e51a60fabf-41cec2f9ccamr6644293fac.23.1774887922060;
        Mon, 30 Mar 2026 09:25:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d0494be33sm5380422fac.5.2026.03.30.09.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:25:21 -0700 (PDT)
Message-ID: <e674677c42000efda5fb8ddac62e13ea372591f7.camel@ndufresne.ca>
Subject: Re: [PATCH v4l-utils] v4l2-tracer: retrace: support all mplane
 planes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Esther Zilberberg <esty5664@gmail.com>, linux-media@vger.kernel.org
Date: Mon, 30 Mar 2026 12:25:19 -0400
In-Reply-To: <20260318084936.10626-1-esty5664@gmail.com>
References: <20260318084936.10626-1-esty5664@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-hi0dnmLCBfWB07BUeB7S"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-57663-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 7D0BC35EBCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-hi0dnmLCBfWB07BUeB7S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 18 mars 2026 =C3=A0 08:49 +0000, Esther Zilberberg a =C3=A9crit=
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
> ---
> =C2=A0utils/v4l2-tracer/retrace.cpp | 19 ++++++++++++++++---
> =C2=A01 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cp=
p
> index 010936c0..844c25c7 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -284,9 +284,22 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object =
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
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (buf->m.planes =3D=3D null=
ptr) {

I see that you use spaces instead of tabs. Can you fix it to follow appropr=
iate
style. The two lines above are suppose to line-up.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line_=
info("\n\tMemory allocation failed.");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(=
buf);

If you are on plane 1 or 2, the previous planes are going to be leaked. One
simplification you could make, is to allocate the planes as an array and se=
t
pointers into that array. Then you just have to free the very first one,
regardless how many planes.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n nullptr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (__u32 i =3D 0; i < buf->=
length; i++) {

I find it easier to read with blank liens between scopes, if you don't mind
adding it.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json_=
object *plane_obj =3D json_object_array_get_idx(planes_obj, i);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p=
lane_obj =3D=3D nullptr)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t v4l2_plane *plane_ptr =3D retrace_v4l2_plane(plane_obj, buf->memory);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p=
lane_ptr !=3D nullptr) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 buf->m.planes[i] =3D *plane_ptr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 free(plane_ptr);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0	}
> =C2=A0
> =C2=A0	if (buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE ||

--=-hi0dnmLCBfWB07BUeB7S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacqj7wAKCRDZQZRRKWBy
9IdgAP9ARREt/YF0Onod9Xo1i3NaGJpT1xZsTZHw//j9/FMj1AEA/OXEloU78ZRw
M4W2ZA83F6R7tGZTHrYkXEBlxxoy2wM=
=OX6P
-----END PGP SIGNATURE-----

--=-hi0dnmLCBfWB07BUeB7S--

