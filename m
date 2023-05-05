Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6485D6F8809
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 19:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbjEERwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 13:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjEERwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 13:52:39 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BAE1A1F9
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 10:52:07 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc4bc2880so3287586a12.2
        for <linux-media@vger.kernel.org>; Fri, 05 May 2023 10:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683309070; x=1685901070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9KiUn2j/F3rd3L6a4gBAonK4ydKd36At77LcJnV4Hk=;
        b=csstjdbtFjroFqvwHrAj7ASCkdwnZItI/fNeIzHVu87W9zqLlBfvxLeJp+R0u/JEId
         tAQYpvEDjeR7XJQC0qKU+nohFILvaBZi2lFIInEBFyvwCea0rBtSc4D8/ufuyPHsfTmh
         J8+f0cWSLrqTwEJqbCoLLxqSaKIi7WAdGU4oELV82QUPVmR3cgMdDOb55hOv7XAUaBLV
         TzHFKV1xpVg3Pn61jMhE6iO0mkrZ5D8b+uMvtRa3U5MSTAlM+adKh1GILvt8wyOYMhVu
         02lWdXL1a+t1Hh0KibdY4lorosL+o8VnRAqdHIr45nhhSDflQp10+43kyc0ODlqInvoP
         oqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309070; x=1685901070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9KiUn2j/F3rd3L6a4gBAonK4ydKd36At77LcJnV4Hk=;
        b=Prl07kJspz1zdthI+Kld/gvIujiJxy/B3gxuBBCCzv8i/5TvsGc2yEqpstMoC+Mr5T
         ZufumyDHntmuJHuCTfn29h8rQD74ccNUgVekIvZprvpCVnpSfYX6m695Pksm3z8Xst6G
         c9S+0zOoKlknNsXPJi7VWQhJvuaULVEs02v8FB+1omcPI8FSvEtt1NqbAZK7eqFtDdmQ
         mdjY92rtZA3YdMh8klKQrIakGS1nSnk6gFUnBWF+kjrc9GP41uJl4lE1GqvY3u3V3V9G
         Ydte6eSVupmFqxL6wquoOuptyb2IJYabr+NL7JWrkEJetYJlDsJRx9gcsZD09R/B7L3z
         TxCw==
X-Gm-Message-State: AC+VfDxanvBGZsf/jCqH/TKzV0Ou1KlE1M5ND6/v3KJQorBouaJcEK8c
        +dDuJnFkPPl3kxx1DyxTOadYuw==
X-Google-Smtp-Source: ACHHUZ5xqpX2L5ebNYEvbbCCWtHxDyyOulKKr7mtICAZPFhip7BFcUyqOUSfDx5jcLvYiofFRZ5+OQ==
X-Received: by 2002:a05:6402:182:b0:50b:f929:c6d3 with SMTP id r2-20020a056402018200b0050bf929c6d3mr2297319edv.1.1683309070329;
        Fri, 05 May 2023 10:51:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id f22-20020a056402069600b0050bd4b8ca8fsm3126782edy.14.2023.05.05.10.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 10:51:09 -0700 (PDT)
Message-ID: <0f6aa2f3-b56e-840c-9bb7-6add0335315a@linaro.org>
Date:   Fri, 5 May 2023 19:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8996: Add CAMSS power domain and
 power-domain-names to CAMSS
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hansverk@cisco.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230503072543.4837-1-y.oudjana@protonmail.com>
 <20230503072543.4837-3-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503072543.4837-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/05/2023 09:25, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add the CAMSS power domain as well as power-domain-names for all CAMSS power domains.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

You should explain why you are adding it.

> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 30f6ebc4bd11..0168a086f57d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2118,7 +2118,9 @@ camss: camss@a00000 {
>  				"vfe0",
>  				"vfe1";
>  			power-domains = <&mmcc VFE0_GDSC>,
> -					<&mmcc VFE1_GDSC>;
> +					<&mmcc VFE1_GDSC>,
> +					<&mmcc CAMSS_GDSC>;
> +			power-domain-names = "vfe0", "vfe1", "camss";
>  			clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
>  				<&mmcc CAMSS_ISPIF_AHB_CLK>,
>  				<&mmcc CAMSS_CSI0PHYTIMER_CLK>,

Best regards,
Krzysztof

