Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436AE3FBDCC
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 23:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbhH3VBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 17:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbhH3VBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 17:01:14 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAB3C061575;
        Mon, 30 Aug 2021 14:00:20 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id u14so33859620ejf.13;
        Mon, 30 Aug 2021 14:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KWiHNXS+3DcOlsVpnDVjQ/m3C1IyjZ5owtbI17urlSs=;
        b=bls3vPsE9/mpAehw9h8f0bfIKo/ur5D3gapsk6ABlwMpjeNlxnNftLg5NnlgKbrS4J
         /sKHmCpb2siio/kdCeNycUZ/YaVbk+xwo5ZfnVTuL1OsnztQ4y3HVsto7kYb0mDWWMfq
         8WvxYIJTIg9sE0Cfxp8919Ne5mZ0AxMthoZinPZFWWUC00ZrTYoNt8QeXuqlqGirttHG
         k+ZwbnF6G40YvyJTJXblgBwpSjnNY3tWBrKGzhYGJRP8X2ebVIFiUH+zW4cD75T377Xz
         la5A1p6W1yPx/RLEbxQqKeK2sbulJg1f+x+IjRuzhp187q928KQ6NyqQGyxu+URoxBD7
         Su9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KWiHNXS+3DcOlsVpnDVjQ/m3C1IyjZ5owtbI17urlSs=;
        b=QyWx7lxddHyrmJJ1pgY/la0FPXouMksveAZZSrU6c2/qoW7O5RdPEVz6vwGoZPc2vA
         c5ckT7OXYEVUwpi9d1kLvaaB9CuMJIy8Zi6UJMqmA+e4enhwcJinZzKxjr0BD2GahG3K
         nMEnQF4U+B/BXCcGlyCP+qdaB9u5q6WM4tYg++WPtGaLhq7qLXysGnjFlUlLiMoIwYAF
         ctWcTuI/UPh8JR6I6pjVb++V/Oyhi6HPvPM17IDirjkiXwCTxegQZlA0CGX7X9mmuAPf
         LlzpTyni/m1N3Ta+CciOu71QTz0NnMTDMRdQeq+5aKD5L9CF7hPYevrF8fp/eZB2YaEI
         QDQw==
X-Gm-Message-State: AOAM530cyMuS748lHKcthIyovnXqigJChCnO30v/8UQAFQF/lQzT9a2q
        hqipw9Hf7SwmK2im6JRIFQG2ji7iHwmcmyYc
X-Google-Smtp-Source: ABdhPJwhD4PkYb6968XTC6ESe+L5tvt2UaX2SD+FMpytvd38l0rgpOZLeQtVZrtL5iuFcKST3zh7Iw==
X-Received: by 2002:a17:906:1451:: with SMTP id q17mr27376832ejc.214.1630357219217;
        Mon, 30 Aug 2021 14:00:19 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id dk6sm8164992edb.14.2021.08.30.14.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 14:00:18 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] dt-bindings: phy: phy-rockchip-dphy-rx0: add
 support for tx1rx1 phy
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
 <20210830180758.251390-5-mike.rudenko@gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <60aa055c-d872-3e5c-3c85-09300215a60e@gmail.com>
Date:   Mon, 30 Aug 2021 23:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830180758.251390-5-mike.rudenko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mikhail,

Some comments below. Have a look if it is useful.

On 8/30/21 8:07 PM, Mikhail Rudenko wrote:
> RK3399 TX1RX1 D-PHY is not a child of GRF and uses reg, thus add
> corresponding properties conditionally. It also requires DSI clock to
> operate, so check for it. Since we now support both rx0 and tx1rx1,
> rename the schema to rockchip-mipi-dphy-rx.yaml.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  ...hy-rx0.yaml => rockchip-mipi-dphy-rx.yaml} | 39 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/phy/{rockchip-mipi-dphy-rx0.yaml => rockchip-mipi-dphy-rx.yaml} (65%)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml b/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx.yaml
> similarity index 65%
> rename from Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> rename to Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx.yaml
> index 7d888d358823..f42319448fc9 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx.yaml
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy-rx0.yaml#
> +$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy-rx.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Rockchip SoC MIPI RX0 D-PHY Device Tree Bindings
> +title: Rockchip SoC MIPI RX0/TX1RX1 D-PHY Device Tree Bindings
>  
>  maintainers:
>    - Helen Koike <helen.koike@collabora.com>
> @@ -16,19 +16,28 @@ description: |
>  
>  properties:
>    compatible:
> -    const: rockchip,rk3399-mipi-dphy-rx0
> +    enum:
> +      - rockchip,rk3399-mipi-dphy-rx0
> +      - rockchip,rk3399-mipi-dphy-tx1rx1
> +

> +  reg:
> +    maxItems: 1

This allows every node to have a reg property.

>  
>    clocks:
> +    minItems: 3
>      items:
>        - description: MIPI D-PHY ref clock
> -      - description: MIPI D-PHY RX0 cfg clock
> +      - description: MIPI D-PHY RX0/TX1RX1 cfg clock
>        - description: Video in/out general register file clock
> +      - description: MIPI D-PHY DSI clock
>  
>    clock-names:
> +    minItems: 3
>      items:
>        - const: dphy-ref
>        - const: dphy-cfg
>        - const: grf
> +      - const: dsi
>  
>    '#phy-cells':
>      const: 0
> @@ -37,6 +46,12 @@ properties:
>      description: Video in/out power domain.
>      maxItems: 1
>  

> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the general register file
> +      (GRF), required for TX1RX1 MIPI D-PHY on RK3399.

This allows every node to have a rockchip,grf property.

> +
>  required:
>    - compatible
>    - clocks
> @@ -44,6 +59,22 @@ required:
>    - '#phy-cells'
>    - power-domains
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +          const: rockchip,rk3399-mipi-dphy-tx1rx1
> +then:

> +  required:

Move/swap the properties section above the required section.

> +    - reg
> +    - rockchip,grf
> +
> +  properties:

  reg:
    maxItems: 1

> +    clocks:
> +      minItems: 4
> +    clock-names:
> +      minItems: 4

  rockchip,grf:
    $ref: /schemas/types.yaml#/definitions/phandle
    description:
      The phandle of the syscon node for the general register file(GRF).


", required for TX1RX1 MIPI D-PHY on RK3399."

This phrase is already said/done with the "required:" section above

>  additionalProperties: false
>  
>  examples:
> 
