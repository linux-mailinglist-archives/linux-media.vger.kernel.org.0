Return-Path: <linux-media+bounces-16985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC01962128
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A04471C2125C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F551591E8;
	Wed, 28 Aug 2024 07:31:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D058328DB;
	Wed, 28 Aug 2024 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830289; cv=none; b=HIXYJReWGe61c3gDiM+cIqvqkP2naKDiZJPfYzE01vQeN6PYxhPJ2BiviYeajx4xo5yta1Ce+BCnMDonjNIVtrDp0bruxyfbQKn7WyP+I6TMJC51golWHEFiZtHjEcjz5F80Irh/rojZWKnxaqQPd1+evOOzaZC9933FHdPEIBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830289; c=relaxed/simple;
	bh=VfmrcibnR5VC4udjpTBxcTJD4ySxANT7MnQuzKLh1W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5Vs/Ao+TToZZAHRFzKpCLmxQ5+GrNvtYc8fEKBPAoewHsjU2lvmKhPjw6RHVMiUjrxXc43w18e76/K2oum/uxrZ6zZjc4tE/sJJU+pDX+oIW6KZDUlsE/VU8ACyw7oZU3gWaxLOVlTBAGSBJSv774DoC8SVIGrA7ibXkV5fJyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b2e6e7ad28so2486897b3.0;
        Wed, 28 Aug 2024 00:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724830285; x=1725435085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWjj01UxlqgE9wgsqT0X1qkl31HoxLJKg7srHrY8G6E=;
        b=nNfyT7SWXZmr+OlTCdxSP6N1hNgApjtiNYZuu+Kw0g8ZCPQq5+TVbVaAriN1KWMQ+Y
         YYVcAly3Rb4Ei0SfRYWcCSiYVYk+pzTHLMFNovh4aIfskIRq9E7B4JeyeAl8IKOrrCfD
         4GCZzFZJyHjMIIHvlyxHVJNBgZzKYZSnZaZx1iW+OFpYHFhWzzS/ZjdRJwYsOzhM69nh
         txFk6xrVc8L9VbYMKeUcKGS7DhiwhOH7qzEWzwMBAdBcSoU1BDKtmX2ywMd8pD5INQiS
         28l/NJPBItFw74bt11H4OYzwkk6pR8zFyV8UkH7iEGC4IhnVH6FL9eGjqY+GMYW4AiA6
         Ctjw==
X-Forwarded-Encrypted: i=1; AJvYcCVJE3lawRcDnqoLjfAUItYHOY5MlqUgkhP7Pw+XhxGbixkzH8PQHLE+65e6Mn/HHSb5y8dmckcOnm+u@vger.kernel.org, AJvYcCX+0OomyyMtaXwkEq0SKwnaHEXrXGpyY5UmH1g5xiWn4cJdqwFN/aO/hESTlj6LugpQE9clZybRHxjO5tvMc1ONc+8=@vger.kernel.org, AJvYcCXD5h0PAW0SnA3jlNqeOV/txKp8f0JCBASm+uZgsoF0w7U3NFXbeld0Tt4HWM1GEPnbRxAgjWKqusv2WUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYSbR/CW/Pe9NO5GOQZa2HKAg6SJ3fHkTrMuSvjdTudtnvU8y
	oGcjsYm8f5/kjoCMkWZHpfzPHIZiNPA3WXl7NpPn4EvcF6naclDu7Le3x5+r
X-Google-Smtp-Source: AGHT+IH11lNPB+6TO7HdS+kIL6QdrFenzBsOTSVFrr9VzRl8S7c51lJnrdfwBMukdkLJg8R+qUHIRg==
X-Received: by 2002:a05:690c:d8c:b0:6b2:7494:455c with SMTP id 00721157ae682-6d151d53fe2mr9099177b3.1.1724830285594;
        Wed, 28 Aug 2024 00:31:25 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39d3a9bcdsm22673647b3.77.2024.08.28.00.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:31:25 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6bada443ffeso2613957b3.0;
        Wed, 28 Aug 2024 00:31:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnD52FL9mrdWo4sUJC44pVxZIsTSxmvr4mwVIrydqdb3ANF59Kbt9a0tA9kU5LiKr6Ela4HkQ0eoJoDSU=@vger.kernel.org, AJvYcCVvc7gAhmH4Ap7urleofBgIyKQqS6tgY45ZfwWy/KcJgpWK1URym2iwGyI1u6+7UcSnwQ0a0ngNqOCh/OFoax4WJ24=@vger.kernel.org, AJvYcCXz6ZNE1sI3DCNS3VL3Wpv1+sYpUyli3sFEvjAtP8itFsUMn6kFhUxIY3IP+s+iGSWOIQEAJDFXqTZE@vger.kernel.org
X-Received: by 2002:a05:690c:f84:b0:640:aec2:101c with SMTP id
 00721157ae682-6d151d54443mr9754437b3.2.1724830285074; Wed, 28 Aug 2024
 00:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se> <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:31:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXacXi5CqDO5K3-asJ4odHtAoFpeS17qGvK_W1sycLMzA@mail.gmail.com>
Message-ID: <CAMuHMdXacXi5CqDO5K3-asJ4odHtAoFpeS17qGvK_W1sycLMzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family fallback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 4:44=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The ISP Channel Selector IP is the same for all current Gen4 devices.
> This was not known when adding support for V3U and V4H and a single SoC
> specific compatible was used.
>
> Before adding more SoC specific bindings for V4M add a family compatible
> fallback for Gen4. That way the driver only needs to be updated once for
> Gen4, and we still have the option to fix any problems in the driver if
> any testable differences between the SoCs are found.
>
> There are already DTS files using the V3U and V4H compatibles which
> needs to be updated to not produce a warning for DTS checks. The driver
> also needs to kept the compatible values to be backward compatible , but
> for new Gen4 SoCs such as V4M we can avoid this.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - New in v2.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This is in line with Section 2.3.1 ("Standard Properties / Compatible")
of the Devicetree Specification, Release v0.4, as it is used "to express
compatibility with a family of similar devices".  Note that this does
deviate slightly from the recommended format in the specification
("manufacturer,model"), as the fallback "model" specifies a family,
not a model number.

As such I think this is fine, and consistent with lots of other existing
family-specific compatible values.

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

