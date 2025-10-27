Return-Path: <linux-media+bounces-45714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA6C1120A
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 20:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E109A3B0289
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB9F3164A8;
	Mon, 27 Oct 2025 19:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="1/zEhpUu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA582F4A14
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761593386; cv=none; b=ModcX1G3FmBYIVUjX/0E3gq/GApCkiq01x7nvM1VNO8OIlYH5DsXx4sB3CPDuMuHXlOSbbpWtSm06D3vOIymKAKj9obhNoDFA2oFFPMPSQwbELeiA+mXPQ0cTLwPqKhIfYfjayGJ3lBsvEfQM/Z2ylI1SkP7aZJV/RKwz3SrViE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761593386; c=relaxed/simple;
	bh=f9EDrPJeYdZjLKyR1XWnZR+LIS5FB0S1PQr/AgxT/ps=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NmpL0cgXBaBI3NGpV14rrh9mPs4FHnmmT5McZ8STOjVMbH/kExthOkz1RnAyvzbE8sAI+IIGM+nV9crtXxYncwGZDBkO9vvtnrzOrs0OkdO8bcU+d3mjqzmy3s9+ysTapOU35QgfzF0hT8T5DTd/87FqYr7NrloeTAgGxgvs5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=1/zEhpUu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso41926735e9.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1761593382; x=1762198182; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f9EDrPJeYdZjLKyR1XWnZR+LIS5FB0S1PQr/AgxT/ps=;
        b=1/zEhpUuYHUCZOXKXvvecOV/35SE4ug1NgCujTNtmfrEE/SV5yaMie34lTL+asQD5U
         U4hbvbzBnXdxLzrQ5f/0mwXf8YVF/iP57GH57pgvwTOiKC1mxLchP4UTdNlJSeN7Eljh
         WDXcKYAToEF66ub6wxoJzcWkhHCkwCZ4VFc+9fRloSylJWB0/KEL0klKrZhNZpq1zfeB
         FUe3kG82jdlB+ZVrr4CArv4JcX0FjO8clJcvvt9xS4WfDalgFzDx+ST6R9YJh8morAff
         hqC2Wwdf7vd9w1HnesG0z+WmEFz09tmHIDkU5pwalInNtrznn6DAuibNDcDdvYbYbWoz
         dnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761593382; x=1762198182;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9EDrPJeYdZjLKyR1XWnZR+LIS5FB0S1PQr/AgxT/ps=;
        b=J6KMM+31eFhOcyCntm5ivP9UoqoJtMTDPDRoCPgbO1ZjQPpKaJAW9kFhd4v3YC9xif
         63Z0oUEdO8zN2kFxbgv6icv4+PSEZixWlNe50v6Q6BPtgjcOedqYv45W9Bl8hcouBip8
         l6on5EVSB5V//YrP6ZXiUZFKPpX0Rg820WytBK8kxZ4sBTmdW+10ANMgzQ2VkwY4vsAS
         98z/zZEQ+dZcgnf16beimbxdjREy2CXMWYsut8F5XZKevIJBDeZCDGUly6U3NozKjk+W
         ZaENr08JLb0XUIr3tpbtG2zByDw0D/IZ5zHZV8fHi5Xyuxta/JtTLJ24KAQFkxDjVytc
         tHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVquj+K1Y9ZTHonW61PSHD5F0KkS9VRt3N1HbQrs46GqpZnl8gmJvmp2cem3XlxGwdqwVedKjrATz9VTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9OXk2lqi4U5MKxG315dvPstw6ZDxU/OR+zFuZGukxLcQKiN5t
	6dNcnIjzzDjEvpNx3SS3WgTjr9q8FqBmg0uJ6SbhibkR9E4LYYP4XZodm9n/V1AF9iU=
X-Gm-Gg: ASbGncspxAeVh7nCoPjSoXmON2SWg0lpgNMrUdaoLY0I9LOS3i7hUhGYqsQ7nCNS694
	pYOmOb+4Zz08iuEzafGUsY7KKOtGnJB7APndyVZHnU8lldVV+sCm+A08fpqqcUwyVPfMaYO7F2M
	VGVdidrMSrRm6rWAMepsEsIM2bmz/rNU3Swsv47bvaq9KjZZDkTRhLVAORxqVgpk24RIy8oafwR
	ShzIDQdRUKNmELSL7VRbNIFrqs54xak0NoDMwgZfuPUc7m10TXfeQwoBFEwuz/DS0oky9s0eKF2
	RWqLAwu58CZJKq8jFywpYsf1go3VtmrAKbISx7b+FpmloBVdrI/d5BwplXrjmOWZSM1rLvbOgj0
	Id3MWjEYevuU+F166nQDQ4BFvZ6jDFhBRKISK4kktmHAImuODCRGQSrckD22rn/rkx4qmYFZV4b
	WV2H8TJAv5J2HBPks=
X-Google-Smtp-Source: AGHT+IGocaODkva4Vi+tf+oBbjpK958/QSI3Hxe2akrbLW5jasCr9HasaaEHo3kz7/sJopvmcF8bNw==
X-Received: by 2002:a05:600c:8488:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-47717e4df87mr6180765e9.22.1761593381986;
        Mon, 27 Oct 2025 12:29:41 -0700 (PDT)
Received: from [192.168.4.57] ([79.79.193.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b6fsm16002057f8f.1.2025.10.27.12.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 12:29:40 -0700 (PDT)
Message-ID: <ac27d9b1da68746c62c03047fd7896e2303ef1fd.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Johan Hovold <johan@kernel.org>, Minghsiu Tsai
 <minghsiu.tsai@mediatek.com>,  Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hans.verkuil@cisco.com>, 	linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 19:29:39 +0000
In-Reply-To: <aP91nfnpShIhXcVQ@hovoldconsulting.com>
References: <20250924133552.28841-1-johan@kernel.org>
	 <aP91nfnpShIhXcVQ@hovoldconsulting.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-D/OargbqI2TIFLsZob0G"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-D/OargbqI2TIFLsZob0G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 27 octobre 2025 =C3=A0 14:37 +0100, Johan Hovold a =C3=A9crit=C2=
=A0:
> On Wed, Sep 24, 2025 at 03:35:49PM +0200, Johan Hovold wrote:
> > This series fixes VPU device leaks during probe of the mdp and two code=
c
> > drivers.
> >=20
> > Included is also a minor documentation update to make it clear that the
> > VPU lookup helper returns the device with an incremented refcount.
>=20
> Can these be picked up for 6.19?

They are picked already, please check in the tree,

https://gitlab.freedesktop.org/linux-media/media-committers/-/commits/next

Nicolas

--=-D/OargbqI2TIFLsZob0G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaP/IIwAKCRDZQZRRKWBy
9Fc7AQCPNa5G9ciLazzEbjeyVuuoqH63GaI8a209fxcD9GMEFwD/eiCo3UjnKnEv
ruFn5dSHzalVI5zJt+gwoMAc3YEJuw4=
=8nKN
-----END PGP SIGNATURE-----

--=-D/OargbqI2TIFLsZob0G--

