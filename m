Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1079620CBA
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 10:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbiKHJ54 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 04:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233479AbiKHJ5z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 04:57:55 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5886813DED
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 01:57:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j4so20551787lfk.0
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 01:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzIkB97wrKBKr6cVr3DUHYTmRg+yvmZDZzpdOYE3TT4=;
        b=XmaVBDqIo1HN7hPCvJCS7axGiEkEnEPZr1IAsm1vX9OvkDQPBLh29+1HIn3UFPFz3U
         ACXWzsr8mwzuiuhRaUCgU5uy6CT5YA7QdHVzjI5517s+XIPlLui+imL9Nc7VgbLdTsaM
         Ys7vyzMJmVJyw+L4vSXmeheyYuvpW1gQq5GmHt6ebb+lNYJTVTz3OfBWuTPWLDWOh+FK
         BgCbPnOy0q73O8uR7jQWBMC4xnZbvCZs5jdDemt0z0WEJ47toH6CEYstbws2hFgaWjod
         FXoDDbsRCA0gUXIkIULFzii+4GEpNbshi2+AymYUQlSXk4NX+VZox+EfOQ8uhW4fYBV5
         OVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzIkB97wrKBKr6cVr3DUHYTmRg+yvmZDZzpdOYE3TT4=;
        b=CHVyswlFpXv85bXgjlTu2V5zQMfjxqyL1fn70Aog48j3ZKu+brCjVMw61iOqfjQUeA
         MOfmDNBEYf408lqNIRcKqFw2dH9BzlOM3ISkgG6MlE49R5hmlKsz8PENdMpJwfpa3aEL
         BngQ193ttUEnn1U8u/1nOo5DPI4kvNZtG/+C9T4KIhnHrUO2bZvUVpXp/Geia7VwVgEL
         lapjGBTwI6VMbfg/RIURlGuPdBU400nY2uqqd2J2ON+Whogf/rBRwlJwg/1uZj6YVijR
         VkhNGwLrIp0iDGCYeS0yMoT8oFs47JObCxf6OO9PDAknnwmdikl+tRzEuQEfrvIbWyKf
         BYBw==
X-Gm-Message-State: ANoB5pnxiWViUcNyrb1q3C+ukupbnto3ZsCGzXyNKQwKhGMrpKAkfIoT
        QbVW/pWrdHzlg5NfjRfrOrcycQ==
X-Google-Smtp-Source: AA0mqf5GCGgBSLf5eKDQn1/Q9ks37EyZXU10uI6iWpK0j41+foEUJv9XDZkd/RNeFBWOmDW0zLhMuw==
X-Received: by 2002:a19:e30f:0:b0:4b3:b574:8be1 with SMTP id a15-20020a19e30f000000b004b3b5748be1mr3061383lfh.262.1667901472723;
        Tue, 08 Nov 2022 01:57:52 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id v6-20020a05651203a600b004b40c1f1c70sm193334lfp.212.2022.11.08.01.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 01:57:51 -0800 (PST)
Message-ID: <fd05b618-8ab9-054a-7874-3b98aae69218@linaro.org>
Date:   Tue, 8 Nov 2022 10:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
 <20221108021816.213084-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221108021816.213084-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/11/2022 03:18, Bryan O'Donoghue wrote:
> The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 populated.
> Other sensors and components may be added or stacked with additional
> mezzanines.
> 
> Enable both the IMX577
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -d /dev/media0 -V '"imx577 '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
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
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 64 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 ++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index b0558d3389e5..78f6e78d8ed4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -52,6 +52,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> new file mode 100644
> index 000000000000..307b09094e7f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2022, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "qrb5165-rb5.dts"
> +
> +&camss {
> +	status = "okay";
> +	vdda-phy-supply = <&vreg_l5a_0p88>;
> +	vdda-pll-supply = <&vreg_l9a_1p2>;
> +
> +	ports {
> +		/* The port index denotes CSIPHY id i.e. csiphy2 */
> +		port@2 {
> +			reg = <2>;
> +			csiphy2_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep>;
> +			};
> +

No need for blank line.

Plus missing dtbs_check, as pointed out by Bjorn.

Best regards,
Krzysztof

