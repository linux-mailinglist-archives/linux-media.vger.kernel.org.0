Return-Path: <linux-media+bounces-26771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB78A41801
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEF07189153B
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E3722D7B7;
	Mon, 24 Feb 2025 09:01:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A86EEB5;
	Mon, 24 Feb 2025 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387666; cv=none; b=fHeN/vjTm3rwUaM3nyamyOfkg4K2NgDt6MmOD2Gd1M9pHySefcDJFbYyUOdocrPYiQsPpWlWUOJwBeZK7Nh9LSAzAN6qFGYagKP55034LptOj40NDhBiKs3fYbMgO3tPJf4xiN1L8fMl8ArtnjEFo5EmYCTtp4rUxURQPh1UtnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387666; c=relaxed/simple;
	bh=z+OyVhcm0qRqv/F/DdiJK0Kx276Qsve4SMAomSlICGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvc74Mk25Q16Qd+qa7HLN+KrydyIuCApW1fcOYWLetHZhxN/NIlM9Aj2Q6ZSLZgytO3A5rLVV95lU3OTHDY0TDoR7VhKh1V+FEGVIdBTRw6OLJQ458jzXTlJokDe2eRgiMbwBKt+kW0fre9NLofphJVfsxKZNsYZa5RpdMS1VAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8692998b124so2537580241.0;
        Mon, 24 Feb 2025 01:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387663; x=1740992463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOe9HsltTIw7CTbh/CYElZLjggwXVdNmrZGMPir2qlk=;
        b=X9T4jzGek4gR97Uc/DUINXccra/HZ7EcTvfRCqfRDnQ4nuBnDe8TbAJ7OPa6FBG+8E
         BpYXP3OUf7s4Ci9HfLXSZyfseO3QClU+k1Z0txKU/w7uE1pGphmGfIiZja62134C0N/Y
         8UGxX3Y3JbmAUhGsc3Gj7a404BMjYm0ICqz3v3r6tgl/zvHmw5Z7xMAU/jxpAwhClKUv
         uRx2dIOJahvRdFtnbsZezywncNqPKS4TIqTBS8DAcJQqQE6wYx8sKIIAc8TGefgEkFX1
         LY4ZCT9++o/1oHsjsBTXMRXKgqmOKIa8dkEDSOjfb9OrhQgrymveCARXGbpR87NmSEFC
         K7HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZM3P1epffMtDTiZSXE7tH1Zc4i5P+ZrpecdFb5UTwkogl71eTwM1Bj0MqL3dIq1To0DwTs0O6cHZQFFg5Ntj7Vok=@vger.kernel.org, AJvYcCVC13uYvMkAdrgi5rnhHX7PCUY1NFcDTIhKo55Wl2DRRupG6SDP7mRPrA4KxYvqQqzPgwejES/8R5M+@vger.kernel.org, AJvYcCW94CdkoZDtu7g/3ki1ANcJXNVpZpNbK+7Sq4+fqyJfmhHy6oAfwDV8SSn25yjqvaNu1BOqOU4tsrdb33Iq@vger.kernel.org, AJvYcCWibhXQSO6oe4iCKstMOPQgUPLspEs3FaEhjqp9dfI6reU7PocA3YpKW5SWq9nHCwxmaRspnbAiGVY6zm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOD/YrLG2yT4dApvNWVT5ST5akoeGeaEmkxxX9FgwIM+VaRSl4
	s+ljRZuKY95nMTweyrzSe5cHaClWZAvc57fmArAc07yvZsIx6hh3qo2MCmL4
X-Gm-Gg: ASbGncu16wMWIJrd46fGvnejM7mUmkrq3WB9yjBdTo9X73IzYadCzosrELvaLLgY/Wx
	VKxjk91mhbtMbOadcpVWuTLJ2E43v3LdU16Q7p0YHZKfgikDEjLeQl1Y9xrayXX47SR0fycjxOq
	sQ6kWCUIpC5NgEyhJlwxbCEBbXhV/olo9CbXwvCLwkGC8Kk8LNRZ4QsC+FITgA1ERjqNMO3KWRx
	wdI2QRvd9dYKzzhG4KImpLLdwX0cTuWG2D1GD6R1YuEm7ZJOV00gV9dcUiJnmsjyuM013fg/4WM
	G7fQD5KT421g5EV2TnBdLM/JjhnnvSTqFRv6Kwf39D3Qdjqw3vyDz0UhYBQaMArQ
X-Google-Smtp-Source: AGHT+IECkv3s1INDVhFh1/p/Bxj9SI7VdWaV/F9XgD0N7xvDl/ggrSwRQIsdm39NSeie4+rngXl8/g==
X-Received: by 2002:a05:6102:d91:b0:4bb:623:e1f7 with SMTP id ada2fe7eead31-4bfc28ed564mr5352375137.16.1740387662770;
        Mon, 24 Feb 2025 01:01:02 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e858066csm4483286241.9.2025.02.24.01.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:01:02 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso2650162241.1;
        Mon, 24 Feb 2025 01:01:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0Zj6IrqjSWACZ1Hdw4KuGVLKChH8401p30mY0HYDq1OyZvJyLI6Ww4G6ohjVQ1X3x2h89Yz7XEx+JpUqocoLk5ec=@vger.kernel.org, AJvYcCVuWzRQ8Ozt2HBv0qHrUHO0cgPGeYOBRl2HfMPR4dU77TxJMObsFlyaKHrcjKOSuJNtqQY9jWPHBruZbwI=@vger.kernel.org, AJvYcCWuBba21nQz+5tVWE3/NOjPHC+Z95Hz/6px2+H/s/dW2iAaPyqPnvkkyWYrfWY8uGn/rTXPjTSTinEK75ws@vger.kernel.org, AJvYcCXbV94lLbhaUEaktFDhu2z2ClcPrNOLlYG8Hr9OkYCUws4U4l8QuSWw6Ib/38LBknSPmpc1JllTjs5S@vger.kernel.org
X-Received: by 2002:a05:6102:41a0:b0:4bb:9b46:3f71 with SMTP id
 ada2fe7eead31-4bfc27d870dmr5445112137.8.1740387662348; Mon, 24 Feb 2025
 01:01:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com> <20250223180855.GD15078@pendragon.ideasonboard.com>
In-Reply-To: <20250223180855.GD15078@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 10:00:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-H-6zLJAX06Zx+cu2vjCYvKghNAEw=55eu+sYqDoSgw@mail.gmail.com>
X-Gm-Features: AWEUYZlGeUM-pmc-byJjYW5THOFUae4o4VtZXna6DT3s8ByZXP0FBgpP34Wv38c
Message-ID: <CAMuHMdU-H-6zLJAX06Zx+cu2vjCYvKghNAEw=55eu+sYqDoSgw@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Sun, 23 Feb 2025 at 19:09, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Feb 21, 2025 at 04:55:15PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > found on the Renesas RZ/G2L SoC, with the following differences:
> > - A different D-PHY
> > - Additional registers for the MIPI CSI-2 link
> > - Only two clocks
> >
> > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml

> > @@ -48,7 +58,7 @@ properties:
> >    resets:
> >      items:
> >        - description: CRU_PRESETN reset terminal
> > -      - description: CRU_CMN_RSTB reset terminal
> > +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
>
> I'd mention which SoCs these apply to:
>
>       - description:
>           CRU_CMN_RSTB reset terminal (all but RZ/V2H) or D-PHY reset (RZ/V2H)

Note that RZ/G3E uses the same naming, so be prepared for more churn...

However, I am confused...

1. According to Section 35.3.1 "Starting Reception for the MIPI CSI-2
   Input" (RZ/G2L Rev. 1.45) CPG_RST_CRU.CRU_CMN_RSTB _is_ the
   D-PHY reset.

2. The CRU has three (not two) resets on all:
     - CRU_PRESETN,
     - CRU_ARESETN,
     - CRU_CMN_RSTB (RZ/G2L, RZ/V2L, and RZ/G2UL) or
       CRU_S_RESETN (RZ/V2H and RZ/G3E).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

