Return-Path: <linux-media+bounces-12707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B38FFE75
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 10:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1805C288739
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 08:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079F415B133;
	Fri,  7 Jun 2024 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cEYeB3FC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAA15B12A
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 08:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717750369; cv=none; b=H9xAcq4ze+LHfokBnnHfhsmhf1SW4AZdKNJFWOPIeEVmkPb/GIVIqbzmNvKB/8W0iHVX5B5zFcGVQmsJ/kKTcZmyEd2Gc8vRDU3/98TKo1Y86v9LRCPB4hKbafOChm9GZWePLLEMMLad4CXL7znWVe/5z33FwsbNC3uyz0YGH+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717750369; c=relaxed/simple;
	bh=66HBX4J19VbRekWum3euwSQ7xtqYmK2ftAnDc0LiNUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRK4zR917vpuX3x7MSo+IkGNljfEhXFZZkESkV0bkYN0cyxUr+54t7ocSssyR9C/pZs+D3pH1YLTEQU2ggZfOLS1UcGt20LPsw8gf4D7Yii902dYqB0ub7+CyVsByhS/qqM4522zfzjzt/aa9ix7LO3yvglxToFXdVn9SehHElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cEYeB3FC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a68ca4d6545so338000566b.0
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 01:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717750366; x=1718355166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjuZF9YFMCyt7vHEOY4hC4haJuA8BL1l+S1hJkJtq90=;
        b=cEYeB3FCvUDvGJcO/VGB8nRYHeTaMlQ6phUOUPui2exsJRFxSsWpooLivxq02ru5Xu
         SyRJUH0NV6mUMrfX/wGfWIkOtCtFYBKo+27ey26ico9tfLErzk7BiLdrIu5Gkj0u47Zw
         of0MhcRxhG+kNMaSev07MaQWd2CGpmUc6gu0+0idtrRdwPI6vaBLKxZ+pVhGECJBMTde
         2PlaiwK6MZLEkhrhQgIyqIw2RWFvmtUDL5Vnxjpid4bL7CUWb1UW2v/uUq58M4OoVMpR
         LfWrqWOwc+qmn/SrN1AltGe4pOJ7xjrBBm5yCjTTsvaUc8CrOrMqNbam9EyptYaJdp+m
         esRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717750366; x=1718355166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjuZF9YFMCyt7vHEOY4hC4haJuA8BL1l+S1hJkJtq90=;
        b=ags6YSVqaI/s6uiH1tq27ZiuW4yVg97LeEg9e0S8IS/7mR2mnppOTE/GHhI51/ivVc
         gTHNKpGj19s0VCB1xqyBXpKB/I85qFD4u0thJ1mjC+94NwNrxDdoJ8/2hLdszNaR7v2d
         ZHtgvdC+Ik1s2PZYIqFL3rLXmSYFMViU3BcCAiwgY8f88hdpIbRVcCLqVq8JXNUDIXRL
         Kasg7xQUD/ssZDGplZdq0Q6gQgkx7vz98Zz73+d9xS+HssvMmXfwDJXBgjcuKl3+e1yo
         SVusq1JSC6YhRUqKtZWXbnCEG0nGtrRqB2WXp/XNafPjkc/gXyRreQ/zhxbFQpV88DHn
         v+1A==
X-Forwarded-Encrypted: i=1; AJvYcCWjmcIwHIy1FEbWY8FGNDCwrOmUznF7JPA1Xha4PbJdxAezNdrM4FpBFYIAcxGGyuGO+sO+IydJ/m12+9Jt+U6AepW6CcwCfFbNhME=
X-Gm-Message-State: AOJu0YxZV6Qxcg159a8pR+iTOq2ixSRu55s3mBmUC9z5ow18eT13tRVw
	wHAV7aS5MCTjkN/wcr/H1inIqG0FB17kKluT2PWvmyiH2BImHwNJhj2yjFeTMz/df0Qy6Iy8ySy
	bHOu+Ht/9drW/FMtbxI5ED+021O0D4VUltjgIXQ==
X-Google-Smtp-Source: AGHT+IHz0oblgfs6QK84jkLY1rRZ8G4iI07a+WGgFejWKVL3U8A1X2rtzxqVz9VMl0MyJrrPsb3bywI+y5oC/oU1aTg=
X-Received: by 2002:a17:906:4090:b0:a6e:c5c0:ba42 with SMTP id
 a640c23a62f3a-a6ec5c0bb34mr26417566b.30.1717750365646; Fri, 07 Jun 2024
 01:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com> <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
In-Reply-To: <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 7 Jun 2024 10:52:33 +0200
Message-ID: <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor interface
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Florian Sylvestre <fsylvestre@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 12 janv. 2024 =C3=A0 08:32, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 10/01/2024 15:14, Julien Stephan wrote:
> > From: Louis Kuo <louis.kuo@mediatek.com>
> >
> > This adds the bindings, for the mediatek ISP3.0 SENINF module embedded =
in
> > some Mediatek SoC, such as the mt8365
> >
>
> ...
>
> > +  clock-names:
> > +    items:
> > +      - const: camsys
> > +      - const: top_mux
> > +
> > +  phys:
> > +    minItems: 1
> > +    maxItems: 4
> > +    description:
> > +      phandle to the PHYs connected to CSI0/A, CSI1, CSI2 and CSI0B
> > +
> > +  phy-names:
> > +    minItems: 1
> > +    items:
> > +      - const: csi0
> > +      - const: csi1
> > +      - const: csi2
> > +      - const: csi0b
>
> Why one hardware has flexible number of phys?

Hi Krzysztof,

seninf can have multiple port depending on the soc, each requiring its own =
phy

>
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI0 or CSI0A port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI1 port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI2 port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI0B port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 2
> > +
> > +      port@4:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for cam0
> > +
> > +      port@5:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for cam1
> > +
> > +      port@6:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv0
> > +
> > +      port@7:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv1
> > +
> > +      port@8:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv2
> > +
> > +      port@9:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv3
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +      - port@2
> > +      - port@3
> > +      - port@4
> > +      - port@5
> > +      - port@6
> > +      - port@7
> > +      - port@8
> > +      - port@9
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> > +
> > +    soc {
> > +          #address-cells =3D <2>;
> > +          #size-cells =3D <2>;
>
> Use 4 spaces for example indentation.
>
> > +
> > +          seninf: seninf@15040000 {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
>
>
> > +                compatible =3D "mediatek,mt8365-seninf";
> > +                reg =3D <0 0x15040000 0 0x6000>;
> > +                interrupts =3D <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> > +                clocks =3D <&camsys CLK_CAM_SENIF>,
> > +                         <&topckgen CLK_TOP_SENIF_SEL>;
> > +                clock-names =3D "camsys", "top_mux";
> > +
> > +                power-domains =3D <&spm MT8365_POWER_DOMAIN_CAM>;
> > +
> > +                phys =3D <&mipi_csi0 PHY_TYPE_DPHY>;
> > +                phy-names =3D "csi0";
> > +
> > +                ports {
> > +                      #address-cells =3D <1>;
> > +                      #size-cells =3D <0>;
> > +
> > +                      port@0 {
> > +                            reg =3D <0>;
> > +                            seninf_in1: endpoint {
> > +                              clock-lanes =3D <2>;
> > +                              data-lanes =3D <1 3 0 4>;
> > +                              remote-endpoint =3D <&isp1_out>;
> > +                            };
> > +                      };
> > +
> > +                      port@1 {
> > +                          reg =3D <1>;
> > +                      };
> > +
> > +                      port@2 {
> > +                            reg =3D <2>;
> > +                      };
> > +
> > +                      port@3 {
> > +                            reg =3D <3>;
> > +                      };
> > +
> > +                      port@4 {
> > +                            reg =3D <4>;
> > +                            seninf_camsv1_endpoint: endpoint {
> > +                                remote-endpoint =3D <&camsv1_endpoint>=
;
> > +                            };
> > +                      };
> > +
> > +                      port@5 {
> > +                            reg =3D <5>;
> > +                      };
> > +
> > +                      port@6 {
> > +                            reg =3D <6>;
> > +                      };
> > +
> > +                      port@7 {
> > +                            reg =3D <7>;
> > +                      };
> > +
> > +                      port@8 {
> > +                            reg =3D <8>;
> > +                      };
> > +
> > +                      port@9 {
> > +                            reg =3D <9>;
> > +                      };
> > +
>
> Stray blank line
>
> > +                };
>
>
>
> Best regards,
> Krzysztof
>

