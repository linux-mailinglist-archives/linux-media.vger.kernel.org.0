Return-Path: <linux-media+bounces-12503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001E8FAC29
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 09:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A858A1F2211A
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F635140E5B;
	Tue,  4 Jun 2024 07:38:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FEA1EB30;
	Tue,  4 Jun 2024 07:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486699; cv=none; b=PdLjQpZkt5IfKOn8ykimFJX7BQqHFsu9KaZBDDj8cfYuQ+K8om0H3YbC0uQA6+jkHyFV0/WGJ2AwA6+m3iGptT7ziGR0uO97/EXB6LZXdfODa2bessINKA4UC8NW5Ky787T2KF28NGxNGgEZ17aissAsp7Y/okv183uo60rVBS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486699; c=relaxed/simple;
	bh=qL7MUGPlglr+vmdYx9v7PTkeIwv/mu+fsovHWLo01Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIO7Jo+NNDTEB/jQdtLCWkNZGaQmx8nMTQ+is2KpJTg39ock1jLmkLSON8eJQrcmRfegxK0Yw1CBOZtBy1st/rKHuBl1gMbX2XWm8HItgiCXXyE47LXp/5dpj+omqdVuP0JDP5mB9Tr9SFjtBD6PqJootAf+8ewK1ukPXS2Gk+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62027fcf9b1so41817887b3.0;
        Tue, 04 Jun 2024 00:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717486696; x=1718091496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncFzTtEwlKg1IZ15srN8tx0Uc4LrcAfyFOw7B3tI97Q=;
        b=C+dVBQxfl0nZlUPZHbjbBO9Ma4yA+F5tCgZymbJORdaeW8KBF2L+Tdg8LN8+MOoNiD
         lZ7YNuf+DaHNfeqTt2mi6U0dDLbgPdHsG3hZLDO8VtdURaVoqJBDxY5j8vwi0MFtG68j
         lK3jDHfbfWRqBWWcqnAkq/L6ILVcHmrCcrosJyRAg1Y1LLes2coOWDqSdVA901aNXvXO
         b8sMe/bRqoIdo+YXuOUo9NZJ9x+pMeC96wFqGrS+ZrPcox1I6hkok0JPizRjvHYam8aK
         SoPr9JeGRbPyI32t9gvb+gu5Eradr1ppKJll/rP6iDl/i2o08fB7Z1P2amc3rfy12F5b
         rlJw==
X-Forwarded-Encrypted: i=1; AJvYcCV2IAcBrB1p8wzqD9cgI42jmlHO83fatsqMeiGxgT3XVyKK/5JjAaYNO8vHO0pSmorfyZqrQ9AwWLNCQ8P4dxseHkkmhza50k7EJkaBib6GNZ9/8A8PZGDSpIUd5SZOol+eL+iA4llKjHi7nVZW6FeizfwQgFl3AqRwq3wE+rxkorq/N7cdbOgABYQ=
X-Gm-Message-State: AOJu0YwfpoZqoPVr+YAr5HkEPyu8ZXYpSXjE+gPYlBFw4+wkH2ohIjT8
	xMkJXFc0Pi47rjEY174LndE1iyaWs4P5E7Kt+dQ/dDSe0maWu0AVZBTuhzwu
X-Google-Smtp-Source: AGHT+IHmNm/nTGE+XB4NbBQZGCFCviaIAu4tphAUkRoqbtH6vn1tvC6XLJd3jwIJgCUmjcjBRDSFZg==
X-Received: by 2002:a05:690c:6d0d:b0:61b:e694:2225 with SMTP id 00721157ae682-62cabc38464mr14879617b3.5.1717486696484;
        Tue, 04 Jun 2024 00:38:16 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c908c3e6csm9726637b3.57.2024.06.04.00.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 00:38:16 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62a0894f1d3so38756797b3.1;
        Tue, 04 Jun 2024 00:38:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+jHz8uL12VB9If96OThCdVSJQEF/EM5v/LIpEW1oHakE7FipP0lIUyArcWlpR3aiZ1+IJaxnKJ4BRUrhWIAtfpQll9lQu22y9QymBN7lKprCndrNKEXHd5/2fkv0Ou1fx76DDj58rJwTGUoD9JIAP7HBRhUwQ7i3DjjhFaIHcnNCY1tv5GpqWFNQ=
X-Received: by 2002:a25:824a:0:b0:dfa:480b:4ea8 with SMTP id
 3f1490d57ef6-dfab822ddb0mr1367285276.0.1717486695525; Tue, 04 Jun 2024
 00:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527131945.1679661-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527131945.1679661-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 09:38:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRwRq-CzT5v1h6W31q_0RR4UvTpJAVVS73vrEbrxFmBg@mail.gmail.com>
Message-ID: <CAMuHMdWRwRq-CzT5v1h6W31q_0RR4UvTpJAVVS73vrEbrxFmBg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: renesas,isp: Add binding for V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, May 27, 2024 at 3:20=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> @@ -22,6 +22,7 @@ properties:
>        - enum:
>            - renesas,r8a779a0-isp # V3U
>            - renesas,r8a779g0-isp # V4H
> +          - renesas,r8a779h0-isp # V4M
>    reg:
>      maxItems: 1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

BTW, this binding only describes a single register block, while the
ISP seems to have two: CS and CORE (the second one is optional, as it
does not exist for the second instance of R-Car V4M)?

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

