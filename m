Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D7E221A91
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 05:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgGPDJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 23:09:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12814 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726996AbgGPDJO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 23:09:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594868953; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mw4JTlNVh9hVrQQ8A7sSm35gcNawb7Kka3KE5+3Xp3U=; b=fGQ5lWJThl+IW1UMhXxGA1ERRLtKNrrr7RicNbT26D0wwpHN08U4a464uoyAWxBDj3Ls5lqb
 4fIa0XDafUyozPUR2ETC4b3LNbYJQQMnFiAwT1vjn0gp8sJz22rNMzVXLpeJhqsKRRfQDnoV
 aQcf+7ytZjv+lKbI3ua7n8lSo4U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f0fc4ce7c8ca473a869d509 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 03:09:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AFB18C433C6; Thu, 16 Jul 2020 03:09:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.11] (unknown [61.1.230.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF20EC433C9;
        Thu, 16 Jul 2020 03:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DF20EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 3/3] arm64: dts: sc7180: Add OPP tables and power-domains
 for venus
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1593603638-19296-1-git-send-email-rnayak@codeaurora.org>
 <1593603638-19296-4-git-send-email-rnayak@codeaurora.org>
 <20200701165414.GB3191083@google.com>
 <1ce702e1-6deb-8f13-3e17-38170b136b2c@codeaurora.org>
 <20200714003603.GP3191083@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <069bb34a-a637-6408-f067-43ff418b4776@codeaurora.org>
Date:   Thu, 16 Jul 2020 08:38:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714003603.GP3191083@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/14/2020 6:06 AM, Matthias Kaehlcke wrote:
> On Thu, Jul 02, 2020 at 02:26:14PM +0530, Rajendra Nayak wrote:
>>
>> On 7/1/2020 10:24 PM, Matthias Kaehlcke wrote:
>>> On Wed, Jul 01, 2020 at 05:10:38PM +0530, Rajendra Nayak wrote:
>>>> Add the OPP tables in order to be able to vote on the performance state
>>>> of a power-domain
>>>>
>>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sc7180.dtsi | 35 +++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 33 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> index ad57df2..738a741 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> @@ -2392,8 +2392,10 @@
>>>>    			reg = <0 0x0aa00000 0 0xff000>;
>>>>    			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>>    			power-domains = <&videocc VENUS_GDSC>,
>>>> -					<&videocc VCODEC0_GDSC>;
>>>> -			power-domain-names = "venus", "vcodec0";
>>>> +					<&videocc VCODEC0_GDSC>,
>>>> +					<&rpmhpd SC7180_CX>;
>>>> +			power-domain-names = "venus", "vcodec0", "opp-pd";
>>>> +			operating-points-v2 = <&venus_opp_table>;
>>>>    			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>>>>    				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>>>>    				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
>>>> @@ -2414,6 +2416,35 @@
>>>>    			video-encoder {
>>>>    				compatible = "venus-encoder";
>>>>    			};
>>>> +
>>>> +			venus_opp_table: venus-opp-table {
>>>> +				compatible = "operating-points-v2";
>>>> +
>>>> +				opp-200000000 {
>>>> +					opp-hz = /bits/ 64 <150000000>;
>>>> +					required-opps = <&rpmhpd_opp_low_svs>;
>>>> +				};
>>>> +
>>>> +				opp-320000000 {
>>>> +					opp-hz = /bits/ 64 <270000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs>;
>>>> +				};
>>>> +
>>>> +				opp-380000000 {
>>>> +					opp-hz = /bits/ 64 <340000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>>>> +				};
>>>> +
>>>> +				opp-444000000 {
>>>> +					opp-hz = /bits/ 64 <434000000>;
>>>> +					required-opps = <&rpmhpd_opp_nom>;
>>>> +				};
>>>> +
>>>> +				opp-533000000 {
>>>> +					opp-hz = /bits/ 64 <500000000>;
>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>> +				};
>>>
>>> the labels of the OPP nodes don't match the specified frequencies
>>
>> Oops, I'll fix and respin.
> 
> ping, it seems the respin is still pending

I was waiting on Rob to first ack the bindings update patch [1] before I respin
these, however I have not seen a response from Rob on the bindings patch yet,
despite a couple pings. So I'll respin this series anyway.

[1] https://lore.kernel.org/patchwork/patch/1241077/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
