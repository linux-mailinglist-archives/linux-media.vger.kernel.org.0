Return-Path: <linux-media+bounces-49944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA4CF5495
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 20:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14F86305F327
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 19:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467D133B6F3;
	Mon,  5 Jan 2026 19:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ZPOKwVzq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3009028314A
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 19:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767639762; cv=none; b=BPph3iCct4Scb3saExVexsym7Byud7O5UA1Q9XyHfGmxE7HeH2E/tlKOC88f61oPk3bj3Baqe/yVmbIR7EFZv6+TKX7Ux91V4FeTWEy6rnor31BDiu7u2XxB0wPFvY4/YlKSK3pqHvHaFffNYKRvp/8Fkn5LEwRszqgP8rjcRVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767639762; c=relaxed/simple;
	bh=6GF+eSef4reroedO/ULhcBZiCCCblDzpWr+3JiqD9kM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VQJz0hOMXFAVFsOKb1QaciuepjJXNBab7KM1AmxwluhXUVr+YAPVnqtLUkxP70x09K7QoDGVQyIOHIkymeiDmqSkVQU5OLGNA233z4Oeva9S6Tje6LPYCmX9m2XV3ACZk/mTWaC+ARcBplCDibcrfhfXcKhBbzfWKm0NR3EUkDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ZPOKwVzq; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2d56eaaceso23399685a.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 11:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767639760; x=1768244560; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gA0VMJuSnU0pX+CCjUlZE4nvqKz/dcQOtvqUW9x/szM=;
        b=ZPOKwVzq5VbiXmKIIcFNiDfEEXdzfsJUsDEgxzzQ09CLHKoZc+RhDd8fWX6dc8gOJj
         lDgh2qskT0M5iLscTnhTpb795K+Dv1mPxkRSLYHchEo06LstW/VadoWt/fSjRkUYITsZ
         C7CgxA6C6CmxsE9jadejCnPTr9mXHSrwqBFWWEsSFFJB7JfpAoaxJEAtTJtdfxGjn4WQ
         0OLLcYfzjYOuyzAhw2qT46PWR4B1MUJhgloBlm06Z5/b8s2xetS1EFWoCvysebsgtbta
         YknDRzdeyH9V5R93ce1E680PYhLqBteOcqokH2DXoOdHLAHeg4GODnlVtyhY7uzGNq2R
         n9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767639760; x=1768244560;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gA0VMJuSnU0pX+CCjUlZE4nvqKz/dcQOtvqUW9x/szM=;
        b=VhXoLN1PTnhmvFPd4bC2cC6IuuP4PEWXlbR5KdyIH9JsDyAMOc1RkE6TFXMyMa2xln
         8Qz9qfMI7YSDqBIk38bR1qVs11psIF6zvFQvBEIYymanGKpVZCPMtnVfaxX9Rkkstrwi
         su/Hqz07Zyc1m4W7JeCmlMWTL1/lFEP6uzu5+uVhGHmW4cuLB5EdecXDAUZvoLCkPAIA
         hpJuxYrOE5oUJwr6EqCkKmtuOCZhuIp7pdWqyG7mQ2QapX7FIqbwLo7garJfJoyCl+CJ
         uxYzdkEtTiTpkB46eza4Y3xIwwETjPGL6RnnhjxpetxHWlIOlY9J44D6Rr/kGu4TSZXH
         fYAQ==
X-Gm-Message-State: AOJu0YzAdeDuQkuk7s+oIHZS6nGp6MDxr+iX/HNhE5CuKc/pG3DubIzg
	5FBk1PDGko0xI/xVk93dlx+D8HdWJkGdP3x6ud5PXzf87mH7gDtt8s2+x4EP0NtglGs=
X-Gm-Gg: AY/fxX4ZnZkz+5MBORJ/XmIvckpEYHBYbYviQ3ZiXy8VbF/W2fZEem1fGZbx/eJcgBb
	LANWcVlOrObWzXUuNAJITJLSVpeHYw8WRYffnEfdlMg6hWwMAgJfdNVV2OqAxPboPca/wUk13me
	oAr7Z1o5xTJg0mq+B02zKCUSu18IcBgdWOXLVpsZfJzl+JlgRneU+ilMRvGDdRhgmZjZxwGwhIf
	VyaRpzlW06SoUV9GfgeIcrW/X3JCHyn0TePVxk4wrTqSbWelwo3jizz3nsWZX43Qua5kyiP3nqp
	yFQ3c5HCQ6S6FyuOxbimyzEU2+EqVTQlbtT+tvTDoz5HYheSyY4ISiXKkZ7RGqPHWUXw7NunoEi
	toft2XipKEkZUCCbK8lN7XHgQoGY4xNWbD7wwDl4ym2bhd9PcwJ+NkyvvOsyxjx1TAFdTGbRTeY
	aOCgUWI1j5X/bz/WrW
X-Google-Smtp-Source: AGHT+IGJf5nR2VtRNdDG0B+XVbulrpPI9aSHHZuWb6/beDKJdT3vUvNlExg9ujzf1PDLbcC4Nkrk1g==
X-Received: by 2002:a05:620a:4589:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8c37eb5e0e2mr92934385a.12.1767639759742;
        Mon, 05 Jan 2026 11:02:39 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4ccdf8sm12115685a.23.2026.01.05.11.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 11:02:39 -0800 (PST)
Message-ID: <8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca>
Subject: Re: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT
 enabled
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Stefan Klug <stefan.klug@ideasonboard.com>, Xavier Roumegue	
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt	 <rostedt@goodmis.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Date: Mon, 05 Jan 2026 14:02:38 -0500
In-Reply-To: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-kp8IPL/GQ8oar2rBFJK9"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-kp8IPL/GQ8oar2rBFJK9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9crit=C2=A0=
:
> On kernels with PREEMPT_RT enabled, a "BUG: scheduling while atomic"
> kernel oops occurs inside dw100_irq_handler -> vb2_buffer_done. This is
> because vb2_buffer_done takes a spinlock which is not allowed within
> interrupt context on PREEMPT_RT.
>=20
> Fix that by making the irq handler threaded. The threaded interrupt
> handling might cause the interrupt line to be disabled a little longer
> than before. As the line is not shared, this has no negative side
> effects.

That's interesting, do you plan to update more drivers ? There is a lot of =
m2m
using hard IRQ to minimize the idle time (save a context switch), but RT su=
pport
might be more worth then that.

>=20
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/nxp/dw100/dw100.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> b/drivers/media/platform/nxp/dw100/dw100.c
> index
> 8a421059a1c9b55f514a29d3c2c5a6ffb76e0a64..4f5ef70e5f4a052fb5f208e35f8785f=
9d30d
> c54e 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1600,8 +1600,9 @@ static int dw100_probe(struct platform_device *pdev=
)
> =C2=A0
> =C2=A0	pm_runtime_put_sync(&pdev->dev);
> =C2=A0
> -	ret =3D devm_request_irq(&pdev->dev, irq, dw100_irq_handler,
> IRQF_ONESHOT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(&pdev->dev), dw_dev);
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					dw100_irq_handler, IRQF_ONESHOT,
> +					dev_name(&pdev->dev), dw_dev);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> =C2=A0		goto err_pm;

--=-kp8IPL/GQ8oar2rBFJK9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVwKzgAKCRDZQZRRKWBy
9H1CAP9C6Znn6Z4goZYAF6lQ10kG37AYaIkSgwXJGSCNM1k25wD/WJvjXOVKAg7w
ntMWFY479H+NK7I9m3RI4qug6vvItAs=
=6+Fg
-----END PGP SIGNATURE-----

--=-kp8IPL/GQ8oar2rBFJK9--

