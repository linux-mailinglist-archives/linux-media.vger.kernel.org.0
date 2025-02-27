Return-Path: <linux-media+bounces-27157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02968A47A57
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00A533B10E2
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C77229B27;
	Thu, 27 Feb 2025 10:33:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7C21D3E7;
	Thu, 27 Feb 2025 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740652415; cv=none; b=ERXTJ+jqIqj0xyKFZ5/cg4AAmIKRA2HVcvPQdDto7ls5PrTIVVf6x2SErQl5dyQzKuhrFUsu/krw1Tq1HnE/D9SvYwVnA5PqNQ9tKHtIh/KnvcHF/QlVifPFgytrM1gK+NT50ZnV5qySyZ8AIbt+/thbB1GWVPJqOZQZo2k3q+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740652415; c=relaxed/simple;
	bh=sdRYJf5KqEhXm7M/os0m46/SzH35rQZIDcFmEL2GFkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tft7f8a39Lhobh/dnaBwZxjVOvMeFDRlB/w2XMrEjK7lS8YuQyHBtV1LKJh6ti9YmRF/bDQ52EK/cmPtJw5kgxxkVhMShoONRs/6Eu0hMFh7YuOv8Vbpmig96Op8aoBGtDLulhSMyKXLxJmE8CvGD5jd9/61RMcFu+upDf9Fom8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b3ed5fde5so395734241.0;
        Thu, 27 Feb 2025 02:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740652411; x=1741257211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubSE84NjFTjsY5U2xLJxwBeHimqGUMTmF43TX7I58to=;
        b=oBBvKr9XVDbFmwKhembhCuagm7yyyDaZXId+H9hUTcc0ek7mObLqOTTQiKR7EJ0yAE
         /c6cxYKcqxiZP7Kp0mw9NpxjGS3TWIgTKzf9RhSjzqNexm5UF49utu0gt4/HWbnsNZ55
         51d4AY5nRBe7/ZJjch7LnmAfJhusMtUJM/1zCEfF3EJJlBetVytPX5v/m6ZKQPGhtxCC
         J8LrWDJ5zImhZ/5vQlRleLUDutmaXj76uEn6QbmL+bU3sVvmg2vYiV3Zhun6YxHnEKqI
         hJ0Xhif7xDJkELroxVPffwW5Lqgy70A5YVodD3MUpEWoG+EKURquswOGUVmSKiZJTJ/P
         7aLw==
X-Forwarded-Encrypted: i=1; AJvYcCUomP/c2MA4IuVz4uJuwQlLsNnwV/4iQh/q6ancGS0kkpn1oDIgKOu4rXv9Cm5aojtJurX5BT5ImToC@vger.kernel.org, AJvYcCVVFf6gLqzZ6rfqNpKBs0Hfq8jaMqshSIaXsAec0tIR8iFAxknBMR/lml904FQ0nhkJumEUHUa2E1LGislH3oyo7UU=@vger.kernel.org, AJvYcCWv1EL2utwHo2YlgV06/I+5+4v3RctOQkj8LYqrcqtTJ6sPilLCtdWQ1TTApEaZHCP2jImE15ehbJPyanM=@vger.kernel.org, AJvYcCX+bG+R3V9yUB1r1vMxLRAI0VDcRrUr0xOw5OejQtVeC1Itt9gWszGPcu6HnK2msiLFXMG/cwPSWzvqcvAb@vger.kernel.org
X-Gm-Message-State: AOJu0YxgXcmp1HywGQr289Pv1mTavtkWj3rgodthv67FELNB17hfMq0Q
	u8MfmghAm0nHsTvs9OThR06wB9tl2+CBE37WfXAMpswyijlsyiBIj8YKirCi
X-Gm-Gg: ASbGncvPVqsLJ5xKOFCuhkTFXah47xt/5Gj1FjoI8bMaUXZkXNGqUFhy3NOnEhAd6sA
	Sv+s7/kIeumblNCRRIdtwwSO7dzdsiTINhc/6i+hN6Pw+zC5ciImMqcoyOnlE5cbdNV8Q6BK+7E
	Yk4VC9AAntpUnwzRoIyN7+WqKY7qvW+17PJfBbqAWHVttbP/OewvKCI+f7esmlsXdmd9FPEaC7g
	Yw++89z1H0K19cQEO24sWRki561ShUGEGescUKcOKcIRH2cv6+sLRJTQhDz0U3LFGGi6X1iHr2b
	uE0AjxMYqQP/+puqe3vIlIjIibC2h7vCl5zUMprsG5eavegBysuKlWKmHoXOv7d6KhQn
X-Google-Smtp-Source: AGHT+IG8QZ60apdnKBlKPn/BDfdi4vaLf8ZdXAbLymQpP6LqjEnW5zIiyBSSnWGaGcVdIDzEj1v4Kw==
X-Received: by 2002:a05:6102:26cd:b0:4bb:dd1c:dcff with SMTP id ada2fe7eead31-4c030fd5013mr1118836137.2.1740652410866;
        Thu, 27 Feb 2025 02:33:30 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c0345fc82fsm199790137.1.2025.02.27.02.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 02:33:30 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52099627b5aso791000e0c.1;
        Thu, 27 Feb 2025 02:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlmQKq94RL7ibpCyZpDX1dC7g/X4RL/KonRvKEPk9jNGGscoOY/JdknYtP3UyuX9XDuVCVHrIpXqACbEgV@vger.kernel.org, AJvYcCVANtr7PKnLKea5/vusQL7DasrUQAJkSpPxMkAQYLNKMTYmW/ME7/VhhBLVaS9Q1bBCP4K26mWku332ToLXpcozYD8=@vger.kernel.org, AJvYcCVWa8NCXGo8A50Dmi74X3HmQCn4oT9Q23/QHd5Be6gEYWHBvBBdqBcfp37yP/nQ1PsjIxko6cBaIypbfqE=@vger.kernel.org, AJvYcCWiz20+v6jRU1HWRooyPE/xlM/TyFivpTC8tbhlugsiQmKoZn3WJ+tuqqGOJhvIwI3/Vq9Z2zTx89Mt@vger.kernel.org
X-Received: by 2002:a05:6122:2708:b0:521:bb4e:c68d with SMTP id
 71dfb90a1353d-523493c558amr1710120e0c.0.1740652409909; Thu, 27 Feb 2025
 02:33:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com> <20250226152418.1132337-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250226152418.1132337-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 11:33:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfZSP3BDmKYTBDbKFe=KVR6TtscMQZov4+UDoMXgZwGQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrvdZJIWK8_MeL2zxoRDqPgCpV_45kQFeRZFTYprQXVZ0-CAVTqL8i0vNI
Message-ID: <CAMuHMdUfZSP3BDmKYTBDbKFe=KVR6TtscMQZov4+UDoMXgZwGQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/17] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, Rob Herring <robh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Feb 2025 at 16:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> found on the Renesas RZ/G2L SoC, with the following differences:
> - A different D-PHY
> - Additional registers for the MIPI CSI-2 link
> - Only two clocks
>
> Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> SoC.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml

> @@ -48,7 +58,8 @@ properties:
>    resets:
>      items:
>        - description: CRU_PRESETN reset terminal
> -      - description: CRU_CMN_RSTB reset terminal
> +      - description:
> +          CRU_CMN_RSTB reset terminal (all but RZ/V2H(P)) or D-PHY reset (RZ/V2H(P))

According to the flowcharts[1] in the RZ/G2L, RZ/V2L, and RZ/G2UL
documentation, CPG_RST_CRU.CRU_CMN_RSTB is the D-PHY reset on all of
them, so I think you can just write "D-PHY reset".
Or "D-PHY reset (CRU_CMN_RSTB or CRU_n_S_RESETN)"?

[1] Section 35. Camera Data Receiving Unit (CRU)
    35.3.1 Starting Reception for the MIPI CSI-2 Input
    35.3.2.2Stopping the D-PHY (MIPI CSI-2 Input)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

