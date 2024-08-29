Return-Path: <linux-media+bounces-17105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB630963E35
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E3C7B213B8
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30FD18A92C;
	Thu, 29 Aug 2024 08:17:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8115DBC1;
	Thu, 29 Aug 2024 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919476; cv=none; b=qux8YnaVZuWHp4qbOH9J/DoK9OAqAQkElTRLDEZ57iC+khwBLjQ0S7e8Ufx9eutmbH0QY8DO/IsqFLLahJq2/5hVPNyv5BQBBKJJq+dH7QtK8YY1qb6p5DBRNyCr5lZmcPTjxNOIK9WOLZofF2WfXM9svjB5pxK8nNzxQziJ3ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919476; c=relaxed/simple;
	bh=A8xmdVulZj6c73gN+sr5y2jvvN0uP5DbkN+RHkP/3GU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRZpXdT6FnCwgTqEUwTugW0v9siuCxvaxb+AudhhUaagTSE9KyrZI9sFPgH9Qyn3rhT0si7lIES8pW+s06shhi4nNK0FxjV0p2S2HtbQdYMRFnU7BY798Xrrk+kU9boyBp4pFY3LMveLKPQDEayfRtMn2J2YT9bcMK6Z/YKFZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e165825ebfdso411674276.0;
        Thu, 29 Aug 2024 01:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724919472; x=1725524272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1szbGPbm35HNkiswkRMva8T5XaR/6jCVSedCfdt0eY4=;
        b=LzhRikeHchW8DeoXCvG0JII8pqoE6+XYwPXdEYvEswpXu8ozcoq4+njtf+BRDtvUtR
         BWpbLgZA3L60qHUQzF0xc8yxUvvugJlqlY3GqnM4VuBymWR4uHWpa5nO6ieGvCS8iFX9
         eNYnhwCuLn+I2ChKF7Y7Kd98Gl+EOayCJyKAdqew3OgM1Q/WWUULTUnXKglvRzuTvX8U
         glHd+S6iXST5xt4b52obUOtTOD4G8WM+B2H+msvrb/ghBkkaS4iM4x4qqc2LQCoIZqoR
         qK8JHk+hw90VOp+fuO+US5v8uFygDA+13U3iEATqwEPDHFIHDKBo4z2R/ynQUvfIeWMs
         UYWA==
X-Forwarded-Encrypted: i=1; AJvYcCU69R3vLVbcmKHOe4Dz7EMSNTjNQX0qAk7mCbauMt4O9ae8FdAYLTmVzb9rRp09yiSMRStMBSZy2rSD@vger.kernel.org, AJvYcCVhB1rdpcBs0HCmlWsnCXtwrKbwYiCORFwNbKu8jnpjauxMbtpxp8P5sB/VjnVUaE3NGYku8BqIRDNYSNg9nFMPymc=@vger.kernel.org, AJvYcCVhBYFRulaLfaKj2EWtwsY7fePvmD/obqGSWHZTTQsN8AmCnPLV5Ji+HhCglm1oAyZYa3Sw/mRf7tumR5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9FmgFR9zDMCNAGvB5jLTyhupcvGWHme6ZV5KZur8f2Weob1Ro
	ZNj17enTUNK3wy/rfrUaD46lE//2zHDPgFiOJN03VByspEQFgYK1s8xfppXQ
X-Google-Smtp-Source: AGHT+IFGwa84BEnkBztHdk4pG/xG0IyauGLgd8qnfan0mbJFU5ycjMrphmmJ9xmsYPM1wjYYp/4/BQ==
X-Received: by 2002:a05:6902:13cf:b0:e11:83ac:a024 with SMTP id 3f1490d57ef6-e1a5ae0f434mr1915920276.39.1724919471679;
        Thu, 29 Aug 2024 01:17:51 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a62657b4asm156201276.1.2024.08.29.01.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 01:17:47 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ca1d6f549eso4794687b3.0;
        Thu, 29 Aug 2024 01:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVts7je5lLT3rGXObQGyQLyV1/UavT3x/jv/eao7B79Ffeq07A1+eJk8nmtKK9jacz/CYf7/ETGWN8T@vger.kernel.org, AJvYcCWnVLhrywAn1ZQfPt5VxsF4QJc3S+n7S5yA98dhiC9R7By9GjsNY59l/uWN16ckxGQZrmspa17Iud5g7kZyu9sj8tk=@vger.kernel.org, AJvYcCXb9v8PRtEyzdtsy6cjRzQ+h7sy6q19PaNIfeeBVA3UyBMuu6OQAO6MseIt8pHgvhXLTOhesPMRKCbZjhw=@vger.kernel.org
X-Received: by 2002:a05:690c:6283:b0:627:de70:f2f8 with SMTP id
 00721157ae682-6d276404ad3mr21559857b3.14.1724919467537; Thu, 29 Aug 2024
 01:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
 <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>
 <20240827081233.GE2636928@fsdn.se> <20240827213441.GA30398@pendragon.ideasonboard.com>
 <9e18bbf4-ae22-4d53-a998-67ad5807d72b@kernel.org> <20240828144644.GA3680498-robh@kernel.org>
In-Reply-To: <20240828144644.GA3680498-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 10:17:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDzHfd2d-WpNPPM9nVeqjE7aS8YhJusvxXwL-Y+z8A5w@mail.gmail.com>
Message-ID: <CAMuHMdUDzHfd2d-WpNPPM9nVeqjE7aS8YhJusvxXwL-Y+z8A5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family fallback
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 4:46=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Wed, Aug 28, 2024 at 07:36:35AM +0200, Krzysztof Kozlowski wrote:
> > On 27/08/2024 23:34, Laurent Pinchart wrote:
> > > On Tue, Aug 27, 2024 at 10:12:33AM +0200, Niklas S=C3=B6derlund wrote=
:
> > >> On 2024-08-27 08:31:22 +0200, Krzysztof Kozlowski wrote:
> > >>> On Mon, Aug 26, 2024 at 04:43:47PM +0200, Niklas S=C3=B6derlund wro=
te:
> > >>>> The ISP Channel Selector IP is the same for all current Gen4 devic=
es.
> > >>>> This was not known when adding support for V3U and V4H and a singl=
e SoC
> > >>>> specific compatible was used.
> > >>>>
> > >>>> Before adding more SoC specific bindings for V4M add a family comp=
atible
> > >>>> fallback for Gen4. That way the driver only needs to be updated on=
ce for
> > >>>> Gen4, and we still have the option to fix any problems in the driv=
er if
> > >>>> any testable differences between the SoCs are found.
> > >>>>
> > >>>> There are already DTS files using the V3U and V4H compatibles whic=
h
> > >>>> needs to be updated to not produce a warning for DTS checks. The d=
river
> > >>>> also needs to kept the compatible values to be backward compatible=
 , but
> > >>>> for new Gen4 SoCs such as V4M we can avoid this.
> > >>>>
> > >>>> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@rag=
natech.se>
> > >>>> ---
> > >>>> * Changes since v1
> > >>>> - New in v2.
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
> > >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.y=
aml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > >>>> index 33650a1ea034..730c86f2d7b1 100644
> > >>>> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > >>>> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > >>>> @@ -22,6 +22,7 @@ properties:
> > >>>>        - enum:
> > >>>>            - renesas,r8a779a0-isp # V3U
> > >>>>            - renesas,r8a779g0-isp # V4H
> > >>>> +      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
> > >>>
> > >>> Adding generic fallback post-factum is odd, does not feel reliable.
> > >>> Instead use specific compatibles as fallbacks.
> > >>
> > >> I agree, it feels a bit odd. But this was the road we hammered out a=
t
> > >> great pain for how to be able to move forward with this issue for th=
e
> > >> other IP block involved in video capture for R-Car Gen4, VIN [1]. Th=
is
> > >> just mirrors that long discussion decision for the R-Car CSISP.
> > >>
> > >> I would hate to have different solutions for the two.
> > >>
> > >> 1. [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
> > >>    https://lore.kernel.org/all/20240704161620.1425409-1-niklas.soder=
lund+renesas@ragnatech.se/
> > >
> > > The compatible fallback for VIN has been added following a request fr=
om
> > > Conor and Rob, so it would be nice if the three of you could agree to
> > > achieve consistency in the bindings :-)
> >
> > Don't twist our answers. You need fallback, but specific, not family.
> > There was a countless number of answers from Rob that specific
> > compatibles are preferred.
>
> Preferred, definitely. But preferred is not absolute. The Renesas
> bindings have consistently followed the above style for some time. For
> the most part that has worked out it seems (based on Geert's slides
> linked in one of the threads). If you want to continue that here, it's
> not something I care to argue about.
>
> However, I have to agree that adding the fallback after the fact is not
> ideal. Why design it where you have to carry renesas,r8a779g0-isp and
> renesas,rcar-gen4-isp in the driver forever when you could have 0 driver
> changes instead? The problem with genericish fallbacks is you have to
> know the future. Am I going to have a family of chips with the same
> block? It's much easier to just say "oh, this new chip is compatible
> with this old chip".

I agree it is not ideal, but it worked well for us.

R-Car Gen4 was a bit special, as its first member was named R-Car V3U,
and at that time it wasn't clear whether R-Car V3U was some sort
of one-off intermediate between Gen3 and Gen4, or the real thing.
In addition, the second Gen4 SoC (R-Car S4-8) is network-oriented,
and doesn't have any media support at all.  So we had to wait for
R-Car V4H and V4M to get a better picture of media commonalities.

Note that unlike on R-Car Gen2, R-Car Gen3 Video-In uses only
SoC-specific compatible values, as the VIN module on Gen3 had
SoC-specific routings, and a generic compatible value thus couldn't
work.  Hence for R-Car Gen4, we also started with only SoC-specific
compatible values, which turned out not needed (so far ;-) due to the
introduction of a new player in the pipeline (the ISP).

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

