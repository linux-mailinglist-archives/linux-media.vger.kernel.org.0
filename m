Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFC427467C
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 18:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIVQV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 12:21:29 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42088 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbgIVQV3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 12:21:29 -0400
Received: by mail-io1-f68.google.com with SMTP id u6so20213465iow.9;
        Tue, 22 Sep 2020 09:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WT3BlMz5H25vS9de9DwHFxmjwp6Zk6osCyQzUmqe8OI=;
        b=cuLsL8qq4zF4Xc4H+ZKXjBPmRXlpim7eFQ0b6zO0Gu4ENi6FRJC8N9bSgygu21FN9a
         yqQaq6uZ0eySYx+5GB/fScQ68CsZMjuFiUyuNsX/FOTawLDm4iJWZPVbV96ouVnjMw7g
         plOW8oMy/FF8TNJV4B08Q5C3sqRmLTtKsbuh5morVAfjTMq9AFl1AHlhg+fpLkVQj3Dt
         tvgoR4CKhYy77i9nM2yw12sOnznVwsl4HoqFzAUTf2Ajkv+/4tseHUwS67J3qAMktEyc
         DyitM9uAbrAQqzpJIA1DSLCZRyQk5/RwOcxFlwZMbo99O1lEiNfcc8wBBdmXMpFxuujS
         oZ+Q==
X-Gm-Message-State: AOAM532gUdW2ZpoQaTrIkzn2YbdGQXEIhb5loBlHbsP6F0i/J6zvos4u
        +jzVNy7xDAVsyKDYdPK7U22lg9x5AaeM
X-Google-Smtp-Source: ABdhPJz7KTEOSv42ZkpPp51GkLs9/Gz5b92l1Z3lYi3S6hyiYv53JM4jJs/+1t6UAUFSNTJ4O8HyIA==
X-Received: by 2002:a6b:d908:: with SMTP id r8mr4081861ioc.21.1600791687897;
        Tue, 22 Sep 2020 09:21:27 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l4sm4461668ilk.14.2020.09.22.09.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 09:21:27 -0700 (PDT)
Received: (nullmailer pid 2795412 invoked by uid 1000);
        Tue, 22 Sep 2020 16:21:26 -0000
Date:   Tue, 22 Sep 2020 10:21:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] media: dt-bindings: convert CODA VPU bindings to yaml
Message-ID: <20200922162126.GA2791437@bogus>
References: <20200922120007.12766-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922120007.12766-1-p.zabel@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 22, 2020 at 02:00:07PM +0200, Philipp Zabel wrote:
> Convert to YAML, add missing "fsl,imx6dl-vpu", "cnm,coda960"

Seems like a lot more cnm compatible additions than what's mentioned 
here. I'm okay with some changes in the conversion which were 
inconsistencies or errors, but just enumerate them here.

> compatible, and specify the power-domain property for i.MX6.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/media/coda.txt        |  31 -----
>  .../devicetree/bindings/media/coda.yaml       | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 110 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/coda.txt
>  create mode 100644 Documentation/devicetree/bindings/media/coda.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/coda.txt b/Documentation/devicetree/bindings/media/coda.txt
> deleted file mode 100644
> index 90eb74cc1993..000000000000
> --- a/Documentation/devicetree/bindings/media/coda.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Chips&Media Coda multi-standard codec IP
> -========================================
> -
> -Coda codec IPs are present in i.MX SoCs in various versions,
> -called VPU (Video Processing Unit).
> -
> -Required properties:
> -- compatible : should be "fsl,<chip>-src" for i.MX SoCs:
> -  (a) "fsl,imx27-vpu" for CodaDx6 present in i.MX27
> -  (b) "fsl,imx51-vpu" for CodaHx4 present in i.MX51
> -  (c) "fsl,imx53-vpu" for CODA7541 present in i.MX53
> -  (d) "fsl,imx6q-vpu" for CODA960 present in i.MX6q
> -- reg: should be register base and length as documented in the
> -  SoC reference manual
> -- interrupts : Should contain the VPU interrupt. For CODA960,
> -  a second interrupt is needed for the MJPEG unit.
> -- clocks : Should contain the ahb and per clocks, in the order
> -  determined by the clock-names property.
> -- clock-names : Should be "ahb", "per"
> -- iram : phandle pointing to the SRAM device node
> -
> -Example:
> -
> -vpu: vpu@63ff4000 {
> -	compatible = "fsl,imx53-vpu";
> -	reg = <0x63ff4000 0x1000>;
> -	interrupts = <9>;
> -	clocks = <&clks 63>, <&clks 63>;
> -	clock-names = "ahb", "per";
> -	iram = <&ocram>;
> -};
> diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
> new file mode 100644
> index 000000000000..c32415b46761
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/coda.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/coda.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chips&Media Coda multi-standard codec IP
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |-
> +  Coda codec IPs are present in i.MX SoCs in various versions,
> +  called VPU (Video Processing Unit).
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: fsl,imx27-vpu
> +          - const: cnm,codadx6
> +      - items:
> +          - const: fsl,imx51-vpu
> +          - const: cnm,codahx4
> +      - items:
> +          - const: fsl,imx53-vpu
> +          - const: cnm,coda7541
> +      - items:
> +          - enum:
> +              - fsl,imx6dl-vpu
> +              - fsl,imx6q-vpu
> +          - const: cnm,coda960
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PER clock
> +      - description: AHB interface clock
> +
> +  clock-names:
> +    items:
> +      - const: per
> +      - const: ahb
> +
> +  resets:
> +    maxItems: 1
> +
> +  iram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle pointing to the SRAM device node
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cnm,coda960
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: BIT processor interrupt
> +            - description: JPEG unit interrupt
> +
> +        interrupt-names:
> +          items:
> +            - const: bit
> +            - const: jpeg
> +    else:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: BIT processor interrupt
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx6dl-vpu
> +              - fsl,imx6q-vpu
> +    then:
> +      properties:
> +        power-domains:
> +          $ref: /schemas/types.yaml#/definitions/phandle
> +          description: phandle pointing to the PU power domain
> +          maxItems: 1
> +
> +examples:
> +  - |
> +    vpu: video-codec@63ff4000 {
> +        compatible = "fsl,imx53-vpu", "cnm,coda7541";
> +        reg = <0x63ff4000 0x1000>;
> +        interrupts = <9>;
> +        clocks = <&clks 63>, <&clks 63>;
> +        clock-names = "ahb", "per";
> +        iram = <&ocram>;
> +    };
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3126fc2cca2..01be39a3265e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4332,7 +4332,7 @@ CODA V4L2 MEM2MEM DRIVER
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/coda.txt
> +F:	Documentation/devicetree/bindings/media/coda.yaml
>  F:	drivers/media/platform/coda/
>  
>  CODE OF CONDUCT
> -- 
> 2.20.1
> 
