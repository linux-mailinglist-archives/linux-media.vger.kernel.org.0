Return-Path: <linux-media+bounces-28397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15191A66D62
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 09:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FD5118898B3
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 08:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230BF1E5B9A;
	Tue, 18 Mar 2025 08:05:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADEA38FA6;
	Tue, 18 Mar 2025 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742285125; cv=none; b=KHXaHRQQ/kmNb3OCp1rg5WpsCIKgd1/lGdNr73WmgG+qncWg/+gUonbZZn/MeHYHW7qjPJ71ArQWZDcZWaPAuwhd0KzZ/vjkuX79Ov3zQEd0mH89eYDndapLMZTh41N/PIyidzb8FGBFSd7g8ky355mGrXFbSLmPia0aKF36Q0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742285125; c=relaxed/simple;
	bh=8eKb6s6TfKAxfOLRJBQu3UMQGqysNsSuBuKB+zc59K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxlJANbUMrtzAXETaZl+WCNMX5PouXzMKQSS7dijrnK+hers7OffBS0U21cDgc9dOhiyIeUufXCQBrE6qB9vXQRNfiMlKJEb0xKq5/shvTXz80iNHReYifjE3DAlRvGUqy3U3I5qc/9v3LjlAi5Cg+nz/k/JoKGU/+x8z8iBJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-523dc190f95so2559352e0c.1;
        Tue, 18 Mar 2025 01:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742285122; x=1742889922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9qhH9LS3Rq8nlFupSanETSKWHq5T1i+yLcj3FPB7/M=;
        b=dvR26JnunVUR/NFl+PEfKM3W+addd9ERYXUEpLDoYTyCzKCGz9tGmaTSOqGbpAXInd
         MtKGkoSR+e+Qzu0HTVTPbvB7DGFlgEoKT4YWnwCvTChY46VvxUH1glhk+jryZliPM5F2
         c02axvzoW96cC5aP/fMzyF0ajjDFNPFxjPat2bG6qnbRMEMpF5lFs+3JX9Yf+oV/5u9E
         +XsG2mhQ86AZvRnlgU7eurN3vUZd1tVd9l8dROQbVC2JNEcyTLV1pP7zntm2EH07PsTH
         vLMCKkAKPJ00bNT/NczaWLkKuhXoKbSj0V53oNlYV9HfPfyHAJjo9YEj8a7tOtgnR8Qe
         p49g==
X-Forwarded-Encrypted: i=1; AJvYcCUSULRdH4lV66OY2VbezMGEPHFHte+VZvhUjl5pc/XycttCiP5Sinro1yaIhFjBzgtpWM+K1XljwfWo@vger.kernel.org, AJvYcCVk76rSbyfpiiDRIVWl6Ref8fpDQgUKI850Zrs+FD6S8ROmc/tmacaFYOjhHS6M1ALc0lS9RS3WvLef/QInMWAvEyM=@vger.kernel.org, AJvYcCWbKLSZCP16gBJ1KOYGsj4q0Fve7MKEFNPQTRIBgTgg60MlOBXy5sTIheGuEcbeMVWhH67K7LwdAsiQn7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1xno9tnMmrQN1KTZIYsGRxKagXPOJhviAL8Xdufaa7Yt/tqQi
	LlINJPNCC3QDptOdmpNM1Hdd7Z2Gl8m67bgkQFP1Snau2AR2exlbeCHHFqeC
X-Gm-Gg: ASbGncsjcbxgufLn7TAl6iuuwdIrNAhUMHcjcMCVmSawhKvSilM8aWNbv6L6pCs+TrR
	DIWQDXbHZik8za6SLlpIGbeS6S8EGt0gFph240F6we+xwJk9zpFU7UYRbs27nzsYAxh9woD4o0m
	0iBE/6Ope+pLZv8/9dcwAxYUehr0073BPqa5IGawdPN7phUAab77RSWyZi4GJPKx1h9u+w1ZcWX
	CQ5f7Sf6A4CkQjQ4s6/aSvpXD2gu0JOdyQZ7LmRsgzWqrKHIqBhDc46jmII8W7AqUnsjMhK0REj
	bT72s0xsJO/1g7WHpMYOCpU6iJ867rDiNe5os21kcoj8NExRowXdKFHCO3ZwpmWVp4nWvR8O7tz
	Z/kI+BfHzX5pUDQUgoX0jxg==
X-Google-Smtp-Source: AGHT+IFNfQ8cM//L1M/MwBcpi+RFY0kOeY4qj4siAbGZs9giQOaR+emD3KqBnmeLnScZ95m4CSVTdA==
X-Received: by 2002:a05:6122:3c8c:b0:520:5a87:66ed with SMTP id 71dfb90a1353d-52480e7f34fmr2038002e0c.5.1742285121855;
        Tue, 18 Mar 2025 01:05:21 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a5ccc18sm1923998e0c.22.2025.03.18.01.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 01:05:21 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523b7013dc8so2227080e0c.0;
        Tue, 18 Mar 2025 01:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKOu2CN0MwYhAjb5C2S7nm98wUjWCKkgelPQpKCLBTgzrF81S/3+4kxOkBvF3004B9CruhusD9q8mRBP8=@vger.kernel.org, AJvYcCUkgX5P/LDWCvuV6mN3Qu1PI/pBYdVhbF3FrI8BDv3j5/vOy5DgSdWG0jbTnYp/q6u2zFJr7YTvMrxp@vger.kernel.org, AJvYcCVlc8508UiUIRLI/e1lCzSlfF8FjmVvMMoYmY/PZ/Zb5PeKEvEuhrdMppm0tGnBqiCfe9QqEITPPGzsbtbq1fL+DrM=@vger.kernel.org
X-Received: by 2002:a05:6102:cd0:b0:4ba:9923:fa57 with SMTP id
 ada2fe7eead31-4c4d9084f76mr2173437137.15.1742285121144; Tue, 18 Mar 2025
 01:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-merry-ringtail-of-competition-7d46fb@krzk-bin> <20250317114904.GA868399@ragnatech.se>
 <573bb90b-bada-4dde-b88a-f92db1d1a3d1@kernel.org> <20250317153406.GB919085@ragnatech.se>
 <4134b49c-f3f2-4b46-bf2c-52986fca265f@kernel.org>
In-Reply-To: <4134b49c-f3f2-4b46-bf2c-52986fca265f@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Mar 2025 09:05:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=mG78mZ6R8xAuEJUcDd0m5sE2-ttEbTAt+ERHrZjTHQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqwYxhhT63Rc9otRTI_BgmebHMKNPh4z4mRIsWosEzhPVEIi-IFxGIC8UQ
Message-ID: <CAMuHMdW=mG78mZ6R8xAuEJUcDd0m5sE2-ttEbTAt+ERHrZjTHQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, 18 Mar 2025 at 08:27, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 17/03/2025 16:34, Niklas S=C3=B6derlund wrote:
> > SoCs. I know it's confusing and not logical but that's how they are
> > made.
> >
> > - One part is the ISP Channel Selector, this is a function that sits on
> >   the CIS-2 receiver data bus. It is responsible for selecting which
> >   CSI-2 Virtual Channel is routed to which DMA capture engine.
> >
> >   This part is what the rcar-isp.ko driver have always supported and
> >   every instance of the ISP that is described in tree deals with just
> >   this one function as this is the one we always had documentation for.
> >
> >   This block is the one the reg-names and clock-names labels "cs".
> >
> > - One part that we now wish to add is the ISP Core. This is a
> >   traditional ISP that act on image data in different ways. This is wha=
t
> >   I try to model with the reg-name and clock-name labeled "core".
> >
> >   This is new and we have not had documentation for this until recently=
.
> >   Unfortunately the "core" and "cs" functions is implemented in the sam=
e
> >   IP block. And to operate the "core" one needs to also deal with "cs".
> >
> > To make it more interesting all ISP Channel Selectors (cs) do not have =
a
> > companion ISP Core, but most do. The lack of a ISP core is OK, it just
> > means that video capture path can't manipulate the image as much as
> > paths that do.
> >
> > It's not ideal but to support the ISP Core and ISP Channel Selecotr the
> > rcar-isp.ko module needs both "core" and "cs" clocks and regs. And to
> > support just the Channel Selector it only needs the "cs" resources.
> >
> >
> > Sorry if I have been confusing. A good example of this is patch 4/7 in
> > this series. It shows the V4M board that have 2 ISP instances, one that
> > have both cs and core functions, and one that only have cs function.
>
> Based on this I think the instances with ISP core are not the same
> hardware as instances without. You have there different (new)
> programming model for entirely new part of hardware not present in "old"
> instances.
>
> Different device means different compatible.

I think the intention has always been to represent the "full" ISP,
but we started with limited bindings, due to the lack of documentation.
Note that at the time the bindings were written, all SoCs we were
aware of only had the "full" ISP.

> And judging by the address:
> reg =3D <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
> 1. 0xfec0 < 0xfed0

Relative addresses don't mean anything.

> 2. Huge address range
>
> that's not "renesas,r8a779h0-isp" at all, but your old "ISP" device is
> actually a part of that 0xfec0_0000.
>
> Probably the channel selector should have never been called "ISP"
> because it does not process images. :/

The documentation has just a single chapter for the combined Image
Signal Processor with Channel Selector, and considers it a single block.
From my point of view, the ISP processing core is just an optional feature,
which is not that dissimilar from e.g. the optional stream buffer in
Documentation/devicetree/bindings/net/renesas,etheravb.yaml.

> >> What is this ISP core responsible for inside Renesas ISP? How many ISP=
s
> >> are inside of SoC?
> >
> > The ISP core is responsible for image manipulation. ISP Channel Selecto=
r
> > for CSI-2 channel routing. The number of ISP varies between SoCs:
> >
> > V3U: Have 4 ISP instances, all 4 have cs and core.
> > V4H: Have 2 ISP instances, both have cs and core.
> > V4M: Have 2 ISP instances, one have cs and core, one have only cs.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

