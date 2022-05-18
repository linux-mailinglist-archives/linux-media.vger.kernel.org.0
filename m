Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5973A52BCD5
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 16:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238399AbiEROFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 10:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbiEROFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 10:05:04 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5333E14676F
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 07:05:02 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id bx33so2632606ljb.12
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4be4XubXmodsQyyIZAOkjAtM6Y2yi67Gjsh2Z2W5A8w=;
        b=B6uPnx2xGjPw06R1UIM+lD30VHrMv5OhwsWQ8+ZAW5SxHNeWTpVOPGbmHSPVDlw+VD
         9hM8p1R05Zt5FumNjBx203Sk2906de2TwWSKdYv6AM+idQZGWkVGnYe5oJuU74fkoGNs
         pD1yeutRT8vpCyOKZQeL23PSd5ESE+XZOrlm0qkQCrS1ADSD1dezVE8xzc5SLkgldtw7
         SHKsBotZV6yO6u5MK1s9oW2Hs32jctzRRsAUyekvWgy4tszBFmWIrrIMVUOi5IlxetsR
         IaAi/eYrCeF88eTbVzVzbFNoGaRXRUJ2d81S7iyh2ZxOcT4OT9knD2aTze222THtluzM
         H3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4be4XubXmodsQyyIZAOkjAtM6Y2yi67Gjsh2Z2W5A8w=;
        b=BhTURNRh8QZgtmxxBxqpFoJN0TznbE5TXZsh5ZQ2kWRPMjAyVCpNRv2m8yYFPjhGJD
         CsxWPprkpcAO65A5AGm7dqcAmtw5M0kRU+3etztC6PO+HW/PXbPiyhlRtoIM1QvgLwwt
         Gy1NsKrYv9t0UbBmuydsAfpvTnSM9Gk/oJRPsDxXWfFarmsyR11lmkF3Zz3VKvHYduLz
         bwMU9sU9WysOl9/cCNxvQaCy+kN4o1DXszgvhRodMA/ZPnY7yFJkDlZAi3ZAZBpbL91E
         5m2VZKe8PiqTpujI4Q6GNtDTciGiG/8JBLVnWmia7GPkpqRJW12E3L4WNOfTLwaMBCqT
         N9sA==
X-Gm-Message-State: AOAM532kdgdXMORosdda2AjnXEEYWugN2bj2wmI0vN6A0GxQSvvawTxF
        SNSRoIAXYLU2ypxfzj+YgeMPdw==
X-Google-Smtp-Source: ABdhPJyum/9upK7pIF0FGYulA7ZOiN+2Cg4PV9d6rFilhc3AYLNoZbZVZDEpBgHKeiY1v87z+TObOg==
X-Received: by 2002:a2e:9e41:0:b0:253:c37c:378b with SMTP id g1-20020a2e9e41000000b00253c37c378bmr3573907ljk.202.1652882700578;
        Wed, 18 May 2022 07:05:00 -0700 (PDT)
Received: from [192.168.1.102] (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id q21-20020ac25295000000b0047255d211e4sm217587lfm.275.2022.05.18.07.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 07:05:00 -0700 (PDT)
Message-ID: <0864eed7-bba2-59ec-dc5f-b491ce114798@linaro.org>
Date:   Wed, 18 May 2022 17:04:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on
 cam1
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
 <20220518133004.342775-2-bryan.odonoghue@linaro.org>
 <58af3b06-97fe-fd29-b6e3-fa68737b1d96@somainline.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <58af3b06-97fe-fd29-b6e3-fa68737b1d96@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Konrad,

On 5/18/22 16:55, Konrad Dybcio wrote:
> Hi!
> 
> 
> On 18/05/2022 15:30, Bryan O'Donoghue wrote:
>> The IMX577 is on CCI1/CSI2 providing four lanes of camera data.
> 
> Commit says IMX577, code says IMX412.
> 
> 
>>
>> An example media-ctl pipeline is:
>>
>> media-ctl --reset
>> media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>    arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 98 ++++++++++++++++++++++++
>>    1 file changed, 98 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> index 0e63f707b911..48b31790c434 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> @@ -1203,6 +1203,43 @@ sdc2_card_det_n: sd-card-det-n {
>>    		function = "gpio";
>>    		bias-pull-up;
>>    	};
>> +
>> +	cam2_default: cam2-default {
>> +		rst {
>> +			pins = "gpio78";
>> +			function = "gpio";
>> +
>> +			drive-strength = <2>;
>> +			bias-disable;
> 
> Other pins in this DT don't have a newline between function and
> drive-strength, please remove it for consistency.
> 
> 
>> +		};
>> +
>> +		mclk {
>> +			pins = "gpio96";
>> +			function = "cam_mclk";
>> +
>> +			drive-strength = <16>;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	cam2_suspend: cam2-suspend {
>> +		rst {
>> +			pins = "gpio78";
>> +			function = "gpio";
>> +
>> +			drive-strength = <2>;
>> +			bias-pull-down;
>> +			output-low;
>> +		};
>> +
>> +		mclk {
>> +			pins = "gpio96";
>> +			function = "cam_mclk";
>> +
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +	};
>>    };
>>    
>>    &uart12 {
>> @@ -1294,3 +1331,64 @@ &qup_spi0_data_clk {
>>    	drive-strength = <6>;
>>    	bias-disable;
>>    };
>> +
>> +&camcc {
>> +	status = "okay";
>> +};
> 
> It's enabled by default.
> 

I'd prefer to see the camera clock controller disabled by default.

https://lore.kernel.org/linux-devicetree/20220518091943.734478-1-vladimir.zapolskiy@linaro.org/

>> +
>> +&camss {
>> +	status = "okay";
>> +	vdda-phy-supply = <&vreg_l5a_0p88>;
>> +	vdda-pll-supply = <&vreg_l9a_1p2>;
>> +
>> +	ports {
> 
> Maybe the port definitions along with #-cells here and on camss could be
> moved to the SoC DTSI?
> 

I agree with it.

>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		/* The port index denotes CSIPHY id i.e. csiphy2 */
>> +		port@2 {
>> +			reg = <2>;
>> +			csiphy2_ep: endpoint {
>> +				clock-lanes = <7>;
>> +				data-lanes = <0 1 2 3>;
>> +				remote-endpoint = <&imx412_ep>;
>> +			};
>> +
>> +		};
>> +	};
>> +};
>> +
>> +&cci1 {
>> +	status = "okay";
>> +};
>> +
>> +&cci1_i2c0 {
>> +	camera@1a {
>> +		compatible = "sony,imx412";
>> +		reg = <0x1a>;
>> +
>> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
>> +		pinctrl-names = "default", "suspend";
>> +		pinctrl-0 = <&cam2_default>;
>> +		pinctrl-1 = <&cam2_suspend>;
>> +
>> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +		assigned-clock-rates = <24000000>;
>> +
>> +		power-domains = <&camcc TITAN_TOP_GDSC>;
>> +		dovdd-supply  = <&vreg_l7f_1p8>;
>> +		avdd-supply = <&vdc_5v>;
>> +		dvdd-supply = <&vdc_5v>;
>> +
>> +		status = "okay";
> 
> It's enabled by default.
> 

--
Best wishes,
Vladimir
