Return-Path: <linux-media+bounces-40101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AFB29C23
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9EAD3B1F3E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F75130275B;
	Mon, 18 Aug 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="UdZmtK5L"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC73009F0;
	Mon, 18 Aug 2025 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505606; cv=pass; b=XeLFqCP91uzE9Xf/lrA4dEcfhCbBRDKDbJ+lsPe3jBaELunxvVahXPvUyFJCIaFrcM+3lOu+KR2l5ez/nMUOqXFqv3IoorfTjurdIGmyG8NAtNFNKSXxMqnUzmMB46/+6o6DGOwXgb95A34J4gHwofT5bD9hCGi6ERNYdy+GSv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505606; c=relaxed/simple;
	bh=tj2yGevcfo5KIS3N2gQc2IK6xq5EamVZy8KjuhEWC4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YRUTDc2Jbbe0OpsYUjN7u+nfMGhCYtxTOTi4MolNnZ+sFKOHtG1aDjnIXmPBbc0HeiJlKZsJB4lisrGO3Qo8mqb8hmSwN0nqtOP91odNfrbatd7Bo3HcHU9y6DCjgICxGRgOKiUJ7dRQ/dP99e6xhqce9Z/+MnKzZcMe2a+3VVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=UdZmtK5L; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755505586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TkJ31jB1dC74/EBx/flkMf5oj39dXFkwhuGHCgNWMHshBoZwvchGHGGaLjonlfPpqgvfLjUrSldiTo2oevGRJV0Lxe4HcEjF5MqnEWAUBqNviLmUMnnyBleq+Tsu1uW/POR83UfsEVEKZ42FucmIKAJK7uka8HXXft2/7JHakF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755505586; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tj2yGevcfo5KIS3N2gQc2IK6xq5EamVZy8KjuhEWC4g=; 
	b=PqLvXOzE7JsmOuiLkeNQpW6C6Ss9RuJxdxmj9VlOs0A1EyuMGiJ9/dNdOD+pwHb9e96QZ3t1QsqjyMlEVyrWOjQMdn9eu4RVi/WX4IPWcCN2X9Plb5eglP6XF07IoLEqOH+fhPvaS4EpcMSHMccPcGkinXnAZGF1yyfiQ4noLRk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755505586;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=tj2yGevcfo5KIS3N2gQc2IK6xq5EamVZy8KjuhEWC4g=;
	b=UdZmtK5LGeSmkPXn3snFHzL0cEnDQv2TqrktxrtgQhUDAVyuoZYSchXasjg6Z5+e
	NClvxAnPJEmnI5f3CqlQxKGBH6QzG4VI0aRtiD64hpcuAAWZxMUiq9sxUiDlFanjmFH
	MIcPnxrtFGCBnWSho07TqHbBltep/zVYUH1aYLJA=
Received: by mx.zohomail.com with SMTPS id 1755505583162870.9854534398668;
	Mon, 18 Aug 2025 01:26:23 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
Date: Mon, 18 Aug 2025 04:25:58 -0400
Message-ID: <6183937.lOV4Wx5bFT@earth>
In-Reply-To: <d7446ed8-4af1-475f-88e0-07025c60d0b1@kwiboo.se>
References:
 <20250810212454.3237486-1-jonas@kwiboo.se> <13998356.uLZWGnKmhe@earth>
 <d7446ed8-4af1-475f-88e0-07025c60d0b1@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Jonas,

On Sunday, 17 August 2025 12:39:01 EDT Jonas Karlman wrote:
> Hi Detlev,
>=20
> On 8/12/2025 9:54 PM, Detlev Casanova wrote:
> > On Tuesday, 12 August 2025 09:07:33 EDT Nicolas Dufresne wrote:
> >> Le mardi 12 ao=C3=BBt 2025 =C3=A0 02:58 +0200, Jonas Karlman a =C3=A9c=
rit :
> >>> Hi Nicolas,
> >>>=20
> >>> On 8/11/2025 11:07 PM, Nicolas Dufresne wrote:
> >>>> First pass of review,
> >>>>=20
> >>>> There is obvious conflict between Detlev RK3388/3576 series, please
> >>>> coordinate. By picking the same direction, the common code can be sp=
lit
> >>>> from platform code, and then both sets can share that common code and
> >>>> avoid conflicts.>
> >>>=20
> >>> Yes, it is very unfortunate that Detlev did not base the work on v1 of
> >>> this series, this has been sitting idle on the list for almost 2 years
> >>> only waiting on its dependent H264 High10/4:2:2 series to be merged.
> >>>=20
> >>> Most feedback for v1 was related to unstaging and the series could be
> >>> applied clean until iommu detach/attach was introduced very recently.
> >>>=20
> >>> This series has also been referenced in multiple threads related to
> >>> rkvdec2 work, most recent at [1]. Unfortunately, I have missed both v1
> >>> and v2 of Detlev's new rkvdec2 series, and was not able to send a v2 =
of
> >>> this until now due to family tragedy.
> >>>=20
> >>> I will take a closer look at Detlev's new rkvdec2 series and see what=
 I
> >>> can do in a v3 to ease any merge conflicts.
> >>=20
> >> All in all, I'd like to have both of these series ready for 6.18. To
> >> avoid
> >> the need for dependant series, I can pick top patches if the preparati=
on
> >> is
> >> properly split from the platform specific code. Please make you
> >> recommendation.
> >>=20
> >> My main concern at the moment is the back and forth from register to
> >> structure, Detlev already ported everything else to structures, so
> >> porting
> >> a single codec for a single SoC seems like the least amount of work. I=
'd
> >> like to ear if any of you would be willing to convert it. This way I c=
an
> >> land the conversion early, and we remove one massive clash between the
> >> two
> >> sets.
> >=20
> > The conversion won't be too difficult to manage, I can do it as I did f=
or
> > h264 and add that to my serie over this one.
>=20
> Thanks, I very much appreciate that!, I won't have time to look into a
> conversion until at earliest next weekend.

I pushed a branch with my series rebased on yours[1]. It ports the hevc cod=
e=20
to using structs (for registers).
Also move the cabac table and common hevc functions.

Reports indicate that all works well :)

> > As my series is already doing a conversion, I'm not against keeping this
> > one without structs and simply do the conversion later, even if that
> > means merging code we know will change later.
> >=20
> > I'd also like to mention that currently, my serie changes the writel to
> > structs only for the registers, not for PPS and SPS.
> > So I don't mind keeping that part as is for rkvdec-hevc.
> >=20
> > For the variants support, I can also merge in my changes: my rkvdec_con=
fig
> > would just become an extention your rkvdec_variant.
> >=20
> > Finally, this series has been here for longer than mine, so it's only f=
air
> > to have me rebase mine, especially because it means doing a bit more of
> > what I already did.
>=20
> Great, I will try to get a v3 out in next few days after addressing some
> of the feedback.

I will rebase on your v3 and send my v3 when this one is accepted.


[1]: https://gitlab.collabora.com/detlev/linux/-/commits/add-vdpu381-and-38=
3-to-rkvdec-v3
Regards,
Detlev.



