Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 116351A490A
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 19:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgDJRgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 13:36:49 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46334 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgDJRgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 13:36:49 -0400
Received: by mail-oi1-f193.google.com with SMTP id q204so1937206oia.13;
        Fri, 10 Apr 2020 10:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QBEtm9wj9+GCsvuO7AqmsQRpKjkshfnjy93bDn3pJjg=;
        b=OzZlldKPcVDPnfJFdyCTsCVHKEvLo0BvyitGBt+6ZhWuJc37oDJNyUndUgQm9x4ApQ
         zFdE5yUOjF30BCEc3Zfqcv3Bdh/2sMOCOSWzvTUYGR2plwAtimFoeHnbT39/sLhMS+YU
         Z+v+bko8cbKyTA52rwDViNrRRz9jfIBs3AZU/u/DHvjWUnaggPX0LWlJNbENMDH3WHvJ
         RDcpPa29FrAO4GPOt6n8/iZJwZRPVp3mvw4IcJGZhF4rZIsmQm7ur6UX/qkNrU6GuceX
         /vzBPBKPAVXmnxbtDVFxcQ994A+CTYYDTvhELukMeRjencK6+jsFIMw/xPfWbbyVNWRI
         TtHA==
X-Gm-Message-State: AGi0PuaXxdcJCxHNEG0X8PrqDJV4y3/ssPVLhWpyzHnH/GjH9T2PBnGL
        R4dEssFFHySYsoJbDiZHsw==
X-Google-Smtp-Source: APiQypJvIzXiGQUkFI9BjUhby/lCJa4wLGEtjD/gV8K12mkSAWYPQSvkgPt6INjIArj9sD7aK4V+Kg==
X-Received: by 2002:aca:34c6:: with SMTP id b189mr4027120oia.63.1586540208773;
        Fri, 10 Apr 2020 10:36:48 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net. [99.203.29.27])
        by smtp.gmail.com with ESMTPSA id q187sm1541807oih.48.2020.04.10.10.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:36:47 -0700 (PDT)
Received: (nullmailer pid 27880 invoked by uid 1000);
        Fri, 10 Apr 2020 17:25:27 -0000
Date:   Fri, 10 Apr 2020 12:25:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        mark.rutland@arm.com, sakari.ailus@linux.intel.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V4, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
Message-ID: <20200410172527.GA24529@bogus>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
 <20200330123634.363-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330123634.363-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 30, 2020 at 08:36:33PM +0800, Dongchun Zhu wrote:
> This patch is to add the Devicetreee binding documentation and
> MAINTAINERS entry for dw9768 actuator.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 62 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> new file mode 100644
> index 0000000..8a353dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9768.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9768 Voice Coil Motor (VCM) Device Tree Bindings
> +
> +maintainers:
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> +
> +description: |-
> +  The Dongwoon DW9768 is a single 10-bit digital-to-analog (DAC) converter
> +  with 100 mA output current sink capability. VCM current is controlled with
> +  a linear mode driver. The DAC is controlled via a 2-wire (I2C-compatible)
> +  serial interface that operates at clock rates up to 1MHz. This chip
> +  integrates Advanced Actuator Control (AAC) technology and is intended for
> +  driving voice coil lenses in camera modules.
> +
> +properties:
> +  compatible:
> +    const: dongwoon,dw9768
> +
> +  reg:
> +    maxItems: 1
> +
> +  vin-supply:
> +    description:
> +      Definition of the regulator used as I2C I/O interface power supply.
> +    maxItems: 1

You can drop this. *-supply is always a single entry.

> +
> +  vdd-supply:
> +    description:
> +      Definition of the regulator used as VCM chip power supply.
> +    maxItems: 1

Same here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - vin-supply
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c2: i2c@11009000 {

i2c {

> +        clock-frequency = <400000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dw9768: camera-lens@c {
> +            compatible = "dongwoon,dw9768";
> +            reg = <0x0c>;
> +
> +            vin-supply = <&mt6358_vcamio_reg>;
> +            vdd-supply = <&mt6358_vcama2_reg>;
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 38fe2f3..5e124d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5134,6 +5134,13 @@ S:	Maintained
>  F:	drivers/media/i2c/dw9714.c
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
>  
> +DONGWOON DW9768 LENS VOICE COIL DRIVER
> +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> +
>  DONGWOON DW9807 LENS VOICE COIL DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.9.2
