Return-Path: <linux-media+bounces-39714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50204B23FAB
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5FA189C384
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 04:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29D6288CB5;
	Wed, 13 Aug 2025 04:31:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D423D7F7;
	Wed, 13 Aug 2025 04:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755059474; cv=none; b=gcv1TyCPMfid4zZIMC968mgSAUJtQ4Ixz48kh6vfe/U1qrw89WkT22MHnDHyRkPJa5IfKd9jLFDVxnltOlXl85j7CaPSwuWSLeFY2Lwv1si345u3kFCgWYktipmFbyqKw/yf2bzf+tPEWnAmcAzxyFgBw6O7mbQK9gk55lAI4U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755059474; c=relaxed/simple;
	bh=1+lPN/7RaXvAgaTP1wg5cSNxAX1xzdUfHWFU4t8MroE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXH9j37xGezABqWN5oXSKJlBz4z/wQY3UkYvbL1/QZhn0Oa1di2MyteSWZLNqIfNTon0OCDMbrk3qIWAXmlFLGryTPF3pTR70uMZP3wXG/bkJ1VvVQ2W+lurG7CiQB9y2ZMS8I/6XJ6ytWIkFp0XAXOGn+Hhn5BG0l3Jeiy/Lbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af91a6b7a06so1037912366b.2;
        Tue, 12 Aug 2025 21:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755059470; x=1755664270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEitumvRdECaQFnfUf7n8uN2sOMlQVkaq/vshRF+hlY=;
        b=WP0CXxOk6c0kfhTS7AZr/K1vK7hNd6t0bzgtzO4J3MOxEcpcw72rfchQar2XSZWNar
         R2gdcbPx6u0ElwVVO91/IJLmHQiSvqyVhK4W4yHErtOezwaNoSbQ3lBsqp+zuFKdINtL
         5KsEgFTIdAhszZvaV6BbJYVm23eAsa8AEf5jB/EvrP9qkrml1wXo3SsSgrV3skMJ5uYj
         m/+k6Q9TRzdZB8LYBT9znvg3IEcEa8bGvEfvD8hruQx+Obpkij0W1azyP5G9jUA1Jfp1
         oKg5hksrtCAnxy+KgIwNDg+acFvgMRmbwRgC6QFt9wVPd0ZmcfSUGylBrTszfzRoDrVy
         3KKw==
X-Forwarded-Encrypted: i=1; AJvYcCUnOZWI9qoHFLnm9WXWkI+dqfL23KOGzaRNaLEAUl42DYvGPnUVBA61RjHdwPqL+GVo+/aLWqnJSFIN5nFt@vger.kernel.org, AJvYcCUwHTn477wy9eF1JOyWoSGI51pM969j6JmEMnOan53HtG/h9Iv63joen90TK6B7IVJiP+fw36mZfsU0@vger.kernel.org, AJvYcCVFDROMuHgD0GJR02w0o37GtsNFX5vTe4PjfMomGFrmYgfxqzBP7jTXQ0ltBtv8PQv7JPmTd1Jsf8GYeXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxioYNkFPfwisk0ttTTg5zatEL4fxlhbLewseevlZjsevqT8e9y
	HPv7/bdutAUy3h7g9MHBkfMgJVTomcsa7DrbA8R+m8NLUVy5gnmjb3g5xHmWSaASxDk=
X-Gm-Gg: ASbGncsJ5WEdlRK4DCQYx+sFHCFcuo1jLnd61auRwixig/bn2QbGHVuDO2+rNKWpIzA
	2MISfxElf3asR8zigBZZ6YzbHLs2V9aPzOr8wWxfYQ0dmwlzMGYAL89SFCOSlxkQ2CG+dkGEGlG
	GdQBgajamFJNEE8TEoKkjtUUEgURpDkutHn+zuCBLIY2ce0lLehgTHDEPkS9XoXCN4nhmOQDrGR
	KOrgnE+yesl2mTUrm3MSsJfoRruiltsSpehUIbtUEvjAyT7nBVozOZdH4AZY4MPTIw7AaNRp0WF
	S+ry4E+aNbCYzAz34bEKtBJZSKA+Wd6Vo266WDhXRfIlKyVtvfHuWTfYYR08Af3mwe3YTVirPyi
	6pTVdLWv/o3x1fty/LTeGAxIUJaYOLwXCdSd28ErGKaVDLwcp/nbAj1ae5w==
X-Google-Smtp-Source: AGHT+IEpWm9bIegfdk88A9QXgS/lu6pGEs+VhpYdstqTyKTGj5UlzN0p7iKHeIKgnWxdl24fecfQTw==
X-Received: by 2002:a17:907:d90:b0:af9:6e4a:3b2c with SMTP id a640c23a62f3a-afca4e3f7demr160313566b.43.1755059469632;
        Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0761f2sm2334474766b.11.2025.08.12.21.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6152faff57eso9667120a12.1;
        Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUL/Y+uvGgOsLhYz+AK/h9UXMiSv2JX7ik9imGjnxMMhEKMpUCCTW3d48sWpp6f7JuFVNjDIDuC8Kx9P+cE@vger.kernel.org, AJvYcCWDF6g2t3R9VVVDZsd/gzTPQ5InosQCJEurp6J2TSVZQENPgnzJYRuibmE7/5AKaW3ylzSwRdRLDYFE7Ec=@vger.kernel.org, AJvYcCWXiqebk7lCizvLhgzwCLCJAENN5rDY3q6W3Q7tWSBASNTVakBDTiBOzVD6Fq2hZAQXZmTD040rUvUl@vger.kernel.org
X-Received: by 2002:a05:6402:5251:b0:615:539b:7acf with SMTP id
 4fb4d7f45d1cf-6186b75b54cmr834464a12.2.1755059469148; Tue, 12 Aug 2025
 21:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka> <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org> <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
 <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org> <20250812095543.GJ30054@pendragon.ideasonboard.com>
In-Reply-To: <20250812095543.GJ30054@pendragon.ideasonboard.com>
From: Will Whang <will@willwhang.com>
Date: Tue, 12 Aug 2025 21:30:58 -0700
X-Gmail-Original-Message-ID: <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com>
X-Gm-Features: Ac12FXw_0xiUCO5_AdWCiXWdSKd3XS6pJsuGK-9Sx_SEJjxOfia3w-Vp2ADn6es
Message-ID: <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 2:56=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
> > On 12/08/2025 08:31, Will Whang wrote:
> > > On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > >> On 12/08/2025 04:47, Will Whang wrote:
> > >>> On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > >>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> > >>>>> +description:
> > >>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> > >>>>> +
> > >>>>> +properties:
> > >>>>> +  compatible:
> > >>>>> +    enum:
> > >>>>> +      - sony,imx585
> > >>>>> +      - sony,imx585-mono
> > >>>>
> > >>>> I don't understand this second compatible. Is this different hardw=
are?
> > >>>> Can you point me to "mono" datasheet?
> > >>>>
> > >>>> Your description should explain this. Commit msg as well, instead =
of
> > >>>> speaking about driver (in fact drop all driver related comments).
> > >>>>
> > >>> Mono version of this sensor is basically just removing the bayer
> > >>> filter, so the sensor itself actually doesn't know if it is color o=
r
> > >>> mono and from my knowledge there are no registers programmed in the
> > >>> factory that will show the variant and model number. (That is why w=
hen
> > >>> the driver probing it only test blacklevel register because there a=
re
> > >>> no ID registers)
> > >>> Originally in V1 patch I've made the switch between color and mono =
in
> > >>> dtoverlay config but reviewer comments is to move it to compatible
> > >>> string and not property.(https://lore.kernel.org/linux-media/202507=
03175121.GA17709@pendragon.ideasonboard.com/)
> > >>
> > >> You only partially answer and judging by mentioning driver below:
> > >>
> > >>> In this case, what would you recommend?
> > >>>
> > >>> compatible:
> > >>>   enum:
> > >>>     - sony,imx585
> > >>>     - sony,imx585-mono
> > >>>   description: IMX585 has two variants, color and mono which the
> > >>> driver supports both.
> > >>
> > >> ... I still have doubts that you really understand what I am asking.=
 Is
> > >> this one device or two different devices?
> > >
> > > One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ=
1
> > > (Color). Silicon-wise the difference is just with or without bayer
> > > filter.
> >
> > Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
> > explanation either in comment or description about difference in RGB
> > mosaic filter.
>
> Works for me. We could possibly omit the "j1" suffix too.
>
My thinking is that imx585 and imx585-mono are easier to comprehend
than IMX585-AAM and IMX585-AAQ.
Because in dtoverlay for the users/me they will have to know what is
the exact name instead of easy to remember name.

dtoverlay=3Dimx585-aam
is not as nice as
dtoverlay=3Dimx585-mono

which is what it does, a mono variant of the sensor.

I really don't understand the standard for compatible string naming
here, is there something I missed? Is it required to use the full name
of the sensor parts number as a compatible string?

> --
> Regards,
>
> Laurent Pinchart

