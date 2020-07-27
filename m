Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3CE22EBBA
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 14:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgG0MJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 08:09:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24347 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbgG0MJp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 08:09:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595851783; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=N+OxDCRHWtMXnNN00q7isorslYGD8DlcIAQ4ZVsCYVs=; b=osGKzGSGQyfCNgkmDEe/78JlAqKcrEmzVPzi8sPZnv4m5jyPcxChE3LH/NmKWyvkfdYn9NC/
 5yLAhRahHuGgPxBMkbXvmyV/0BqBGaJGlitGI5QBh+s/hUwPOyMuHJM8NpZkr4PH3yDJinig
 qBWQZ6/HvRM5jnmm5EqJsqg5iS4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5f1ec3bac7e7bf09e0188359 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 12:08:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 426CDC43391; Mon, 27 Jul 2020 12:08:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.12] (unknown [61.1.231.32])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B373C433C9;
        Mon, 27 Jul 2020 12:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8B373C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Taniya Das <tdas@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <94581989-e069-55e5-6b70-919185eda33e@linaro.org>
 <e0c03ce2-136c-2c5c-6f36-bb0c69a82e2d@codeaurora.org>
Message-ID: <5a8af2da-cc3f-005d-47e6-b36be1104d6a@codeaurora.org>
Date:   Mon, 27 Jul 2020 17:38:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0c03ce2-136c-2c5c-6f36-bb0c69a82e2d@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/27/2020 11:23 AM, Rajendra Nayak wrote:
> 
> 
> On 7/24/2020 7:39 PM, Stanimir Varbanov wrote:
>> Hi,
>>
>> On 7/23/20 9:06 PM, Stanimir Varbanov wrote:
>>> Hi Rajendra,
>>>
>>> After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
>>> below messages on db845:
>>>
>>> qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
>>> current OPP for freq 533000097 (-34)
>>>
>>> ^^^ This one is new.
>>>
>>> qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
>>>
>>> ^^^ and this message is annoying, can we make it pr_debug in rpmh?
>>>
>>> On 7/23/20 2:26 PM, Rajendra Nayak wrote:
>>>> Add the OPP tables in order to be able to vote on the performance state of
>>>> a power-domain.
>>>>
>>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 40 ++++++++++++++++++++++++++++++++++--
>>>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>>> index e506793..5ca2265 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>>> @@ -3631,8 +3631,10 @@
>>>>               interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>>               power-domains = <&videocc VENUS_GDSC>,
>>>>                       <&videocc VCODEC0_GDSC>,
>>>> -                    <&videocc VCODEC1_GDSC>;
>>>> -            power-domain-names = "venus", "vcodec0", "vcodec1";
>>>> +                    <&videocc VCODEC1_GDSC>,
>>>> +                    <&rpmhpd SDM845_CX>;
>>>> +            power-domain-names = "venus", "vcodec0", "vcodec1", "cx";
>>>> +            operating-points-v2 = <&venus_opp_table>;
>>>>               clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>>>>                    <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>>>>                    <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
>>>> @@ -3654,6 +3656,40 @@
>>>>               video-core1 {
>>>>                   compatible = "venus-encoder";
>>>>               };
>>>> +
>>>> +            venus_opp_table: venus-opp-table {
>>>> +                compatible = "operating-points-v2";
>>>> +
>>>> +                opp-100000000 {
>>>> +                    opp-hz = /bits/ 64 <100000000>;
>>>> +                    required-opps = <&rpmhpd_opp_min_svs>;
>>>> +                };
>>>> +
>>>> +                opp-200000000 {
>>>> +                    opp-hz = /bits/ 64 <200000000>;
>>>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>>>> +                };
>>>> +
>>>> +                opp-320000000 {
>>>> +                    opp-hz = /bits/ 64 <320000000>;
>>>> +                    required-opps = <&rpmhpd_opp_svs>;
>>>> +                };
>>>> +
>>>> +                opp-380000000 {
>>>> +                    opp-hz = /bits/ 64 <380000000>;
>>>> +                    required-opps = <&rpmhpd_opp_svs_l1>;
>>>> +                };
>>>> +
>>>> +                opp-444000000 {
>>>> +                    opp-hz = /bits/ 64 <444000000>;
>>>> +                    required-opps = <&rpmhpd_opp_nom>;
>>>> +                };
>>>> +
>>>> +                opp-533000000 {
>>>> +                    opp-hz = /bits/ 64 <533000000>;
>>
>> Actually it comes from videocc, where ftbl_video_cc_venus_clk_src
>> defines 533000000 but the real calculated freq is 533000097.
> 
> I still don't quite understand why the videocc driver returns this
> frequency despite this not being in the freq table.

Ok, so I see the same issue on sc7180 also. clk_round_rate() does seem to
return whats in the freq table, but clk_set_rate() goes ahead and sets it
to 533000097. Subsequently when we try to set a different OPP, it fails to
find the 'current' OPP entry for 533000097. This sounds like an issue with the OPP
framework? Should we not fall back to the highest OPP as the current OPP?

Stephen/Viresh, any thoughts?

> I would expect a clk_round_rate() when called with 533000097 to return
> a 533000000.
> 
> Taniya, Do you know why?
> 
>>
>> If I change to opp-hz = /bits/ 64 <533000097> the error disappear.
>>
>> I guess we have to revisit m/n and/or pre-divider for this freq when the
>> source pll is P_VIDEO_PLL0_OUT_MAIN PLL?
>>
>>>> +                    required-opps = <&rpmhpd_opp_turbo>;
>>>> +                };
>>>> +            };
>>>>           };
>>>>           videocc: clock-controller@ab00000 {
>>>>
>>>
>>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
