Return-Path: <linux-media+bounces-13548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FBE90CCB9
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3F0A284C2C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC5819B595;
	Tue, 18 Jun 2024 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ykziTRJg"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE6D19047A;
	Tue, 18 Jun 2024 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714381; cv=none; b=Yp1C/6mAOjCmGc10d8HVy1mSNenmsXYQzP9fbX/7bHA5X6tEumpTl17/pZJxk3fDYo5/sw4oSTaXYtWX1QCXe8A65fx+I5NotZ05FUUGHOjkPZC/T48wcAHBFwt1t7TQR9HWvNuvebh/rpozHt3aNVInRAATm+6x+KDHs6jndcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714381; c=relaxed/simple;
	bh=e+/mKXkRdPvjBlGr8XNXuV89ZJiYt/k+nMVYcqGYbKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWU2mwnLGpEB2Qiy3P78uOtyG9BE4xcNofpXCzito+tiNFKegZTRNUVFTyEs67VLYlxvRii4sqTdwBeLeqkYVsZz7t0pbWdksHmbKlbYjd963ev/x+qF2VmuW372NS7n9KRoZUWOhYaPPR7t0Vpm1R0WH30FXM+wFnriRG8D83Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ykziTRJg; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718714377;
	bh=e+/mKXkRdPvjBlGr8XNXuV89ZJiYt/k+nMVYcqGYbKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ykziTRJg5Cai9lwNaWd4iGmTspqKZ/8uEq0NJOinsUZaTJgQRSq9nxRGFRXZOYqmq
	 YwhMr3wTp0AjvEfb9B3pBj5Vclj264bU9APaHtq6XukCY5kJ/RMHnx4x6lL79m9Wif
	 S95liCtyqX19lDj8euZlkjQ1vHZwmmU8DQNQnTMf4B+jqI+K2+7YijGPS1Ew6GU0uL
	 U2kd1m6VD36AVzTp6dKuDvLFaDKR7zhAPLkrEBQcMywh6jLNA7jwqN7tXuVpEsrSno
	 lm7dympUxa9TLpwKZWHrL2SzRElJLcNHLAP49S39FbDGis4BWJTiT3TReI8UjdpWOX
	 pYRom/Y1ib8gQ==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B09F73780BDB;
	Tue, 18 Jun 2024 12:39:34 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: alchark@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org,
 didi.debian@cknow.org, dsimic@manjaro.org, gregkh@linuxfoundation.org,
 heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 liujianfeng1994@gmail.com, mchehab@kernel.org, nicolas@ndufresne.ca,
 robh@kernel.org, sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Tue, 18 Jun 2024 08:39:07 -0400
Message-ID: <4302165.yKVeVyVuyW@arisu>
Organization: Collabora
In-Reply-To: <20240618121329.79936-1-liujianfeng1994@gmail.com>
References:
 <4116468.VLH7GnMWUR@arisu> <20240618121329.79936-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4472750.OBFZWjSADL";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4472750.OBFZWjSADL
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Tue, 18 Jun 2024 08:39:07 -0400
Message-ID: <4302165.yKVeVyVuyW@arisu>
Organization: Collabora
In-Reply-To: <20240618121329.79936-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0

On Tuesday, June 18, 2024 8:13:29 A.M. EDT Jianfeng Liu wrote:
> Hi Detlev,
> 
> On Fri, 14 Jun 2024 21:56:27 -0400, Detlev Casanova wrote:
> >+		.frmsize = {
> >+			.min_width = 16,
> >+			.max_width =  65520,
> >+			.step_width = 16,
> >+			.min_height = 16,
> >+			.max_height =  65520,
> >+			.step_height = 16,
> >+		},
> 
> I think the min/max width/height are incorrect. From rockchip's TRM V1.0
> Part1 page 374, supported image size is 64x64 to 65472x65472.

Page 374 shows the sizes for h265. h264 is the next table, where 16x16 and 
65520x65520 is documented.

> And my
> chromium can't use rkvdec2 because min width/height are set to 16, which
> 
> will cause error at here in rkvdec2_h264_validate_sps:
> >+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
> >+	    height > ctx->coded_fmt.fmt.pix_mp.height)
> >+		return -EINVAL;
> 
> width is 16, height is 32 while ctx->coded_fmt.fmt.pix_mp.width and
> ctx->coded_fmt.fmt.pix_mp.height are both 16.

Maybe

if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
	height *= 2;

is causing issues in this case, I can check.

> After changing them to 64 my chromium can use rkvdec2 to decode h264
> videos now.
> 
> Anyway many thanks to your amazing work!
> 
> Best regards,
> Jianfeng


--nextPart4472750.OBFZWjSADL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZxf+sACgkQ5EFKUk4x
7bYJOAf/Zme2uxfjX+cwsN758W5amw+QvLxn04CfI871RZj09w3zEbV6ZQ1ZYAPg
mG4XI/KLEUI/tDA0AX6DvEkK0K81bxsoPx+NTzH7sMpeoyq52NtrscARBNUE+jrW
hiMntPl1ZnnQub2q4K36Lvdiao7vdsM4xBQZC+bq2qo/CaaSY1KvJou6wsgMvug9
lVVfhHT9EO2bpYntOpZgjJlleNCu6V1lN/b9VhKOFMxCAYhBKDMxXWnfJrx2J8sL
ATZ68cdCoNSIC7xLlcMfOUzVM8lfTG/dvW8e+VLsoBBbX4FWll8Pk2wKC8r2/Sw8
/+doLEMSMZG4MUevBqAHFpjkXgkMbA==
=KICS
-----END PGP SIGNATURE-----

--nextPart4472750.OBFZWjSADL--




