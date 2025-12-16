Return-Path: <linux-media+bounces-48938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BDCC5822
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 00:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A32D13014632
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 23:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F60340A5A;
	Tue, 16 Dec 2025 23:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YQZAHAr0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249C3340286
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 23:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765928640; cv=none; b=ulXZaHXgQspGhkpb0XaJmUy3lW84oO/lJuI/W8nP8b5ix/pnlmdMcyNm0wiGdzN4DfusoJfLJXui19i9UUfxCxO6JKn4LO/D9T/Txc41IPDE2vTYgdsbvKcBObgVD0dbFJYrfXKFpIiH5MbeBvnNtRPe/CowIc0gcSkLtKqpoKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765928640; c=relaxed/simple;
	bh=T6BqMM9/A7isnUVqrD4imU5Gr4AAzjx8kqfQjYKk3o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaAXnETD38hWEV5kbpggs/QBvKMtSK1F4BcG0vfpyKDwbntnF0oClkx1Rsyk2WvxEgqsMqkxcjQBM36HOfeYmwTs3k9Ribw8oZXQCQVfEjD1H8D3Jl2PNWmTlesRFNA0H+tNTh+4Xr+WKgUHRnfqip3f/dNi4sXaEeBa5L6VOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YQZAHAr0; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso15167a12.1
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 15:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765928637; x=1766533437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWQpmZhuHByTsu+CQ3E5sInryvyWTTB+7XX4Qh+8PmQ=;
        b=YQZAHAr06xzylPJdMaNe2XVx1WM7JPJ0v4Ynnl07r+DTVDE+BjJclmjg3BNDMBIlDH
         PMdzx/rktkNHzb72OvcXxIO+TV+et6zXalMroELvjEUT1BK3eytHsAfSWrPH4ymkn2do
         9zBKv4fDMaP6E/KKuGrX2+72pEplbGgoxrHSbOPwyRbMvUQGc2RKdVaVihxEhk/v1tBH
         maX8LUHdBtcx69UZmVj7dsyRJNexuxzADIszHPPJ5oz76yjQyOOVc1VmtUxAUwZCXqaz
         VmqQIdCHqq0HamOw+M3lDOBC7/wE4E2Yt2PE4uSXkDMXgaZjtmMgxCtShVaOZkGKyhHq
         01jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765928637; x=1766533437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWQpmZhuHByTsu+CQ3E5sInryvyWTTB+7XX4Qh+8PmQ=;
        b=PwD3lkC3Lesl6Yg+xpnwLsoNleoaVOhykKBwm6cYORLI97D8cnjpmabsE61or2H29u
         nUl2s++X5DRk+LsBMQi6KkUyEmB3Mg0ZDDdLrqN9w/BnGrA56Ar63fRUyyF1Se3KrQgg
         jkCkbIvDaWbGIzpnnIrz7aE7zvbWQQIqGGVc9kV/Y4X8D9KuTJPdwInG6Y0yA2kwISK4
         skBtCgQUi2zjrIvpOuSglpy/EFCPmgG9qqFZNNdh8AAq6z2TjXkGcysX1bUu0THhGuCW
         jqLvXRrFjg94Kf39cH6bAr54+lDPBZPYVsgQt8SKMwzfufvaJf3pWtK4ekxVqAoqGtPC
         /vqg==
X-Forwarded-Encrypted: i=1; AJvYcCVJAM8ECt4cTeDnW7cbxUmuQ1F36TqVfFYQiZoiHW42NbvmL5h8TJ1cjOSBLr3YVNswvxLkDBaKBs5X6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyykPJ/DYpNffUz+qmhcOzNXjOhHuZtbQvm1TG3WNA/FhIfUfeG
	AY6oeE5F4nj+5fuMP9cIERxs/6vIvab5PzwSffAWB/YfSg7i3FssrsDuBqUM1I6XWhq+Y75I8eW
	ZoSM1uyjethkJmwVeF5sdETiQaORWJ8w=
X-Gm-Gg: AY/fxX6H1Oyhh/RwN+DYWd06cUqRS+CN9P8Emq4v7FFDZhWS0eSelXcQwfV0qy7/bRx
	ASOr/+Zl05zgCyUuMeEDf9uHWD1DysgcGiSsONkFKeIs45qrHwJB4rF+tAUl3E+wABFXEFgewit
	PBu9hINQv2JK4FVEsc+G7HMuvftH479j+EXEJlDsZzNzGteftvtHM+Xm+x2B/zq4oK/z/8Kdp6r
	D6YpJIQPg1vd6co0tuCxd9hZx9uwCyzMxNWEzFFDbIKqIB4jg077X4FVhn+j0txOTHc4odBWD8a
	VVZ2eXt397lCppjxBDDCC7pUcVI=
X-Google-Smtp-Source: AGHT+IFc4SCik6/1a5fdyPdRb57GPQbLhG29WfQBheDtYpWyCEZoAD+X3T4jtRgWy08tQ0KGPuBzfaLM7RFqA70zbTo=
X-Received: by 2002:a17:903:f8d:b0:294:f6e5:b91a with SMTP id
 d9443c01a7336-29eeea26dadmr221641465ad.13.1765928637355; Tue, 16 Dec 2025
 15:43:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com> <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 00:43:46 +0100
X-Gm-Features: AQt7F2q9zUscAc9aUQp2kvq265usXhzgFIJqV1vpvmNAc7x3-P140_1z3fSbVp4
Message-ID: <CAFBinCDO5UWVEtbOOdMn9vy=0H2Q1hJDKhH+X7i0nMsSsw=wbg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/3] media: dt-bindings: Add Amlogic V4L2 video decoder
To: zhentao.guo@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 24, 2025 at 4:32=E2=80=AFAM Zhentao Guo via B4 Relay
<devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>
> Describe the initial support for the V4L2 stateless video decoder
> driver used with the Amlogic S4 (S805X2) platform.
>
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 87 ++++++++++++++++=
++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-de=
c.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
> new file mode 100644
> index 000000000000..401a5a32902e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Video Decode Accelerator
> +
> +maintainers:
> +  - Zhentao Guo <zhentao.guo@amlogic.com>
> +
> +description:
> +  The Video Decoder Accelerator present on Amlogic SOCs.
> +  It supports stateless h264 decoding.
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-vcodec-dec
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
Neil has commented on the driver patch (in v1) to use the existing
canvas driver.
The same applies to the binding: you can replace the whole "dmc"
registers with an "amlogic,canvas" property (see
Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml for
an example).

[...]
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
I did a quick:
$ git grep RESET_DOS
{include/dt-bindings/reset/amlogic,arch/arm64/boot/dts/amlogic/}*.h
-> that lists DOS reset lines for most (all?) SoCs that were supported
by the old vdec driver as well as DOS reset lines for the S4 SoC (for
which you're adding support here).
If some of those reset lines are wired in hardware to the DOS region
then you should include them in the binding.
For reference in case you are not already familiar with it: [0] "[...]
make bindings complete even if a driver doesn=E2=80=99t support some featur=
es.
For example, if a device has an interrupt, then include the
=E2=80=98interrupts=E2=80=99 property even if the driver is only polled mod=
e".
(the same also applies to any additional clocks or power-domains that
are wired as inputs into the hardware which you have not listed yet as
they are not needed for the initially supported codecs)


Best regards,
Martin


[0] https://docs.kernel.org/devicetree/bindings/writing-bindings.html

