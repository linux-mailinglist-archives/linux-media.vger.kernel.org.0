Return-Path: <linux-media+bounces-25419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76845A22223
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 17:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E398D188382E
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 16:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1986D1DF996;
	Wed, 29 Jan 2025 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Z1AkDh9a"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55F1AD403;
	Wed, 29 Jan 2025 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169487; cv=pass; b=fCWLRtc0jknxf2Zzq16OUWQcT3ACjH+rK9T/f/2Ik2K4tx/MwZmbgvRYWXR2ZinIG6ocuZJvMDnOk0mrvSSMioU5qh3w2HCUljFIFUKL6kbInaO3w5z1l4kW1vPmKE9l3HGu9587kj/2DbXOqSRERM2LiaR+wgnJFlGhtYG4dRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169487; c=relaxed/simple;
	bh=iha0Qb5CHXCtlSASKRIfGOfEeYnumvLm3mgF4a5jMWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Agpcm3puINjWI9cnd5ZMfe7k1aYfEULaNOQWjtFlz+XoSmBEC5R92GXuPnEZB84cVDkGhfIs+xl2bUtdFDBwsHYkfEzhlOnXTyHWRc9hpUmYwly/pIAXZEWC3+m5v8RTTlHOr2vdcSnivRJJHASgZjXwT+gcbgtUYk+WARwm7SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Z1AkDh9a; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1738169451; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UgrcL6rMN/4wU8bq3QwCfqoUIJD14WOSBWTAEdNDTNn2oXvmKKlCeC8wFspeGiQad5gFf6LED4uJb/SNP0VFW90337Whkh/4SK4PYFrS57uGRnirxsXGfFsQbCtNCxu3yvP+pDXZibjUgKevgz89uDnByim6O8HrWIsez/BVILQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738169451; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wPGGfc1qwmOrQZGLlJNOWgBoAZRzR/BbTbOKRT5al8k=; 
	b=NG7AtYb2a2Q5uo4vpFBu/10e+848SICc0+d/3SduQISEn8qKRlBI1j7E1wi3ijsWsd4RICHqZybgQYOoIqJUPX5XlWeQznaAn6LF+wDPmUNfCDLAFge0Y+/kH6OAjfkVJ090In9m2yAC4XYDDKIU194LOeGIpen1EXTtjyb+sV4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738169451;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wPGGfc1qwmOrQZGLlJNOWgBoAZRzR/BbTbOKRT5al8k=;
	b=Z1AkDh9apOD+PwP6D7Nj3dw6dqAoxWhEZZpoE5MTrY+XFHQCP9YIKzk3aDle8Zw3
	Igc8acgOSzr2oLLACUvyF3DZ48n/hhVyo6eUi6KajltJ7gnrpSFAIkWISzEhoajoj+w
	hneSRZi4L/It/R0udbKYbQ+V4OfqoE1V5VU13v3A=
Received: by mx.zohomail.com with SMTPS id 1738169445054994.6577657400422;
	Wed, 29 Jan 2025 08:50:45 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Wed, 29 Jan 2025 11:50:43 -0500
Message-ID: <8541055.T7Z3S40VBb@trenzalore>
In-Reply-To: <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <5969581.LvFx2qVVIh@arisu> <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Piotr,

On Wednesday, 29 January 2025 09:48:51 EST Piotr Oniszczuk wrote:
> > Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova <detlev.casanova@col=
labora.com> w
> > dniu 15 cze 2024, o godz. 21:44:
> >=20
> >=20
> >=20
> >=20
> > Yes, the vdpu34x decoder on rk356x socs should be supported by this dri=
ver
> > but I don't have boards to test that unfortunately.
>=20
> Detlev,
>=20
> Just FYI:
>=20
> I done some tests of rkvdec2 on 6.12.11 on 3588, 3568 and 3566
>=20
> For enabling rkvdec2 on 356x i:
> -add 356x compatible in rkvdec2.c
> -add dtsi nodes like this:
> https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.12/=
fi
> les/1078-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
>=20
> With this i can say:
> -on rk3588 i have some hevc 4k decoding perfectly but some others are
> failing -on rk3566/3568 only subset of 3588=E2=80=99s samples is decoded =
well. (but
> is works then works perfectly fine) -when not failing on 3588 sample fails
> on 356x - is see errors like:
>=20
> [   95.666669] iova: 0x00000000f2e80000 already mapped to 0x0000000037378=
000
> cannot remap to phys: 0x000000002f8c0000 prot: 0x3 [   95.745082] iova:
> 0x00000000f2f46000 already mapped to 0x00000000372b6000 cannot remap to
> phys: 0x000000003a403000 prot: 0x3 [   95.822012] iova: 0x00000000f2ee6000
> already mapped to 0x0000000037126000 cannot remap to phys:
> 0x000000003a803000 prot: 0x3 [   95.896802] iova: 0x00000000f2ec6000
> already mapped to 0x0000000029fe6000 cannot remap to phys:
> 0x000000003a403000 prot: 0x3 turning-off iommu makes above errors disappe=
ar
> - but sample still fails.

I suppose you tested with my hevc branch, which is not really ready yet (So=
me=20
ref frames will work but usually, it won't) Can you confirm which branch/co=
mmit=20
you based your tests on ?

=46or the iommu, do you see those errors like that only on 356x or also on =
3588=20
? The hevc branch should have the iommu patches to fix that kind of things.=
=20
(but note that hevc support is really new, so it may have bugs with buffer=
=20
allocations)

> If anybody hints me for way/tool to analyse of playing/failing samples to
> catch: what encoding specifics makes given sample failing to decode  on
> rkvdec2 - i'll be more that happy to provide details=E2=80=A6 (doing simp=
le
> mediainfo <file> shows no differences for me=E2=80=A6)

=46ew features are supported for HEVC as of now:
 - No scanlist support (only default 16x16 blocks will work)
 - Long term reference frames are also not configured yet.
 - hevc 10 bits is also not supported yet

These are specific to the encoding and mediainfo won't really give you=20
information on that, except maybe on the 10 bits format.

You can also checkout YUView (https://github.com/IENT/YUView) to get=20
information on media files structure, but I have had issues with HEVC suppo=
rt=20
lately.

Regards,

Detlev.




