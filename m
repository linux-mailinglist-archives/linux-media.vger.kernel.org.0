Return-Path: <linux-media+bounces-39485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F35B21AF1
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 04:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D53F7189C226
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 02:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C4C2882C9;
	Tue, 12 Aug 2025 02:47:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06D26AE4;
	Tue, 12 Aug 2025 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754966837; cv=none; b=ihAFnFnzcyY5dpG8ScHLSUXX1Kv0Rpf1snZLfgowaCR01xzG29gOIr0oc0CEeVOP7+KMEWnfJjfpsHzX0//LfZU6upm6zCEDM8Pk/eW8CM14Vnq7/Sq5wv2jOuo0OghI0YIAiYcMpGJxPwOZME9WWZXwloZGCjdN6Y+zGGmVGfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754966837; c=relaxed/simple;
	bh=+fHSSfrLfUCHm14m34euvNod7wbZwFjgDmGXRetUF70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpZhCtVrZOda/9MAQqWElKFJTSIy0dKxCNc2EXs9ICS8AngiGUQPSolxK/jWLZR26VMvCZSRNdJTYKGAFgYoePf49xjd7li/FEtZHfDNbQ4MSxpIVwdO+9k7dvkZLVvY8IW/dOjyAoOXHloCEUdux0OOLyoGFCcHwXGy55ahLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-af93150f7c2so760741466b.3;
        Mon, 11 Aug 2025 19:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754966834; x=1755571634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4WEnSDqzgAq88TBUpwwpgbS9VPz87hnkF4biNEHDlY=;
        b=dgAzkda3VL5Mbxab70onA/euKHgWjOxYw4jMqAE/Hz7iMW5/u8wJFv9ticnr8U0Pjg
         FGs77sIYTgPV65ZXgiGpshPW1j53i7/jYHbRq9T4sVlhp276cKaBQBJnR106g3h6CpYb
         LL7IQfNKWJjH3dsjxfjcyhYJKanDIUj+noKVZHRc4J1+r1jV2+LI0keX2TJyOmigTeZV
         QtmeBWddU/Ke5SI7l4M/DCOxkCe7Egb0iKxR7uaJU35R5yyxk8z5Onm87pukWbcn84EO
         854cNtwVD80UwIG6ZJMggnkztRJdHYvEvFfuROL1LX1/5RGhPInFyrNRvt2DALexv35D
         +itw==
X-Forwarded-Encrypted: i=1; AJvYcCWUF6PB8jBT2LIsF3Zdhe+Bqv8ps1TBdhezM9ABZ/uid22G05cuy0+prma2yhygR240udU7H3WqMcpKTbs=@vger.kernel.org, AJvYcCWaO+5SvCgl1OySBxaiaIrcEcbGChYKyCXhmupVBUan23fjwX3OPy4a/T21wabCDOAAcHvUhINeX+pfy5w+@vger.kernel.org, AJvYcCXJQ42S+V5Tfc2fRaHa4mAguv5W9m3YeWzGpRqefGuCyGkFiZmeaudWieDKjxPmgeIn7RmpfO0YOKwv@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbu51E7k+8pbFbBJtsNegEW4arylRJSvLcmTEcGqZx9uxA6Yt
	B6nfTdy1gAxkyECGDZTBZcRQ2ZVkW2XPFTmscseQZY/ZHUTpxsZH+/hDuu9ab9UT3pY=
X-Gm-Gg: ASbGncsHT9RwydCHOKS9uS9lPGdto2bnf4iPgXvybq94VtAf1U8R3txOIPRAPBA6h0k
	T5AZxHpP9ZBgVmzjrz+ZYRFcKEmK8COORyVP8sw3GIEoKmsrR5OYdGBSGrPk6w0bZpx7pK+TCpP
	gjPKrk0SX8G7IjhGFIpu6zO++Duy7Q+XHg3nGCU1S3AqgTEDZi3Qnidr+6kgYYzS93lkh+3INwZ
	//Lb/iYCBceHEgUWPR0TDYbe82TTYaBMNh4Uv7b4db7PBpZ/mUY7yiy1KbSbLUlkZG21aV1yCqx
	pfd0Q5H1SyhEKAoJUZeunAoxwjWNehVvsD5VpmvmA3d/Wgu4CMRsTQHyWrf0znUPhEk8kHwrlCH
	vvZG+V7SR3B2W6GHmIjXtvwncP0nlyjjw47trHuggKVCCHO7h/mPQb7sj1g==
X-Google-Smtp-Source: AGHT+IGNyBA4nuBq+DlfwJH2+ayGi3iMoILnbpXb7HaajMKTe5/Q5P47km3r2D5+H6UFFlPViRmHTg==
X-Received: by 2002:a17:907:94d0:b0:af9:10c7:59b6 with SMTP id a640c23a62f3a-afa1e17dae8mr122846266b.32.1754966833945;
        Mon, 11 Aug 2025 19:47:13 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm2128127066b.92.2025.08.11.19.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 19:47:13 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-af925cbd73aso953464066b.1;
        Mon, 11 Aug 2025 19:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFXNMiH3ayuxKzoMBEOlQkK5iGIwGOCR2M6n54pFnqhgQTIMcRXxmelnb3BYZmYANNM2es4NBWETiKN3c=@vger.kernel.org, AJvYcCWcuk7vP+J420I17TYLkE17H7uAvOxPP1JHN+J5Ka3Po+6LAoeLnvZu6JucapvoDnGLg6/uR0njt5bS@vger.kernel.org, AJvYcCWmBypBaP+ufcq2nM2Xa69u3yTN05owNPnQgDmhLbUWoGH6ORMZsZG7fNzUxMaN+UGkvdQX1wyxqgfXTtBv@vger.kernel.org
X-Received: by 2002:a17:907:d27:b0:af9:3116:e104 with SMTP id
 a640c23a62f3a-afa1dff94d9mr158864166b.3.1754966833478; Mon, 11 Aug 2025
 19:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka>
In-Reply-To: <20250811-successful-military-dragon-d72486@kuoka>
From: Will Whang <will@willwhang.com>
Date: Mon, 11 Aug 2025 19:47:03 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
X-Gm-Features: Ac12FXxQmXnuWdzEc4zTooah7CjD9hS5SJe3jLxjPY4eiFkazCpsluep9zY_bS0
Message-ID: <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,
Reply inline.
Thanks,
Will Whang

On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> > +description:
> > +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sony,imx585
> > +      - sony,imx585-mono
>
> I don't understand this second compatible. Is this different hardware?
> Can you point me to "mono" datasheet?
>
> Your description should explain this. Commit msg as well, instead of
> speaking about driver (in fact drop all driver related comments).
>
Mono version of this sensor is basically just removing the bayer
filter, so the sensor itself actually doesn't know if it is color or
mono and from my knowledge there are no registers programmed in the
factory that will show the variant and model number. (That is why when
the driver probing it only test blacklevel register because there are
no ID registers)
Originally in V1 patch I've made the switch between color and mono in
dtoverlay config but reviewer comments is to move it to compatible
string and not property.(https://lore.kernel.org/linux-media/20250703175121=
.GA17709@pendragon.ideasonboard.com/)

In this case, what would you recommend?

compatible:
  enum:
    - sony,imx585
    - sony,imx585-mono
  description: IMX585 has two variants, color and mono which the
driver supports both.

Something like this?


> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  assigned-clocks: true
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
>
> Drop all three.
>
> > +
> > +  clocks:
> > +    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24=
MHz
> > +    maxItems: 1
> > +
> > +  vana-supply:
> > +    description: Analog power supply (3.3V)
> > +
> > +  vddl-supply:
> > +    description: Interface power supply (1.8V)
> > +
> > +  vdig-supply:
> > +    description: Digital power supply (1.1V)
> > +
> > +  reset-gpios:
> > +    description: Sensor reset (XCLR) GPIO
> > +    maxItems: 1
> > +
> > +  sony,sync-mode:
> > +    description: |
> > +      Select the synchronisation mode of the sensor
> > +        0 =E2=80=93 internal sync, leader (default)
> > +        1 =E2=80=93 internal sync, follower
> > +        2 =E2=80=93 external sync
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    enum: [ 0, 1, 2 ]
>
> Previous comments not applied.
>
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            oneOf:
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +
> > +          link-frequencies: true
>
> Drop
Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml and
sony,283.yaml doesn't seem to drop this?
Just to double check if my understanding is correct, you want me to
remove the line link-frequencies: true?

>
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        imx585@1a {
>
> Nothing improved.
>
> You replied that you applied comment, but send the same.
>
>
> Best regards,
> Krzysztof
>

