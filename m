Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD431533760
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 09:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244342AbiEYHbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 03:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243925AbiEYHbx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 03:31:53 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB99377F7
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 00:31:51 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id e4so22962736ljb.13
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 00:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y2nHQ+fi4PGROpze+YJ+ImCGYvCKI2QwS/EoNpD0efc=;
        b=B9dafGTNVBB/1eV32dXVQsnHURWF3hUL06iNP1fB1zCZEWsTCbLpG/8mJEHqRkfs4r
         Lt8sNIDarBegusJ18/s31F9whgx4x/h9HDNpXSprMCLsbgUAN5OodhYBzhvfkV7loxSg
         xIZkq1UX1iZKPFylqHUN8xSoIUW2MmdoXjUTqHU5Q8KmBXHnxoQqm6HCeYVNealc+mmq
         wMDFWIfnIoKh7Z6oWVjkCW8ssIj11kUKAIlCPbdiGLuOzdWIk7+ponVziiu9qA3GOmrf
         4koWT2pia/pkqL4jiro6l7tYfCQgn0KCJ8XT+hZ2O4BDL/5mkdEIVB07XkAq7X/ite2C
         hkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y2nHQ+fi4PGROpze+YJ+ImCGYvCKI2QwS/EoNpD0efc=;
        b=7vHVnmJ1lw6StLynm2aEmJkZ5YUY0twSNEd2J7Hq093Gb192loL4ZP1PbizwwisDKP
         NpaFZn8jqicDJW3kBUk4WMg8Mt05YaP3P6DoGUn0zBlP8UspUzsbdt6XC9hazt/rp8gx
         garxc4fU/mPqDaAnjWsWkgsEycKNV8KUi/PGIefNc8jzi7Nb1nY9/arZDAOBkrcB2xk6
         jomWJG+91Kzde0+VRdZCoOx1Wxi6bOzyflF3Ogpi91zobv/Rso0BjqXM6laIUQlkg/b5
         h8H63ZYFVHVmUs1fy/4LxXFq8ygRjaC8HLp5nUaCWPSMZ+CTVva2FJtfdKr8hujDLdEv
         0yDg==
X-Gm-Message-State: AOAM531DpYhBGe/JfMGn8pGibRGHGtVzrcqQOLtR3AWZUAmShBuLhwjF
        S1tCEDBbBCdJJFWUPsIkBi+8zw==
X-Google-Smtp-Source: ABdhPJzSlmyfAw7HAwZP5W2LdSaycFjVclSpcQt0PsWn+G5cbfCbAF7eea3gifwt7BF+3BruQcwZUw==
X-Received: by 2002:a05:651c:1306:b0:253:e957:c715 with SMTP id u6-20020a05651c130600b00253e957c715mr9322358lja.169.1653463909886;
        Wed, 25 May 2022 00:31:49 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e86ca000000b00253dffc82b5sm2763010ljj.71.2022.05.25.00.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 00:31:49 -0700 (PDT)
Message-ID: <f9fe758f-1ab7-5075-fa5a-f5a461a91c85@linaro.org>
Date:   Wed, 25 May 2022 10:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8250: camss: Define ports
 address/size cells
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com, Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
 <20220524140207.2758605-4-bryan.odonoghue@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220524140207.2758605-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/24/22 17:02, Bryan O'Donoghue wrote:
> The ports {} address and size cells definition is the same for every
> derived 8250 board so, we should define it in the core sm8250.dtsi.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 2bc11cad3a44..aa9a13364865 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3395,6 +3395,11 @@ camss: camss@ac6a000 {
>   					     "cam_hf_0_mnoc",
>   					     "cam_sf_0_mnoc",
>   					     "cam_sf_icp_mnoc";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
>   		};
>   
>   		camcc: clock-controller@ad00000 {

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
