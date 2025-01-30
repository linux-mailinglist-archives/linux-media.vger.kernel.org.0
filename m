Return-Path: <linux-media+bounces-25424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C538A22BE1
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 11:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9BAA16841B
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 10:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD881BD9E1;
	Thu, 30 Jan 2025 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGcgQbHz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0E1ACEB3;
	Thu, 30 Jan 2025 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738233985; cv=none; b=lR/l92T9oa7qUMa1tSHj73tRnzgjaiLjBehuIE2wc1w1ipOzymcNnJX3hFFfEjdQb1dCMdpkhA2okApTIYn6/v5zjdMihMAdUjRzvftseTCWugq0X9ClNkd+sdkFWuMzj45c7nOw7Bpz4MSSwjAF0c588XYPMgYPbBm/VXNPuFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738233985; c=relaxed/simple;
	bh=gnlUmrWlO7OgOPSRJanEmk9xOsvql/02GYnysEms+X4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rQapo+/cVhZy4bz/zKNaueIbXF9m6ih+gkdjIlmLrj33ZK+P7LppjUHW3ArZaimhtqGP5KkTZ3hpxMbuiaj6lLc6pYv55hYnPNZ8f3JQelYYYg3FurKeUyZse2jFsO5674QUUYv42P2Ce7qZwjUbgesWyQ/rphsuvB39FcLYSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGcgQbHz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dc0522475eso1183400a12.1;
        Thu, 30 Jan 2025 02:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738233982; x=1738838782; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvH7kPRqDnGEpR7MN/c0OEfUDsiKTUq2RFU3G+hwaFA=;
        b=NGcgQbHziT0Mv4GMx0mhnTtCnuNqyKcK/yJYRS3J+fJisz2epNgSVFm0j8519ncZEp
         WNGvkuB1rQrLUAQPSpvsTbWwAMTHA0QUTRlEfjHtn+Z7U521HMUaCByZ/jq3tDWn7MaF
         +cBSzB9OeMWQWOFSnQNBjDx7cd1Nrs5mBkkP26vfAd64agtptZxRONPAqMJecVMJPCp3
         aEjZhn/U3xqoIzNkQU+K5IarpZE4ZsgA0RK2KvDNuIqevNENFzQ8c5+yg3ubiG5EWXSj
         WIxiKEDHEaXbZvP8+tc5LgApYba7tWx7J/6DBGXg6+bNQl9h/dLJGfqF0KrVfWmbdHBA
         pPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233982; x=1738838782;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvH7kPRqDnGEpR7MN/c0OEfUDsiKTUq2RFU3G+hwaFA=;
        b=tfNUbS95yrjAaBXzPHV3jvd3JcDRhVGtiBuNQ6q9aTWhRMB6RV05rM9fd0euVIBjDx
         +xIxofWp3cXVO13wEvC+FgUMDZoL3/hhefloztXjWodQRpaBk4/3gkxEfdAYNBdMjtmz
         xF3x/ZkVaVQ90hC/I66E1m9SRGzWmMdKTuC8d5NtzxHleBt1EqFLy6ASxfYkDErIYVMK
         +LYLzPlSM9EjFZW4bh1Xh80t32/lZpI68ORkD2tCYTi1HD0Fo2C6vnzj1eDekO3Ji0Ec
         gW5YlraXPZnr6krwkqoaIegMcwPgymNGanxh/1sjr00JLInEqmUw5EwK9UCOLmDS66Cb
         H/sg==
X-Forwarded-Encrypted: i=1; AJvYcCUzJw4OukkdyyAC2xSd8jNhQ/sOCix+tqfF25HS4PoT7DEVTi/5nCpY9pOJ2HyMHwyWkzurCPxm5VbN18Q=@vger.kernel.org, AJvYcCXnorH/Tp68Rb37Kuj15x/j2ucXBxFF+1AIvZOqIVO95cBAJsfX5kKh/s2iFoK9EWRNt0g4nampKaUU@vger.kernel.org
X-Gm-Message-State: AOJu0YwHGrlA60CnesmyK2MEtO5eJhoyq9VgF0wPubZUDvfBwuuekR6F
	3oUNFe1DEHS/v+FZCowGorxHoaZoMaw9n47S/k6h0ITMysI2DE76
X-Gm-Gg: ASbGnct/6DinA6V9NHhTw39K3+izzBCrzZVuRkD6KV26PlSPf9HtTkTJMFde/eHj7sq
	fqNqXamac6gRSQn0IcfDfkkMC/0/XDNnEPAz7Q/rDifSMBdbpgRjOw9C6v2oJlj32phxHmNXULy
	Bf+PZ5m/nbRrq7chA4/GD2OpI9fKEMZyCw08uWJ4qjJBm7tgN+RVLzy4/IHs4S8ti+RF5/z9f3X
	tr8XFgmBDWowS6IeYNxQGORP9gVoRDC1jOybPvrAfYB82YZLrUnmQq8ncRCclIclYEBt5zhdIbe
	JyyoMY8eboYqtZOLEZY/aFmkMAlPaGWdmFpqMY/P+0ZtGs2SJujGxK/0g1oP/E1iMe3cHQCG
X-Google-Smtp-Source: AGHT+IEqE7nySufMnirHCjAVfxj7jngqk9FZNYT/ymSENzVPV3ZLZzx1oB1e3XlK0q5RDTVUp4kFhg==
X-Received: by 2002:a05:6402:50ca:b0:5d0:b2c8:8d04 with SMTP id 4fb4d7f45d1cf-5dc5efcab34mr5837467a12.18.1738233982119;
        Thu, 30 Jan 2025 02:46:22 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc725aae6esm854530a12.1.2025.01.30.02.46.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:46:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <8541055.T7Z3S40VBb@trenzalore>
Date: Thu, 30 Jan 2025 11:46:09 +0100
Cc: linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <5969581.LvFx2qVVIh@arisu> <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <8541055.T7Z3S40VBb@trenzalore>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 29 sty 2025, o godz. 17:50:
>=20
> Hi Piotr,
>=20
> On Wednesday, 29 January 2025 09:48:51 EST Piotr Oniszczuk wrote:
>=20
> I suppose you tested with my hevc branch, which is not really ready =
yet (Some=20
> ref frames will work but usually, it won't) Can you confirm which =
branch/commit=20
> you based your tests on ?

Indeed  - i=E2=80=99m using your rkvdec2 hevc code from: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-hev=
c with iommu from =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
and =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a
=20

>=20
> For the iommu, do you see those errors like that only on 356x or also =
on 3588=20
> ?

3588 has no any iommu errors.=20
I see iommu errors only on 356x
=20

> The hevc branch should have the iommu patches to fix that kind of =
things.

I=E2=80=99m using:
=
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
=
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a

I see there is: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu
Let me update iommu code to above branch and report back here how it =
goes in 3588 and 356x


>=20
> (but note that hevc support is really new, so it may have bugs with =
buffer=20
> allocations)

It is already great work.
I=E2=80=99m awaiting for hevc in 35xx during last 2+ years :-) =20

>=20
>> If anybody hints me for way/tool to analyse of playing/failing =
samples to
>> catch: what encoding specifics makes given sample failing to decode  =
on
>> rkvdec2 - i'll be more that happy to provide details=E2=80=A6 (doing =
simple
>> mediainfo <file> shows no differences for me=E2=80=A6)
>=20
> Few features are supported for HEVC as of now:
> - No scanlist support (only default 16x16 blocks will work)
> - Long term reference frames are also not configured yet.
> - hevc 10 bits is also not supported yet
>=20
> These are specific to the encoding and mediainfo won't really give you=20=

> information on that, except maybe on the 10 bits format.
>=20
> You can also checkout YUView (https://github.com/IENT/YUView) to get=20=

> information on media files structure, but I have had issues with HEVC =
support=20
> lately.

oh great. will do and report!


