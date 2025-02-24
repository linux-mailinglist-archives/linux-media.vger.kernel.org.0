Return-Path: <linux-media+bounces-26780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807EA418EF
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E132E168604
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA00224394B;
	Mon, 24 Feb 2025 09:21:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BCB198E63;
	Mon, 24 Feb 2025 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740388886; cv=none; b=DPRlb0bmBEvnpjl8UWXbHjBPWtkB4RMn8aPLtt+dBMePnjdL2sDSrcSmYjGKc/M6CO7hRsl3LlKvTMAlGYMUnsFoeQ0CKBV8AlggRjs0uIibfxHqRtWq0exIvREh16fHRyBLNiK5R1ayRmw7t8TssCTg5VEXpCpL/NUPtSCDxtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740388886; c=relaxed/simple;
	bh=5X9jk15EWyaB4NkonZUuCyx2bBgb76RnzMkSDM9tsr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raZHf6Mbu/wN39Klis7+Fm3fpSCobwXdb5gBu1S/eUBYI6CYsZCoGrASkGKeekNQf5a+ygjoZcYPf05UODeFiRpGkASCKzoeSdA0BVcbEhW0HqyWyAjim1F2C8HBM6svrA8v3hsnrsfLfh7Y3ajDWLSl+V9JTD2Od2H7VJdmdnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4bd3989f027so2673409137.1;
        Mon, 24 Feb 2025 01:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740388883; x=1740993683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUxCSbnE4n4AaIoCQ8bY2SFJFJQDf/ft7sw2fQkUOmk=;
        b=RuK0+Qm+IEPbFI4YpiwFTqLpWOKbinUQFF6qAlBsV93Gvi1pB2T4X7N2g6wXfoha0R
         8N/BBP9aIsh54rjnIaCqFZKPc9wkRP5fLCWRQczYg+/Vs4Kz25EA7eI5vNaznV+yGml5
         rpFDycGOH30B8kH0BKQIc5NvdmDeHbdeZk3Tw6B+yhTPwtInjo3D4aduRyinaKwxNjqj
         LxUQl8LuLu9RksVo+AHYM9IEYddQ6HnJxkwbfiVO4yXLquskpRAJ9ac8kcUZdFoijhTE
         tDsTeYf6y+9GxsIwt2jEfj4zDKgSAhgyexqK0Jnp8d+fKqvWYn0i3qqkB/00pxZ9d2o7
         3EsA==
X-Forwarded-Encrypted: i=1; AJvYcCUzxxskTu1zPj1EehvTA2c8dc5eyqBpDWO6HchM57J/Rt9hL7yGb64eSOoH01x/1o1toE/ouKyxMukeiQlP@vger.kernel.org, AJvYcCWimAtrkVAuAM7lEMGRvIU+FnE03eOLBfxjfEQZdzzkt4ZiGTmRODvuvoYLZo1E3JAugorzy47uwxYAWs0=@vger.kernel.org, AJvYcCWmupH7Reaj+V9ZF54Bh7I8hUzU9rgTfM3bWqBvm9BV0t8RslYwd8LQdR/F8nHdDkJREnRGSvHVGOcBysS5BClrcwY=@vger.kernel.org, AJvYcCWntKtsInzHnXtK4+tjZoibfFRRkhn269T6fWhAGQdnrrvR7U3bJNRBhmmgrKoX3kfny1rQssSkVBXT@vger.kernel.org
X-Gm-Message-State: AOJu0YyN00hXkyDwDAIWQdQjaQ4uY81kz9l49TDYGFvF3QPtMnY7KTOd
	B2urq+rAoISLsGRJEj3Bc9uVDgy04Mln7rtiIEQCJQBxG44BE7EdR2yzP86n+tc=
X-Gm-Gg: ASbGncvOgMt8xFD8agRDGXy1vOPtZGeaodIy8medHw+h6P+m+FuwpVXFKFHtJite74S
	CxAf+f+VYboms3ml1U+6S3h+68EXO42J2dwdud/yz6smMM8M9SCcatNO1YPGDSZmnHUwNiBk0AI
	eZ7Kw0g6NeE8kMvL9GAs50hoVldlDemoFRaT0z6GpDszRgxCfydEwdGzDqpI5t8na45g7Eeq6mY
	OdPxKKzMNROJgADz9CovBgyBpW/LPX9WfpZ9BK/NU3Py+bVwuggJC2k57uMTkKCo2VvLaBS7vbw
	TmT+FbXy5psBwuz6fUB1edz/cs+aE8Yoopnbgm8IMYsJ6mHdFSyAnaZ5pEpGzd0To6+K
X-Google-Smtp-Source: AGHT+IFZc7+dD19GMYHeYrXvDCc0iYndj82lBp69kSSbNndsttS6M4Vrb/dmra9lDNDqBC1pEIqM6Q==
X-Received: by 2002:a05:6102:c4d:b0:4bb:c5ad:af1a with SMTP id ada2fe7eead31-4be992c1f10mr7941566137.7.1740388883257;
        Mon, 24 Feb 2025 01:21:23 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e8548ae3sm4541346241.2.2025.02.24.01.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:21:23 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5209ea469e9so3554637e0c.0;
        Mon, 24 Feb 2025 01:21:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUfNKqplGYnY1L1hw+vwvxZVbFaZxFNv9j+CnsHMt2u177l9+OzEY81r8D3TrZYEOuMnnKVcdYDMIiv6ad@vger.kernel.org, AJvYcCWYzNsZ5tgxa6vrfAJ2DG08xpYKjX6uwgUojkwOKw2uoj2znRD654mAKzTkjyXiMdAjlnKQxL/69PenfiA=@vger.kernel.org, AJvYcCXNrpdPOeMmoNOm3PqN+gkN/EysE85k9Ydov+Gg17dXSOOjmK4lDs0BSmL3RTQTH+siXUp8Xof7tWrTvvQQZGF/kUQ=@vger.kernel.org, AJvYcCXrehezGBOvFHEXL2/qh9TY0Zrz9RfNxPr8aYVvXavKZ77GH6bA8diy4blUTQSTVN0h1jYh9Qw286OG@vger.kernel.org
X-Received: by 2002:a05:6122:3637:b0:521:bb4e:c68d with SMTP id
 71dfb90a1353d-521dcab1650mr7668902e0c.0.1740388882870; Mon, 24 Feb 2025
 01:21:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>
 <20250223180855.GD15078@pendragon.ideasonboard.com> <CAMuHMdU-H-6zLJAX06Zx+cu2vjCYvKghNAEw=55eu+sYqDoSgw@mail.gmail.com>
 <CAMuHMdV_hc2DCLzmHO8jNAsb9oy2MTvn-7Z-h+EwCU1gaH8ioA@mail.gmail.com> <TY3PR01MB11346A3284A4D62BBB1CE291586C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A3284A4D62BBB1CE291586C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 10:21:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKutyphQg15Qs+Y1nszvTXgdGHf_b=fytQpHoPfG96Xg@mail.gmail.com>
X-Gm-Features: AWEUYZmuenyC3v9Ei71OHurvEIBqid0gCs2yUJOFzKsnNgDI8xdKFhv-S_wDVCs
Message-ID: <CAMuHMdUKutyphQg15Qs+Y1nszvTXgdGHf_b=fytQpHoPfG96Xg@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 24 Feb 2025 at 10:09, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 24 Feb 2025 at 10:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > 2. The CRU has three (not two) resets on all:
> > >      - CRU_PRESETN,
> > >      - CRU_ARESETN,
> > >      - CRU_CMN_RSTB (RZ/G2L, RZ/V2L, and RZ/G2UL) or
> > >        CRU_S_RESETN (RZ/V2H and RZ/G3E).
> >
> > Sorry, I missed this binding is about the CSI-2, not the CRU.
> > So the third interrupt is really about the CSI-2 PHY.
>
> You mean typo, interrupt->reset??

Yes (doh, coffee for real!)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

