Return-Path: <linux-media+bounces-45867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F1C167B6
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1A13BE1B2
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6FE3502A8;
	Tue, 28 Oct 2025 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ellKt6Va"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C674350298
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761675831; cv=none; b=YyFFojlTgMKks3rlp+NZ//rLQ2pUUcRPbM6pJ+Kiipbz8OluTmSKbP6Ieqq3CeRy0rvhtm5wWUzWTSVY3GPyYwZR1i9ua47xA2UkjRqi9wJbQ7ai21cjzhb4Inob7FU7Ct2aZ+XDEp2DZG3eBoqncXY+gDE0WyuLdHMayo4q75U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761675831; c=relaxed/simple;
	bh=/8YAVuOLvXfUcCePn46ksoxD4/Fg6wgt5NSgjFjIjp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AScqYxUYjnDAmhwtLq9iojzhEVXEHPIU5FV56mf4/P7Qa6+wegnAKPeH6mfuRWnVbEkYTIN9TEVCD6dUknKSSnjDOC0aOVZ4fOLm8Qu0OEYcL3ofA3lQy/lvRC8OsJiOc7XnQmyLjSDn82qa6mgP6PFheVradxkgxxYxRa9sYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ellKt6Va; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4736e043f9so1121295866b.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761675826; x=1762280626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SByi/noK1LzrmChetu+9tAciMT7QNCZcLIgFo+c/8VA=;
        b=ellKt6Vak0k+N4bETb2WqSXDyxxfzVf8ErqH0xuokbl67QCc9CeDW1lTyenDvkR5s0
         ab0iFLljAUk9twi4dwpMXgzRrDa7ZsFWRfFYQUlHBtp4suDRbGswt6EByDxN8DVpln2B
         /rERGQTmHWiEQXHQjT9lgdbZn0Fko6aO8sDoTRh+KT+kWlTrwlAi4lJaabdJIa4GpdRi
         luXbVPN/aK0yMEJggmHp/0et3wi8nhUkBdosLBrMIwBAXdaN7aFyMi0x01Xe+KKgtTUx
         7auKkZt4XaIyF/QPG2UaZr52NWcuU5AvJF+4pyUbPxrYK2o7eijtHofC+kCNX32Hc2uF
         /KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761675826; x=1762280626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SByi/noK1LzrmChetu+9tAciMT7QNCZcLIgFo+c/8VA=;
        b=WdovnLWkhQyKJfujZemgs7ZEI87ab5G9NdE1DY74ec43hfbhbmnxNWO8LQBXaTp/3y
         gFpxZjbNXUFQ7oBW5if2AmzN5XmQAUpSqxmh1EXVesWAh0Ow+L8RTxW0+oFJ3wx0+eKJ
         dhHE9kYVIt8guOIMIal46qvkAcwPwm30h7tSo45mlqcAGv2lIX1erZ8zAWtYOEl4vSTU
         YJ3/dFN4rwIB81MfEfutX6wTOONbo+n0JxeLd1bSbWxVrVhhPJXMZh2/5Mka8tGDA18c
         swUlbppsxLresieEUEpLmaUBfSjPVIpGS2t8n52VyiDGCHN0F1YItKgfRZe4phJ2z9Y+
         JfLg==
X-Gm-Message-State: AOJu0Yx+I7MdB03sWsMHYE1PWzOrHKFwu2JkDIcgGX36pDbdyJo9rjKA
	Yv9/iwo3OyWPiyC4AMrc7Db/C2ENWLcWbpS7heoYvpIUKmw8Ow8x+j66dwHwoYa/46JmmYMXGwj
	x45ywIbPxHvj1nhyQyLgxySiaVox4Bsw=
X-Gm-Gg: ASbGnctRtQ+yxvXH0WFhupforDx/a++wBmf5yjHdSIPydxI2vV4QfOU95qtqJmbYeq7
	UX9g0X/MBmJOjqe6U5r8aMTATMJz03Baro/9wIyNSGj4pYyCFSmMLRLghsIu2NSrRLvOD/LtHa/
	OIrc9qJhuO6JHkkwz4kfs3Rhtrm5mFBECwaLh/deUicZWnrwQSdU9/ViqVJXYehrlcVREKreUb3
	qnVPRjhzZ68nMz41nAmubrH3n597/SeALd6jfS5krgpNSjKbiTS+3a4x2XR
X-Google-Smtp-Source: AGHT+IERzCnM1Q+dG5xJk3p4f7frp3yawAfW/uKDFumZLMQ7OAJhXOruAAAPxc8vqZJQImIU0+jA31a/xFLrLwySBTg=
X-Received: by 2002:a17:907:980b:b0:b3e:f89e:9861 with SMTP id
 a640c23a62f3a-b6dba4a8de7mr443497866b.28.1761675826412; Tue, 28 Oct 2025
 11:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com> <20251002-c55-v12-3-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-3-3eda2dba9554@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Oct 2025 18:23:19 +0000
X-Gm-Features: AWmQ_bmm1K9uTQjGChVp6dXcI7uBwmD2Omk5zjMb8vPaExIO7xEYl9DV_jPi_n0
Message-ID: <CA+V-a8sg4c697WTS=wXoWvgc_UCFM3+Qjh1br=rMm4F84NVw-Q@mail.gmail.com>
Subject: Re: [PATCH v12 03/15] dt-bindings: media: Add bindings for ARM mali-c55
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, 
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thank you for the patch.

On Thu, Oct 2, 2025 at 11:19=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v12:
>
>         - _Actually_ dropped the arm,inline property mode, having forgott=
en to
>           do so in v11.
>
> Changes in v11:
>
>         - Dropped in arm,inline_mode property. This is now identical to t=
he
>           reviewed version 8, so I have kept the tags on there.
>
> Changes in v10:
>
>         - None
>
> Changes in v9:
>
>         - Added the arm,inline_mode property to differentiate between inl=
ine and
>           memory input configurations
>
> Changes in v8:
>
>         - Added the video clock back in. Now that we have actual hardware=
 it's
>           clear that it's necessary.
>         - Added reset lines
>         - Dropped R-bs
>
> Changes in v7:
>
>         - None
>
> Changes in v6:
>
>         - None
>
> Changes in v5:
>
>         - None
>
> Changes in v4:
>
>         - Switched to port instead of ports
>
> Changes in v3:
>
>         - Dropped the video clock as suggested by Laurent. I didn't retai=
n it
>         for the purposes of the refcount since this driver will call .s_s=
tream()
>         for the sensor driver which will refcount the clock anyway.
>         - Clarified that the port is a parallel input port rather (Sakari=
)
>
> Changes in v2:
>
>         - Added clocks information
>         - Fixed the warnings raised by Rob
> ---
>  .../devicetree/bindings/media/arm,mali-c55.yaml    | 82 ++++++++++++++++=
++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/=
Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..efc88fd2c447e98dd82a1fc1b=
ae234147eb967a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali-C55 Image Signal Processor
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    const: arm,mali-c55
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ISP Video Clock
> +      - description: ISP AXI clock
> +      - description: ISP AHB-lite clock
As per RZ/V2H HW manual we have reg clock looking at the driver code
it does have readl. IVC has reg clock if IVC driver fails are you
still able to read/write regs from ISP driver? I think we do need to
pass reg clock too.

Also for IVC we do have a main clock (which is a system clock).  Can
you please educate me on what is the purpose of it. Just curious as we
pass to IVC and not ISP.

> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: aclk
> +      - const: hclk
Not sure if we want to have the same names as IVC or vice versa.

> +
> +  resets:
> +    items:
> +      - description: vclk domain reset
> +      - description: aclk domain reset
> +      - description: hclk domain reset
Same query here, wrt register reset.

> +
> +  reset-names:
> +    items:
> +      - const: vresetn
> +      - const: aresetn
> +      - const: hresetn
ditto naming.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Input parallel video bus
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port
maybe also resets and rest-names should be part of required properties?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c55: isp@400000 {
we could drop `mali_c55`

> +      compatible =3D "arm,mali-c55";
> +      reg =3D <0x400000 0x200000>;
> +      clocks =3D <&clk 0>, <&clk 1>, <&clk 2>;
> +      clock-names =3D "vclk", "aclk", "hclk";
> +      resets =3D <&resets 0>, <&resets 1>, <&resets 2>;
> +      reset-names =3D "vresetn", "aresetn", "hresetn";
> +      interrupts =3D <0>;
I would have a non-zero val here.

Cheers,
Prabhakar

> +
> +      port {
> +        isp_in: endpoint {
> +            remote-endpoint =3D <&csi2_rx_out>;
> +        };
> +      };
> +    };
> +...
>
> --
> 2.43.0
>
>

