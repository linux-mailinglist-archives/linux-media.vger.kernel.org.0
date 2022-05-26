Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F719534EF6
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 14:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347067AbiEZMQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 08:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241852AbiEZMQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 08:16:14 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8336E24F21
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 05:16:12 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id n10so1583859pjh.5
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 05:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSsFxHfEMcrHOSBoFMEeUFcZhoPO+KxNjOCmccE7VEc=;
        b=j1LakW1276mdhdZUQsSFgcp6av448PqaRz7jViMY+GiGwh5iEij2Cm5mimSgVPEdiL
         Ozj3HVl3aUCQNnL22XjmDerl2WGv3ej+oU5YMVtYH9VIgXAWsX2inzVAfnyQqa2b5xnX
         W2Y4WrZkxJ+HRox9oe5wjmagh65jqeEWGjW8fstEyuAjiqnZGpAs/+pspSCQIhlehDyP
         xDU30Ahlo1lxgsqq/URVcKV4vlRa+Ug1dhRi/5993PYb81ygDBtRkwhfgFcpx+IwipjA
         ioZ7k1tvfTIqVetbCWXoO8xV/OhK2fIufIzWIIGxVrM90tgy7w3bSaH4Mpz4weYTocdg
         ER1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSsFxHfEMcrHOSBoFMEeUFcZhoPO+KxNjOCmccE7VEc=;
        b=KlPbE5Dxgs4/ajbZBL2YGYuDgWqLTfz9pU2Fc/qQh+BgQe9hUV5mx3xD1jdjQ01qC2
         4JUvMzb5OSQ6JSxwwKfTnRNqcqddD7uCNqwjzod6F404T5/cVeBmguAfSUVxgWxNsb38
         3lsUulTOR/b3H+2lisyT6CC15ieGXgn8Fx2lyhqB9VP36fY6WA390KcM6WdCLZF3p+hB
         Z0kbH1m0rDLmhJ4DY3nj+MrF4NM7TteF9eiZF+6onpFlgmQQXpGccDBuIPy1oR/TpitZ
         k1Tc3E3WkPSSKg9Uuiof35XnDrckV1PY5kPWPDNJnMxnNJ/VjU1uAAMa2IRyVNWImYXt
         g4Rw==
X-Gm-Message-State: AOAM531lTaTW9erUUXJK0YxvPj5O4IFFHr4gXrN65/HSVGy5D9g+4j3W
        vHa+7xCl4NJZTSRfGCT6Mx2ddD55Y8HQrB0hJDffArWBGYQ=
X-Google-Smtp-Source: ABdhPJyPE1Wcb5k1NYZNag1s+hH2MlPohRmJCsdM2BsWrYm5w9w9F6ArFLEhJ5Lmyc8aI7BQaEykL1CgVfGR0Wh+Ecc=
X-Received: by 2002:a17:902:8f81:b0:161:f4a7:f2fc with SMTP id
 z1-20020a1709028f8100b00161f4a7f2fcmr30701452plo.117.1653567371993; Thu, 26
 May 2022 05:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-12-luca@z3ntu.xyz>
In-Reply-To: <20220522162802.208275-12-luca@z3ntu.xyz>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 May 2022 14:16:01 +0200
Message-ID: <CAG3jFys4o6vsqhDJXMkL2fFdjDGstdzaB59j=Md6KDinMDNVRg@mail.gmail.com>
Subject: Re: [RFC PATCH 11/14] ARM: dts: qcom: msm8974: add CCI bus
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch does not apply on upstream-media/master or
upstream-next/master. Is there another branch this series should be
applied to?

On Sun, 22 May 2022 at 18:28, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Add a node for the camera-specific i2c bus found on msm8974.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 62 +++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index ffa6f874917a..a80b4ae71745 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1434,6 +1434,34 @@ blsp2_i2c5_sleep: blsp2-i2c5-sleep {
>
>                         /* BLSP2_I2C6 info is missing - nobody uses it though? */
>
> +                       cci0_default: cci0-default {
> +                               pins = "gpio19", "gpio20";
> +                               function = "cci_i2c0";
> +                               drive-strength = <2>;
> +                               bias-disable;
> +                       };
> +
> +                       cci0_sleep: cci0-sleep {
> +                               pins = "gpio19", "gpio20";
> +                               function = "gpio";
> +                               drive-strength = <2>;
> +                               bias-disable;
> +                       };
> +
> +                       cci1_default: cci1-default {
> +                               pins = "gpio21", "gpio22";
> +                               function = "cci_i2c1";
> +                               drive-strength = <2>;
> +                               bias-disable;
> +                       };
> +
> +                       cci1_sleep: cci1-sleep {
> +                               pins = "gpio21", "gpio22";
> +                               function = "gpio";
> +                               drive-strength = <2>;
> +                               bias-disable;
> +                       };
> +
>                         spi8_default: spi8_default {
>                                 mosi {
>                                         pins = "gpio45";
> @@ -1587,6 +1615,40 @@ dsi0_phy: dsi-phy@fd922a00 {
>                         };
>                 };
>
> +               cci: cci@fda0c000 {
> +                       compatible = "qcom,msm8974-cci";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0xfda0c000 0x1000>;
> +                       interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +                       clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
> +                                <&mmcc CAMSS_CCI_CCI_AHB_CLK>,
> +                                <&mmcc CAMSS_CCI_CCI_CLK>;
> +                       clock-names = "camss_top_ahb",
> +                                     "cci_ahb",
> +                                     "cci";
> +
> +                       pinctrl-names = "default", "sleep";
> +                       pinctrl-0 = <&cci0_default &cci1_default>;
> +                       pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> +
> +                       status = "disabled";
> +
> +                       cci_i2c0: i2c-bus@0 {
> +                               reg = <0>;
> +                               clock-frequency = <400000>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +
> +                       cci_i2c1: i2c-bus@1 {
> +                               reg = <1>;
> +                               clock-frequency = <400000>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +               };
> +
>                 gpu: adreno@fdb00000 {
>                         compatible = "qcom,adreno-330.1", "qcom,adreno";
>                         reg = <0xfdb00000 0x10000>;
> --
> 2.36.0
>
