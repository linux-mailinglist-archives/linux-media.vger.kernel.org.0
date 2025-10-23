Return-Path: <linux-media+bounces-45447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC64C039D5
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 23:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 899C14F51C5
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 21:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDABA2566F5;
	Thu, 23 Oct 2025 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1SEwrjh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E523D3B3
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761256220; cv=none; b=F5puOQDUZYf4Gbs/fSgtlxm8CNqDVfvK+LpkzrYaDLBKk49+pVFzpIELUYVVZVqFo6pjy60/RLx0piazZjaNjWdK9K9myRqJuoTJ+jsX/Gv4TF4/FTxdgq09ummvejaPbJJNoNnAWL8agpY1xku8idA3alCQAH66HoCSmW1/gOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761256220; c=relaxed/simple;
	bh=0crdkRWL2i52N8DjaLjPGWqZ+qR9vnRSb8AxmG3G5jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JI3vtKdaJytOTnQokzje/w3TAZpjmZPi1Gf0vuJZBHivcCccXEhKVddRLrb4Z43KmsBh96M8yiApJk1NW54sNdW/HGYj0jXhYwsjdECvUAx2HRsVfaVJYHbrVQgn/ASbKis1D3K2wIkm6lD4CKipXMrkx990CU3P9oHnWr3xof8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1SEwrjh; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63bf76fc9faso2550803a12.2
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761256216; x=1761861016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTxd0N4ykd7gve6I0VI6xvQpfS9jPjV5mFGiKktW21o=;
        b=F1SEwrjh3GuuKfLFMQdbvKrV+ETF04xlvaypgRB84tFPaVh24wshsL4yLG9sLLj1uq
         K4Ca+UWdrgvxQuLcu8SApM1nfHdHWQdUuqMiEnDKKVUf5CezdyIn75Rqb4qd3MRUBRox
         wUKLDbT8b+hxUSourq2iAL/4ergYPhH2+s9WrxRhhM3+B4UtXjdrMcoBv2EsVxgncfvV
         YXuBylJFcF7b7oti0WAGzv9UIXgp3p5jhR3hNDk4wOUJgB2eINVFvRd0jTvFbp+C/OgA
         jDIMCWVaWfVhFGtIdPK66ZzzSl6tEM0pXOLE795FW+Aava05xgsLBkEQvQHz5zwCI2Js
         ZGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761256216; x=1761861016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTxd0N4ykd7gve6I0VI6xvQpfS9jPjV5mFGiKktW21o=;
        b=uPeuZ2KekBxfucVSzNuFAWBoErk25ZpD40btG89WRtWpHJjfBCMnQE7lWgbK1CBrvg
         /mdux8GDVA7yBXvjJYuLV3F+GqsnSTC6ZP9inX04t2o78AgXZeKZ9/xhtOS7hdcdygTe
         VBCPv2vl7a2hll0Ew4fr18ISOjU3OpKitLGSrnpDF4ai5HQT4aPF01gK5uZSp1dgoViW
         O03fI2Q7BouK1XDG2nb7BYiNnzw+27K7imjm0aMAHR364Ktrq9b8VGgZq+cu7A5oHzS1
         NpZH387aob4vJX1Mv2Lw2akg7zIwvj/XCgFDBzMEl9LoulCCGlOoG5mgegwQJgSPV3vJ
         31fQ==
X-Gm-Message-State: AOJu0YyRsUnELXQz6AHqtLbRxzhFa+LvUalEfmW6fJaGe0+Y54QnT19A
	fdFFoNRuSkDMyelREcimmiIQPX8MUVLoJyru0Mw3gGpwpabth23OMwLTs3IJHKDrN0xTZs8/qnP
	L5/mxcttpd9Jb8ICTq0+yW5t49jGmnvM=
X-Gm-Gg: ASbGnctY5VCfDCMLKmwWTpdc39Oa0rdlJ8Blg3BcldgqzY7z3R3uRB+DGL6bFKdz1Ul
	aXnfQ2eOppsL5Byle3xLapnEqmUtY70ahtnfM1YH6Tfhpb+62Hjvsh3JA/k2WQ71oq+Hy3kpKKW
	cHIr7irZjVcB5OT8E08EjVx4qzSJdirv44RIlGlre4OjdJ5yHfe9aBSTmrTPd2QciTR9zYgC6z3
	fX51Plo1jkvzS5V9kesz7Vi39IjVroifkAPYLDvQQYdRlRaH19c9w893xr/TA==
X-Google-Smtp-Source: AGHT+IE6DRq0G5t3WynJX8AdK871ej0FvwPBp17WZkIlAW429pCOMu5FAtpCqnXjVceYtZYEL30EdgTdYQqDcgDyYOw=
X-Received: by 2002:a05:6402:2787:b0:637:ab6d:71c0 with SMTP id
 4fb4d7f45d1cf-63c1f62af92mr23616460a12.7.1761256216068; Thu, 23 Oct 2025
 14:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com> <20251002-ivc-v5-1-192c663fa70b@ideasonboard.com>
In-Reply-To: <20251002-ivc-v5-1-192c663fa70b@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 23 Oct 2025 22:49:49 +0100
X-Gm-Features: AWmQ_blarlbB60Z8ciGxdUOyDe13AFqtYqI4foOh96GGz7YXVmq0KoeyJzdQ_-4
Message-ID: <CA+V-a8sCvhepEL1RnsemN_84U9gcLLoGBnOUtY0zLsZO+kcu7Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: media: Add bindings for the RZ/V2H(P)
 IVC block
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, 
	biju.das.jz@bp.renesas.com, laurent.pinchart@ideasonboard.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thank you for the patch.

On Thu, Oct 2, 2025 at 11:38=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> The RZ/V2H(P) SoC has a block called the Input Video Control block which
> feeds image data into the Image Signal Processor. Add dt bindings to
> describe the IVC.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v5:
>
>         - Rename RZ/V2H to RZ/V2H(P)
>
> Changes in v3:
>
>         - Rename from rzv2h-ivc.yaml to r9a09g057-ivc.yaml
>         - Update clock and reset names
>
> Changes in v2:
>
>         - compatible matches filename
>         - Added power-domains
>         - Aligned clock and reset entries on opening "<"
>         - Removed status =3D "okay"; from example
> ---
>  .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 +++++++++++++++=
++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-iv=
c.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8e236e46882668b2660d175e8=
b2cffe204aa781c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,r9a09g057-ivc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Input Video Control Block
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +
> +description:
> +  The IVC block is a module that takes video frames from memory and feed=
s them
> +  to the Image Signal Processor for processing.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-ivc
Nit, `const: renesas,r9a09g057-ivc # RZ/V2H(P)` as done for the rest
of the Renesas bindings.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Input Video Control block register access clock
> +      - description: Video input data AXI bus clock
> +      - description: ISP system clock
> +
> +  clock-names:
> +    items:
> +      - const: reg
> +      - const: axi
> +      - const: isp
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Input Video Control block register access reset
> +      - description: Video input data AXI bus reset
> +      - description: ISP core reset
> +
> +  reset-names:
> +    items:
> +      - const: reg
> +      - const: axi
> +      - const: isp
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output parallel video bus
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
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    isp-input@16040000 {
> +      compatible =3D "renesas,r9a09g057-ivc";
> +      reg =3D <0x16040000 0x230>;
> +
> +      clocks =3D <&cpg CPG_MOD 0xe3>,
> +               <&cpg CPG_MOD 0xe4>,
> +               <&cpg CPG_MOD 0xe5>;
> +      clock-names =3D "reg", "axi", "isp";
> +
> +      power-domains =3D <&cpg>;
> +
> +      resets =3D <&cpg 0xd4>,
> +               <&cpg 0xd1>,
> +               <&cpg 0xd3>;
> +      reset-names =3D "reg", "axi", "isp";
> +
> +      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
I understand we split this up from ISP, there are other interrupts for
ISP for example 860 which is similar to 861 where it outputs signal on
rising instead of falling. Do you foresee this interrupt being used
for IVC?  Rest LGTM.

Cheers,
Prabhakar

> +
> +      port {
> +        ivc_out: endpoint {
> +          remote-endpoint =3D <&isp_in>;
> +        };
> +      };
> +    };
> +...
>
> --
> 2.43.0
>
>

