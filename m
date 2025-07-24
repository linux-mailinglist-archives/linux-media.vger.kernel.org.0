Return-Path: <linux-media+bounces-38418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C547B10F37
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 17:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626911CE492C
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 15:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B4D2EA486;
	Thu, 24 Jul 2025 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaERG3U2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3362E5B07;
	Thu, 24 Jul 2025 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372559; cv=none; b=HuiudGc/G4OW9TJ97y43zIpviI3dKUikXgJ93MnY13quVXK6ZxNV8Q8sZH2jvQUP2iAeU0mcnVmkQd11DJIg+cWmxfGIbnKGSWhE9c9AnL7gmfJt3WHoU9O1drmI5ffif36yfnCA2s/XKjOkADsEG4WppusLgGqvjmQwuwIIHHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372559; c=relaxed/simple;
	bh=4GbusBPSyHYrVuVP3IzlGn289shga9AVfcznEZxZscw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyUGYpMI8gTiIYFaal7mm+ryoW2UIPRDnHreA2+4XP6ceKw2E/OKHrxNF0q+zZ9vlVw67fNGr3ej7ongdWM3x7k6R9YT4f4fa9mR7PtHOP7+l4+/kSJuUhlCpEkM4tvO80utjlB/aSEBon/JXvK9vMxXZYZb+HVHQc/3w+qPBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaERG3U2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so13519725e9.1;
        Thu, 24 Jul 2025 08:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753372556; x=1753977356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQXNp7yhYRa+ohMVZxRS59p+inq7oHb3YiIWFn/pW5w=;
        b=MaERG3U2Y/YhhFem5XlpEbLZJFazAxQhx+OOrOLX5NlSSD6LTEbo9G4uyNjJt3mCNR
         DSb98DdNCULqYf96G2ev0CfBorzsmg/t4ULRVg3/RIT+dY448TZi4sgOo2+2srAy8BlG
         v+KFcYm920AOqiGnV6f6K/YNGRs9z3Iv8INNX5IaYTvJXT5hot7hhRtUDzALCJpkDoeT
         wISNugTn2wzNblPnWT4pzlXio02ZM/+C0ZHdQYT7YGEtFdblFN/r3POCEmQ7JQ/E8P3a
         pefwc62XPVTR8ZzSiHqNvdakTn1Jc5VezM0xYFy1PQvxcvqz0Ld+g5pnWeeeGHlvtBvA
         ZSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372556; x=1753977356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQXNp7yhYRa+ohMVZxRS59p+inq7oHb3YiIWFn/pW5w=;
        b=iTQE+kxiUGH1eQf3eI9gDQ7hWCg3F4wWvdkULYM8cum6UhkmHKW/7VWGBQASVmTrSh
         FplpAonmf1KWYdMPrr2Sjw6/BXW3hme3943aItgreqI9h8hdO0l2PpLRIAp1QCR3/rX/
         UxbBdV/2MixORlidjgbMzSsv1F8oXJKnb1gyVUu7rDlfVz/g0mso2O1hw9OOBWLj/52l
         utAxK/NuIcdM9v668woMXxQNtvjXaNEoE6bxQgk8p6kqG2YbVUn/a/+9953627hP156U
         wWx9TYzuNwr1W0x1gkUpVth4DixddwRSzji8vAIX1fGSD5Vhtzb5vKa/XWOqlr3GVMaz
         AjFw==
X-Forwarded-Encrypted: i=1; AJvYcCVHt1BUYpb2Ve9kaYGP0HS22MACkuTGh61CtPdiLSV5XBuZETlgeKtU6BA9NMR8shRTOpBUxJFfywKK+7lbr4FyxW4=@vger.kernel.org, AJvYcCXOJJpYlGI15UKRuQsrdLPgOG71lasAs0btPXeN+HD01IabRteMwqZ9/0+mHboLU2kuDRpPTg7HviPR@vger.kernel.org
X-Gm-Message-State: AOJu0YzUf6PvVl1+aJ22+gyS05yrRUT5W/Ue3fkoC/Axla9KI4SkYsip
	Kqa8Qg5fx8cAKnYD26vebhLBflDWcbPFgpAmhoLBF/afTQz8mjhj6E2uCTV8NsVE/n2OqJgraql
	MdJ4PH5ldxWvOs0dOo7SQ1HEuiHAL0Go=
X-Gm-Gg: ASbGncugKmOOyGWmeG4InvAdLSv5Sqas7D6NS/jE6Zls97XWAKnB7D1fT4VYjKpN470
	M3BmzkjLSfUwX0jy0lVgbqIEjWY+FPDeOhpwQEmiP7SNF/j0p9fzUKe2Ae1GSaAQwlzgZzbrQoj
	wak8qHeusXnkL4Bf8hnBSXSV4mOemSHFBV/Ju+iaixc2O7Jd4VR+iPA1NrbidRP3bj5kNXqIlEl
	yA1FNvO
X-Google-Smtp-Source: AGHT+IFMnO6qItU+vRGyl4nDXCXdkg2NGNrZXC0avjMX7zs5Kl/eMq1l2xfLh7HRUy9Varv9K9gV8qL0CKfdQ2nHxts=
X-Received: by 2002:a05:600c:35ca:b0:453:81a:2f3f with SMTP id
 5b1f17b1804b1-45868d4f48bmr77390065e9.30.1753372555411; Thu, 24 Jul 2025
 08:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com> <20250714-ivc-v4-1-534ea488c738@ideasonboard.com>
In-Reply-To: <20250714-ivc-v4-1-534ea488c738@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Jul 2025 16:55:28 +0100
X-Gm-Features: Ac12FXwe5ZLJsySMlTXpMt2Y8Acn98NBwBlSRLjuAJkA3ES3k2mkCyrzY6-wbOE
Message-ID: <CA+V-a8sYp0eXwPdihvkh5u3rnZKq3STrwexAX3JsoNE=8n60hg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: Add bindings for the RZ/V2H
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

On Mon, Jul 14, 2025 at 4:28=E2=80=AFPM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> The RZ/V2H SoC has a block called the Input Video Control block which
> feeds image data into the Image Signal Processor. Add dt bindings to
> describe the IVC.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
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
> index 0000000000000000000000000000000000000000..3ecccf0a4b05ffcf90c130924=
bfe50065b06f87e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,r9a09g057-ivc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H Input Video Control Block
> +
s/ RZ/V2H/RZ/V2HP
The 'P' variant is the one which has the Mali-C55 (also in the commit messa=
ge).

Rest LGTM.

Cheers,
Prabhakar

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
> 2.34.1
>
>

