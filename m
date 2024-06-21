Return-Path: <linux-media+bounces-13892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB7911CB3
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E511C22221
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 07:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBB63C2F;
	Fri, 21 Jun 2024 07:21:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D43516A957;
	Fri, 21 Jun 2024 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718954500; cv=none; b=YMnaySG+5QqR6ZDgquBxb2oyHeMUxG5W+NoHrCVkDAtwe7D0Pck3oWG4OeGT3PADSTwaIWeW8hgEhyJeoSNK7GUIq0pC+DZClc5iRKZGFPdSzOTu3Nz931LhzNKbKrFvycW68shcUxwR7hk8f8B5IsGZm+mD+1HRG1q6KgaWgeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718954500; c=relaxed/simple;
	bh=7CMx5bxarm0V6bXOjOERHcGYnuBsH12q3jR5evZkhxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KO7Al8rR3PNzw/MsHCweoz3AdBLAW43XcXJElJiIVAiEnTrQoM4tjUfwQv/I1u0AJBV88GAwYACqHHJcQHH9eD6w3k19CdJW0p8qHwIUIcmhgN7gBxjgSjIjWmGlKLLpVutbKX+33chHb7PKWWtMVhPZuG5bNLukfoMCIHRn9w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dff02b8a956so1681587276.1;
        Fri, 21 Jun 2024 00:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718954497; x=1719559297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PACd0JpJmNYTIfca4Iea8deTmLaxbsTwqXeNwFLnksA=;
        b=BUlugN5+D0pEQA6Y5ZVSVFPE6SVHY3nVGlPcVWK1MWRNxnm9HTe6GCizmhpNJTYvPo
         tuHB6niaEX7hK9M+jrKRb/uUF5j+eRGb70n5ftlO7kP53Q7rFEDcjA8mmft+r6jgNVT4
         JIwJUfmxqqOchVXela9cm7kJAFFVFuoZR6sIb3/l9ILvmvbm3ILigFkJLWX8AzrlMJdb
         KPEXSBFsC1/kH6nqAaWXbOQW/hh5HOdWy8EX3h8mPHcpkv1/yQ8b5wE0KzIwV/0eQJu0
         eVisjZD5ZoaJSu8O6Huqiec/V8x1XPP+fPaZroPiG5qCuZVJfiFV6SytzgpG/oz+t184
         w+IA==
X-Forwarded-Encrypted: i=1; AJvYcCUilCdbrnqvPcgFpB/I2/Cbs34rnQJzRFC7TOWawljm9E00YBwi2bF2v2GkrC2rrgF1nC6AM5/fNyLUMYELsRg/QjDum5xI7wMbpBqHUMKExc0ZsX5AxJ5or3TR+OOUpuprzUak64gKqUe74EFg5xNsha9h3RVwVAVU17iXYK2IKXM30WiG1KYHz1o=
X-Gm-Message-State: AOJu0Yyt9PZZmNnC6WwJ1zzD+nKAMMXMcSYSgZcsQ57FKsnVEIEDohLY
	lnNI4zAvqYQoBfEXql2EYwqptQXUhrqwveOAmOgji/JFH8lWB2WTsmkMqYa9
X-Google-Smtp-Source: AGHT+IF/3VLqYTGe5uwZjivcFccUaABcRl++AVguPPabGq+UJsMB4gCnYw3V8atN7oq5BdK0F7EtVg==
X-Received: by 2002:a25:ae11:0:b0:e02:bc76:3407 with SMTP id 3f1490d57ef6-e02be16f25fmr8385764276.34.1718954496864;
        Fri, 21 Jun 2024 00:21:36 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e62656d0sm246821276.35.2024.06.21.00.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 00:21:36 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dff02b8a956so1681562276.1;
        Fri, 21 Jun 2024 00:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV9ASaKjGoQf/Dg7biLJuaSyO+vNwleswFSNyiOalbZFp+mOlDkeB4M8kdApCksEQn4jcupNL1D2RAXV2hXOAeyw21AStakA6e5h3WWaN9Ug19xTBxHWOH6pTmTRWW5ZF1esRYMl5yqDCEszb53qwU1bKttsCHY+p0+0jhd2+lnhTaDqX6U/awbvI=
X-Received: by 2002:a25:b181:0:b0:e02:79a0:8b62 with SMTP id
 3f1490d57ef6-e02be16c4e5mr7671226276.32.1718954496385; Fri, 21 Jun 2024
 00:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud> <20240619185607.GT382677@ragnatech.se>
 <20240619204321.GU382677@ragnatech.se> <20240620-gating-coherent-af984389b2d7@spud>
 <20240620172237.GA3623951@ragnatech.se>
In-Reply-To: <20240620172237.GA3623951@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jun 2024 09:21:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaWMiQ_wrmX14uwkeU1D_55ehmJD8+GZ4eydWfw4Mi-Q@mail.gmail.com>
Message-ID: <CAMuHMdUaWMiQ_wrmX14uwkeU1D_55ehmJD8+GZ4eydWfw4Mi-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: renesas,vin: Add binding for V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Conor Dooley <conor@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Jun 20, 2024 at 7:22=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-06-20 17:27:00 +0100, Conor Dooley wrote:
> > > +      - items:
> > > +          - enum:
> > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> > >
> > > If so I can see that working as I could still fix any issues that com=
e
> > > from differences between V4H and V4M if needed. If so do you think it
> > > best to add this in two different patches? One to add the
> > > renesas,rcar-gen4-vin fallback (which will also need DTS updates to f=
ix
> > > warnings from exciting users of V4H not listing the gen4 fallback) an=
d
> > > one to add V4M?
> >
> >
> > I would just do:
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b=
/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > index 5539d0f8e74d..22bbad42fc03 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > @@ -54,6 +54,9 @@ properties:
> >                - renesas,vin-r8a77995 # R-Car D3
> >                - renesas,vin-r8a779a0 # R-Car V3U
> >                - renesas,vin-r8a779g0 # R-Car V4H
> > +      - items:
> > +          - const: renesas,vin-r8a779h0 # R-Car V4L2
> > +          - const: renesas,vin-r8a779g0 # R-Car V4H
>
> @Geert: What do you think about this? This would be a first use-case for
> compatibles crossing SoC DTS files that I know of. I'm a bit uneasy
> going down this road.

Me too ;-)

> Would this not also effect the existing users of renesas,vin-r8a779g0
> which would now need something similar to what you propose below with a
> list of SoC compatibles and a fallback.
>
> >
> >    reg:
> >      maxItems: 1
> >
> > Which requires no driver or dts changes. That could become:
> >       - items:
> >           - enum:
> >               - renesas,vin-r8a779h0 # R-Car V4L2
> >               - renesas,vin-r8a779i0 # R-Car R4P17
> >           - const: renesas,vin-r8a779g0 # R-Car V4H
>
> FWIW, on Gen2 where fallback es where useful compared to Gen3 we did
> this with "renesas,rcar-gen2-vin".

We do know there are differences (albeit probably small) among the R-Car
Gen4 VIN implementations, so I am reluctant to add a family-specific
compatible value.  Typically we only use a family-specific compatible
value if the IP cores are known (or better, assumed ;-) to be identical.

And sometimes our assumptions turn out to be wrong...
See slides 25-33 (last two for the numbers) of my talk at ER2019
https://embedded-recipes.org/2019/talks/herd-your-socs-become-a-matchmaker/

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

