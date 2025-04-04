Return-Path: <linux-media+bounces-29414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 307FEA7C0A0
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 17:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ADAA189DAF7
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB091F5850;
	Fri,  4 Apr 2025 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUc8WQ9s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1281F427D;
	Fri,  4 Apr 2025 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780866; cv=none; b=poE8vjgEGjyfhl3+1Dp0QpDhxYcDrSLOLGLv9sryqT5Kyzy5chevo7qchnuauVElLAi05tLzhyjNHzUj0szsgFoTlfGFHcJAiX0cB9qvOgWavuFtv1H1fFbMhJARkHjoHpQojqO+NhmROKvdhEmc/q0Rn8FPTumuiHxpus8W4RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780866; c=relaxed/simple;
	bh=NV23c45qwybc9Xll89xfd7CaxSceSF6PVMzijUt0RPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2t+vJjxKoBPTKpq/KfDtPFZKqn0XgiysFWapE+O1HKcJ5wiEHzfCkacTZf7qD8IbVmruzXYEf6yLbE183zGzdJodZwNuObNQTVaakBrh2UGnjcF/OjuQbECccoLv1QJ9nHg/yIpGy+fhisHoxf28U2lzI0zm1D17OP+KG8zc3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUc8WQ9s; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5241abb9761so978741e0c.1;
        Fri, 04 Apr 2025 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743780864; x=1744385664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+NmuFTrUmLDbYncW/g9n/YL+hb6L+9MTuP8llxtZWc=;
        b=lUc8WQ9sVhJS+8XR8/tUi5/evz27ou863zVY4V/DTh2sMKO3oDDZFFoXbQw4gkdxnt
         A1XJq0PVJlALHWjkiJ2UC7GYpS3fDiqTECav63tXLfg8X3PsjBswoxDRU6e3gMiH8yp4
         6upzJW7Co/jdQOrsne4Y2qFi8wMlO/iC8Hpq91upHJbHd0QD61lml7pTlmWloJsrcPyJ
         rlh295TmDotM9S/ELEKUsk3zAPCQZcdXrKfWdLIT5KgPWYBBK73Jc3KKfl9MDEbUCaKH
         kZDA7LJJoXZr7ljzCV875XgwFwnaMImPkqMI/4Id0D4WXm+wQ7qvhqQTfeMSPYbxY9kw
         pbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743780864; x=1744385664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+NmuFTrUmLDbYncW/g9n/YL+hb6L+9MTuP8llxtZWc=;
        b=oaComxsm3ZOYa7GR6hvg5bw+UvNeDPBV0XCZI1fM58xHKBoB2Bgy3ZPN4ocNuiQnW6
         JWWo93kgPLiZ+/BHUf4hWcOGmDTaush/eYYX4NIh6wFcQ7RO365etqCX+/nS75gj5+Bk
         tShT0AySjrgnbY8+q0ZL7npkjD6JyrYReZV5R000GhEsKrwa+iPgLpJmokclQTP6Zag9
         8jRZu4Bh+oVSTq9tFHAZJyH7AoI6XHgcLy0H5V6ROluBCJ0yf/pbf8WVEbGWKB83L4+Y
         bC/DVxyCtIr5lRQAUCHJlzNV8WFPn2PSIRv1Vjcj5TNcAil+I0x/fW5vCG2nLb3NgsNk
         J69g==
X-Forwarded-Encrypted: i=1; AJvYcCUmIjvKbzAA51qqrancPnC49ShPa9ypg5sY82zDXeYaE/dxqIOh53q1UaiDbGj/kDW2MBlp5Yl0RSd1@vger.kernel.org, AJvYcCUqOL/b/k2BqAOVMwBQrWASPhuPgrKjogw1qTn/2Z9VTXzY/X+V2IA2c1XyeqhXH2Eh+TgBT/59E1Sf8jcY@vger.kernel.org, AJvYcCW0/ncI+ZRH2A+zZVnkB8d8181ExxL08ITK/NrOFUT2+8LupSmF5GPcN+SpMM6aqJTjc1yz6GdxvP8d@vger.kernel.org, AJvYcCW1qeAkZX9z0d9oYLHGsGriHNqpqh8IyWqYafm9JSM/ogtDyHlnqdL/HPblc3tqgvrGKf8xZvb/F6ykebg=@vger.kernel.org, AJvYcCXEMI9YtbdZDAXQT/tEMjMLk2sTh8OCpRqzCS5cvOa8GTBGij29me+S2TFGESlWtlXFh6GvvFo3MsZiY9ZliJlcEtk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8cLsnrvC8PYSuIyoY3PNdaqmjiyH7gaKo6IsvpueWWSL4lSzH
	fnOYqDclRzlvJXQAE148B3Unzju0IDNOpkeBB3UZ6iS4/LkNhvyTxALTnA7QKJSQKiNK8n+ZZUy
	mcQWZCD3sp8EtddsQqH3XGf/1Zok=
X-Gm-Gg: ASbGnct9EwemT9uiGC8SQ2/ZOcif0Dhy7eT6bXgTyV7RHhbJszfqnCaZWw3/A4qKasC
	FWXDeztvvITkno1cVqGn9nSvnAqZPInI1a4zkN5fnnrATsHZUtF2ZJzb4Q9j4ugzdQjahti8LZo
	kQlSWVDYTWYz2tAVq3EG2TcYvTYWm9r6dtl1sZjsqqytZ+D/lezjugrjeV7MB8vx6XJF7g
X-Google-Smtp-Source: AGHT+IFeqBqPEc1fp5ZyqfbLTgIUGz0qzg+AQ6B0MuW9jh8JpKEs8+/8y5BBVclZGqon6NMK7qZD7gYVyPMB63icxus=
X-Received: by 2002:a05:6122:da7:b0:520:61ee:c814 with SMTP id
 71dfb90a1353d-52765c28c97mr1917972e0c.1.1743780863970; Fri, 04 Apr 2025
 08:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250331-unselfish-spiffy-cobra-a36c7f@krzk-bin>
In-Reply-To: <20250331-unselfish-spiffy-cobra-a36c7f@krzk-bin>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Apr 2025 16:33:58 +0100
X-Gm-Features: ATxdqUFvust2OaYqBoVIflJyaJCXaNLn9_iNCUx025do8GMxEHueuBJr5hhTMRw
Message-ID: <CA+V-a8v4zEDxcR1t8u4A6W6+Ux9ihhFuGbgTM1G00PP9rOSmhw@mail.gmail.com>
Subject: Re: [PATCH 06/17] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/V2H(P) SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
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

Hi Krzysztof,

Thank you for the review.

On Mon, Mar 31, 2025 at 9:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Mar 30, 2025 at 10:07:02PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that=
 of
> > the RZ/G2L SoC. While the LINK registers are the same for both SoCs, th=
e
> > D-PHY registers differ. Additionally, the number of resets for DSI on
> > RZ/V2H(P) is two compared to three on the RZ/G2L.
> >
> > To accommodate these differences, a SoC-specific
> > `renesas,r9a09g057-mipi-dsi` compatible string has been added for the
> > RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 117 +++++++++++++-----
> >  1 file changed, 87 insertions(+), 30 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,d=
si.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > index e08c24633926..501239f7adab 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > @@ -14,16 +14,16 @@ description: |
> >    RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, w=
ith
> >    up to four data lanes.
> >
> > -allOf:
> > -  - $ref: /schemas/display/dsi-controller.yaml#
> > -
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> > -          - renesas,r9a07g054-mipi-dsi # RZ/V2L
> > -      - const: renesas,rzg2l-mipi-dsi
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> > +              - renesas,r9a07g054-mipi-dsi # RZ/V2L
> > +          - const: renesas,rzg2l-mipi-dsi
> > +
> > +      - const: renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
>
> I guess this will grow, so just use enum here. Otherwise people keep
> adding const every time they add new model.
>
Agreed, I will add it as an enum here as RZ/V2N will follow this where
the IP blocks are identical.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
Cheers,
Prabhakar

