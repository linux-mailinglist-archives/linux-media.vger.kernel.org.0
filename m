Return-Path: <linux-media+bounces-62942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJpaGArzF2q5WAgAu9opvQ
	(envelope-from <linux-media+bounces-62942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 09:47:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA21C5EDE81
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 09:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B67F318E436
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 07:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E2734FF78;
	Thu, 28 May 2026 07:42:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0703195FD
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954129; cv=none; b=iIjICFTxoH5E7GFWaiDkwJwxAGwA20TaxHtAyt75paRsKVJFfM+2kjI4kCJq7YbyrjrYoeDa/ROLZD95QN4MrBx4C7o94F5UwM4+BIAzQo3LLuIdlzbQ7n2qFUfnRPoN7zX+oAZk1z8DbP6LoqN1XmdDDY3NT34b1uSOIYKMfB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954129; c=relaxed/simple;
	bh=uAnADGrDbfL9vPfFUaKkzYIy96tZLcZrV9fdweefD5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVrWvI7x64KYdcma+DRmwKjEpLVwffb4PsiiqcNzU9thX9UcnWtQavODVW41442nU1m+faK+iFjmYJ9kU3BducdvySvdHOJAakm7W7qLkR3c18pftTHTLxjFTKfQOZ/oilk3oEr/L5l24zVloAka4EGSe4iAegiP9okbROgfp6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E01B737002E9
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 07:41:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C818AB40938; Thu, 28 May 2026 07:41:52 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [37.167.6.153])
	by laika.paulk.fr (Postfix) with ESMTPSA id 17379B40938;
	Thu, 28 May 2026 07:41:48 +0000 (UTC)
Date: Thu, 28 May 2026 09:41:38 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format
 entries
Message-ID: <ahfxskMC340jUtbQ@shepard>
References: <20260527124552.33815-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1y4O8A5/17eWGJgn"
Content-Disposition: inline
In-Reply-To: <20260527124552.33815-1-arash.golgol@gmail.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,magewell.com,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-62942-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.946];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sys-base.io:url,sys-base.io:email,paulk.fr:url]
X-Rspamd-Queue-Id: BA21C5EDE81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--1y4O8A5/17eWGJgn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

On Wed 27 May 26, 16:15, Arash Golgol wrote:
> The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
> MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
> codes.
>=20
> Remove the duplicated entries from sun6i_csi_bridge_formats[].

Looks good to me, thanks for taking care of this!

> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
>  1 file changed, 12 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index d006d9dd0170..0bec0cd7620e 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_cs=
i_bridge_formats[] =3D {
>  		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
>  		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
>  	},
> -	{
> -		.mbus_code		=3D MEDIA_BUS_FMT_UYVY8_2X8,
> -		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> -		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> -		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> -	},
>  	{
>  		.mbus_code		=3D MEDIA_BUS_FMT_VYUY8_2X8,
>  		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> @@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_cs=
i_bridge_formats[] =3D {
>  		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
>  		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
>  	},
> -	{
> -		.mbus_code		=3D MEDIA_BUS_FMT_UYVY8_1X16,
> -		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> -		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> -		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> -	},
>  	{
>  		.mbus_code		=3D MEDIA_BUS_FMT_VYUY8_1X16,
>  		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--1y4O8A5/17eWGJgn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoX8bIACgkQhP3B6o/u
lQzU2Q//f7QdVsQ1gypsibBCePiIiVDTE55KY5tR06XO8JzvYp2WUJML1pa1ui3J
b5hK2hHdAG1tyJpEk+1PUM0IUkCSO0JcrFN3eoSrveiIUQPQPW1W2wxqiiL3ObP/
ZA/Nos/uppyMmwy/8xNWOYU/vTqe4bcXhfVGsZGuQK2NhTl7xpBu94y3HfCIuYLZ
VCJwKqSuZlEmjj+TrAKf8beYKnIxKtnshcNTuPfg+HT9hKRZ8SAynzi2Cjes0sNX
byb/ugVmjCVHZkQ8frjSAO1OoTAJo3pEsUtjNSiZepBwHlyOrT45z2J7nIfJmf6n
F+lYRl3INteEVBxM2EBleo5Osj3Qx1dzixKx/F4KbTaALRVxFiBj+nPnnen2QBA4
HSU9YcSJ2oqKp5gw2c3z1xlG9w4nWmHOhHOcNEs2+6K5YrzOPgZ+bROfSvQKKOvV
eHGcWvauneSLhc5aXkMO3StdgiUDff4qySgIWu/ZC03DrJ33ydh3ISQKduA21Wao
tf7GbgpBePN0KxgEV4UePBDc9NHXxou9si1MEpl85Gfn8dI339t/XQTWePzNQTOE
6xdY2xXzBMcfmuCuk9vGdVdwfajxHGOk0WUbElDWHxPuYybA4/u3JOohdbk2AQ/9
i1c3+pCSHSTngKi9Jjn0avU+Ir/Oq6D/+gujAMkOgQCZy9jx3Ko=
=jm2v
-----END PGP SIGNATURE-----

--1y4O8A5/17eWGJgn--

