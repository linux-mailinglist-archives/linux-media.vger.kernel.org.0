Return-Path: <linux-media+bounces-13836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 202249109A2
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04FA282A16
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62D81AF697;
	Thu, 20 Jun 2024 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="sUUclGKp"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AE51AB91B;
	Thu, 20 Jun 2024 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896849; cv=none; b=NbSPb0oT/+uAVRVAUH9/Xc1GkIqrpHtqcW8X+LccpS/62Mc850YRh4qInBIo/+XelabLFFpbXPBayD817HLZw04mur4GBpqYkEX26QiO6HdZ2eiyzvQ9u52VKNmo0y3FrxA/5sgNdhd0557JB3t+aPAF1UCLWYgfertqrJON1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896849; c=relaxed/simple;
	bh=E8yNo1vOo/HwpMWWw1NgaDiavOWuLS7spU2l7cCMN8I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XNkFlqotQrdbwHLGHfz3GxYejABUU8tw0dgq/3lXqQDkunNh7j+VnYN6623UYrKWikpryf1dOpctsNyUqQvLApQibJMUz40V0zHVDtW3kUX9VQopZSyPMYVBDoqerd05C/N7mCpcimQ6OHRHW8Ckevi0dAR73TWF5lc38iUy9PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=sUUclGKp; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718896846;
	bh=E8yNo1vOo/HwpMWWw1NgaDiavOWuLS7spU2l7cCMN8I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=sUUclGKpZsWCBXCUee0dz6Bbh6pIV8byvX5w2lUt4SCveucbiFVvS9zwzdAPGjUEi
	 +mduAPp0qcEoY9V+5Kdb6ml7A6UWfw5ZKJUZf5T0Ja2wWO5YDM/IT65jlaErgU+Ytg
	 Bk2DJDGrLCHCQNsSG8KuxDDMTWRR1R2tT9yhiv3tjygdcibnQ5RfhuqtZTh4T9huCL
	 GeGnuCq8irkfK38SGltrUmYq2ESGAcYJ21ib1nXVlw+sru88SRFTrBoE5R3Th6OYkl
	 opY2B0yO2vJnHhz7BlXRfx+0FqWP+CzQJUJrrA/lCPQ/zSqyR699p6jFyoNZy6YKtY
	 ojgLYuH0OzQvA==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DE2B237820B5;
	Thu, 20 Jun 2024 15:20:44 +0000 (UTC)
Message-ID: <d2a020024a0af609392649aac1ce037225d5e524.camel@collabora.com>
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support
 runtime suspend/resume
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Thu, 20 Jun 2024 11:20:41 -0400
In-Reply-To: <20240617104818.221-3-jackson.lee@chipsnmedia.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

one more thing I notice below when comparing with Hantro ...

Le lundi 17 juin 2024 =C3=A0 19:48 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: "jackson.lee" <jackson.lee@chipsnmedia.com>
>=20

[...]

> =20
>  err_enc_unreg:
> @@ -295,6 +334,9 @@ static void wave5_vpu_remove(struct platform_device *=
pdev)
>  		hrtimer_cancel(&dev->hrtimer);
>  	}
> =20
> +	pm_runtime_put_sync(&pdev->dev);

I don't know if its strictly needed, but I noticed that Hantro calls
pm_runtime_dont_use_autosuspend() in its remove function. Can you check if =
this
is strictly needed, we don't want anything to call again later if we are
removing the module, so better check.

Nicolas

> +	pm_runtime_disable(&pdev->dev);
> +
>  	mutex_destroy(&dev->dev_lock);
>  	mutex_destroy(&dev->hw_lock);
>  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
> @@ -320,6 +362,7 @@ static struct platform_driver wave5_vpu_driver =3D {
>  	.driver =3D {
>  		.name =3D VPU_PLATFORM_DEVICE_NAME,
>  		.of_match_table =3D of_match_ptr(wave5_dt_ids),
> +		.pm =3D &wave5_pm_ops,
>  		},
>  	.probe =3D wave5_vpu_probe,
>  	.remove_new =3D wave5_vpu_remove,


