Return-Path: <linux-media+bounces-11417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0348C4388
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 16:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DDB1F22387
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 14:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20BD4C6D;
	Mon, 13 May 2024 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GLlZAvFN"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B1B4A1A;
	Mon, 13 May 2024 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715612135; cv=none; b=gY/kpet0rCpz5QNp/f0mO+LtxQw5yIuqdeRZ+wQfuU3y0vKmxjijE7xEb46jtGrR6LoqbKoB7jjDQCoAuPTvm9HNWIiC6pzIT9xqP5G2gGOSfBw31grf6rNykZYicEoH3QDwqzA2fue5y+N77Jrq+Qtn6/futRnuwGXKC3HTyK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715612135; c=relaxed/simple;
	bh=/zuMT5Y4ZRWt6Ev/Pe1bed+f3UqPLoYxack4eF1uwkE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rX4icDeevdWUvWsXtc1fG/81NhXJXIqorUTC5LxzkRbZi/LfW0VxLtsdpnOU/ofY18NcSVvq5iM6Pr2BeDsHhOWm9QSRuRWD3tCNMh5tsaVsyzxREbt8Yc+eoLB+ukuhPTM9sJL66ZYroza7k0VOix+HUDyXKNpCASk8Rnb1zhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GLlZAvFN; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715612132;
	bh=/zuMT5Y4ZRWt6Ev/Pe1bed+f3UqPLoYxack4eF1uwkE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GLlZAvFN/grbmJC42rwU4WfEUpGd/4bdKMD1jtecZnGh8Q5im5TXf75rOKBLjbV7f
	 34cuinhwjH39OZcWptmvm5aRhocT3xZ2O7EtHADqQujXUHM02vkA6SJMwsg9gTCZWm
	 n2+JuAeh35odoXSogxfm1o3DoH/FVWH2Mai8AYlJwvx72v6oyO0y6+ZoXNc9cTvVL5
	 Pwrs+Do1xAKi0xSkutB6a7wTugBHP/hTwYzJ3CTiMxZEknEr03R2rzxs4R1MUemSp7
	 go+qc+ZHMIT0/fnMvc742YgijHyrwRmtoYkZSZTUKugRnHnHlOWycP00rF9HANbj8A
	 P8cjcBW7VYoXg==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 96BF8378217F;
	Mon, 13 May 2024 14:55:30 +0000 (UTC)
Message-ID: <d2876f64774d09db10ddae01f98889d542563507.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: AV1: Be more fexible on postproc
 capabilities
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org, 
	heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Mon, 13 May 2024 10:55:24 -0400
In-Reply-To: <20240328093439.18712-1-benjamin.gaignard@collabora.com>
References: <20240328093439.18712-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 28 mars 2024 =C3=A0 10:34 +0100, Benjamin Gaignard a =C3=A9crit=C2=
=A0:
> RK3588 post-processor block is able to convert 10 bits streams
> into 8 bits pixels format.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on rk3588")

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index f97527670783..964122e7c355 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -82,7 +82,6 @@ static const struct hantro_fmt rockchip_vpu981_postproc=
_fmts[] =3D {
>  	{
>  		.fourcc =3D V4L2_PIX_FMT_NV12,
>  		.codec_mode =3D HANTRO_MODE_NONE,
> -		.match_depth =3D true,
>  		.postprocessed =3D true,
>  		.frmsize =3D {
>  			.min_width =3D ROCKCHIP_VPU981_MIN_SIZE,


