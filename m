Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62FF7532EDD
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 18:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239428AbiEXQWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 12:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiEXQWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 12:22:10 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A298040A31
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 09:22:09 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id l82so10704747qke.3
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FbPeWCEe/rxIHEa/hiVBgobEzhmZYhzLM/LYaOtDRPU=;
        b=Y3gcWPAaJ4hpmL2L+n26Ut0AF4CraALFauvu7s+2olFZzWxG4GRq2Bmq4l+G2t77cP
         tYgtSfPXtyoNdtna9YMwOBuOmCsscJsxzvGJFtqD2auaIeIjejQKv0/gccH39w80YSpa
         /pHsgYkYF7jKbbSEbNCxgEkyGOiiipfiz51/xcFxnIK1KPmGPYRdtPn7isN0fZt4NKl1
         DM603a+yq55Z+nVvnn235F+1vbLLwdtDz+AwjDFI5j8rq/fTUzGr9K+7dWyrDApMgyh7
         tp1aJgSy/fk3kZQMfxiZXCznaUXnM6Fw79bz9/H+1VhsoSq/I9un5DlTRQhyGbG+JnpR
         Eg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FbPeWCEe/rxIHEa/hiVBgobEzhmZYhzLM/LYaOtDRPU=;
        b=3qe+7UKF7VhEVvS2nbVYVvvzvnB7xLfWjMIQBArAYhmLgZxJ0Oa5Amj/2GuzU/xoCb
         R6+lgpv3Q2/xtBpEtChbyKp2oInY1n856DNizMD8/yV8BxVnAIEUs31oANI7PCSRQ5bZ
         +9AdatxXRFPj1SIK9NldTxDOUxuBESbTKX5JvfbqfA2kZJZ01qxTECF394cNN9+RJ0YF
         5864ncs/pjLOLDXQHOIisPxrrzq2RZvO2pgX+hDPmqcEu+23/19xTgn2M8YaSPu5PKfd
         RQkS3kAM9rmlxGm/BDmEnLyj5zmEdgpxe+ToKx8ZE/Jjnu7ignSxksM5NH6dpUvnONFe
         vXvQ==
X-Gm-Message-State: AOAM533xkUoNE+yvTsEySzZ3k9TiD3P2jb0NUVIEiy6FlPUS0HpZt62Y
        I5EHaMxNJC33tQevHYFsCuKUY8RnK1LDEZl9+7pc/w==
X-Google-Smtp-Source: ABdhPJzRM19vBhddeLT/0BQNWI+Y6tQxm9OEixBDWjgY2AVJx9Oo+xKjyEUF8zeMSB0OVfETg+HNBW/nEzA9vCsaRR4=
X-Received: by 2002:a05:620a:2a0f:b0:6a0:2734:a92e with SMTP id
 o15-20020a05620a2a0f00b006a02734a92emr17609575qkp.593.1653409328778; Tue, 24
 May 2022 09:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220524140207.2758605-1-bryan.odonoghue@linaro.org> <20220524140207.2758605-5-bryan.odonoghue@linaro.org>
In-Reply-To: <20220524140207.2758605-5-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 19:21:57 +0300
Message-ID: <CAA8EJpqUkeReqnhcURpftpJmFth9-3OGQoAkFqd7Y06EjfraRg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577
 on cam2
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 24 May 2022 at 17:02, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The IMX577 is on CCI1/CSI2 providing four lanes of camera data.

By default the RB5 doesn't employ the navigation mezzanine. Thus I
suggest adding a new DTS file that will include the qrb5165-rb5.dts
and extend it with camcc/camss setup.

I remember, this was discussed back and forth. I think it's time we
either create a working repo for mezzanines or push default setups
into the kernel.
I'd vote for the later option.

>
> An example media-ctl pipeline is:
>
> media-ctl --reset
> media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 60 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     | 33 +++++++++++++
>  2 files changed, 93 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 0e63f707b911..756ddeb7530b 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1294,3 +1294,63 @@ &qup_spi0_data_clk {
>         drive-strength = <6>;
>         bias-disable;
>  };
> +
> +&camcc {
> +       status = "okay";
> +};
> +
> +&camss {
> +       status = "okay";
> +       vdda-phy-supply = <&vreg_l5a_0p88>;
> +       vdda-pll-supply = <&vreg_l9a_1p2>;
> +
> +       ports {
> +               /* The port index denotes CSIPHY id i.e. csiphy2 */
> +               port@2 {
> +                       reg = <2>;
> +                       csiphy2_ep: endpoint {
> +                               clock-lanes = <7>;
> +                               data-lanes = <0 1 2 3>;
> +                               remote-endpoint = <&imx412_ep>;
> +                       };
> +
> +               };
> +       };
> +};
> +
> +&cci1 {
> +       status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +       camera@1a {
> +               /*
> +                * rb5 ships with an imx577. camx code from qcom treats imx412
> +                * and imx577 the same way. Absent better data do the same here.
> +                */
> +               compatible = "sony,imx412";
> +               reg = <0x1a>;
> +
> +               reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +               pinctrl-names = "default", "suspend";
> +               pinctrl-0 = <&cam2_default>;
> +               pinctrl-1 = <&cam2_suspend>;
> +
> +               clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +               assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +               assigned-clock-rates = <24000000>;
> +
> +               dovdd-supply  = <&vreg_l7f_1p8>;
> +               avdd-supply = <&vdc_5v>;
> +               dvdd-supply = <&vdc_5v>;
> +
> +               port {
> +                       imx412_ep: endpoint {
> +                               clock-lanes = <1>;
> +                               link-frequencies = /bits/ 64 <600000000>;
> +                               data-lanes = <1 2 3 4>;
> +                               remote-endpoint = <&csiphy2_ep>;
> +                       };
> +               };
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index aa9a13364865..2b65ec2806d0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3788,6 +3788,39 @@ tlmm: pinctrl@f100000 {
>                         gpio-ranges = <&tlmm 0 0 181>;
>                         wakeup-parent = <&pdc>;
>
> +                       cam2_default: cam2-default {
> +                               rst {
> +                                       pins = "gpio78";
> +                                       function = "gpio";
> +                                       drive-strength = <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               mclk {
> +                                       pins = "gpio96";
> +                                       function = "cam_mclk";
> +                                       drive-strength = <16>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cam2_suspend: cam2-suspend {
> +                               rst {
> +                                       pins = "gpio78";
> +                                       function = "gpio";
> +                                       drive-strength = <2>;
> +                                       bias-pull-down;
> +                                       output-low;
> +                               };
> +
> +                               mclk {
> +                                       pins = "gpio96";
> +                                       function = "cam_mclk";
> +                                       drive-strength = <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
>                         cci0_default: cci0-default {
>                                 cci0_i2c0_default: cci0-i2c0-default {
>                                         /* SDA, SCL */
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
