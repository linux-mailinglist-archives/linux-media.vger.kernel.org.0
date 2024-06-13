Return-Path: <linux-media+bounces-13210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F8907CB5
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 21:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE9F0280F00
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 19:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A3614BF91;
	Thu, 13 Jun 2024 19:35:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D034D12C7E3;
	Thu, 13 Jun 2024 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718307335; cv=none; b=NeU6jLS5ZtQiQzLsKZ4U0/bFqkkryE+lGjkG70jot68qvbzBF/V1koRK+sFCa0lwqBA17l7eF+u8t7bYfG2BPWFN5EBuuF2fXL7Mqk9jnTBcJd1tTCOuiKwNpfOyqM779fx7CJLKeXDuCyqCdr9mE4aRVgJQ/Vv49el2py1R9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718307335; c=relaxed/simple;
	bh=s5KKQ0WNyT8RnqJyo/yU0Fv2P20o+Qh11bQpcaR2S40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExK5cWSByhn3dRcxl7Fz7bvE8ngIfQxeHsLwdzkUkBNXSgAsLR2TfLQRVv/NDwQJXBsdkwV2In57Pi6fpHIUbzA6568cDC0TqlUZ+VnWM6Re3QsYfi7XsYWHVh6+cNgL8DHBkDtUOE+rKE+ZIQA2BBthS8QWbNSIwVBiBQ9vxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-631443f1a04so8053647b3.0;
        Thu, 13 Jun 2024 12:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718307327; x=1718912127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQG5ooT0PXUjGHQYatw2DQ/Unvuxh0lOAK6d2aZOYtA=;
        b=dzBcZS6VrtnY1FNPsbeCp8IJsArriBx5TFISKUyd1tEvgUZ4nAflbZSyvBSHXKAe0W
         iW5akIPWL2G/GL7UC7ivrBfJ16twxgFolK72eiqCbN3qWTwHrGM/Jl4+1FvR5HqQeq3D
         43dE8BRfVEPOcVpLvacwIp1ubQR5L4Fy/1ksQlxdZx9y7SqCglwTCNIzyC5lQmNbSfvM
         ETpoKL/R9e3VWoXGQb5XMUVMpsTHmQiBFaC0+IYshaU4+Bbos4cjlecQ4FGTAo5X7Ye9
         cWVKu0BSTNwLn3r6Q0hy/nHoZUz8id69DnJqwtKHOt51xEjK/voAs9Xu9W1Wna9NpgDy
         wZjA==
X-Forwarded-Encrypted: i=1; AJvYcCVdn0AxSBNCRRpYl8zugU3Wnn+XKBTwo4WWOGhwAJ6WOV4/RPVdGkWGHjFN0DzcuMQbJYHKO8n7uw/cgGEkksSHJuciGtKPJffYbPPMzzRpHJU/nTGbI9Wld3Et/a3WNUAWdrkpDC5U4KUmyAzid2sd3n+nte8dCUX8t5296E7fZZSjpieUwjfh7Ro=
X-Gm-Message-State: AOJu0Yxz0MH1kQWfC10ykaWGzbd2b5FID+/M5/H2xwFiZvRLX5rEEAhi
	4PXZRmSsKkDshv/9HEGz6uesUjl8tHSgZTji/+eTfdNsFoZSFGYAlHg69MtN
X-Google-Smtp-Source: AGHT+IEj2IQ15T0RtLrNpkm7Kg831aV9UJTYXbySLiXylTr/zld1XGb77gJz4KEtSJsEF/e315UjlQ==
X-Received: by 2002:a81:dc08:0:b0:62f:8513:ba7d with SMTP id 00721157ae682-632064dce1emr4680347b3.22.1718307327392;
        Thu, 13 Jun 2024 12:35:27 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631183d7cc4sm2646987b3.10.2024.06.13.12.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 12:35:26 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-631443f1a04so8053307b3.0;
        Thu, 13 Jun 2024 12:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhQDq944CyeBxubI+bidMm4MhcxvLXdMzM7ZPas/+mxOHYeN5V3+IR/1zYVh5dEuP765SQO2IrBieu+fPu7LwHj8yVoLvh0hry66kMkRyujDXfMrxHDuX6mzG4Nr3srXhC40Futs5uNotl96v3UKdXYmDixjN0JQJ2H1w5WYU5Dk2BoZ3j2HlVJcw=
X-Received: by 2002:a81:ae15:0:b0:630:163b:46f7 with SMTP id
 00721157ae682-630bc5fc133mr20529697b3.6.1718307326451; Thu, 13 Jun 2024
 12:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
 <20240610-screen-wolverine-78370c66d40f@spud> <20240610165935.GA382677@ragnatech.se>
 <20240610-yoga-antler-e6447592de16@spud> <20240611110617.GD382677@ragnatech.se>
 <20240613165111.GA2005299-robh@kernel.org>
In-Reply-To: <20240613165111.GA2005299-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jun 2024 21:35:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQr0pzhL6Tq=R_TTUSu5wDZO-sWQHkuLg4C=xv9TyoWQ@mail.gmail.com>
Message-ID: <CAMuHMdUQr0pzhL6Tq=R_TTUSu5wDZO-sWQHkuLg4C=xv9TyoWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for V4M
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob, Conor,

On Thu, Jun 13, 2024 at 6:51=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Tue, Jun 11, 2024 at 01:06:17PM +0200, Niklas S=C3=B6derlund wrote:
> > On 2024-06-10 22:32:29 +0100, Conor Dooley wrote:
> > > On Mon, Jun 10, 2024 at 06:59:35PM +0200, Niklas S=C3=B6derlund wrote=
:
> > > > On 2024-06-10 17:03:49 +0100, Conor Dooley wrote:
> > > > > On Mon, Jun 10, 2024 at 01:31:23PM +0200, Niklas S=C3=B6derlund w=
rote:
> > > > > > Document support for the VIN module in the Renesas V4M (r8a779h=
0) SoC.
> > > > > >
> > > > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@=
ragnatech.se>
> > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vi=
n.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > index 5539d0f8e74d..168cb02f8abe 100644
> > > > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > @@ -54,6 +54,7 @@ properties:
> > > > > >                - renesas,vin-r8a77995 # R-Car D3
> > > > > >                - renesas,vin-r8a779a0 # R-Car V3U
> > > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > > >
> > > > > Your driver patch suggests that this is compatible with the g var=
iant.
> > > >
> > > > Currently it is. But that not always be true, I tried to outline th=
is in
> > > > to cover letter.
> > >
> > > To be honest, I don't usually read cover letters when reviewing bindi=
ngs.
> > > Information about why things are/are not compatible should be in a
> > > commit itself.
> > >
> > > >     The V4M capture pipeline is similar to the other Gen4 SoC suppo=
rted
> > > >     upstream already V4H. Currently all futures supported for VIN o=
n V4M are
> > > >     also supported by V4H and the driver code can be shared. But as=
 done for
> > > >     other R-Car IP bindings a new dedicated binding for V4M is crea=
ted.
> > > >     This have proved prudent in the past where quirks are found eve=
n within
> > > >     the same generation as more advance use-cases are enabled.
> > >
> > > I don't understand how this precludes using the g variant as a fallba=
ck
> > > compatible. I'm not suggesting that you don't add a specific one for =
the
> > > h variant.
> >
> > The bindings have been around for a while and currently there are 25 So=
C
> > specific compatibles, one for each SoC supported. Each compatible
> > consist of the SoC model number, not the VIN IP model/version number as
> > no such versioning schema exist.
> >
> > The datasheets are specific for each SoC and there are differences
> > between almost every SoC. There are of course lots of similarities
> > between the SoCs and the similarities are cluster around the 3
> > generations (Gen{2,3,4}) supported.
> >
> > Using the g variant as fallback in DTS for h variant even if we also ad=
d
> > a specific one for h is confusing. As g and h are two different SoC.
>
> Why? That is the very definition of how "compatible" is supposed to
> work.
>
> > The g variant is r8a779g0 which is the SoC name/number for V4H.
> > The h variant is r8a779h0 which is the SoC name/number for V4M.
> >
> > I think the core of the problem is that there are no versioning schema
> > for the individual IP blocks used on each SoC. For better or worse the
> > bindings for lots of Renesas IPs are centred around SoC name/number and
> > not the individual IP implementations.
>
> We've tried IP version based compatibles before. It doesn't work. Guess
> what, the IP version changes with nearly every SoC. Chip designers have
> no discipline.

The R-Car V4M capture pipeline is similar to e.g. the R-Car V4H capture
pipeline. But it is not identical, hence the different compatible values.
AFAIU, for the current feature-set, the driver does not need to handle
the differences.  But that may change later...

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

