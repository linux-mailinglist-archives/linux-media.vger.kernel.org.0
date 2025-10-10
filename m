Return-Path: <linux-media+bounces-44187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4DBCEB20
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 00:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B5EDA4F30D6
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 22:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3624C2773C3;
	Fri, 10 Oct 2025 22:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1eYd7dH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904AC2765C3
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 22:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760135425; cv=none; b=O7CML9hpzLiKaOUQxjHQUcIEJVU5v44CprVgiAlDUjcxiYmVjrDBrDLd2/vR5O3II4F2/yvmEL4QXoFdf8zxFLZ1Pod1B2WGiFo1n4cG2hLIPXUrnpFfxIw/YeDtBi8YXSpOOGutMquMOUKJDOfwpKFsamSMaWx2ETWU2TFmBJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760135425; c=relaxed/simple;
	bh=sx8RlxKZpctnoFBweJS6xvncbNrY1voIIKFf38weEJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjBQSI4aMZh4ZPKkeM8q/LHxEKzxM/uhjV73CyDJ7VzxCFQTrDl1Cm01uiQEAZaQYFZuJfgJmvvHZH5Mm6fOIt8jWjbBjl/2J/qrmOucmcuOcYq9UqwvSMoD9zr0LhmG4yb9hzVPfQFXPOHacO8CrXh8Cw/7UWV8qhOk+U2Y9y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1eYd7dH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDDDC19424
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 22:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760135425;
	bh=sx8RlxKZpctnoFBweJS6xvncbNrY1voIIKFf38weEJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o1eYd7dHZIXngemP67EIzsgbqIA0L3klykBwdyF6/bIPZbplABgEjsmZ/9NcBEvGi
	 eLJSlaczmFYktWp1kIZKiDYsW+QF1mq/6Ys/PGAfsdOocOXHkB+hZQKlvE9rq3bIjD
	 kozFm5JTqkqKPLBE9Qtd13pOdxy2b+S/hqmupQsrKSpdDju1gOnbQfS31FNzLXarUO
	 CyaIrF+/V/dnzgD7jB12p6ZO30rOEXp1U21RphIuuQPFGj/cz3ItnvjHGsyaP+VfYb
	 fSVwe4lf+k0hZS71b9u5GvZ+3Z13YaPl/ifDug/hdQWwsZeNtFifS+Tkm696qMVGqo
	 dCtJjv5yakJGQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso4672681a12.0
        for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 15:30:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUa53buPRPRiEy4ho6zkvHWh2GKw4ixj5g4xPgzLtaQ7QDXEo2yqLLDbL+3HwK6Jmu1rJtH5a/ibnPcvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzooxHEWLQHz1k3K9AFyuPpi46k3l3x/v8BZ78o1V7r+07pzbwi
	/ZcmiEtW6LNZ8d3f95tI7HGDqlbiyQvx73UYLlK8NyksGUzz0311FDDRR3OBvV+iUB9ZbIyZFfo
	AIpv5cu+9L1VawpaIEwXRwXNTLcMulA==
X-Google-Smtp-Source: AGHT+IGdYPfHL1gnUujQzCp8M6WogUc1LbdE4xIMlDxV2yOAQw/4MfeeyPV2JzMy1aQ4kJRIZ9ePrEIFshlr8zpVXxg=
X-Received: by 2002:a17:907:a909:b0:b3e:5f20:888d with SMTP id
 a640c23a62f3a-b50aa7a1685mr1585501166b.27.1760135423725; Fri, 10 Oct 2025
 15:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com> <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com> <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com> <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <c863f6a7-b117-4444-ae6d-1d525b572be2@oss.qualcomm.com>
In-Reply-To: <c863f6a7-b117-4444-ae6d-1d525b572be2@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Oct 2025 17:30:11 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+LPpJxVRUP4b9Gt40t=Wr=2B+697Jv2sjtDqTpqwGezQ@mail.gmail.com>
X-Gm-Features: AS18NWAgf_96UGCOZLypid2OePxqb7YT8CX9tJwVzXdlzHqYAmMGtDO6SoLnFQ8
Message-ID: <CAL_Jsq+LPpJxVRUP4b9Gt40t=Wr=2B+697Jv2sjtDqTpqwGezQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>, 
	joro@8bytes.org, will@kernel.org, saravanak@google.com, conor+dt@kernel.org, 
	mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org, 
	abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 2:53=E2=80=AFPM Charan Teja Kalla
<charan.kalla@oss.qualcomm.com> wrote:
>
>
>
> On 10/9/2025 11:55 PM, Dmitry Baryshkov wrote:
> >>> I really don't like the idea of extending the #iommu-cells. The ARM S=
MMU
> >>> has only one cell, which is correct even for our platforms. The fact
> >>> that we need to identify different IOMMU SIDs (and handle them in a
> >>> differnt ways) is internal to the video device (and several other
> >>> devices). There is nothing to be handled on the ARM SMMU side.
> >> Huh? So if you prefer not to change anything, are you suggesting this =
series
> >> doesn't need to exist at all? Now I'm thoroughly confused...
> > Hmm. We need changes, but I don't feel like adding the FUNCTION_ID to
> > #iommu-cells is the best idea.
> >
> >> If you want to use SMR masks, then you absolutely need #iommu-cells =
=3D 2,
> >> because that is the SMMU binding for using SMR masks. It would definit=
ely
> > I'm sorry. Yes, we have #iommu-cells =3D <2>.
> >
> >> not be OK to have some magic property trying to smuggle
> >> IOMMU-driver-specific data contrary to what the IOMMU node itself says=
. As
> >> for iommu-map, I don't see what would be objectionable about improving=
 the
> >> parsing to respect a real #iommu-cells value rather than hard-coding a=
n
> >> assumption. Yes, we'd probably need to forbid entries with length > 1
> >> targeting IOMMUs with #iommu-cells > 1, since the notion of a linear
> > This will break e.g. PCIe on Qualcomm platforms:
> >
> >                         iommu-map =3D <0x0   &apps_smmu 0x1400 0x1>,
> >                                     <0x100 &apps_smmu 0x1401 0x1>;
> >
> >
> > But this seems unlogical anyway wrt. apps_smmu having #iommu-cells =3D
> > <2>. It depends on ARM SMMU ignoring the second cell when it's not
> > present.
> >
> >> relationship between the input ID and the output specifier falls apart=
 when
> >> the specifier is complex, but that seems simple enough to implement an=
d
> >> document (even if it's too fiddly to describe in the schema itself), a=
nd
> >> still certainly no worse than having another property that *is* just
> >> iommu-map with implicit length =3D 1.
> >>
> >> And if you want individual StreamIDs for logical functions to be attac=
hable
> >> to distinct contexts then those functions absolutely must be visible t=
o the
> >> IOMMU layer and the SMMU driver as independent devices with their own =
unique
> >> properties, which means either they come that way from the DT as of_pl=
atform
> >> devices in the first place, or you implement a full bus_type abstracti=
on
>
> I don't want to dilute what Dmitry is saying here, but the below is what
> i can make out of Robin comments, please CMIW:
>
> iommu {
>         #iommu-cells =3D <2>;
> }
>
> video {
>    iommu =3D <iommu sid1 mask1>, <iommu sid2 mask2>;
>    #iommu-map-cells =3D 2; /* does it look weird to define here, even if
> it is SMMU property? */

No, not weird. interrupt-map similarly requires #interrupt-cells. So
it would be just #iommu-cells here.

>    iommu-map =3D <0 smmu sid3 mask3>,
>                <0 smmu sid4 mask4>;

But you only have 1 cell, not 2 here. The #iommu-cells in this node
would define the number of cells before 'smmu'. The #iommu-cells in
the &smmu node is the number of cells after the &smmu phandle.

Rob

