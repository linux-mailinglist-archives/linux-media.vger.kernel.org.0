Return-Path: <linux-media+bounces-29059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 568BEA76749
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DAD8188B92A
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D41213E60;
	Mon, 31 Mar 2025 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRhKUG1q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606EA212FB7;
	Mon, 31 Mar 2025 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429765; cv=none; b=JzVljX5vOi9BjIFds/rMQN4JSXzJKJjw3A8lxD2pMU2IzU6XjAuRAvkrFhR33oiydfC2oG4vSdicEyUaZRiVoAvHdmBPwLtY5O270VfGRoFDduaAq7UqU/CHsOWVhOEVbpfopat60CL7NyAPyqu04jW0LjBCjHicnuG2woDaczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429765; c=relaxed/simple;
	bh=whd/Svxmvbj7rA7O6S+iIb54/KqQ8e1rgCHT0rtZ8i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ryly8SOkKlil2w2pX5Gks0ycRWNpxASBhtq6OnJDpDoaL6wT4YCip6nlcjLrkTPbm9DXgZPVMIgHkJzBJ8XJD1gvILo6MOm7rEsP03cX48WqFY3FdhF5a/meaTNodRxgglhoK3bYclDQU+p0pow57572z6pRRLiGLPgQAINuNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRhKUG1q; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5262475372eso533348e0c.2;
        Mon, 31 Mar 2025 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743429763; x=1744034563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lETntPaflYFwrwUvTncaP8RyLf4Wye2mcICW7b/doA=;
        b=CRhKUG1qmIFCM3zydOE2o8WwVu8C/ONWviUj8ooX38E6Bpngd35vW95kljRl4beKYT
         j64JqZJ3tcW3ZQElaax13xM6bvcqzXVZrQ1sjNSpM5+Egq53crnPYpSFnNzDhGqPE0uJ
         20LwPm6CD+eMwdaojsYCzajmAol9QNRLZS10Vh/7IH500CiYFDVBfZUPbp6O4tZvuh4j
         1MPICHrhV8QgiP87kUawta5CWIOzpbBDAeRCokCgSZwECMOLtIAxLAxTaqvA3L6EGfmd
         J+q+x3vZZJc5EE0wIUsa90d91WyiVPnTqq4ktJALtbEfSJk3Ows+6gWmQsRXcsGY3jwe
         28cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429763; x=1744034563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lETntPaflYFwrwUvTncaP8RyLf4Wye2mcICW7b/doA=;
        b=EKvSxoT0xcaZqZtmm/pgWBgx+sS29HuYvIX/XN3XKRmf4ScRCsJFKGE9VU2YAwFA+f
         ami5jqaU1Rz7pFb99kYNvnnamlotZuTPDzr0l+BBu7rXk+fRLD+0f1qfEY1imeeoPzXk
         LJdm7Pg00xPrNIeJgw2hkQGvGiUyDmJrIAl0RHSgYueGxkTZTeiTZGRrkpB2e+u+W/Jc
         NoYbgRcjnPQVdwD3JYvImAckEinOSh7F5Nx4ReYK3sDBM3iXQXIMZjWRRJAGORrxfIQX
         Wo0UPv1YtCJEkIhwX0jZtT8ApAC6LOi1MAILdC2piiTShC275aYR+otRTYqqV+w9xkzl
         MAig==
X-Forwarded-Encrypted: i=1; AJvYcCU8wYhZ+jVPV2UQmoWegv+6b/3bwSUTSIyYWpRmSl7u6seEVmNpdZq5UlJPI9nlVeOvQN71evjDmb3eTmFf@vger.kernel.org, AJvYcCVYAmEE/ZYDBiSmbbjwYgS6nJMpmuXNtulyQRB7uTsZCDrnyVGB95tyaRzfVOEC3lxdLSRrQMK2wuIb@vger.kernel.org, AJvYcCW74NHUFPvx17Eo9OKMkUppe21MSMKrFycTnP/IkoeclVdyZ4FokqyHPJEIehJlJnPRJSg2nq2N6MuI1HA=@vger.kernel.org, AJvYcCWLN5pu3oYuSnebOoJRWQ76dZ5oLfwsUikDBuYoUnSGLipMuXlEnfJ82Db8JWGfIoB6RLvm/OYaYVSa@vger.kernel.org, AJvYcCXsLIQ2kql8r7SabLB3q6UIUKYdQ0L9r1pHlBTiU5NkKzWfstTH+NxH7Ts1AeDTwAGkRrDUYBTY0VDEGaPe4rH9Ojk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKSu07fy57K5uNxOUGCJdn3K3/ojMQcKBIJqFSfEFhoiU1YQbF
	XYGHORsrDC7XO76BvlMhEeP742G3jBvoHYFdBAkyIE567k2NbZwLxkJX7xqBrcanbRzDAn04nak
	3xM8BSDpmTSc5Y253Vuf63gkcS6w=
X-Gm-Gg: ASbGncs5yra38TCZOXjVv6ljnNkUTZrKoK7KjMpATWc9Ze9GGkp37quN+f0RDHL0LaG
	lcCSXzwQJTxwJx1CDXxj2mZ5rrRHEJTbzrvH/8Fjm5btxKaOxayJCJTxZfVPG5KxJ+OfKWoS1AH
	vzF+5vLqurLw/iLALjNzwn4juLbVI8XFqcIesBZNM0oXT7FiawyfnSTYormbw=
X-Google-Smtp-Source: AGHT+IFJA0XagyJKY+XH2Q/wP5pTEqfLMMTmMOabXhZtdfzmwQ2y2LT/1u6A/39ZZguGThzfOqEK+WfhriLs4v9hW2A=
X-Received: by 2002:a05:6122:2a4c:b0:520:5a87:66eb with SMTP id
 71dfb90a1353d-5261d366116mr5066095e0c.3.1743429763111; Mon, 31 Mar 2025
 07:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUO+mh79ExahTiW-hG26QfxrBfBFRipO_B6QWXvP-+wHg@mail.gmail.com>
In-Reply-To: <CAMuHMdUO+mh79ExahTiW-hG26QfxrBfBFRipO_B6QWXvP-+wHg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 15:02:16 +0100
X-Gm-Features: AQ5f1JoZkmNou5F8OyuDiCyoOrm4-guRY1b_zQlH7cjXGWsIxa-9FxDIWKZhpig
Message-ID: <CA+V-a8sdFYEM6DE_ku5-FBPa6xcDmhAq6FDXiovR0VAixZds0A@mail.gmail.com>
Subject: Re: [PATCH 13/17] drm: renesas: rz-du: mipi_dsi: Add feature flag for
 16BPP support
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Mar 31, 2025 at 1:29=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Sun, 30 Mar 2025 at 23:08, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce the `RZ_MIPI_DSI_16BPP` feature flag in `rzg2l_mipi_dsi_hw_in=
fo`
> > to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
> > 16BPP, whereas this feature is missing on the RZ/G2L SoC.
> >
> > Update the `mipi_dsi_host_attach()` function to check this flag before
> > allowing 16BPP formats. If the SoC does not support 16BPP, return an er=
ror
> > to prevent incorrect format selection.
> >
> > This change enables finer-grained format support control for different
> > SoC variants.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -30,6 +30,8 @@
> >
> >  struct rzg2l_mipi_dsi;
> >
> > +#define RZ_MIPI_DSI_16BPP      BIT(0)
> > +
> >  struct rzg2l_mipi_dsi_hw_info {
> >         int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long=
 hsfreq_mhz);
> >         void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> > @@ -38,6 +40,7 @@ struct rzg2l_mipi_dsi_hw_info {
> >         unsigned long max_dclk;
> >         unsigned long min_dclk;
> >         bool has_dphy_rstc;
> > +       u8 features;
>
> Please settle on a single solution for all features: either use a
> boolean flag to indicate 16bpp, or a feature bit to indicate the need
> for the DPHY reset signal.
>
Agreed, I will use the features flag for all.

Cheers,
Prabhakar

