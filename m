Return-Path: <linux-media+bounces-44941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A2BEB6F6
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 22:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9449B6E2F5C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 20:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291BA25743D;
	Fri, 17 Oct 2025 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="VV1XvIul"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3462C33F8C9
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 20:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760731360; cv=none; b=Rg19D1J773yBJOMmZdG8jwwmqR7BLyEIrPCEXwSN529BSdPVtvf7QN+Zlk+Aacu+gbe+CnugBX7S3P7v/ACWsIG2j5BUREjmjVp/seQ+7nexyEO677rFNIvZM1eRotzSBZgqE91bftw/wbyePzot72c2rsram8xRCzvN0FpJkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760731360; c=relaxed/simple;
	bh=YEmcixcro8qq5jyMdQ3+GPIbFdsNJT56ZX2qwi+396s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CdWADnSzIsWezwGzApO8oAqBBtgarbvxL8dEXQcG7cYrC6IOk9yaZJTMjwiVxGmrkVo7K8laQQOKiadQpJtumTN+0IVDR/kKGtHQfItEg0uPhmt+/yfle3hWP4uT4ERCUBJGtYeDWuWzygR4R7vgiC1P6Y86I7+O/ZiVj9zznTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=VV1XvIul; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-85d02580a07so403323185a.0
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1760731357; x=1761336157; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J2tuttkyULuzLdFnQ9MtmS6DjBEIf7L0xEYqV2T+pNs=;
        b=VV1XvIulPtxO17/390LOp7rnC5kYGHLIF1e9gGzKuMqTUG0mfDoMFYjoFWqFF76IH4
         4Ac71YbDh59Ph/0pAUxCXrur7kz4LFILk/kwYG42zSPyo1uI+TMxzlOgj4EVwrceKAmg
         dCw9+F6cdfGm5ZLB1v8Rb1/bk95IK6G0EInPK10EcnPiOJjqEP/xVQYWAvMSPIwWjOYf
         RGS0UsCDHq72g4OeDTVUqEYOk7grJDIxftl13L+H0w27OYOUaz6V6OZRExsseL4NCwvt
         YB4cVIddo3OMNHXPx9a4Bq9bpI3I47TaoZb2BlCul8Xo+akzRToBfvx5YH1+xkcrsAEU
         bWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760731357; x=1761336157;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2tuttkyULuzLdFnQ9MtmS6DjBEIf7L0xEYqV2T+pNs=;
        b=qECphqu4aeSYF5bRlaYMkUv8EGEgJ81vGjorfsb0hWsdhcKY7/1ZGCsH9JfTiA2CH9
         8KKQohX4SwSB4XdTc6wp/wXv2M0Vb5EHWEJ/2pD1/Ha8yrS70QJEhrCF+ya4g4t/37I3
         WPqWu6rdtfysgn8dvbU2Q3TdWZBqJvxsrvMG36l6pANr/bSpbxceaxEEwLRi4gvmRMKU
         WREAvOs6V2b22fHWkY7tM6kTVNn/hK1wC/S4Rip2LTNsUGMabIt+H2m7TovFjQUyGndL
         RXboWw0QVP569EW5T+EPnQVFDQ8gOZFWxEwaVTbamEadssHJwBgZl7tjUT3K5dLBxYFz
         oa4g==
X-Gm-Message-State: AOJu0YyNcI9p+2cbD4VDbZpgkeyP0Vzv4iqRGyURXDtztUaQ3RqQU6g3
	6DdtgtylbGd52Oj6T2dOlRqZkuIF+gbpyXjhADg//tVqvjxy7fZiv1HoYXJIWM59+po=
X-Gm-Gg: ASbGnctp7xTmbtWLfwgtPSfOS5DZGTIa6epmGIqDdxxlGvVUlM4Wt1QJX9RknptB4kU
	ps5/xOW7+MHWwR0vsuqWZ6VlREs8r8rsuTz9GjPX82NchZOpos58pek6Ld61tkZ66pYB90abiFU
	xQ+yu08upPisF99PuA5Dq0n8xGKXzBYDts7VhAMTA9z6mzxt2Er+YuCbhLvs4H9JMjnIr/nT25M
	TP7LKPhBJFBBJu8fEcRb4PVi2pYCQZk7gcCG49yKAendyGZgIwMh/38PMiqUcUvVu0O7zG4RR64
	iw64K+biHZtcrv4lPtFujjwE1r6hOiynpJBmVXA8fle1vJNA0CHasZXp8+OPEQRL/MKLJQdM3Oa
	t8DgR2rPsoEojncg3Z3wQOkFV7e3A5wGKlg3nVssJGM/JQRdBDbvOTb0bjPaE5mj0ajlII1EzsZ
	6aOQFL2wKxS7OU1f+VHUHDoCVzE50=
X-Google-Smtp-Source: AGHT+IHSMUePxe/bPZ29PJJFlHHcFR6pMPe4oHFJ8eKH5Fc8kGyfOKlZkSlsIdgsAAbV4DdfW1pCaA==
X-Received: by 2002:ac8:7d05:0:b0:4e8:aaa3:8b6a with SMTP id d75a77b69052e-4e8aaa38d5cmr16697371cf.25.1760731356941;
        Fri, 17 Oct 2025 13:02:36 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87cf51fc208sm4660666d6.13.2025.10.17.13.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:02:36 -0700 (PDT)
Message-ID: <342257a17444d96eaaaa9392d157e85de679723b.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/5] media: v4l2: Add description for
 V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
Date: Fri, 17 Oct 2025 16:02:35 -0400
In-Reply-To: <20251017-av1_irisdecoder-v2-2-964a5478139e@oss.qualcomm.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
	 <20251017-av1_irisdecoder-v2-2-964a5478139e@oss.qualcomm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Urt5bDwGCibGgnCKgiP9"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Urt5bDwGCibGgnCKgiP9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 17 octobre 2025 =C3=A0 11:35 -0700, Deepa Guthyappa Madivalara =
a =C3=A9crit=C2=A0:
> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
> core/v4l2-ioctl.c
> index
> 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a5=
4b5c8
> 6251 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
> =C2=A0		case V4L2_PIX_FMT_QC10C:	descr =3D "QCOM Compressed 10-
> bit Format"; break;
> =C2=A0		case V4L2_PIX_FMT_AJPG:		descr =3D "Aspeed
> JPEG"; break;
> =C2=A0		case V4L2_PIX_FMT_AV1_FRAME:	descr =3D "AV1 Frame"; break;
> +		case V4L2_PIX_FMT_AV1:		descr =3D "AV1 OBU stream";
> break;
> =C2=A0		case V4L2_PIX_FMT_MT2110T:	descr =3D "Mediatek 10bit Tile
> Mode"; break;
> =C2=A0		case V4L2_PIX_FMT_MT2110R:	descr =3D "Mediatek 10bit
> Raster Mode"; break;
> =C2=A0		case V4L2_PIX_FMT_HEXTILE:	descr =3D "Hextile Compressed
> Format"; break;

--=-Urt5bDwGCibGgnCKgiP9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPKg2wAKCRDZQZRRKWBy
9FtGAP9GU55FUgYIUK7UMe4RWo1rWcRc/rK/aIKD3lFJ+Tf72AEAyzhydjJDt7q0
d+DNRq/gFNH5HTnd8V7SL298V0H6TAc=
=gGm2
-----END PGP SIGNATURE-----

--=-Urt5bDwGCibGgnCKgiP9--

