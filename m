Return-Path: <linux-media+bounces-14506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CC91F087
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB5D21C21091
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DE3148314;
	Tue,  2 Jul 2024 07:52:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B01B7BAE5;
	Tue,  2 Jul 2024 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719906746; cv=none; b=CWA3L4NtImruJqLnMEOWQs68XTyD8Rvqwk84YSLMCRvXvUfMQet/RrTAHk7g1IJk/eGj0SD4v5cj2n5dwti0VGDgDMeEL6+urMeXur5avGdpm8LfXADkoJ2nZO7hC/QobkSdFxIWrFi14T13j6gSc/sK7/3MtsW/4JPUOEwFQPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719906746; c=relaxed/simple;
	bh=OqzqMR+WzTj4/Lgodib+o48Zyro29kSlJLasYJTvnso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rddb/pnkq0nrcU94dB9wGQVrRNt/m/5nZoJESUwKXY4IfLnPGqKijF2ip6mxCKO+4ZwmMlz0SUhaeaCNEBSlYVfYihyrsr2Fpo2h28aAYE3mgz8FqlN4XGpJgKtM1CtGEwKYs1BtmvLUgkJUnosX1KRPWbCYCgyV+dlyJFQ1Rjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e035ecb35ffso3680460276.2;
        Tue, 02 Jul 2024 00:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719906742; x=1720511542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3g/a2FSejo5CeNd4xTQe1UuYvToby9yj60ALat11c4=;
        b=tRZ1OfWg4l+CYoEUlCtsC5RutqDtfUCpKLrw+QF3MszwqXwUDw/xqCjtm7ko5225TE
         ow0xITjYRoQWhuBAcWZwsvU/hUrBGRJ3y7RgrHc6+6ItiohBPE72+w+cGRSmhHsrNX4P
         +iwzAircGgq1VQ0ySvMR4jAGI+0b95R3gV+fKepa3X52IrGOtJWX52BRhoOR7ws2SJq7
         wS6QrwHMkfIfglE0d5XX3DGEwTDO4kJV7L2iwU8ELDjAWYTEOsqs4baPQPmMgQqS26g4
         t8sSnIw2V8Oqg0Ma6jlfopl4Ux3v7UX+DB3Eplwyrgy6PuJeUFqAfhHMK9iWvvWZV6Zn
         SZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCUl5gpWzuBLsy4MO5+KQV8zH8cM59+QA25jiLW9mXftGsm4CVtBHlJiQRdzQ4EmrB8uFqw5BHVYxZDx3iOuyRLwEcuUAJ2+QluHTPHXdAr0M6g3nFC4GU+6BaI2RXoLnuU1nITv5j2C3EX4HYB0shDhcvhsojoBYAUdJoSTAQHrEXdOOi7xC38zFAE=
X-Gm-Message-State: AOJu0YwSXsdaZFtO7QVDXSFpp492vFn1xea495lifTgw8YQ69LvwbnEo
	uYVsMZP8zUsyxrY2PoMXZb2jq9acah9pLA0yM6USaRFkxNR5EJCAoV0HKKuQ
X-Google-Smtp-Source: AGHT+IGvemOEqvL+nHhFg2qJJBraaQrxCRy0juFhbW8oh7uWJoETy0QsZn51fzl8jKfCX2V91nA8DA==
X-Received: by 2002:a25:6b12:0:b0:e03:6402:1135 with SMTP id 3f1490d57ef6-e038c932319mr4131110276.50.1719906741891;
        Tue, 02 Jul 2024 00:52:21 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0353d592a2sm1535105276.5.2024.07.02.00.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 00:52:21 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-650866942aeso1129337b3.0;
        Tue, 02 Jul 2024 00:52:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkj0jqs7/WIq8seTA3ZaeMSickqaODSG1bnN+hlF2aXUoR8ZmPYf6M0fWzu37kqzJDmwmovNQx8qFbgyoemVMF36eEPZhdjmc+yAoi0y3JHqCgyLhcg7LOd/Ol38OYJY1eU+PQIu0l2iAdh7mpaATHOV8VzMXd9e5tSyvg7Z6spEksl6MomKusKjQ=
X-Received: by 2002:a05:690c:812:b0:64a:f237:e0b0 with SMTP id
 00721157ae682-64f55d7c8a3mr29635737b3.5.1719906740345; Tue, 02 Jul 2024
 00:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se> <20240624144108.1771189-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240624144108.1771189-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jul 2024 09:52:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrEf9KFKCawY_XPu0WuJwaE+Se21jx-d4X_Ef+f2S36Q@mail.gmail.com>
Message-ID: <CAMuHMdUrEf9KFKCawY_XPu0WuJwaE+Se21jx-d4X_Ef+f2S36Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: renesas,vin: Add Gen4 family fallback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, Jun 24, 2024 at 4:43=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The two Gen4 SoCs released (V4H and V4M) that have a video capture
> pipeline the VIN IP are very similar.
>
> The datasheet for the two SoCs have small nuances around the Pre-Clip
> registers ELPrC and EPPrC in three use-cases, interlaced images,
> embedded data and RAW8 input. On V4H the values written to the registers
> are based on odd numbers while on V4M they are even numbers, values are
> based on the input image size. No board that uses these SoCs which also
> have the external peripherals to test these nuances exists. Most likely
> this is an issue in the datasheet.
>
> Before adding bindings for V4M add a family compatible fallback for
> Gen4. That way the driver only needs to be updated once for Gen4, and we
> still have the option to fix any problems in the driver if any testable
> differences between the two SoCs is found.
>
> There are already DTS files using the renesas,vin-r8a779g0 compatible
> which needs to be updated to not produce a warning for DTS checks. And
> the driver will need to kept compatible with renesas,vin-r8a779g0, but
> for new Gen4 SoCs such as V4M we can avoid this.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v3
> - New in v4.

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -53,7 +53,10 @@ properties:
>                - renesas,vin-r8a77990 # R-Car E3
>                - renesas,vin-r8a77995 # R-Car D3
>                - renesas,vin-r8a779a0 # R-Car V3U

I think R-Car V3U should be moved below, too, as it's the first
member of the R-Car Gen4 family, despite the name.

> +      - items:
> +          - enum:
>                - renesas,vin-r8a779g0 # R-Car V4H
> +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4

If all differences in the pipeline can be devised from the topology
in DT:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>
>    reg:
>      maxItems: 1

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

