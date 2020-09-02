Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C35325B75C
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 01:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgIBXb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 19:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgIBXbT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 19:31:19 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB537C061245
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 16:31:18 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l63so696057edl.9
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 16:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T4yXzW6yLaOrjJCWDznrsqD2chk3J8tmvftWN4ofhYI=;
        b=Xtu9LFAQ1AsuRSYENiMC1JSVEyn/r84YRw+kVkrqLSiwzEk18vBQ5Bw6DIZQQeRd55
         LwGAzvYyrHms38I0HNnvqPlCsNjOV90RlA80Ze+BfYhdDY0nXTs1o69yz0AgVedqqGFx
         qXajRu4qWBN9/Y/EfquKUuZx+dOtEt11KYUCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T4yXzW6yLaOrjJCWDznrsqD2chk3J8tmvftWN4ofhYI=;
        b=B18qoO/nZABEWdQ7Y1bRRvyfAVqA6BF3WX/UhD9AS1CrPQbVMwpHzi/QDC2jAmgfK+
         JXEu4j9YKblCC2+kyPha2dI245QscGVHDgmwmYuUv7XujIPRyV9hAVLDiRISlv+TubhN
         dMdiQ3dDCxNGQa0tI4kjpFekTvMDtRsGAvbA9uwLu79ffNMTafYKL6UEgD1hHgEyWCVk
         f+5wkcPWbey6OWx7viUhM+3Y6GSyGcPrpLeBsf5hrM/A9kN1cxjyZIJtu5OEFXOkmxYs
         DqfTj8f+qstCEhokh1i6eqChpnwd5xcWAJrV8BLf5NFJqrFUAlAsYipNYCCUMtEAcM9q
         /bgQ==
X-Gm-Message-State: AOAM533M6pnh8BoHyEJfOQvLf8jMCI5FxSTQUw7POsgZFtotoMn1unG8
        v1IDK/KHl7zhqZ3kbGtejyQKMOJp2vwiDA==
X-Google-Smtp-Source: ABdhPJwL4ApdL7apx7HtDwaPAk5g3SmkZf5lfke6bui9ZDfj/2orxSVZYXUX5GWKz+A38FZQXnynmQ==
X-Received: by 2002:aa7:da89:: with SMTP id q9mr243261eds.111.1599089477071;
        Wed, 02 Sep 2020 16:31:17 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id w14sm1092901ejn.36.2020.09.02.16.31.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 16:31:16 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id z4so1119640wrr.4
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 16:31:16 -0700 (PDT)
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr495865wrh.192.1599089475406;
 Wed, 02 Sep 2020 16:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200902224813.14283-1-tfiga@chromium.org> <20200902224813.14283-3-tfiga@chromium.org>
In-Reply-To: <20200902224813.14283-3-tfiga@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 3 Sep 2020 01:30:55 +0200
X-Gmail-Original-Message-ID: <CAAFQd5D3+yXv9iwfWwStxqUOrec3g0WjFF6ko-xRA=ejcNmhSQ@mail.gmail.com>
Message-ID: <CAAFQd5D3+yXv9iwfWwStxqUOrec3g0WjFF6ko-xRA=ejcNmhSQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] media: dt-bindings: media: i2c: Add bindings for GC5035
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hao He <hao.he@bitland.com.cn>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Xingyu Wu <wuxy@bitland.com.cn>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>,
        darfur_liu <darfur_liu@gcoreinc.com>,
        "hao.he7" <hao.he7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Self-review,

On Thu, Sep 3, 2020 at 12:48 AM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Add YAML device tree bindings for Galaxycore Inc. GC5035 imaging sensor.
>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  .../devicetree/bindings/media/i2c/gc5035.yaml | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/gc5035.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/gc5035.yaml b/Documentation/devicetree/bindings/media/i2c/gc5035.yaml
> new file mode 100644
> index 000000000000..cf8cc3b581cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/gc5035.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2019 MediaTek Inc.

Copyright 2020 Google LLC.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/gc5035.yaml
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Galaxycore Inc. GC5035 CMOS Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Tomasz Figa <tfiga@chromium.org>
> +
> +description: |-
> +  The Galaxycore Inc. GC5035 is a 5 megapixel, 1/5 inch CMOS 10-bit Bayer image
> +  sensor that delivers 2592x1944 at 30fps. This chip is programmable through
> +  an I2C interface. The image output is available via a MIPI CSI-2 interface.
> +
> +properties:
> +  compatible:
> +    const: galaxycore,gc5035
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Input clock for the sensor.
> +    items:
> +      - const: inclk

Typo: mclk.

> +
> +  clock-frequency:
> +    description:
> +      Frequency of the inclk clock in Hz.

mclk

> +
> +  iovdd-supply:
> +    description:
> +      Regulator driving the I/O power rail.
> +
> +  avdd28-supply:
> +    description:
> +      Regulator driving the analog power rail.
> +
> +  dvdd12-supply:
> +    description:
> +      Regulator driving the digital power rail.
> +
> +  resetb-gpios:
> +    description:
> +      The GPIO pin that drives the RESETB signal, controlling sensor reset.
> +      The RESETB signal must be driven low to activate the reset, so the
> +      GPIO_ACTIVE_LOW flag should be given by default.
> +
> +  pwdn-gpios:
> +    description:
> +      The GPIO pin that drives the PWDN signal, controlling sensor power-down
> +      mode. The PWDN signal must be driven low to activate the power-down
> +      mode, so the GPIO_ACTIVE_LOW flag should be given by default.
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      A node containing an output port node with an endpoint definition
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +
> +          link-frequencies: true
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +          - remote-endpoint
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-frequency
> +  - iovdd-supply
> +  - avdd28-supply
> +  - dvdd12-supply
> +  - resetb-gpios
> +  - pwdn-gpios
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gc5035: camera@10 {
> +            compatible = "galaxycore,gc5035";
> +            reg = <0x10>;
> +
> +            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
> +            pwdn-gpios = <&pio 112 GPIO_ACTIVE_LOW>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&clk_24m_cam>;
> +
> +            clocks = <&cam_osc>;
> +            clock-names = "inclk";

mclk

Best regards,
Tomasz
