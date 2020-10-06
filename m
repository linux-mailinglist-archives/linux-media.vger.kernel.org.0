Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E33228536F
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 22:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgJFUrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 16:47:16 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35119 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbgJFUrQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 16:47:16 -0400
Received: by mail-oi1-f193.google.com with SMTP id w141so25733oia.2;
        Tue, 06 Oct 2020 13:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/pUaqHHp4YUjL7pFKi0B4arMijIiTNmIeTJV/6lNHyc=;
        b=tJW18xbLt1MxKOldnaY9bNpUpjMVijqmVAWdXIg9ZxD2mH7ZVkXiDHKyEioj99bJDi
         ABwDgVyFFYTJe55lnI8mBXs3euXhcTf7sJvY6UNhZbxv6cz4LE4FzvXfqxw6BIjU55nY
         HdM7YgP0AFfViLP/pYtpAUgaFcm04KndSFA313JweaJWl4NLlSRpOZHZ7fB0VosDUEHW
         aMVOG2wQO7ruKfyTZvQysIdtUuIUeJPpp+W0V85aQOVpz+4tSTP8KFIa2Fxj+FoKB+rf
         QPBkR6u7inDe3ht4OaG34htplwi5QxezBc5e61+b0Msm1Oa0Rfl7hgCAbv63osublIhv
         H7qQ==
X-Gm-Message-State: AOAM530Mp5q7ZIBOIKhVldDr1T5MydCCdbvyeSylv9vWJSxQbCmT7eWo
        uoOL8UqDPfKjhdgLektYTw==
X-Google-Smtp-Source: ABdhPJzLi0UmI+ty/BGog5CRDpbjptdkb8K2wdmNxkwBuAE3Na+erEJDB1gCsMcV70FZ6LO+f0C/0w==
X-Received: by 2002:aca:c485:: with SMTP id u127mr71293oif.92.1602017234868;
        Tue, 06 Oct 2020 13:47:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v11sm1136710otj.73.2020.10.06.13.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 13:47:14 -0700 (PDT)
Received: (nullmailer pid 2810273 invoked by uid 1000);
        Tue, 06 Oct 2020 20:47:13 -0000
Date:   Tue, 6 Oct 2020 15:47:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bogdan Togorean <bogdan.togorean@analog.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 ADDI9036
Message-ID: <20201006204713.GA2807001@bogus>
References: <20201002133537.172379-1-bogdan.togorean@analog.com>
 <20201002133537.172379-2-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002133537.172379-2-bogdan.togorean@analog.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 02, 2020 at 04:35:17PM +0300, Bogdan Togorean wrote:
> Add YAML device tree bindings for Analog Devices Inc. ADDI9036 CCD TOF
> front-end.
> 
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
> v2: added reg property description
> ---
>  .../bindings/media/i2c/adi,addi9036.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> new file mode 100644
> index 000000000000..7c4af704db98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/adi,addi9036.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADDI9036 VGA CCD Time of Flight Sensor
> +
> +maintainers:
> +  - Bogdan Togorean <bogdan.togorean@analog.com>
> +
> +description: |-
> +  The ADDI9036 is a complete, 45 MHz, front-end solution for charge coupled
> +  device (CCD) time of flight (TOF) imaging applications. It is programmable
> +  through I2C interface. Image data is sent through MIPI CSI-2 2 lanes and
> +  can output two RAW12 packed data streams. One is IR and the other is Depth.
> +  Each data stream is on a separate or same MIPI Virtual Channel, depending
> +  on configuration and each have 640x480 resolution.
> +
> +properties:
> +  compatible:
> +    const: adi,addi9036
> +
> +  reg:
> +    description: I2C device address

Can drop this.

> +    maxItems: 1
> +
> +  reset-gpios:

maxItems: 1

> +    description: |-
> +      Reference to the GPIO connected to the RST/SYNC pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The sensor supports two-lane operation.
> +              For two-lane operation the property must be set to <1 2>.
> +            items:
> +              - const: 1
> +              - const: 2

If this is the only possible setting, then why does it need to be in DT?

> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        addi9036: addi9036_tof@64 {
> +            compatible = "adi,addi9036";
> +            reg = <0x64>;
> +
> +            reset-gpios = <&gpio 41 1>;
> +
> +            port {
> +                addi9036_ep: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.28.0
> 
