Return-Path: <linux-media+bounces-24444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF05A05F58
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 15:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453931888CB0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55921FDE07;
	Wed,  8 Jan 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHB/0WmI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C6C1FC7F1;
	Wed,  8 Jan 2025 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347965; cv=none; b=OzC6y9PM+ea6qnGm7AthohlPSNt4cKtEs7Kn04oXIjx//fHoU3Fy8H2/mtFxvTb4BDevI7F3IBsA/R/BuV3901vdknzhUX1SVVIDC/lw/VLVaDsEwox/+G/6sOnxaxilWA2zPQLtLkFHzpzFd+yQVMxVLdQjuiVfe6/uabkBSGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347965; c=relaxed/simple;
	bh=a3ho2vecaIpCSyRJg3lIAeUiNwzNu5h3r+7NClo9Quc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjdf7PedPyLteMIr0uyQB4UN8+z02wovVD8BhGUEkH2Jcr01P6JtNXFg1+5L+QgdA6QFC4Dht4L2lDtwarESu2t0eRa7K8jdked7CuJzdVJodft3V8pgSMUGr7dxmGcjyFV/WWvp4EU2ZAdcWedUc35zhM5UF5l8gYVrCm9wvKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHB/0WmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D624C4CED3;
	Wed,  8 Jan 2025 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736347964;
	bh=a3ho2vecaIpCSyRJg3lIAeUiNwzNu5h3r+7NClo9Quc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tHB/0WmIDPXbQjh7juRiylvbGaNOmDFzMXOqexoHbRtZFWwQAvL17iATXT0ceNkC7
	 vKN71mUB0nMJNSYnbPVidM8OyXTOYgpB59StbOCXO81s/6yaSx013Bb/dMwqXQtylE
	 JB/pyyBOgxvH88Aca/Xoa0ObF2wAlD71buJvFgP4eiWN/ytkBDyT67+ntQIpBJl7tC
	 +DJNkylikSep6qIKZSOMpWKpP1m+d43OwvAS6Q0sXGZGlJsYc/4FmriLO/5wzPJQth
	 4KsFcVOnyPzBZ++2aRMQv//yhchr2pYul60bDHIMxu6eC+EXAVdydipm0FFkUbr3bU
	 rgoudXHgr2DmQ==
Date: Wed, 8 Jan 2025 15:52:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Sebastian Fricke <sebastian.fricke@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, Jianhua Lu <lujianhua000@gmail.com>, Stefan
 Schmidt <stefan.schmidt@linaro.org>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <20250108155237.5cf0ba10@foz.lan>
In-Reply-To: <5953bea1-194d-fe2e-251a-d4ef3e7544d3@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
	<20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
	<20241223113027.21b8f7ab@foz.lan>
	<fbe0d935-a3cf-dfa0-aad8-56834a0a002c@quicinc.com>
	<635ce4ed82aaca422b869f467300b0eccf9c8703.camel@ndufresne.ca>
	<c0f59149-713b-45e4-3755-4a52cfaa93f6@quicinc.com>
	<498a99e1-77ca-4acf-8850-cb74417ae88c@xs4all.nl>
	<9fc76dd1-ef49-a9d2-0271-eacb50943b03@quicinc.com>
	<9b33ba28-5aa9-4863-8fde-535841ddbc10@xs4all.nl>
	<6654d78e-d16b-489a-3532-e2fbc788b0ef@quicinc.com>
	<067d0deb-50ea-46bd-9f09-827b0ba61aa3@xs4all.nl>
	<5953bea1-194d-fe2e-251a-d4ef3e7544d3@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 8 Jan 2025 16:42:03 +0530
Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:

> On 1/8/2025 4:13 PM, Hans Verkuil wrote:
> > On 1/8/25 11:21, Dikshita Agarwal wrote: =20
> >>
> >>
> >> On 1/8/2025 2:25 PM, Hans Verkuil wrote: =20
> >>> On 08/01/2025 09:51, Dikshita Agarwal wrote: =20
> >>>>
> >>>>
> >>>> On 1/8/2025 1:17 PM, Hans Verkuil wrote: =20
> >>>>> On 08/01/2025 08:43, Dikshita Agarwal wrote: =20
> >>>>>>
> >>>>>>
> >>>>>> On 1/7/2025 7:27 PM, Nicolas Dufresne wrote: =20
> >>>>>>> Le lundi 23 d=C3=A9cembre 2024 =C3=A0 16:21 +0530, Dikshita Agarw=
al a =C3=A9crit=C2=A0: =20
> >>>>>>>>
> >>>>>>>> On 12/23/2024 4:00 PM, Mauro Carvalho Chehab wrote: =20
> >>>>>>>>> Em Thu, 12 Dec 2024 17:21:49 +0530
> >>>>>>>>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
> >>>>>>>>> =20
> >>>>>>>>>> +	.dma_mask =3D GENMASK(31, 29) - 1, =20
> >>>>>>>>>
> >>>>>>>>> Setting a mask to GENMASK() - 1 sounds weird. Is it really what=
 you want?
> >>>>>>>>> I so, why?
> >>>>>>>>> =20
> >>>>>>>> Hi Mauro,
> >>>>>>>>
> >>>>>>>> the value of this dma mask should be 0xe0000000 -1.
> >>>>>>>>
> >>>>>>>> The background for the same is, 0xe0000000 onward memory space i=
s allocated
> >>>>>>>> for IO register space so we are restricting the driver buffer al=
locations
> >>>>>>>> to 0xe0000000 - 1.
> >>>>>>>>
> >>>>>>>> Based on the comments received in the past, we are using GENMASK=
 to
> >>>>>>>> generate 0xe0000000.
> >>>>>>>>
> >>>>>>>> Does this answer your query or I missed something? =20
> >>>>>>>
> >>>>>>> I'm not sure it will do what you want. (0xe0000000 -1) matches ~B=
IT(29). Perhaps
> >>>>>>> you wanted to use ~0xe0000000.=20
> >>>>>>> =20
> >>>>>> value of dma mask is coming as expected with GENMASK(31, 29) - 1
> >>>>>>
> >>>>>> qcom-iris aa00000.video-codec: dma_mask DFFFFFFF (0xe0000000 -1) =
=20
> >>>>>
> >>>>> Isn't this just the equivalent of GENMASK(28, 0)? Can't you use tha=
t? =20
> >>>
> >>> Too early in the morning, this suggestion was clearly wrong.
> >>> =20
> >>>>>
> >>>>> It's much easier to understand than GENMASK()-1. =20
> >>>>
> >>>> Sure, I can use either ~GENMASK(29, 29) or ~BIT(29), =20
> >>>
> >>> ~BIT(29).
> >>>
> >>> It's really weird to just disable a single bit, so I think some comme=
nts
> >>> explaining why this mask is needed would be good (if there aren't com=
ments
> >>> already).
> >>> =20
> >> I tested this some more, and seems ~BIT(29) doesn't work, as its still
> >> conflicting with the register space. =20
> >=20
> > Odd, perhaps a 64 vs 32 bit issue?
> >  =20
> >> Correct value would be GENMASK(31,30) + GENMASK(28,0) to set the exact=
 bits
> >> to get the desired value i.e 0xe0000000 -1 =20
> > Honestly, in this case I would prefer to just go with the actual hex va=
lue
> > 0xdfffffff together with an explanatory comment.
> >  =20
> We moved to GENMASK way to address comment on previous version, but sure
> can directly use 0xdfffffff with a comment.

If I understood it right, bits 0-31 can be used, but the hardware has some
issue using bit 29 at the mask. Could you please comment why it can't be
used?

Btw, as this is a mask, IMO the better would be to document that all bits
except for BIT(29) can be used with something like:

	/* Bit 29 can't be used because ... */
	 .dma_mask =3D GENMASK(31, 0) - BIT(29)

Thanks,
Mauro

