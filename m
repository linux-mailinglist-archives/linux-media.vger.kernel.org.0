Return-Path: <linux-media+bounces-49557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AFACDE0B0
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 19:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA1713011EC2
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C6B284881;
	Thu, 25 Dec 2025 18:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMAyxaJg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5711D5141
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 18:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766688577; cv=none; b=G3jYjXf7wmaGwI0ueRDvQndNmOnPk15dS/7UQ1jICRTGnSCGdEKjMleCtobBOz7791jcA0vbHJBXefTD7ittCcgiNRr1BB4VfwEwKpwJQyqcOVMC2efc7lebdObC/38TMjycfDuHDzhZeEKCaDbWCkCPuCeS4jOPW39OJpZxU94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766688577; c=relaxed/simple;
	bh=/GLmmBp5IxXzJeH6mbbMRLZztQZUxgTxdEss9ySj2+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYjF/y2whdIPvtK+oGz2CIy7gNuUsIlxII7qpIj2QFT1eQ4zNOL/GHwDmWYqRo6xdqeY9QImNh4X33YfjB6VSI8yuDr5GdiIfNxTUbLZYusv0PxdwBILtp8R8GtHQHhOc6BH4y8zRt68+eu2ZFuV9WqrnPE40v0wgDFcjLeIAYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMAyxaJg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7633027cb2so1224153166b.1
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 10:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766688573; x=1767293373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=;
        b=iMAyxaJg0onJpjLCnCTpuw1FCQoUxmZx/LQVA1tv+EGqo89Czx2RG/3VzNe8bW95G9
         /dmDchU1xgr7xNYUwmhey/tLgqvJ49nDl6zw+99/TX/SQ7bh+9wPrxR9Uvmp0Rbs/EeH
         OisrrM1dAXHEh7hDDd0/qwWJz4rcqW1A1WKTRScnfAoszrJYfVoaGWrg9NJyGneb0KFl
         yF+AY74BVPV7zBJYFLf1aXusBaWRR3+Ve8j9Cr5xkWm4RpWDjHvwC7gGpSw78trwm+2S
         xchQsAZ6EN60COOB6Hfv8VlsbZKx12OIccwjQhfPwQP2rG5gl8kNfWdbYXBelF/WT+Pu
         K9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766688573; x=1767293373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=;
        b=anhpTmG7JfRTv0WM6fxkt72bS3GFswDz8v4/ccuELDl0/z7k9ebu6bsv3vr9ZovnEc
         1w1RBQf9cjiXiTHx5Ax1C74ToKLwJa/nnfDf6sISMRj54tkma27EAIvLlkJRyI36wj2c
         6sW5onyoANkcsiwxYfG6wCJFIWUOLTFOILV4SEMeiwWXT+0t3VkXCHY3iloV/f7pi7OL
         LdfaxTLZmZEaBlbcX1VLe4cs4/F5tSznvPmJhSnlMPisOvYyJbG4QgYhUnc6qxjQokKN
         Ak27U4LUPBm1mUzoTukT1NUFFSpT0/4CdUZ7mp2zHXyd4RwLjGb5+Tfxi403VJvWo63s
         C2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7a+gkOMhgewGZwDYJHdsvaQ0B6BaL6VVneY2ArYW80mH0Q6+Mum1Jb5FhakcZUST4/h5XkjzgON9ivg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYEpEur7DT2kgsVZImPa92QfB4rNxxOSwE0aPt5oHiU4cvyMf
	I0pTOetlQ/H3gPVv7dkAOXiIf3mruGyTp3UwUo8lU5gkhiHddpydIJDt
X-Gm-Gg: AY/fxX52U0lsuk1SP/Mcv+zbNs43IKnsZyhalUyg8TdJwUB396kd/xzk8hMYeT/ntXU
	XvzcOD0XWRPSFQ50IralBVX/jheH7jJqUc1eUb5PRMsCi74vgE56/N2uXksZVA0iUYyrOaQOT89
	Gvbc59c4PiLgnZb+nKdMK8KYYww2LixbVTxPBP4eBR0GdL76Yt3c4uEp8o6EGVz8TkO1i7QYhar
	eA7mFUg/rpeet0/GY9o4lHNo9U1ZhqfQ79+Jh61OSdtRBNsza0m8vjYAnXnf3QkNs8Yea2uoj60
	uU8KWeIMMM/pfSIJ8yDGiZeLM9dJx8jglVVNJ6ONrFHN0WbieQHfjs6NvuYjg5URR+AoZHQQVBa
	U9QpLlT0qvPvoNBq+nOOB4KRK7+I+pgoQvj8tzxtiABIIyYbmtAPScgx5at8bwwWUiOs0Koo9qV
	GJrc1ByOLr3vVlHuX/v5kBi+kBrFAY+SEMfuiU/sBzJVM=
X-Google-Smtp-Source: AGHT+IHGj4ugPVsyxVEKdshMmhjzljqKZD5JHwjw22tMZO+csxcebOAuFJVgXAVvGwk2iqbs87W2hA==
X-Received: by 2002:a17:907:d8a:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8036f55069mr2086910366b.17.1766688572432;
        Thu, 25 Dec 2025 10:49:32 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm2164305466b.1.2025.12.25.10.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:49:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
Date: Thu, 25 Dec 2025 19:49:30 +0100
Message-ID: <13929653.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251225103616.3203473-5-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:15 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The device tree bindings specify using "fail", not "failed".
>=20
> Fix up all the ones that are wrong.

While patch indeed fixes the issue, I wonder if "fail" is proper value?
According to specs, it means that device needs repair. What about just
keep "disabled"?

Best regards,
Jernej

>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts      | 2 +-
>  arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts b=
/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> index 63e77c05bfda..f2413ba6a858 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> @@ -112,7 +112,7 @@ axp209: pmic@34 {
> =20
>  &i2c1 {
>  	/* pull-ups and devices require AXP209 LDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts b=
/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> index c32596947647..e0c7099015da 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> @@ -96,7 +96,7 @@ axp209: pmic@34 {
> =20
>  &i2c1 {
>  	/* pull-ups and devices require AXP209 LDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/arch=
/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> index 5bce7a32651e..5dfd36e3a49d 100644
> --- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> +++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> @@ -170,7 +170,7 @@ hdmi_out_con: endpoint {
> =20
>  &i2c0 {
>  	/* pull-ups and devices require AXP221 DLDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts b/arch/ar=
m/boot/dts/allwinner/sun6i-a31s-primo81.dts
> index b32b70ada7fd..fefd887fbc39 100644
> --- a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> +++ b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> @@ -90,7 +90,7 @@ hdmi_out_con: endpoint {
> =20
>  &i2c0 {
>  	/* pull-ups and device VDDIO use AXP221 DLDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c1 {
>=20





