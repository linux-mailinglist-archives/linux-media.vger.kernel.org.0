Return-Path: <linux-media+bounces-26772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AE1A4182A
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A9731743BD
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1EE24A046;
	Mon, 24 Feb 2025 09:05:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A63245007;
	Mon, 24 Feb 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387954; cv=none; b=Q0fjVWVQQWK6xPKgOZAHNrsw4qsljzg4yzU0/zEtNj7ZUQB8dV5u90lMebRVs5FEyP+xtF5+a0d7eqSx0p1rru0FH/4wlQfYFp89u7wSpwlkyZVcHkcqe9/6Y15XtwGBCydkpUCV4NQI7dKEHDji3L8qmBxCD0aCGB5TafCPJDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387954; c=relaxed/simple;
	bh=eUkPwQ9m36exbMkdtZ5SGav/mKYeXKb0WO6zAUjz2jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3IIpE2gqNeCKQbpCnxKBeP5hgJ1kIbBJeBChcQLZbIWhJ3hHUjjLkSDbYTIM+txTs1nErWhj35NV3rHyJIQnMxt7YZ7aDW1itMdLf9+hnr/e3Jug+1dIoYk+ZpJ5/sgI6ulgaCiiNB0O9hv0JSWa3ZTGGi/ftnFczp3SrZtj3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f22fe889aso3531533f8f.3;
        Mon, 24 Feb 2025 01:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387946; x=1740992746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XW7SoAHFjEV752Biy5J96qJjLeCuR0/5/9KQgU4Yvq8=;
        b=Kva0ZaSvBl5AsUWkJuKc/0/KQCWsS+kVHPvUR3ZtvqgIWjr0JjB6gksSdUAbiu0N1+
         QlTb7YVJvEx+42CHkvmoTWADD+cY7UCJw6ZeHC5I0oWieEn2ixhWURTjFZVNFEbbM0ql
         5LjFUxJ0HpoEz8keBM9syisIjwVdexmZGnbwB/pKzyhNm0T/MkbT/a5f3hpS3SQP4m0e
         kRx32iP5Hk4Jv10edVONEY0htHN5i0XwqEPObRdhixxX6do0KdLAE0q1U/Ui58tParw5
         +0lesz/GG6F/Rt82hjW9GVof8qmu1N7bODG+XOaR0ntbPULVdUJZcq/97g+pElRAXlda
         cT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUF9+PdbB4GRTJlAQYv+sapA7G/CeV5FnD9bwTXET62xXNc1s3ZEOl+8oDSzYYKSroZxe9lIJlj6aUz@vger.kernel.org, AJvYcCVJU6hGZrYond0pG9stIBhVoZC4NOiIwDHd6dckdWWXzCq6doTefhDqpj39UhPjOsYlBwBN3ZHL/u96LxuW@vger.kernel.org, AJvYcCXMPXvkJ2ahgUbPZ68i1uC1yhEn+ryu4D3wrIop7dKqF7ojoSEIiJoivj3FzsRk1W4aOiVa3IdSlzvcaP8=@vger.kernel.org, AJvYcCXpCHLIxm9rKasO3hTpiwshRh7y0CABDezgW4VZLjIvnP/xYN2aii6osRySVrpE6uqaHGmyrjJKQpA8GjtbfTeW9UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOP5n5rn2aejNYsqQ3pZz3Q/vb1eG4rRX8Wr3EG2XXbxb9Vqh
	ViVDrfQFrO/VIpqDANI49HMrTf7PKAoXZWzu9cJn2hejsLYp4aEq3UISOMKYInA=
X-Gm-Gg: ASbGncvqsaS6s4sOB4dsuCzctvDvj1DXqrJLCyunbMyMQSJ3OoFZUyqpJvqCSVnKNXa
	BZi2uuSm/+wBUfyLOMGFx6vjQmU+0oTntC5t+sjl+FmXdMTRoDZpNXmeFU3Vqtnd8qRQZV9Julz
	3jAgXOtMA5qCz72QUsvfzSJNvn9tVS2HcLt+M3OwCeJMXPubkbOxlMRBmfpa4KETmysDnu6xwaM
	TPhn20YRDuFkm4YmQ1XnFtOIzSYj9U8OdyE2Ao0oig6o5Gg8dRvXVXKoNHRwslYs++dbTB/a/+W
	LO9cxsk+QdHgV5WcCtdUWZPn1Xtymc7qzgoj9XUrbHx6yOlXCkMLvi806tliK0Sm
X-Google-Smtp-Source: AGHT+IG2byA6VcTZexHq+P++yju4e8je8MyD4ZSKRXtHQfqNAa+mSxi0Bs7t8nt7woVT/BN81WvKEQ==
X-Received: by 2002:a5d:5f51:0:b0:38d:d9e4:9ba6 with SMTP id ffacd0b85a97d-38f6e756860mr11598232f8f.3.1740387946504;
        Mon, 24 Feb 2025 01:05:46 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbabfe1d9dsm1389651666b.101.2025.02.24.01.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:05:44 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaedd529ba1so500781666b.1;
        Mon, 24 Feb 2025 01:05:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/qOzLTLrHMfGjK96Kl8BQEJIn34htAiF4GGv5rDaIMoPHPysh+VNkQkQjLfwNeEdNvQVDZQc/Z9weIZXzxd2ycYY=@vger.kernel.org, AJvYcCWA6wSTC5uOtqoyxx0Y1As2yrg3SFtPIhr4Vm8ydJkj32iXAvoy3nDvktcbK9VX+Gkl9N8ZYJ7DNBeUqkPL@vger.kernel.org, AJvYcCWGtlkP6qsCvoOKLcEiDlgrOMnx7Vf2aHsNOrinLAB5PAk2pVMJ6v410Tc6OYFwMcMhmWwuvNwMBHpWPgs=@vger.kernel.org, AJvYcCWmhXcNLIpXgn66xtLxcJt6X7p9YJsZEU93XgsNj41w5DYxS2b/XMf542t9LU705/79c1YNtwDw9Gyq@vger.kernel.org
X-Received: by 2002:a05:6402:274d:b0:5e0:49e4:2180 with SMTP id
 4fb4d7f45d1cf-5e0b725286fmr28663134a12.25.1740387943126; Mon, 24 Feb 2025
 01:05:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>
 <20250223180855.GD15078@pendragon.ideasonboard.com> <CAMuHMdU-H-6zLJAX06Zx+cu2vjCYvKghNAEw=55eu+sYqDoSgw@mail.gmail.com>
In-Reply-To: <CAMuHMdU-H-6zLJAX06Zx+cu2vjCYvKghNAEw=55eu+sYqDoSgw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 10:05:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_hc2DCLzmHO8jNAsb9oy2MTvn-7Z-h+EwCU1gaH8ioA@mail.gmail.com>
X-Gm-Features: AWEUYZlqi2EGmND0ZEA8Us8Hs9h0LJdT8q-1XVxelx3fRONaDfoLe8xmQ1d33Ck
Message-ID: <CAMuHMdV_hc2DCLzmHO8jNAsb9oy2MTvn-7Z-h+EwCU1gaH8ioA@mail.gmail.com>
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

On Mon, 24 Feb 2025 at 10:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 23 Feb 2025 at 19:09, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Feb 21, 2025 at 04:55:15PM +0100, Tommaso Merciai wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > > found on the Renesas RZ/G2L SoC, with the following differences:
> > > - A different D-PHY
> > > - Additional registers for the MIPI CSI-2 link
> > > - Only two clocks
> > >
> > > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > > SoC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> > > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
>
> > > @@ -48,7 +58,7 @@ properties:
> > >    resets:
> > >      items:
> > >        - description: CRU_PRESETN reset terminal
> > > -      - description: CRU_CMN_RSTB reset terminal
> > > +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
> >
> > I'd mention which SoCs these apply to:
> >
> >       - description:
> >           CRU_CMN_RSTB reset terminal (all but RZ/V2H) or D-PHY reset (RZ/V2H)
>
> Note that RZ/G3E uses the same naming, so be prepared for more churn...
>
> However, I am confused...
>
> 1. According to Section 35.3.1 "Starting Reception for the MIPI CSI-2
>    Input" (RZ/G2L Rev. 1.45) CPG_RST_CRU.CRU_CMN_RSTB _is_ the
>    D-PHY reset.

This is still valid.

> 2. The CRU has three (not two) resets on all:
>      - CRU_PRESETN,
>      - CRU_ARESETN,
>      - CRU_CMN_RSTB (RZ/G2L, RZ/V2L, and RZ/G2UL) or
>        CRU_S_RESETN (RZ/V2H and RZ/G3E).

Sorry, I missed this binding is about the CSI-2, not the CRU.
So the third interrupt is really about the CSI-2 PHY.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

