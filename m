Return-Path: <linux-media+bounces-43672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5051BB5083
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 21:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56B9F7B574B
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 19:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC81287257;
	Thu,  2 Oct 2025 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="EtJOEWJX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB412820B2
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434190; cv=none; b=uA+Oad/Mxt1Kek3WU87YKG1/1UcIqD6R3LXspLtRU6apMoJProAy6okz+4OXVyO/t+npmQCUxF4crN2SmBBTA2o3Nzcko3qpap1rcmRpe0fM1El/j90Cy7ofCSp6/rFjG2XQsFYMrsAqoN6I3Q9/zbU0gPHryu4f9ETYK+a/DTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434190; c=relaxed/simple;
	bh=A7KqEddsKAVljMmXY3IRxI+7rX4YiRQA/2iN8f0iHrQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PbmOgWRreZnxTPpBT03+ShVh0U6Sxom/Yt7BvnTVsOmXEYxfnkIJEYOdXnhiwW7v3ibgJ0dwcFoKI0GqTCuZgsL3qZmZ8MEuRbLZTZKLlXyeUq21TmtT1/z6A7ZZhseznuCphVbMlQXaMmEcxXAIn9I0nIQW1ejz37o9ieAxcTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=EtJOEWJX; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4da72b541f8so16783681cf.1
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 12:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759434188; x=1760038988; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GLbu0A99oMaa9nLYhV9YO0gV0kE8G3JYKTRJhNNwLwY=;
        b=EtJOEWJXpDfN+ANYDijWwJ+xUDgkh7lzTZxp/CeCJj6+ZvXFPYajSJts2V/sfODe2g
         AjLrLC8G+TIEce6LvfGcUY/+eRFeZYbV6YquQAGqwOJwbVCZIjFWFmwrJb4CwAUs6ThR
         1tv8P63JnGQf210KD9+gbfv822HTT3gJDoJp9dG22+AfJCgGaVsPQNfxcZSPetJVdwuV
         YPGz4EL3w2UHmDCHjrJm41H33IHWBrLV7JD7RKO1vkM3NuSfMp5Dt6fZf0WkzBfv8atj
         DVcxcK0c6480SmdqQrpADd4hDwV/dGFqGAugySIydAEHgVILDprR4SdfpQX3Hn3Tgl3W
         It4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759434188; x=1760038988;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLbu0A99oMaa9nLYhV9YO0gV0kE8G3JYKTRJhNNwLwY=;
        b=agbjwGqBn5rK3n7I8tazKznEz2KBVG6G4SMtgHWAs0yPRdnf4f3PsU+L0yPAb6cQdm
         QpVy0Z1MAJ7XnXf0CVBh4y4s0Y24mL3sSmAR5ejDJdo4YfpGA/BBKT1HWI0PUAVvESLC
         +ov9H6spxIO9UDP2c4UQriZY2VmEsxn8MRTsT75Bgv0HlCwE60uC1z2+VH3QJNLTz+Fr
         0SwkZTtTjvSbpT8f+hTuTmoC+4nM27Xqmz3I2qmke58HdaGMCKLk2GzUK9xRBVUUV3Ut
         72E9NVn0vOt9uXPJbxWpigju3qPVfatj4/BeuJfv2q8e1Any3ak/kmqPtLniGKGUv3mP
         oknA==
X-Gm-Message-State: AOJu0YzUKyJkOnEWYcSQwqrPwNVnZYyUP+l+l/P49KQqshDjVVYMCMrz
	SVjTdCu8j9IcSqMNTHa3Um1z5ER/UHNbz+M1tay+fZO/NzROJKxJPquShS3EgZCX1jc=
X-Gm-Gg: ASbGncslHS9bdD5b1a83Zg3T+8qCgzzw+0B9M1nnTX9zIpUTQIhupZ+UJdZO/Cds082
	iqQNmw/QBT1/fxU/X8qU9WnPb0Y9jOa5lNjA/UI5oulEUD+iJQVwV/0ctlEzfKACzfB3h5Hv71v
	HZTeIkuxcC8tlSiJ/5gnAQGbwzinOrxa1Xw5pLMCGKAEdXRC8oew8AQ/TnwYWX814FcYjsy+nUs
	PDMCBwv5jWVdZzoZ6ta1S+0ejbMBIweJiggQuFdprBRj28uToCYPuHixU+o5jue9mkuoJdYhJrW
	ZUKHooC/bjAkflu86V2G3u9odKnaYQ0H0vXamJg9vugW97nyugd5ADmJrtkL8qXnFqL3TpEMQxX
	ep72/zc05eCPI0V8ntA1LjZEY2CSfGTlXqIQtZuU0Vcp6thgi2s2O
X-Google-Smtp-Source: AGHT+IEzPBiXGBpKFF7vB5ii+FVt1qb6kGCEKl1cm73B6uxuSdAlpsQkRsPwqoLcv3e98vv8MU6XCg==
X-Received: by 2002:a05:622a:1f9a:b0:4b3:4457:feca with SMTP id d75a77b69052e-4e576a452ffmr7677081cf.6.1759434187582;
        Thu, 02 Oct 2025 12:43:07 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cadc7f0sm26557711cf.26.2025.10.02.12.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 12:43:06 -0700 (PDT)
Message-ID: <544147436308901fba85d6de48380c0c1eea7c67.camel@ndufresne.ca>
Subject: Re: [PATCH 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Thu, 02 Oct 2025 15:43:05 -0400
In-Reply-To: <20251001-av1_irisdecoder-v1-2-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
	 <20251001-av1_irisdecoder-v1-2-9fb08f3b96a0@oss.qualcomm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yf81LbpFpHXIOu8Kt4WA"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-yf81LbpFpHXIOu8Kt4WA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 01 octobre 2025 =C3=A0 12:00 -0700, Deepa Guthyappa Madivalara =
a =C3=A9crit=C2=A0:
> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
> core/v4l2-ioctl.c
> index
> 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..d3ee7736b74b0f277d3208782e3ac32=
82eca
> 1e6b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
> =C2=A0		case V4L2_PIX_FMT_QC10C:	descr =3D "QCOM Compressed 10-
> bit Format"; break;
> =C2=A0		case V4L2_PIX_FMT_AJPG:		descr =3D "Aspeed
> JPEG"; break;
> =C2=A0		case V4L2_PIX_FMT_AV1_FRAME:	descr =3D "AV1 Frame"; break;
> +		case V4L2_PIX_FMT_AV1:		descr =3D "AV1"; break;

Perhaps "AV1 OBU stream", so its clear its no Annex B ?

> =C2=A0		case V4L2_PIX_FMT_MT2110T:	descr =3D "Mediatek 10bit Tile
> Mode"; break;
> =C2=A0		case V4L2_PIX_FMT_MT2110R:	descr =3D "Mediatek 10bit
> Raster Mode"; break;
> =C2=A0		case V4L2_PIX_FMT_HEXTILE:	descr =3D "Hextile Compressed
> Format"; break;

--=-yf81LbpFpHXIOu8Kt4WA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN7VyQAKCRDZQZRRKWBy
9Fw5AQCbUcP66ePDvEJ9FsZlgVB+kvABFUtQrZBWY828sY4anAEAggr+vAjgEgPw
4iyEwI0mxlc1FCpEjJab+uQB4XZw2A4=
=hE1j
-----END PGP SIGNATURE-----

--=-yf81LbpFpHXIOu8Kt4WA--

