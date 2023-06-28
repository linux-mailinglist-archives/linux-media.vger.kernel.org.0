Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D306740CD0
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 11:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjF1J2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 05:28:01 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:51612 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234530AbjF1JSO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 05:18:14 -0400
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-78358268d1bso137972639f.3;
        Wed, 28 Jun 2023 02:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687943893; x=1690535893;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y3rNiHDzzvT5fn4zsItuTLUfPl9yseXqas/GeAA6tTU=;
        b=M2xdpC9YyeyaqFLVRhoUphFWh/NJZL5y3wh37KlDHKx15LF9dkTy7xWghSqOmTODAA
         HuLyzM1pRFraLNh94tH91euZIBL7m5w6q+hdgNvG5Mjj8hQLsyO0TOxdLTKwks1lobiu
         AqgcleOHNt+IQO6dVm3HBM7Pjg9pcHQfwlG4nK1pwGDW6Alq1n9YndOTPLp4DjU4uVdk
         M/WNJmr36IOGf43qGk8K6xClmtBS79jqTGtSQNNKn/nAdIZhy1rNq1PZtqqqLSGLAx8a
         /tzWJwkMQQxWQpKeUrnm1EclF/TM2DM7exMfckcPpYsx65HcK6SPOiEM3X8UdAX40itw
         KgUQ==
X-Gm-Message-State: AC+VfDxufqd99VleAS5ZOjwe3iT3Lf1NaPUZAekpp0TDHtiCjkk4IikV
        ayclH1boIF5baxBJ1TvWtNvYGhZDnw==
X-Google-Smtp-Source: ACHHUZ5hdew/tbjh37LxMK1//ANp1jJhQJGeMCqjFo7ZC1u/XMFXJeJvxavj99PxkNADBXvIkZi10w==
X-Received: by 2002:a6b:d808:0:b0:783:491a:13fe with SMTP id y8-20020a6bd808000000b00783491a13femr11503497iob.5.1687943893293;
        Wed, 28 Jun 2023 02:18:13 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p14-20020a02b38e000000b0042adbd157b5sm1089962jan.179.2023.06.28.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 02:18:12 -0700 (PDT)
Received: (nullmailer pid 4146586 invoked by uid 1000);
        Wed, 28 Jun 2023 09:18:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     guoniu.zhou@oss.nxp.com
Cc:     krzysztof.kozlowski+dt@linaro.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, jacopo.mondi@ideasonboard.com
In-Reply-To: <20230628064251.1774296-2-guoniu.zhou@oss.nxp.com>
References: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
 <20230628064251.1774296-2-guoniu.zhou@oss.nxp.com>
Message-Id: <168794389087.4146462.8940502156407485967.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: nxp,imx8-isi: add i.MX93
 ISI compatible string
Date:   Wed, 28 Jun 2023 03:18:10 -0600
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Wed, 28 Jun 2023 14:42:49 +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add the compatible string support for i.MX93 ISI.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/milbeaut-clock.example.dtb: /example-2/serial@1e700010: failed to match any schema with compatible: ['socionext,milbeaut-usio-uart']
Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.example.dtb: /example-1/syscon@20e00000: failed to match any schema with compatible: ['sprd,sc9863a-glbregs', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/leds/common.example.dtb: /example-2/i2c/led-controller@30: failed to match any schema with compatible: ['panasonic,an30259a']
Documentation/devicetree/bindings/sound/audio-graph-card2.example.dtb: /example-0/cpu: failed to match any schema with compatible: ['cpu-driver']
Documentation/devicetree/bindings/sound/audio-graph-card2.example.dtb: /example-0/codec: failed to match any schema with compatible: ['codec-driver']
Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.example.dtb: /example-0/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/thermal/imx-thermal.example.dtb: /example-0/anatop@20c8000: failed to match any schema with compatible: ['fsl,imx6q-anatop', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/i2c/qcom,i2c-cci.example.dtb: /example-0/cci@ac4a000/i2c-bus@1/camera@60: failed to match any schema with compatible: ['ovti,ov7251']
Documentation/devicetree/bindings/iio/adc/ti,palmas-gpadc.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['ti,twl6035-pmic', 'ti,palmas-pmic']
Documentation/devicetree/bindings/iio/adc/ti,palmas-gpadc.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['ti,twl6035-pmic', 'ti,palmas-pmic']
Documentation/devicetree/bindings/input/mediatek,pmic-keys.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.example.dtb: /example-0/pmic@0: failed to match any schema with compatible: ['sprd,sc2731']
Documentation/devicetree/bindings/dma/dma-controller.example.dtb: /example-0/dma-controller@48000000: failed to match any schema with compatible: ['ti,omap-sdma']
Documentation/devicetree/bindings/dma/dma-router.example.dtb: /example-0/dma-router@4a002b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.example.dtb: /example-0/memory-controller@13410000/ethernet@6: failed to match any schema with compatible: ['davicom,dm9000']
Documentation/devicetree/bindings/arm/hisilicon/controller/sysctrl.example.dtb: /example-0/system-controller@802000/clock@0: failed to match any schema with compatible: ['hisilicon,hi3620-clock']
Documentation/devicetree/bindings/arm/hisilicon/controller/cpuctrl.example.dtb: /example-0/cpuctrl@a22000/clock@0: failed to match any schema with compatible: ['hisilicon,hix5hd2-clock']
Documentation/devicetree/bindings/arm/hisilicon/controller/hi3798cv200-perictrl.example.dtb: /example-0/peripheral-controller@8a20000/phy@850: failed to match any schema with compatible: ['hisilicon,hi3798cv200-combphy']
Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: /example-0/parent/i2c/camera@36: failed to match any schema with compatible: ['ovti,ov5695']
Documentation/devicetree/bindings/net/marvell,mvusb.example.dtb: /example-0/usb/mdio@1/switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
Documentation/devicetree/bindings/net/qca,ar71xx.example.dtb: /example-0/ethernet@1a000000/mdio/switch@10: failed to match any schema with compatible: ['qca,ar9331-switch']
Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.example.dtb: /example-0/iomcu@ffd7e000: failed to match any schema with compatible: ['hisilicon,hi3660-iomcu', 'syscon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230628064251.1774296-2-guoniu.zhou@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

