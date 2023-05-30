Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773AD716817
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 17:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbjE3Pxq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 11:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjE3Pxi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 11:53:38 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569F0E67
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 08:53:15 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso3814776e87.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685461993; x=1688053993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VqNpW0OZtd7V3RZHQpujchgrqkyo2Xa35qmnixTOZkI=;
        b=R84/R7uSTjQVDR7nu30+XtKG6irZjIyGXIoVBe5sNFdFqOWXVxEDB5x5CYajSIBnw/
         YFGrO0A2plIQ2dAIdLvEeIP6LogNVsRHaZOBEKfY91Aj7v/zuRatxfboOM8xvJtnY1X8
         fQyZGKrtZTTR0VJhmNlX7JOPvB4IsEBUPplbx79Sgq+ycuBEh87wt9kz+jx8EC9ICYOz
         pGZAEzRjmI7cYF8NcklzThgHc6ru+jb9RgrvFYU7WO8yvktBCfCokwB2CMqx6mgRBocq
         4HvopUrIHc+NIiavF2K6mVG2kHPL0fE7eTynRnI+XtB6rbGlMB/bNhGRnBEIcwscI/fE
         HMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685461993; x=1688053993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqNpW0OZtd7V3RZHQpujchgrqkyo2Xa35qmnixTOZkI=;
        b=SVeGNpN2gcIRvCUrGiPjXvE1LGLUosV6LgULsGjKHaxvytbGm1Xld6ujGgDvQVewA3
         egSThBXdnxQDCi4+lKtB2thBESsL1OhiGa2SUMMoE7N2zp4tLyzh4SPaGtpJGzO5d7p1
         N5LY4sWETX8vhc9MFq/eux2DlgsvJCSpfNM/NvUP4GYHLsrZsapKLcYiSIHexKGP727v
         tasTzNI49z+e6Y5G0ZecBzEDlqVTR9Yzus4iRi0PnWwEV7nfmwtaEwE4kw+tpvm1tIOt
         8FqSQuliO7CkoHH7QB1CA/5cw2mAsUTpyvezyX6eB98OqsPIPBzJIdruGPD4ABWm29dv
         kg2g==
X-Gm-Message-State: AC+VfDzTAV+MzXRFoMnqQP/nYgOOceeCm1Kiagk2Hb0QrN8X9btl8nu+
        JVCt2+LTn3fTUwoQe5Ym9EtbAA==
X-Google-Smtp-Source: ACHHUZ4AhHkowvpWGnw7baxepQF5swQezoDFLOmN7uQQpMK3/MtpwUYzh3bZPyWDDVvirfxLTDxC5A==
X-Received: by 2002:ac2:511c:0:b0:4ed:d584:d1f4 with SMTP id q28-20020ac2511c000000b004edd584d1f4mr975949lfb.10.1685461993559;
        Tue, 30 May 2023 08:53:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402004e00b0050c0b9d31a7sm4561155edu.22.2023.05.30.08.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 08:53:13 -0700 (PDT)
Message-ID: <57e159ef-fce7-88b8-6107-9985559c4578@linaro.org>
Date:   Tue, 30 May 2023 17:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] media: dt-bindings: alvium: add document YAML
 binding
Content-Language: en-US
To:     Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        martin.hecht@avnet.eu, linuxfancy@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Gerald Loacker <gerald.loacker@wolfvision.net>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Shawn Tu <shawnx.tu@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230526173955.797226-1-tomm.merciai@gmail.com>
 <20230526173955.797226-2-tomm.merciai@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230526173955.797226-2-tomm.merciai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/05/2023 19:39, Tommaso Merciai wrote:
> Add documentation of device tree in YAML schema for the ALVIUM
> Camera from Allied Vision Inc.
> 


> +
> +          camera: alvium@3c {
> +              compatible = "alliedvision,alvium";
> +              pinctrl-names = "default";
> +              pinctrl-0 = <&pinctrl_csi0_pwn>, <&pinctrl_csi0_rst>, <&pinctrl_csi_mclk>;
> +              reg = <0x3c>;
> +              clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> +              clock-names = "xclk";
> +              assigned-clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> +              assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> +              assigned-clock-rates = <24000000>;
> +              streamon-delay = <20>;
> +              powerdown-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +              reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +              status = "okay";

Please apply all my comments from v1. I don't see improvements.

Best regards,
Krzysztof

