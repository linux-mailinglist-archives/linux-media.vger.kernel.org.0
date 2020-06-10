Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8990F1F5C47
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 21:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730463AbgFJTy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 15:54:26 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41917 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgFJTxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 15:53:52 -0400
Received: by mail-io1-f65.google.com with SMTP id o5so3691084iow.8;
        Wed, 10 Jun 2020 12:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O+t9lN1UMgBXDzBprmivY3nXV0Nk80cUhVR4G1aXLM8=;
        b=Yxq0VeEUi56pSR8YYDTj8uqLk4dp5LqdgvZkrNQiuE9tExPtVnhb7YCQcBExeuHN8D
         +4nH3vPA2RRKd52GTD1AsIywWzblYmWXhfGacKD0UIUBAJ0uquAiasaMwI5M9jRT25sk
         hYgzQilQqmG0BswRNV5jaRHWrIa7eMQgRcylgcIIIFoS4VkH52d/7LspaPD6EELhc4XH
         zMwJiIddk5gVM340V5KCuqS5OxWjj5fLiPn7SM6rXXFWILm4naiq9iLPIaP+2+ZM/SuI
         e+GwTBI2vYUhxI5su7dHTr4Jecy8OyTVeUUQ7B2jlAYL8rzjg1hpc2VoQCe73g+5YuDW
         dKEw==
X-Gm-Message-State: AOAM5331UfG7AsOxR/turAwT/BDJct+m0XiMamHiUdmldXiUDx4MrY8Y
        kSPN8jb5Oh9EL5ekNa1PdA==
X-Google-Smtp-Source: ABdhPJxgi35NvZv7yMGHmOA+wBKY4rZbmDSzHwLSvytHAzYSEuK9hWs1yklVui3HUx2F1LGdIWldTg==
X-Received: by 2002:a02:908b:: with SMTP id x11mr4496909jaf.41.1591818830814;
        Wed, 10 Jun 2020 12:53:50 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id w29sm428458ila.26.2020.06.10.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 12:53:49 -0700 (PDT)
Received: (nullmailer pid 3611634 invoked by uid 1000);
        Wed, 10 Jun 2020 19:53:48 -0000
Date:   Wed, 10 Jun 2020 13:53:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Add ch7322 media i2c device
Message-ID: <20200610195348.GA3606875@bogus>
References: <20200602190914.218541-1-jnchase@google.com>
 <20200602190914.218541-2-jnchase@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602190914.218541-2-jnchase@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 02, 2020 at 03:09:13PM -0400, Jeff Chase wrote:
> The ch7322 is a Chrontel CEC controller.
> 
> Signed-off-by: Jeff Chase <jnchase@google.com>
> ---
>  .../bindings/media/i2c/chrontel,ch7322.yaml   | 67 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  MAINTAINERS                                   |  7 ++
>  3 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> new file mode 100644
> index 000000000000..daa2869377c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/i2c/chrontel,ch7322.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Chrontel HDMI-CEC Controller
> +
> +maintainers:
> +  - Jeff Chase <jnchase@google.com>
> +
> +description:
> +  The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
> +  programmable through I2C and drives a single CEC line.
> +
> +properties:
> +  compatible:
> +    const: chrontel,ch7322
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the RESET pin, if any. This
> +      pin is active-low.
> +    maxItems: 1
> +
> +  standby-gpios:
> +    description:
> +      Reference to the GPIO connected to the OE pin, if any. When low
> +      the device will respond to power status requests with "standby"
> +      if in auto mode.
> +    maxItems: 1
> +
> +  # see ../cec.txt
> +  hdmi-phandle:
> +    description: phandle to the HDMI controller
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      ch7322@75 {
> +        compatible = "chrontel,ch7322";
> +        reg = <0x75>;
> +        interrupts = <47 IRQ_TYPE_EDGE_RISING>;
> +        standby-gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
> +        reset-gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
> +        hdmi-phandle = <&hdmi>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index d3891386d671..7794ffccd325 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -187,6 +187,8 @@ patternProperties:
>      description: ChipOne
>    "^chipspark,.*":
>      description: ChipSPARK
> +  "^chrontel,.*":
> +    description: Chrontel, Inc.

This is in Linus' master already, so you can drop it. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
