Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180D66EB914
	for <lists+linux-media@lfdr.de>; Sat, 22 Apr 2023 14:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjDVMLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Apr 2023 08:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjDVMLA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Apr 2023 08:11:00 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A2F1FC8
        for <linux-media@vger.kernel.org>; Sat, 22 Apr 2023 05:10:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ec816d64afso11560275e87.1
        for <linux-media@vger.kernel.org>; Sat, 22 Apr 2023 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682165457; x=1684757457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPnDF9DYM/NKDMLhSe3+ERdFQloF9vFQjHlbD109zt0=;
        b=NC5nBS9GOvTeZcG3repZOpLz3E9YKYGLizrTJ2BDD6eW2BTL5jfSVdgabcYuNCLjOM
         WW2VZxrSQwIsAWjCKE6SO2ClAaEFixljd6fDlSz7co1Y5txHKiZQk7/OnkyRzhDsTtyd
         LNvdoleCD+nUJhT75ncZESs6aeJZFlRArFHnCIWcM/oMaGx4+Ad25QFcSXC7CLrj0kdS
         SeYw4klaP90YhSK1A3kHYr4+q9dSqZLfRDw3l+ZMHlSl+RDIAHCjFh8+9/0PtUUXviQS
         9VQPGAtrSIVBRgk/Eef6z8+zsXhlygFTpsx7eh5naCThMLNbLdZ25/wgZKzu+CW/wmzl
         rZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682165457; x=1684757457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPnDF9DYM/NKDMLhSe3+ERdFQloF9vFQjHlbD109zt0=;
        b=SkidW2LFlBoqdD8ykwsjQWaaq63RwBF8EBsy60XCAdq1hIZqmBze1TietaICgAp64n
         QklsrHyeWlkd0kiDXtfiSduDXNCV/s/+R+kskjx5ITFBHmrWC20Jy2wMChKRS9/5kdYF
         uCPaCpxvKJckR3YWBFarUr2DuEHSNgs/p+ZLuW0qsK+n2KWq+7iomfm+vh0EYX5j8IYH
         qpbBdeD9Ie7VsGpkXYpK4DnTYFqg1wbLIxNpvAFXgqenCR2UQl09W5R4T4yG1mrEi+X7
         Qx0cUSPfkYDzze5BS24ukE81nyJeph+juZ6tm8cDtd8Y4YoJNVzrOCvGKqmetkKjbfkV
         AzBQ==
X-Gm-Message-State: AAQBX9eRItvlj3p9ogMkkCky7CwR/SHoswUra5gDzfaVMm4+Rg7lhFYd
        8yAEYNr4JY2xxkcsdpjKmksPlg==
X-Google-Smtp-Source: AKy350b+41OQZx0jt34QgFSz8mpHAcQA7Q4IfXLOTt1Aty4YMRkKmMvzXO8PsN8Eud0T9Lm1G0kumw==
X-Received: by 2002:a05:6512:3e16:b0:4eb:41ac:e33 with SMTP id i22-20020a0565123e1600b004eb41ac0e33mr3783203lfv.19.1682165457203;
        Sat, 22 Apr 2023 05:10:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id m12-20020a056512014c00b004eed4c80b55sm866517lfo.156.2023.04.22.05.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 05:10:56 -0700 (PDT)
Message-ID: <01d06e66-9535-cb4c-6ea8-102f8b16f8b8@linaro.org>
Date:   Sat, 22 Apr 2023 14:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8998: add hdmi cec pinctrl nodes
Content-Language: en-US
To:     Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-4-176479fb2fce@freebox.fr>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-4-176479fb2fce@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 18.04.2023 20:10, Arnaud Vrac wrote:
> HDMI is not enabled yet on msm8998 so the pinctrl nodes are not
> used.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
Are they supposed to be identical?

Konrad
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index b150437a83558..fb4aa376ef117 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1312,6 +1312,20 @@ blsp2_i2c6_sleep: blsp2-i2c6-sleep-state {
>  				drive-strength = <2>;
>  				bias-pull-up;
>  			};
> +
> +			hdmi_cec_default: hdmi-cec-default-state {
> +				pins = "gpio31";
> +				function = "hdmi_cec";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			hdmi_cec_sleep: hdmi-cec-sleep-state {
> +				pins = "gpio31";
> +				function = "hdmi_cec";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  		};
>  
>  		remoteproc_mss: remoteproc@4080000 {
> 
