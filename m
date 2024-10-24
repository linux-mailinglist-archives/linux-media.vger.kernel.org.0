Return-Path: <linux-media+bounces-20218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBC9AED68
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 19:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF9C3B254B2
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C645B1FC7F8;
	Thu, 24 Oct 2024 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9pOY8hN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5B11FC7D9;
	Thu, 24 Oct 2024 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789880; cv=none; b=Jyr8GlZkXjJtMALRK5+vWkD/ksBWui17ddDAznOtv2YfmlgwImkKCnVUYWFd/aE3yOvJv5mwiZ0OyyeAVLJKtQixrknfSo13oJozRfktWpSHZPpqAQ3/XW6fO5Nv0nTrJOYqxi51BrgPdGBhSYaQNzNQF6CDH8DB+zJpCDYHzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789880; c=relaxed/simple;
	bh=V5blXOjJNWllX91RTrP1Opr+qb7soFgBDwd8A0fxx9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGTy9H3pICA3fRXYSrH8+NOCwg1Qk7B0sOrFbcpD/aNgWYCdGvu2J+wHPsIZnBqCe5QdkhHuISIV1QeP0PtmNxQNOscp0MCRs3GhbM1gzjbw5oS1T8DfYEi3j+VnYeGRi4arHQWfhhoJTw9je2bdVMStjQqX/hPjNInNupvek84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9pOY8hN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so1467198a12.0;
        Thu, 24 Oct 2024 10:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729789876; x=1730394676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVRDMh4v3CEd58OP2wBIPjczPRQa4F6T5qX1vzLxZds=;
        b=f9pOY8hNm0k4KsiAWmUyrZo7qZv0AOJpMXncwZdeVZ1ydb4G3AlGaWiKTcX7N2b2Os
         m0qVE4XkN9x/I+YtQtY1j+2iU6y/NOMbbiW32f75SeYZsPvQLEi6pAVV39LlMWtOJRan
         U9Mdg+HPJCdzUxSQ2YxdT7G2aGB8MSiWLTOZai5wGh6v1lIws3yB4CS6tkivBkAjGi40
         KrARt4DQcONdGml18ogmr9+f0DdkVs9/cTHV7txwEyd8FSH5Q+mfKu0Hl4GzOIDi5vwv
         7aFpx71oU36lKIKQweXpv0TnXyYqAhzXhILJGhAcCTa7U1HQbPag0/6F6k74FqGY+2Xb
         bMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789876; x=1730394676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVRDMh4v3CEd58OP2wBIPjczPRQa4F6T5qX1vzLxZds=;
        b=a9/i786fUrfUjLdhmOqA560Fll7T8PxxHZjoILjyTxRDl35XEDv6PiO2VnAYaYp/lR
         X8o/K+I4gP9CdWdUBgGIrg9G/F9HXNj4xeFuqnnt3Kn/rON7GLRm4lD1CJBt4hZxgVhx
         FQ2QvNMusHCvLAlOE0ZMavJriRdTCcnAa06X4BRflYOqxITR53EcMfa/bIE6IkaPG8B0
         TNOQ4fywXMXX0meZiF4JlvbKgqZ+DPWqWz2OtRsjWqYt/PTyfDubAXdzQyR1/F+JCuSx
         Q0ZYY5qhkvDz/IS2d2L7SmXhPDgPbl860YRLYZ0fh0dnj25p/q8fP29obMfAvFwMmHVT
         xoZA==
X-Forwarded-Encrypted: i=1; AJvYcCU2qSySK2+adJDHkNxYi5MzImDB+LHeD5qVdvwuV6Nt9qfco9YRi1kY/MTo+jSmgD4744s1sWzVHd7wWGg=@vger.kernel.org, AJvYcCVHkfMKyRb/pHlsnJqYW3RYkAX8yrr63tznhgFstN7wqMBAWMuA3nZL0nnqUaldS5euZfjwiPRufR9R2zk=@vger.kernel.org, AJvYcCXlGUUvjyZsuJDowhzgaqiecuzCUov67HzZ3+3SmumK0+Sp7QsLCf75L8NI6+A9pZla/9VH3+S+OWPyAYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAWSXAgGx5IXPI1FSPkvahRe8xXXBp4mjKv3xIVGoQ+4UQSz+p
	HpRXx6fU3iJqrXtWGNc9dCO53bGGEwpDVk/xckr01niUiBotQs1L
X-Google-Smtp-Source: AGHT+IGjmlyXMLE3dKbnjF8DXuZcZ3UAnGJ7Nj4af4Rv+ZlHQd4d7mjQ1Fjz4Dh4fSFTXZ/qCJdZAw==
X-Received: by 2002:a17:907:2d8c:b0:a99:f8a2:cd8f with SMTP id a640c23a62f3a-a9abf9682bemr674542166b.64.1729789876399;
        Thu, 24 Oct 2024 10:11:16 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370e86sm639779066b.110.2024.10.24.10.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:11:15 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:11:14 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: digetx@gmail.com, mchehab@kernel.org, jonathanh@nvidia.com, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: vde: Convert comma to semicolon
Message-ID: <ue3ccfkhnumjikar5iekotbv56h6p5zpfhkkw7rjb6vbu2oge6@kkrwbc3j75ag>
References: <20240905022532.1642653-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2lkg7gwyztygq2nw"
Content-Disposition: inline
In-Reply-To: <20240905022532.1642653-1-nichen@iscas.ac.cn>


--2lkg7gwyztygq2nw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: vde: Convert comma to semicolon
MIME-Version: 1.0

On Thu, Sep 05, 2024 at 10:25:32AM +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
>=20
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
>=20
> Found by inspection.
> No functional change intended.
> Compile tested only.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/media/platform/nvidia/tegra-vde/v4l2.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2lkg7gwyztygq2nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcaf7IACgkQ3SOs138+
s6FGrxAAoQvep6MJjN0ETLhmO0cz608RmeY1mB7sp8aXMINtslR6zbSyVOqPZk6p
3V0sQaVLaJzY0DKN4n0JSosBOeQJRZuFxXbNWBbfwvqCRdNvxl/Zk9QIAHMFYEs6
QPJhVUDd5ql3UXYZym3L2NkwH2pprOAeHNNmqS96MQQPqLdmJMrj3/oHckRgot32
OWu+UjUft73+TftaUMoZxwMmjDfJz2P39moZMEH5LqjhXtUHRvjAcsY+x3+mr4gT
+rBneylG6hbz4W8PElx2hUPmpIryilc5UzpJHDbSBR+jEtQQtOWhnxM0NAjZT7cn
2Qr1ozOW74Ekcy0UAr+wwpLM+CIykUCfMa/hG+Mb4P+62nDnyUsWLMJSjm5lIQZS
93bXc7sCOipwCSkz4CzXWf38BWeX1ZkOrd51YGpoBtPyC05uFHAl5EE72DgWImI/
zK6tBWeBjwXFhIkH5UeCYgMV5EzkwSTfuqOEW07T16n3Sv7fv96u2z/hOGBuOwFB
vI4bauMbuDe6eSCo9283XscRwV5N18r76UJusWTTDoI926KNVrmWCjHCq1OMevtm
baqmFhSEmWK4I6aOMjavkTNzVa0QPdrnmWzZwv8izVqz5fC5Imk2HljM9zR1hpRK
XfOFWr6OIMfJ/Q4dJgFKMWuakGa67lWITL6KtzXYdTOWXXLoBSk=
=UVc/
-----END PGP SIGNATURE-----

--2lkg7gwyztygq2nw--

