Return-Path: <linux-media+bounces-12251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F2F8D4E85
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 16:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4BB4B22D94
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 14:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16DA17D8A4;
	Thu, 30 May 2024 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxyE+Pvg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B720717D367;
	Thu, 30 May 2024 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081177; cv=none; b=TsLxCMBrPe287GdmobGt0nvr1QPTHo+2Oq4u9b/XqbDdoKSYjhl4fjmgMt1prKbz0rQShtwlkeSABMNz8SWCdvKZhWRHwOnLPu+Ibu7NcC0sML7yZoYsvd08JQMNijeK4VoNpF4mZeKNW+5FlMV0jDYachWqzEmnMUH9/zc/0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081177; c=relaxed/simple;
	bh=2M/bX3DMlKaFRx7PMmizFrsTFakadvUyhcsjdcaFL/8=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NBzhqVyK7RMK4z9CFNzANJj2yXkVd5na4pwZ0INHbS/GBMN9rzmBZ1XjioE6GP2gpmiJB9s7zNPUj7STUenj2c+WD2HNKP4fTDK8uUDdlwAaUPGWn3cUi87nUBHJQxMo6yvsakQsJ/4ytq+pkbzMjt9WUgg6THvVWFQrvyIj9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxyE+Pvg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-420180b59b7so10982785e9.0;
        Thu, 30 May 2024 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717081174; x=1717685974; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fN+il09Q5hozBUgCD24l9ZhdhxZZcfUa526Q3onSzJs=;
        b=OxyE+PvgSIghbN0jXvVQk7eGGqVH5V0zaUPyt6nr4F4PktuSdDPLRIWMjXh3VYgu4Y
         CSVLY4mBM5UvvyIePPVxtkjFrultaUDvX5OIKl67rjdgzZY00VHjDOM694l3yyT/1Pf+
         lJTIwVj0VpudkWV8o2o4zjdXK8JauFaoo+iDeMNFYhaenUiPwBmOnxpQ/Uh23/Rngryf
         bX6nswTmCmGqBSOgmS+B/777XBqghaJsDJi28QzOKmv7iOONBSVudGjuTT9/vugcaKqu
         uqdIpzen4U7mjvchFdh96US5WTv+lvCOwy2wuQYHlNCAc6kb0njJdUzHKtq4bMU0wCzu
         4NWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081174; x=1717685974;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fN+il09Q5hozBUgCD24l9ZhdhxZZcfUa526Q3onSzJs=;
        b=e8oNVWS5PatTZEFYaxd5uQb3dDQuvutKmx59jCbWoFK+OwfRGKwG5NZ27zKZz68gI0
         IUOIXqoKd1AhyvUXaJOlZyF4A6Y4K7dj+t1Z410YG2MBXJH8BP6vPXI3klFzBj+lO7Ns
         12MJKu7DJnaJmZyMdmlUe/OMtwTkw+gTMY8pcs/xEyJH4EKSEksryFY9N3tGTR3+nC4s
         L3WVUJ/s6aX+AYCX91QQ3VUyOppvFr1OIG5BQJgMFokWAu2Fdct7nOM0UZi2uGrcRA+7
         sEINBH3P9pz/vXwHnKgBLkeejZ7LwuDK7au2hG357lT8QWuqgU3ecVRIMWrQCD+qniRN
         KKFg==
X-Forwarded-Encrypted: i=1; AJvYcCW7HnoCCrtKRXhTbPp4pX7cWFNM7naaaR9KXH0F0tIljaJgnQ/psKkn12Xgpmwtml1zsItc8HxpnnRPxXAQX0B7nwajJWGwTDNS+cX2d38JJu6EOW/K5Frza2MEIk+cUEvLEBI4ghqpLfo=
X-Gm-Message-State: AOJu0Ywxg7ZGEkRmgGAYN3Yux/KoW4TKm2HH3hJxOiXCTS6UK12+O465
	tgJAIqzDxd/i9/OyP+5CAPyoabQUF1isKt6MAemHaiQAYp0/ISg5
X-Google-Smtp-Source: AGHT+IGJHKXKr76/XYhPXeghTC0NwiijcdXEGnge9Z9ZE6srx5obl7LG3w++K3AY/0CPWvteT6YExQ==
X-Received: by 2002:a5d:4807:0:b0:34d:963a:12cc with SMTP id ffacd0b85a97d-35dc00be0b3mr1801067f8f.53.1717081173704;
        Thu, 30 May 2024 07:59:33 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dcb2e09b9sm1481373f8f.48.2024.05.30.07.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 07:59:33 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=b7e88a8a5532f45237502da7f24ff5e22f5dda01e74efa121a1811c4117a;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 30 May 2024 16:59:32 +0200
Message-Id: <D1N2H4X8ZL1D.18140DCI2SH8X@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] media: tegra-vde: remove unused struct
 'tegra_vde_h264_frame'
From: "Thierry Reding" <thierry.reding@gmail.com>
To: <linux@treblig.org>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
 <eagle.zhou@nxp.com>, <digetx@gmail.com>, <jonathanh@nvidia.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240530132619.71103-1-linux@treblig.org>
 <20240530132619.71103-4-linux@treblig.org>
In-Reply-To: <20240530132619.71103-4-linux@treblig.org>

--b7e88a8a5532f45237502da7f24ff5e22f5dda01e74efa121a1811c4117a
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu May 30, 2024 at 3:26 PM CEST,  wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> 'tegra_vde_h264_frame' has been unused since
> commit 313db7d235a0 ("media: staging: tegra-vde: Remove legacy UAPI
> support").
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/media/platform/nvidia/tegra-vde/h264.c | 5 -----
>  drivers/media/platform/nvidia/tegra-vde/vde.h  | 1 -
>  2 files changed, 6 deletions(-)

Not that you really need it, but since I'm here:

Acked-by: Thierry Reding <treding@nvidia.com>

--b7e88a8a5532f45237502da7f24ff5e22f5dda01e74efa121a1811c4117a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYlFUACgkQ3SOs138+
s6F2RA//RFa62PzaTHSpU90ZCnNs5bjRTOvdjV3rRmpKqxeeVNvrZ1A8dkFKD44t
KN8QbRH035zYs6pfwDN/j0Aj0zKN0icsgN8VxYVVo9I0kyqa6CfuguUdZwS8GA71
TL8bkyuIlKuY06KJZEZ3V+lmNKIRB6pz7/d2BfmaeTppbJRUMvbUv/+mu00v09Ds
MqTqw1gRrcVBToZKeHipT/zTW4PcH5Njwi97acXxAAnkUxcaHH3un8z6lBagqsT7
v0x8SVVhpEaYVzKNzQntRoANALZxk6wYqpI+6Q8OZsJu1WEe4lGWSirRcQZHLiHh
LcmLNNzWWVZBjqJIzb502U5N4tV7vyUR/8q4u9mj9pSf43uLVvIUQexSiMNEFa3M
V5juc2Ir93VTBJMQA+wrPZ0V8cRkhOZ2QOYKCEVUIFIYdeXgU1Xxi6RTISG4CQTN
wowNofBYkYcPMFdDe/CzW7Doe0vgMvd+8nvK8mIndO36iTQnD642/d25CX98HdNA
ew1GKHzJTChwUJY8n0eY0ApEhzg9ZKU8si0PzpZRy/1hl6R1jB1yUX/gITFV3l7n
ymqnXc/1j5ubBbMtnkIyk3f7b7U2U10CG+sU678/iIkMUeecTRKGacNEPqffbzyP
MoVzjB0IzkGsT1O3nlTBc2t76KNUIN70Gb86BFWzqj1+NFi+CzM=
=Dfi8
-----END PGP SIGNATURE-----

--b7e88a8a5532f45237502da7f24ff5e22f5dda01e74efa121a1811c4117a--

