Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2554211F45
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 10:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgGBI4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 04:56:23 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:35740 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726522AbgGBI4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jul 2020 04:56:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593680182; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HtJyaDx29b1fnJMB/cy87u6Jgv4WnAhUPAzely5Z90E=; b=FbdtbuW4yOBz3aRScu2o3tOkNU63qptRkqXOa8K3tUAG+w8AJ06FhM6EMECJ0nLPEORXjZkB
 JPCmC900R5B3YjOn9WuOG8DvaeQtL3hijERsFL1xwZmrSH2kM6dlb+cMEkY0tkMNFiaSL8nU
 cW/K3R5A+rgKhG0xPaK5GiEr3ec=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5efda135a6e154319f438fbf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Jul 2020 08:56:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CA047C433CB; Thu,  2 Jul 2020 08:56:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.11] (unknown [117.247.20.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B59C3C433CA;
        Thu,  2 Jul 2020 08:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B59C3C433CA
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
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <1ce702e1-6deb-8f13-3e17-38170b136b2c@codeaurora.org>
Date:   Thu, 2 Jul 2020 14:26:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701165414.GB3191083@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/1/2020 10:24 PM, Matthias Kaehlcke wrote:
> On Wed, Jul 01, 2020 at 05:10:38PM +0530, Rajendra Nayak wrote:
>> Add the OPP tables in order to be able to vote on the performance state
>> of a power-domain
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 35 +++++++++++++++++++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index ad57df2..738a741 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -2392,8 +2392,10 @@
>>   			reg = <0 0x0aa00000 0 0xff000>;
>>   			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>   			power-domains = <&videocc VENUS_GDSC>,
>> -					<&videocc VCODEC0_GDSC>;
>> -			power-domain-names = "venus", "vcodec0";
>> +					<&videocc VCODEC0_GDSC>,
>> +					<&rpmhpd SC7180_CX>;
>> +			power-domain-names = "venus", "vcodec0", "opp-pd";
>> +			operating-points-v2 = <&venus_opp_table>;
>>   			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>>   				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>>   				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
>> @@ -2414,6 +2416,35 @@
>>   			video-encoder {
>>   				compatible = "venus-encoder";
>>   			};
>> +
>> +			venus_opp_table: venus-opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-200000000 {
>> +					opp-hz = /bits/ 64 <150000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-320000000 {
>> +					opp-hz = /bits/ 64 <270000000>;
>> +					required-opps = <&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-380000000 {
>> +					opp-hz = /bits/ 64 <340000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-444000000 {
>> +					opp-hz = /bits/ 64 <434000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +				};
>> +
>> +				opp-533000000 {
>> +					opp-hz = /bits/ 64 <500000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>;
>> +				};
> 
> the labels of the OPP nodes don't match the specified frequencies

Oops, I'll fix and respin.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
