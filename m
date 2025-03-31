Return-Path: <linux-media+bounces-29052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C853A765FD
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 838C13AC9D0
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1970B1E5B7E;
	Mon, 31 Mar 2025 12:29:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3291B1E570D;
	Mon, 31 Mar 2025 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424180; cv=none; b=MIEgJtKS5cIZeX7FKRS+vSlO2yFzKI0oy5WCuFVVEFuo1hswKGcbkCqBcVh9nnKSvwUwW/mUnytuRfWY8tE2rv1WWDF6aCjYhi0JMshcLhKbtt1j72XQ25WPOwRs5h68+6RvYamgE56Fh+oIKceCeRIgx/0LjMFm6K9LBT6HLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424180; c=relaxed/simple;
	bh=TY1jhOTEr3tWljFOOoITiNLFQXkN4A20pVuJGU9HBQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axEXRsp7r3vh7ZtrKNOVMi1RO6+CtD/gjTvWCtSAcy6CCmFWlwMWrIkB5SRi450Yemg1X8Lw9R27CpD1oKEh1omGKOUV05uM42BAXKmhuEm2bSWSFCu781VjqNznyBSdIkboPI1Ur3eT5gJrlc73xrBOkoStaD/ASdEN77DYDwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5259331b31eso2103140e0c.0;
        Mon, 31 Mar 2025 05:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743424176; x=1744028976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/hvjEUFixlRsZXguCUr03tOmwYEQ41nqruFxXBAttY=;
        b=SZ7FcrN18TFt4s68EToZkMy32VogA5TuNBMuyBj0Yw64DytTf9xg7n9lT1SMxHa5YY
         U+ePtx2ykWKtbR2DlIJGVd/hK9HZQkorx2TLX3PxBcUXHdvCZ6uU0ht5kQcO39TePlmH
         f2JKKIl0193ydETOg5jhDlt2EZEeXs/XcTGgGY9y27JGbU7eTBq2ab14B5KaYgpnVIdL
         bd9+6+Paz35YAkKj1S8+/WdhtqrIFh5e6DJM+1UVwHPmXZeRV4t6kusYDOnMnNQTvtUK
         bY0qJH4+MFfNpAIBQQwjLGPBBStLCuoAR1zhzVaH96Dm/rmpenzG/s487m+MEZcq5yiU
         tSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6XH6AEpjhylbxkSyGfCPdXCNmvw3eUnzBbWCoHo+xfS6Tsw3yVIIOyjZHHmVvAQhNrh56vbw59BP2@vger.kernel.org, AJvYcCUtO6ntkRf6JHvMxgaRVA526ZFLMgIDiS2I4NWaUOp9n7QnB4yAo3e7B4sbX4+LVclpk+apc0EBvLI/GGz+Hbk1eoA=@vger.kernel.org, AJvYcCVFiNaEX7Fsd1JyJDA0LNjitta3UQNd3jN09oymoai6+3sT0cCGkId2ntoIs5PfjSjxtheHd0Kj1pkZuRIj@vger.kernel.org, AJvYcCVGlhsH1/1qMYHLsDo+bXRs/PWNksojWeME4I3lXoqH+cIZF0d/wff7MIDxVwyUpQ8LHTOwm1poNZrkP1I=@vger.kernel.org, AJvYcCW85uJGmu1KyuZq7X9InV0RYZ3EQct54LeyGct/VZCIMR/IMYyGriKw1zjYsRyD46dj3ptCDQMtv/UW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/WFhF73GXwSAZwAfLssSqxhFtkA8iKMJ+SPJG0DYNCfiDneZ
	AubXcHsg0jcv+Xwf/UEyPRluVghg1Y7cc6RyFm6seS4ZIc0Bi6v+EKghV01Q
X-Gm-Gg: ASbGnct2XTKrQbFrEm38kJvVekhoDj1J3fqMyEx3L8YMTVK6QNETeq0MrrJB/kyiWze
	k7mxf/F3/jqoL0hylfAEMWv/TeE/E0JIBN+mEIp5lWKEn4SVfWS/sZUXyU0jXy/bqa964962qCj
	IjNjQh5rDzhUrP1rw8jMY68/kNrsvO7kA0lAD91UeBOCZJVw9wsXimY6fv0AhkA/ZLgLVifVA7n
	Gj+/unSBwC6Rj0atAOKEkheTwPJL42Q/FEd+d3R/iGgGj1ThAyMuEfOuphym/hd0pbMwQl8V4qN
	Fw/f8xX5IhHwsuxUaOm4g5VMSS47XqaAG5PAV1JaGFzWpz1Vjzrgvaxt3NV/Qm1D97RzFpSCBIL
	T3ikh3y+GbXDxDWP5Dw==
X-Google-Smtp-Source: AGHT+IGV9qrruQC8eD3r1v1TatdV7QAigdH5XkauM7J3ViCCNwHT2qsO4mEs8+7hu5HqXEL8XucMAg==
X-Received: by 2002:a05:6122:2188:b0:520:64ea:c479 with SMTP id 71dfb90a1353d-5261d4adb01mr3822544e0c.10.1743424175976;
        Mon, 31 Mar 2025 05:29:35 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e840eafsm1510772e0c.24.2025.03.31.05.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:29:35 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86feb848764so1930859241.0;
        Mon, 31 Mar 2025 05:29:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUh3LlE3Z/eqgMEUJDXo9HBNtevNXgB+sAKxhXKpAgWp6gdbck85r+k9TyiDn8QqS3pJmw7N6QWMIFzZrAX@vger.kernel.org, AJvYcCUvy42TWp4Gd7XZoTPQb0K1ADvuqGTBq+4rqC9AKY2AnHqUaCnxiZfVIt/P4FcZr0QAKxQ0nck1UvRzL0neMdtNC9I=@vger.kernel.org, AJvYcCVHDl/mR3OT7KZU5XIAz4FGDlTNctnOVHTOCj2VwYlvxwhO5tJkKgVFiljI6rmb+n1nmnC1NOH0mUhj@vger.kernel.org, AJvYcCVRZjaXOlS0YmZlqsD0gP/f7Mo2gxZi6EMWfWTw482j1RAtRVwPJh0Y10EMHSYKdKrWMpUV/kxZIVDu@vger.kernel.org, AJvYcCVbGxv2MfGE6ZQ56ApexcqguOaWQiJGg197pNzvS8M5IUawwZkUBZbIhCoIGWylLvkFTcUB33pL1wmjIFU=@vger.kernel.org
X-Received: by 2002:a05:6102:291e:b0:4c4:f128:3abb with SMTP id
 ada2fe7eead31-4c6d399e628mr4308764137.25.1743424174473; Mon, 31 Mar 2025
 05:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250330210717.46080-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250330210717.46080-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:29:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUO+mh79ExahTiW-hG26QfxrBfBFRipO_B6QWXvP-+wHg@mail.gmail.com>
X-Gm-Features: AQ5f1Jp1eHcZ8sWmnLzl63q9yjCxoAPQRs9IgU0nL-PSWGK0iw87Vz5cicheX0E
Message-ID: <CAMuHMdUO+mh79ExahTiW-hG26QfxrBfBFRipO_B6QWXvP-+wHg@mail.gmail.com>
Subject: Re: [PATCH 13/17] drm: renesas: rz-du: mipi_dsi: Add feature flag for
 16BPP support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Sun, 30 Mar 2025 at 23:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce the `RZ_MIPI_DSI_16BPP` feature flag in `rzg2l_mipi_dsi_hw_info`
> to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
> 16BPP, whereas this feature is missing on the RZ/G2L SoC.
>
> Update the `mipi_dsi_host_attach()` function to check this flag before
> allowing 16BPP formats. If the SoC does not support 16BPP, return an error
> to prevent incorrect format selection.
>
> This change enables finer-grained format support control for different
> SoC variants.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -30,6 +30,8 @@
>
>  struct rzg2l_mipi_dsi;
>
> +#define RZ_MIPI_DSI_16BPP      BIT(0)
> +
>  struct rzg2l_mipi_dsi_hw_info {
>         int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
>         void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> @@ -38,6 +40,7 @@ struct rzg2l_mipi_dsi_hw_info {
>         unsigned long max_dclk;
>         unsigned long min_dclk;
>         bool has_dphy_rstc;
> +       u8 features;

Please settle on a single solution for all features: either use a
boolean flag to indicate 16bpp, or a feature bit to indicate the need
for the DPHY reset signal.

>  };
>
>  struct rzg2l_mipi_dsi {

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

