Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651A519C046
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 13:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388136AbgDBLfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 07:35:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43141 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388114AbgDBLfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 07:35:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id 91so1833123wri.10;
        Thu, 02 Apr 2020 04:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3jRj6ArkhLpwKk89KkNwwo0VNZLkATY3JVXtCwdIArM=;
        b=K5EVHPS43D3wRMjNBYwFajRGzmakbnuj+UOMC+I3xmc/oBhq64lltzXE7tKv9ShvUq
         CtkZGwuDchILQM06WFVgVpu9QVxOfiQOJPLogjjrq7Noy1yl/sgroQB7YifPJ9J2Q9Sn
         nEWmbWbVkGjxYs1EGON1aNgsjj8TbBTVajQw2Cqh9bvzZiyLgOvXfqqaSwiChuPcvQwj
         UXVolcpVUn68hUorItLk6ayhBoV+pxvY17WazrWj4vC5NQ059F0EJe2koBP1s1NG0ESl
         7eSrl2K/7zk/XIPmzVQ+x2c5+RHguj+65zeVfXvTlvo/Jx/GK13Jx3Kn4i8RrKOmmxci
         eyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3jRj6ArkhLpwKk89KkNwwo0VNZLkATY3JVXtCwdIArM=;
        b=qclcfVIlMeIgQiM9MXrTwYLYfRdP2RE6XYp0FAaR0VkT0e47sJU1196PLIEcy7YhR4
         qE+N2FxxSLZffewUQYkV6ug5okYMZ2UZ+fVeDCkoam0TShz/+c8BiV1H070IWPb4FqjY
         Rd9CaZwKxBTfgjqCt8vfb+GRZDx0qOWdXvGAWrKH3DkxzNdEcmw5Va04acpXvmJGv42O
         Nka9kVzWbec0tKYI5FugwmunzYhJVh1XzORoRRbKbbJ1aUC4CPf2A9rfsBAKWIlyD0w3
         mRwqz0yiZIEdcRbc6Dgf3468ksNA/KC4yrnYaFHZA0G6CGPm4lOnOiGdUjyWFes8Z99x
         SNWg==
X-Gm-Message-State: AGi0PuZ38bBhYR8sl0Vly+dqoDMIUE4on0LMQ8VHvN6rJh1k4Xsbl4Ul
        90D//jO5oMwFdqQs1AKRn+mMFX4j
X-Google-Smtp-Source: APiQypJScYhchNteJw20HMwQtHnfXa6FcDztGwsdbPdIPctfKge9tKbWTf7Ki51Ie81cFzzp4rihKQ==
X-Received: by 2002:adf:97d0:: with SMTP id t16mr3091065wrb.343.1585827308886;
        Thu, 02 Apr 2020 04:35:08 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id m19sm5863793wml.21.2020.04.02.04.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 04:35:08 -0700 (PDT)
To:     helen.koike@collabora.com
Cc:     dafna.hirschfeld@collabora.com, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        karthik.poduval@gmail.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <20200402000234.226466-3-helen.koike@collabora.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: rkisp1: move rockchip-isp1
 bindings out of staging
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <7e53ec1e-33bd-3385-40a0-de3fd00ad1a1@gmail.com>
Date:   Thu, 2 Apr 2020 13:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402000234.226466-3-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

> # SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> %YAML 1.2
> ---
> $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> $schema: http://devicetree.org/meta-schemas/core.yaml#
> 

> title: Rockchip SoC Image Signal Processing unit v1

Where do we need 'v1' for? Is there a 'v2'?

> 
> maintainers:
>   - Helen Koike <helen.koike@collabora.com>
> 
> description: |
>   Rockchip ISP1 is the Camera interface for the Rockchip series of SoCs
>   which contains image processing, scaling, and compression functions.
> 
> properties:
>   compatible:
>     const: rockchip,rk3399-cif-isp
> 
>   reg:
>     maxItems: 1
> 
>   interrupts:
>     maxItems: 1
> 
>   iommus:
>     maxItems: 1
> 
>   power-domains:
>     maxItems: 1
> 
>   phys:
>     maxItems: 1
>     description: phandle for the PHY port
> 
>   phy-names:
>     const: dphy
> 
>   clocks:
>     items:
>       - description: ISP clock
>       - description: ISP AXI clock clock
>       - description: ISP AXI clock  wrapper clock
>       - description: ISP AHB clock clock
>       - description: ISP AHB wrapper clock
> 
>   clock-names:
>     items:
>       - const: clk_isp
>       - const: aclk_isp
>       - const: aclk_isp_wrap
>       - const: hclk_isp
>       - const: hclk_isp_wrap
> 
>   # See ./video-interfaces.txt for details
>   ports:
>     type: object
>     additionalProperties: false
> 
>     properties:
>       "#address-cells":
>         const: 1
> 
>       "#size-cells":
>         const: 0
> 
>       port@0:
>         type: object
>         description: connection point for sensors at MIPI-DPHY RX0

>         additionalProperties: false

Nothing required here?

> 
>         properties:
>           "#address-cells":
>             const: 1
> 
>           "#size-cells":
>             const: 0
> 
>           reg:
>             const: 0
> 
>         patternProperties:
>           endpoint:
>             type: object
>             additionalProperties: false
> 
>             properties:
>               reg:
>                 maxItems: 1
> 
>               data-lanes:
>                 minItems: 1
>                 maxItems: 4
> 
>               remote-endpoint: true
> 
>     required:

>       - port@0

The use of '@0' makes "#address-cells" and "#size-cells" also a requirement.

- "#address-cells"
- "#size-cells"

> 
> required:
>   - compatible

How about 'reg'?

- reg

>   - interrupts
>   - clocks
>   - clock-names
>   - power-domains
>   - iommus
>   - phys
>   - phy-names
>   - ports
> 
> additionalProperties: false
> 
> examples:
>   - |
> 
>     #include <dt-bindings/clock/rk3399-cru.h>
>     #include <dt-bindings/interrupt-controller/arm-gic.h>
>     #include <dt-bindings/power/rk3399-power.h>
> 
>     parent0: parent@0 {
>         #address-cells = <2>;
>         #size-cells = <2>;
> 
>         isp0: isp0@ff910000 {
>             compatible = "rockchip,rk3399-cif-isp";
>             reg = <0x0 0xff910000 0x0 0x4000>;
>             interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
>             clocks = <&cru SCLK_ISP0>,
>                      <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
>                      <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
>             clock-names = "clk_isp",
>                           "aclk_isp", "aclk_isp_wrap",
>                           "hclk_isp", "hclk_isp_wrap";
>             power-domains = <&power RK3399_PD_ISP0>;
>             iommus = <&isp0_mmu>;
>             phys = <&dphy>;
>             phy-names = "dphy";
> 
>             ports {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> 
>                 port@0 {
>                     #address-cells = <1>;
>                     #size-cells = <0>;
>                     reg = <0>;
> 
>                     mipi_in_wcam: endpoint@0 {
>                         reg = <0>;
>                         remote-endpoint = <&wcam_out>;
>                         data-lanes = <1 2>;
>                     };
> 
>                     mipi_in_ucam: endpoint@1 {
>                         reg = <1>;
>                         remote-endpoint = <&ucam_out>;
>                         data-lanes = <1>;
>                     };
>                 };
>             };
>         };
> 

>         i2c7: i2c@ff160000 {
>             clock-frequency = <400000>;
>             #address-cells = <1>;
>             #size-cells = <0>;

Incomplete example.
From i2c-rk3x.yaml:

required:
  - compatible
  - reg
  - interrupts
  - clocks
  - clock-names

> 
>             wcam: camera@36 {
>                 compatible = "ovti,ov5695";
>                 reg = <0x36>;
> 
>                 port {
>                     wcam_out: endpoint {
>                         remote-endpoint = <&mipi_in_wcam>;
>                         data-lanes = <1 2>;
>                     };
>                 };
>             };
> 
>             ucam: camera@3c {
>                 compatible = "ovti,ov2685";
>                 reg = <0x3c>;
> 
>                   port {
>                       ucam_out: endpoint {
>                           remote-endpoint = <&mipi_in_ucam>;
>                           data-lanes = <1>;
>                       };
>                   };
>             };
>         };
>     };
