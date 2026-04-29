Return-Path: <linux-media+bounces-60018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBAJIDhX8mm5pwEAu9opvQ
	(envelope-from <linux-media+bounces-60018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:08:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F64998A4
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD41A305EE05
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C97423177;
	Wed, 29 Apr 2026 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="GUwG85sZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0E421EFE
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489687; cv=none; b=BIEEqx0Ru+KJpdos42+V+tzrMcsdhHA/Dc6iDWv/5h+VrUudXfG7DyH5IYjd5tDK+s7YPD9Ny2MZ84vFQtosYbizzfRh/YIlIJ1Ve7Muul7Pa503qXjM9Y58GqG+FW0SY5YeYZLYY0Euc3YMv2oYz7VnLfvuCwTo2IwLTnlvArw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489687; c=relaxed/simple;
	bh=7+Hvv4+54ohcqqP5bPt0lbTIfMcofDo1/arHFiSOaAE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DFTUm/qWxKbg40a5ZYGtKN2umNjr9QlV7+10MzrLWZNcaU/HCAWt7szxQT6sw9cKjVsxnEgEyPl/uDIQQ8lSyp6fk/cQzkPkHae7nogXb4F1SDE8uGOeVqmTRjFSjPu3ZTVvuPkTM2nZFEoiE49vE1eS3T2sENRzFQeaQJypUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=GUwG85sZ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8d4f78fc9f6so11296785a.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777489685; x=1778094485; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ysVs+tGOn7Mjhq3uiCYR8hMiyn+nHB8HC49fRVE07mw=;
        b=GUwG85sZAEQn+CH3KIx4pYpsli4KMNjOSjV3xQGIXR1JI/KeuxKZ1tvVW71Z78x200
         5oVuohzxxse+aDSD9UoX7IAQJy4ELZescDTbA3Aebi/580taARxrfFKNXigAwvLOuWGv
         x0UCNl1fyNM5TJXpDywhOxQrD7SpBN0ap4Rx4qqrFViq3stRcEtcUA26qoJSACSyP3rB
         sjUKrOEsbNFEmdKujd4w0dgDYTiab0ebcoWEY3SKz09Y2yZpxWqEcou1yumSR9e9GEm7
         1RaT0a8I6EwsYCgarVV5cTScFt+9Vw8xG0acYRSDv7YvMCmwvejTWs8WqJWE7OxYZ0T0
         IqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489685; x=1778094485;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysVs+tGOn7Mjhq3uiCYR8hMiyn+nHB8HC49fRVE07mw=;
        b=bwmphQ2BavdSISz8k/rUB6MJAJB2ze4w5jjS9Eh9jhgyqhs96z0mjoKBEwKoI9G2mw
         YJzGISsd4XKUFSrxsjUgQh5A//En1dgrDYpO2wfA2wKnvyzAdSkyBblYv8X7L0LlaMTO
         2C6nt4bNpUmFy2eIaXMBE7nm+2ai+BNAMdTo5b6vvQHg5sKlMaf8vfDSAbVgVF8/h6Ex
         JzOeUM/jRU53qbRtf7iC9ECn6gD9DQKXpN9SebZ9KmpByhSM5zGnOcLOd1gpTTbokb4u
         HS0PQjHVApk4iFzKfgKn1NNmHDvomp5JQY1Nvdehr3/7EoHxoYTIfClWQ5Pka55N4dRC
         6e9Q==
X-Gm-Message-State: AOJu0Yy5Kl3KHZ8FtCT3Rzz2lriAh2xx5KvyClISNfSq5Z81CYsXcWi7
	lAJroqbKpkIoiXygrpcTJFnTnINI1ONppvW62pk3KGlmFCeOWowu3XlTO18699Grt5I=
X-Gm-Gg: AeBDieuMvJKg47lSVSk3/Nc9FSqbYyKzf0/cvbnTg6pFEKtyo68eEDRbtNlys93CDqA
	r6ExzsA5otEA2fxWsGCe6zbru5e+pcjZu+PGX6cLezs62eVC/v2w65RXatcVtwbAbNA4XJ2uB0Z
	XMNCNAJ7qcSY/dqhZZs/ocx+LgwHbIiKC1e+JjeWutJFc/D4n5NeyFl5W1oqB+oKYWkfA6FYzt3
	t7Tpq11doxvgW4/77Y2tXS/hkn1n2LJOoGXvrg6BXW8ILLEhtYK8PALwVZmsmYBta8ijBWrXY9n
	+T5R2RzRODhQVE6d9CwZ+khhQwgp1qQ2Fxej7ffZqGjNHgS03RYTN54chQUNms90xQiHO7ZlsgI
	/P4HbdL+MDGBZtksAxyBzOjAXGzJ0PdX/3LuzejCspXBF+XZRiLfUhIN+zyq/5cO/odLp/DUIVY
	rZvQGukOiU/OsECK2nODC9qM/L2WoMR+j9xsvqbse/3V2Rx9ZR2A==
X-Received: by 2002:ac8:7d51:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-5100e0f4ed9mr120711691cf.4.1777489684869;
        Wed, 29 Apr 2026 12:08:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ae657d7sm23790771cf.21.2026.04.29.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:08:03 -0700 (PDT)
Message-ID: <6b9544538177a833c7de635782c67f3fae0beef5.camel@ndufresne.ca>
Subject: Re: [PATCH] media: cedrus: clean up media device on probe failure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: =?UTF-8?Q?=EB=B0=95=EB=AA=85=ED=9B=88?= <mhun512@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, Mauro
 Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ijae Kim
 <ae878000@gmail.com>
Date: Wed, 29 Apr 2026 15:08:02 -0400
In-Reply-To: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
References: 
	<20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
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
	protocol="application/pgp-signature"; boundary="=-ArOwzQZ1bmZyT5qFP9QG"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: D31F64998A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60018-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,sys-base.io,linuxfoundation.org,sholland.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20251104.gappssmtp.com:dkim]


--=-ArOwzQZ1bmZyT5qFP9QG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 27 avril 2026 =C3=A0 19:00 +0900, =EB=B0=95=EB=AA=85=ED=9B=88 a =
=C3=A9crit=C2=A0:
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> cedrus_probe() initializes the media device before registering the video
> device, the media controller, and the media device. If any of those later
> steps fails, probe returns without calling media_device_cleanup(), so the
> media device internals initialized by media_device_init() are left behind=
.
>=20
> Add a media-device cleanup label to the probe unwind path and route video
> registration failures through it as well.
>=20
> Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> =C2=A0drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff..2c25654640 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, 0);
> =C2=A0	if (ret) {
> =C2=A0		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> -		goto err_m2m;
> +		goto err_media_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	v4l2_info(&dev->v4l2_dev,
> @@ -533,6 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
> =C2=A0	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> =C2=A0err_video:
> =C2=A0	video_unregister_device(&dev->vfd);
> +err_media_cleanup:
> +	media_device_cleanup(&dev->mdev);
> =C2=A0err_m2m:

This label is left unused. Can you fix this warning please.

Nicolas

> =C2=A0	v4l2_m2m_release(dev->m2m_dev);
> =C2=A0err_v4l2:

--=-ArOwzQZ1bmZyT5qFP9QG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJXEgAKCRDZQZRRKWBy
9Jb5AP0W2NO3lfYARP66qlgaOk81oBVFPzJbTkbCjtmBnCuWbQEAqCvyLm4BXXjp
0DRDRSToJuHjR05VHYK2ozXTCeXXgQw=
=JKEn
-----END PGP SIGNATURE-----

--=-ArOwzQZ1bmZyT5qFP9QG--

