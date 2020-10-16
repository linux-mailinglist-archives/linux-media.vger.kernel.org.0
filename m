Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E4F290799
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 16:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409240AbgJPOom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 10:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409236AbgJPOoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 10:44:38 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36758C061755;
        Fri, 16 Oct 2020 07:44:38 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z22so1738007wmi.0;
        Fri, 16 Oct 2020 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zXODRUIxIpwKwJnSwrcHxYeoA1EaeMgbXtO86KGA4Sk=;
        b=iZlQJVk5M/oGVgVbnJ1fmKKMBwLO8N/M9kVpvvQGM3MMRHSY4gDdkVMjFyCix28Ohe
         bWiARwIx9YmYIlkzZNfO3DeQcI3YfjSxWWF/7z+vFQXH5nQJsvJMfN19UItq8qH6CffM
         mbUZLzCBLA0DrkGDRY9UgahzECFJpM2Wq+Lw+pi4k85yCjS+V1seGtCQr1W2WPMS7yw7
         tREmQYP/PqnZZR7YPzHZ/x5MXEpPFbTNumZfDwVeMOd0jIQ+uWNTqRXDdYsvlBMptgiL
         gy3HgJEgY4k+ne+O1nQc84u+TvTkMwSIbtOy0ZbVkqhfj4dzQvz8s1orlQKAcA5MCOEe
         O3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zXODRUIxIpwKwJnSwrcHxYeoA1EaeMgbXtO86KGA4Sk=;
        b=jMy4+SLwOzgW7H5z39WIdje/MryB1Ieo05qwVyJt//OH3BR35+XgORtkSJ3D/PAW5J
         xYOJnKNQ3QB301/jHA3W/4dtQ8OCy+FSpS4G4ZvOYkD8o32z5eu/kBM6fNxvyMH+w/wY
         Ck4OwKXI+XZDoR2WQA661akYWbw8E/J1zYU/zyaGTc5BJRUpfqGo4K8IkaI5nG7nVSY7
         AoWiqoq55mY13O0WSsejmQVj4nJ+sVfmmYAqGRyixCdZ50jS4dmy1YfF5XIEbbe/mNcJ
         0acJaRmrg8ulQ1L5MI1oP78SY4bahYqS+JoRTuu1Hjrhd6pJN5MvS8RSeDNDuXdGWyUj
         PObg==
X-Gm-Message-State: AOAM530Ykhij1/nch+QyOYT9Ddhmg2Bo7jXy/ihGZydKvfMj4astYMqz
        X977fXk6XW+W5jigSmWGQE8=
X-Google-Smtp-Source: ABdhPJwTFcYef2RzYeDCbWKQH6nOI96l/QjL1QtGqRk6kc8BMQRau70UzPy5IKmL+Jjyq36ImsBwxg==
X-Received: by 2002:a1c:5545:: with SMTP id j66mr4355295wmb.31.1602859476359;
        Fri, 16 Oct 2020 07:44:36 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id b25sm2892005wmj.21.2020.10.16.07.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:44:35 -0700 (PDT)
Date:   Fri, 16 Oct 2020 15:44:33 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: imx7-csi: convert bindings to yaml
Message-ID: <20201016144433.abhe57lgkqnxdxyq@arch-thunder.localdomain>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-3-rmfrfs@gmail.com>
 <20201015152546.s5fvuxklgludyv2u@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015152546.s5fvuxklgludyv2u@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Oct 15, 2020 at 05:25:46PM +0200, Jacopo Mondi wrote:
> Hi Rui,
> 
> On Wed, Oct 14, 2020 at 03:27:58PM +0100, Rui Miguel Silva wrote:
> > Convert imx7-csi bindings documentation to yaml schema, remove the
> > textual bindings document and update MAINTAINERS entry.
> >
> > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > ---
> >  .../devicetree/bindings/media/imx7-csi.txt    | 42 ----------
> >  .../bindings/media/nxp,imx7-csi.yaml          | 84 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 85 insertions(+), 43 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/imx7-csi.txt b/Documentation/devicetree/bindings/media/imx7-csi.txt
> > deleted file mode 100644
> > index d80ceefa0c00..000000000000
> > --- a/Documentation/devicetree/bindings/media/imx7-csi.txt
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -Freescale i.MX7 CMOS Sensor Interface
> > -=====================================
> > -
> > -csi node
> > ---------
> > -
> > -This is device node for the CMOS Sensor Interface (CSI) which enables the chip
> > -to connect directly to external CMOS image sensors.
> > -
> > -Required properties:
> > -
> > -- compatible    : "fsl,imx7-csi" or "fsl,imx6ul-csi";
> > -- reg           : base address and length of the register set for the device;
> > -- interrupts    : should contain CSI interrupt;
> > -- clocks        : list of clock specifiers, see
> > -        Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> > -- clock-names   : must contain "mclk";
> > -
> > -The device node shall contain one 'port' child node with one child 'endpoint'
> > -node, according to the bindings defined in:
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -In the following example a remote endpoint is a video multiplexer.
> > -
> > -example:
> > -
> > -                csi: csi@30710000 {
> > -                        #address-cells = <1>;
> > -                        #size-cells = <0>;
> > -
> > -                        compatible = "fsl,imx7-csi";
> > -                        reg = <0x30710000 0x10000>;
> > -                        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > -                        clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
> > -                        clock-names = "mclk";
> > -
> > -                        port {
> > -                                csi_from_csi_mux: endpoint {
> > -                                        remote-endpoint = <&csi_mux_to_csi>;
> > -                                };
> > -                        };
> > -                };
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > new file mode 100644
> > index 000000000000..9fe064dd5ba3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> Shouldn't bindings be dual licensed ?

right.

> 
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX7 CMOS Sensor Interface
> > +
> > +maintainers:
> > +  - Rui Miguel Silva <rmfrfs@gmail.com>
> > +
> > +description: |
> > +  This is device node for the CMOS Sensor Interface (CSI) which enables the
> > +  chip to connect directly to external CMOS image sensors.
> 
> Pretty cryptic, not your fault as it was there already. Is NXP using
> CSI as a name but it's not really MIPI CSI-2 ? This seems to be a
> bridge, right ?

Correct, original naming issues.

> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx7-csi
> > +      - fsl,imx6ul-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: mclk
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +    description:
> > +      A node containing input port nodes with endpoint definitions as documented
> > +      in Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          remote-endpoint: true
> > +
> > +        required:
> > +          - remote-endpoint
> > +
> > +    required:
> > +      - endpoint
> 
> As per the comment on ov2680, this last part can be removed
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - port
> > +
> > +unevaluatedProperties: false
> 
> additionalProperties: false ?
> 
> This apart
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks,
Cheers,
   Rui
> 
> Thanks
>   j
> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx7d-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    csi: csi@30710000 {
> > +            compatible = "fsl,imx7-csi";
> > +            reg = <0x30710000 0x10000>;
> > +            interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +            clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
> > +            clock-names = "mclk";
> > +
> > +            port {
> > +                    csi_from_csi_mux: endpoint {
> > +                            remote-endpoint = <&csi_mux_to_csi>;
> > +                    };
> > +            };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 926dcdc4794c..b7f7f14cd85b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10773,8 +10773,8 @@ L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media_tree.git
> >  F:	Documentation/admin-guide/media/imx7.rst
> > -F:	Documentation/devicetree/bindings/media/imx7-csi.txt
> >  F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > +F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> >  F:	drivers/staging/media/imx/imx7-media-csi.c
> >  F:	drivers/staging/media/imx/imx7-mipi-csis.c
> >
> > --
> > 2.28.0
> >
