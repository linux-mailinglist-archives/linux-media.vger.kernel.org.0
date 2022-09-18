Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD405BBCA8
	for <lists+linux-media@lfdr.de>; Sun, 18 Sep 2022 11:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiIRJHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Sep 2022 05:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiIRJH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Sep 2022 05:07:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51B225588
        for <linux-media@vger.kernel.org>; Sun, 18 Sep 2022 02:07:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o2so40020894lfc.10
        for <linux-media@vger.kernel.org>; Sun, 18 Sep 2022 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bGZfcJ7/xyTSyo+e1DkgIAHCGdwCcIgSpxyOQDXxlU8=;
        b=DqMh+ai5U1mHXrGdZr1lVbsRIf/WhSIqeXDUxusNTb9K0lM9g+KJQFz+C4oNRckfkK
         mstpTYW4FxXis55JLsdZfe24u131EjbSl4PbkMP4NKiJ+MJVlXkcv1VQmvvm5fIoE0yt
         R39ilKcM+bQjp2NJyNlmSluLIGeIu9YGf0yNrA6aE+YMo33d7J5b0JPyn97JIcVo1qDi
         MDcuPR1V04VkC3cRmzHwHQzoAYLuRDOwlF+Qq96g7Ca2X7PAHAkUNTMIOZANmwoOUDJ1
         qIi4dFIlayh8WvDvbdt7ooTdIqMbsVNKddGRNWY3Yerv12CImPdbwAiAuovReC1hbsEN
         TY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bGZfcJ7/xyTSyo+e1DkgIAHCGdwCcIgSpxyOQDXxlU8=;
        b=tTAOa/D/lgQwYcbP4GQOBNdZakKu6T8hnPyoKJHm+tImFlvi+BHTRG15M7YrnzmeyL
         lp9jMt2BqgE9dNQQRAUMRH0vDu3rXvVJrPQGfoavacrhk/NnekhKev+MWx1IcV7+ofpP
         w0S87rUmQW5GbUxZdqzo399MdS/3v4grs5bsVkIauNAGsjhdAWrw3+SYwHLZ9Ma8fT7g
         sdB8CyjGoElI5yebzek1xv4fhgjv24yZA9K8IsGUeLo3G2Y+vplLcbAcwfQ3nbIsSyHH
         vQAl4YbBRqMS+TaVqFFQaHiGaJ3AKk8XlJ3AsiuT43mYzX0IFUEJfjskgiY2Jcbs14OF
         M3sA==
X-Gm-Message-State: ACrzQf02ndQowqnQlvC6JxZ2L+MD8wMnpalaiI1eRhN2WiCYNU48U2z2
        JARIWRfBbwmBRGth2C81bBX/vw==
X-Google-Smtp-Source: AMsMyM6Wxk7qCai/ULKOcTxWryxS0Gymnh6yFDaLDSLZoFTg/jaFiGPP8/tb5UnRLI0ZpdtahlYkSQ==
X-Received: by 2002:a05:6512:22d2:b0:498:f68b:6cab with SMTP id g18-20020a05651222d200b00498f68b6cabmr4197755lfu.548.1663492045954;
        Sun, 18 Sep 2022 02:07:25 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k14-20020a2e6f0e000000b002637c04b472sm4457662ljc.83.2022.09.18.02.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 02:07:25 -0700 (PDT)
Date:   Sun, 18 Sep 2022 10:07:18 +0100
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] media: dt-bindings: i2c: ovti,ov5640: Drop ref to
 video-interface-devices.yaml
Message-ID: <20220918090718.isp3ktb3v2isiwkn@krzk-bin>
References: <20220916133521.73183-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220916133521.73183-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 16 Sep 2022 14:35:21 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> video-interface-devices.yaml isn't used so just drop it from the
> DT binding doc.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


camera@3c: 'AVDD-supply' is a required property
	arch/arm/boot/dts/imx6ul-14x14-evk.dtb
	arch/arm/boot/dts/imx6ull-14x14-evk.dtb
	arch/arm/boot/dts/imx6ulz-14x14-evk.dtb
	arch/arm/boot/dts/stm32mp157c-ev1.dtb
	arch/arm/boot/dts/stm32mp157c-ev1-scmi.dtb

camera@3c: 'DOVDD-supply' is a required property
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
	arch/arm/boot/dts/imx6ul-14x14-evk.dtb
	arch/arm/boot/dts/imx6ull-14x14-evk.dtb
	arch/arm/boot/dts/imx6ulz-14x14-evk.dtb

camera@3c: 'DVDD-supply' is a required property
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
	arch/arm/boot/dts/imx6ul-14x14-evk.dtb
	arch/arm/boot/dts/imx6ull-14x14-evk.dtb
	arch/arm/boot/dts/imx6ulz-14x14-evk.dtb
	arch/arm/boot/dts/stm32mp157c-ev1.dtb
	arch/arm/boot/dts/stm32mp157c-ev1-scmi.dtb

camera_rear@3b: 'clock-frequency', 'enable-gpios', 'vdda-supply', 'vddd-supply', 'vdddo-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
	arch/arm/boot/dts/qcom-apq8016-sbc.dtb

camera_rear@3b: port:endpoint:data-lanes:0:0: 0 is not one of [1, 2]
	arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
	arch/arm/boot/dts/qcom-apq8016-sbc.dtb

ov5640@3c: 'AVDD-supply' is a required property
	arch/arm/boot/dts/dra71-evm.dtb
	arch/arm/boot/dts/dra72-evm.dtb
	arch/arm/boot/dts/dra72-evm-revc.dtb

ov5640@3c: 'DOVDD-supply' is a required property
	arch/arm/boot/dts/dra71-evm.dtb
	arch/arm/boot/dts/dra72-evm.dtb
	arch/arm/boot/dts/dra72-evm-revc.dtb

ov5640@3c: 'DVDD-supply' is a required property
	arch/arm/boot/dts/dra71-evm.dtb
	arch/arm/boot/dts/dra72-evm.dtb
	arch/arm/boot/dts/dra72-evm-revc.dtb
