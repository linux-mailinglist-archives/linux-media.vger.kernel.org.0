Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7694E1952DC
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 09:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgC0IbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 04:31:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43885 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0IbL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 04:31:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id m11so4444975wrx.10
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7qMxcUuECzy6UW7EY22DAqOxFR3J+yYatNeUV89Utj0=;
        b=Re9nh7mY7E2XnsoW7UqnE/ZbPpu/RAKnPlkcHVa+kmfTNDW7Q8B+tS5p7UHi+5cQzr
         BoVPWRVPSDacWjh56gaT78/RFhIEV+yvCIrnphWAOihwXMbTJ3wEJabJ9p/kvd359VZW
         DHiulHb5HIhXw2KzkMMZ/m6cgb0duHKD+TrVUQa4iTBBFWqefNuYnKCdHNTIOS8awbKW
         ElPVI6HDUuw7o2+SI6O/SoB/QrV4uSimO/Lht54lGbHc5r0Jr0thhgokUFlgR3yS/VBV
         LJQVP8XMaQrc+enAiFb6qurB13hn5fbTUYDDiEfWMdTFHH579thoAdWbrBFW7mHhF5DR
         nkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7qMxcUuECzy6UW7EY22DAqOxFR3J+yYatNeUV89Utj0=;
        b=iuvxkC8reWdTHl8D06lw/1mMyi8oH07lOBAxTr7ZFengTjy+Et6DYd3bnmag4+Vt/C
         O3mdYcJR75hO324MdCrn5Jl05EcrwzgAMvsK5KQvYb7k+2vcJnpwOFR3QlNB09At7r5T
         pbl1kjxOeD71jzr9L7gAZSQjUA7pZ9h0plXTtHwIMfuO9mFVr2NV68Tj62bPUoNQ2O4v
         UPpc3WhAtJe4Z+siqpt9/IqZtCB9o06N0+JTWGb89/2a6+zolrPmdvTpIFt4+swri32+
         jEB2SZbFXc6LMRViRxe+SSDfoY2JaZvyGbMWY5mcNzFpxgb06jbhSW7N3kHZbhnE3wjb
         DU+w==
X-Gm-Message-State: ANhLgQ0yrD8wRU7pARZH9y412T3O6Audpz4P0wXuPHJzrX8SOei1TY6x
        8LxcftlSxrs2VXazvAmxphHNbg==
X-Google-Smtp-Source: ADFU+vsnkuuXK5PCN3CGLGb7k6BWdwMd/4riN9BWBlsjaqEq6fO9cPeQcvyc9vM82ENDj4wZ1oJO+A==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr12997224wrt.146.1585297868413;
        Fri, 27 Mar 2020 01:31:08 -0700 (PDT)
Received: from dell ([95.149.164.95])
        by smtp.gmail.com with ESMTPSA id q3sm7373231wru.87.2020.03.27.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 01:31:07 -0700 (PDT)
Date:   Fri, 27 Mar 2020 08:31:57 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Guillaume La Roque <glaroque@baylibre.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Zhang Rui <rui.zhang@intel.com>,
        dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: Add missing 'additionalProperties:
 false'
Message-ID: <20200327083157.GI603801@dell>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-5-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200325220542.19189-5-robh@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 25 Mar 2020, Rob Herring wrote:

> Setting 'additionalProperties: false' is frequently omitted, but is
> important in order to check that there aren't extra undocumented
> properties in a binding.
> 
> Ideally, we'd just add this automatically and make this the default, but
> there's some cases where it doesn't work. For example, if a common
> schema is referenced, then properties in the common schema aren't part
> of what's considered for 'additionalProperties'. Also, sometimes there
> are bus specific properties such as 'spi-max-frequency' that go into
> bus child nodes, but aren't defined in the child node's schema.
> 
> So let's stick with the json-schema defined default and add
> 'additionalProperties: false' where needed. This will be a continual
> review comment and game of wack-a-mole.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/altera/socfpga-clk-manager.yaml    | 2 ++
>  .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml       | 2 ++
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml       | 2 ++
>  Documentation/devicetree/bindings/arm/renesas,prr.yaml         | 2 ++
>  .../devicetree/bindings/arm/samsung/exynos-chipid.yaml         | 2 ++
>  Documentation/devicetree/bindings/arm/samsung/pmu.yaml         | 2 ++
>  .../bindings/arm/samsung/samsung-secure-firmware.yaml          | 2 ++
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml         | 2 ++
>  Documentation/devicetree/bindings/clock/fsl,plldig.yaml        | 2 ++
>  Documentation/devicetree/bindings/clock/imx8mn-clock.yaml      | 2 ++
>  Documentation/devicetree/bindings/clock/imx8mp-clock.yaml      | 2 ++
>  Documentation/devicetree/bindings/clock/milbeaut-clock.yaml    | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml  | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml  | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml  | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml  | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml   | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml   | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml   | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml          | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,mmcc.yaml         | 2 ++
>  .../devicetree/bindings/clock/qcom,msm8998-gpucc.yaml          | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml       | 2 ++
>  .../devicetree/bindings/clock/qcom,sc7180-dispcc.yaml          | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml | 2 ++
>  .../devicetree/bindings/clock/qcom,sc7180-videocc.yaml         | 2 ++
>  .../devicetree/bindings/clock/qcom,sdm845-dispcc.yaml          | 2 ++
>  Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml | 2 ++
>  .../devicetree/bindings/clock/qcom,sdm845-videocc.yaml         | 2 ++
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml         | 2 ++
>  .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml        | 2 ++
>  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml             | 2 ++
>  Documentation/devicetree/bindings/eeprom/at24.yaml             | 2 ++
>  .../firmware/intel,ixp4xx-network-processing-engine.yaml       | 3 +++
>  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml          | 2 ++
>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 2 ++
>  Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml | 2 ++
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml    | 2 ++
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml    | 2 ++
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml     | 2 ++
>  Documentation/devicetree/bindings/gpu/samsung-rotator.yaml     | 2 ++
>  Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml       | 2 ++
>  Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml       | 2 ++
>  Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml | 2 ++
>  Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml         | 2 ++
>  Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml  | 2 ++
>  Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml      | 2 ++
>  Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml      | 2 ++
>  Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml    | 2 ++
>  .../devicetree/bindings/iio/adc/microchip,mcp3911.yaml         | 2 ++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml        | 2 ++
>  .../devicetree/bindings/iio/chemical/plantower,pms7003.yaml    | 2 ++
>  .../devicetree/bindings/iio/chemical/sensirion,sps30.yaml      | 2 ++
>  Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml    | 2 ++
>  Documentation/devicetree/bindings/iio/light/adux1020.yaml      | 2 ++
>  Documentation/devicetree/bindings/iio/light/bh1750.yaml        | 2 ++
>  Documentation/devicetree/bindings/iio/light/isl29018.yaml      | 2 ++
>  Documentation/devicetree/bindings/iio/light/noa1305.yaml       | 2 ++
>  Documentation/devicetree/bindings/iio/light/stk33xx.yaml       | 2 ++
>  Documentation/devicetree/bindings/iio/light/tsl2583.yaml       | 2 ++
>  Documentation/devicetree/bindings/iio/light/tsl2772.yaml       | 2 ++
>  Documentation/devicetree/bindings/iio/light/veml6030.yaml      | 2 ++
>  .../devicetree/bindings/iio/pressure/asc,dlhl60d.yaml          | 2 ++
>  Documentation/devicetree/bindings/iio/pressure/bmp085.yaml     | 2 ++
>  .../devicetree/bindings/iio/proximity/devantech-srf04.yaml     | 2 ++
>  .../devicetree/bindings/iio/proximity/parallax-ping.yaml       | 2 ++
>  .../devicetree/bindings/iio/temperature/adi,ltc2983.yaml       | 2 ++
>  Documentation/devicetree/bindings/input/gpio-vibrator.yaml     | 2 ++
>  Documentation/devicetree/bindings/input/max77650-onkey.yaml    | 3 +++
>  .../bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml  | 2 ++
>  Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml    | 2 ++
>  Documentation/devicetree/bindings/leds/leds-max77650.yaml      | 3 +++
>  Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml  | 3 +++
>  .../devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml    | 2 ++
>  Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml   | 2 ++
>  .../devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml     | 2 ++
>  Documentation/devicetree/bindings/media/renesas,ceu.yaml       | 2 ++

>  Documentation/devicetree/bindings/mfd/max77650.yaml            | 2 ++
>  Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml   | 2 ++

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
