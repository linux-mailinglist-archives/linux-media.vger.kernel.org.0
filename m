Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7745A230087
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 06:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgG1ERh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 00:17:37 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:54972 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726369AbgG1ERh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 00:17:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595909856; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hCNM+2Lv+dQQBLrGuQbA6lyFD5H/2pzjFUsxm4GPBrU=; b=EASfrngd76WsCHcGmJQWRxIs5DogMtMA07IHijgViVEBTneRREXXfCGzHA5yP8iR3V5GtGFf
 OqcZ6ODA5kCl+i1UDyljm/Y4tDJ7tsBxaEg9cRJ3TcBeTzHF1mZQuhuyXCPXkMdnkfekONAJ
 ZJhz4AUy7ruj7PaBCV5dBG7b8Tc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f1fa6df70ff737ddba4a710 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 04:17:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3E52BC43395; Tue, 28 Jul 2020 04:17:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.12] (unknown [61.3.20.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FA49C433C6;
        Tue, 28 Jul 2020 04:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4FA49C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
To:     Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Taniya Das <tdas@codeaurora.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <94581989-e069-55e5-6b70-919185eda33e@linaro.org>
 <e0c03ce2-136c-2c5c-6f36-bb0c69a82e2d@codeaurora.org>
 <5a8af2da-cc3f-005d-47e6-b36be1104d6a@codeaurora.org>
 <20200727153806.kgegadvghmkevch3@vireshk-mac-ubuntu>
 <159589753282.1360974.11628682178494669632@swboyd.mtv.corp.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <e08e9822-7c0c-29d7-67b2-245af66b623a@codeaurora.org>
Date:   Tue, 28 Jul 2020 09:47:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159589753282.1360974.11628682178494669632@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/28/2020 6:22 AM, Stephen Boyd wrote:
> Quoting Viresh Kumar (2020-07-27 08:38:06)
>> On 27-07-20, 17:38, Rajendra Nayak wrote:
>>> On 7/27/2020 11:23 AM, Rajendra Nayak wrote:
>>>> On 7/24/2020 7:39 PM, Stanimir Varbanov wrote:
>>>>>>> +
>>>>>>> +                opp-533000000 {
>>>>>>> +                    opp-hz = /bits/ 64 <533000000>;
>>
>> Is this the highest OPP in table ?
>>
>>>>> Actually it comes from videocc, where ftbl_video_cc_venus_clk_src
>>>>> defines 533000000 but the real calculated freq is 533000097.
>>>>
>>>> I still don't quite understand why the videocc driver returns this
>>>> frequency despite this not being in the freq table.
>>>
>>> Ok, so I see the same issue on sc7180 also. clk_round_rate() does seem to
>>> return whats in the freq table, but clk_set_rate() goes ahead and sets it
> 
> I'm happy to see clk_round_rate() return the actual rate that would be
> achieved and not just the rate that is in the frequency tables. Would
> that fix the problem? 

It would, but only if I also update the OPP table to have 533000097
instead of 533000000 (which I guess is needed anyway)
If this is the actual frequency that's achievable, then perhaps even the clock
freq table should have this? 533000097 and not 533000000?
That way clk_round_rate() would return the actual rate that's achieved and
we don't need any extra math. Isn't that the reason these freq tables exist
anyway.

> It may be that we need to make clk_round_rate() do
> some more math on qcom platforms and actually figure out what the rate
> is going to be instead of blindly trust the frequency that has been set
> in the tables.
> 
>>> to 533000097. Subsequently when we try to set a different OPP, it fails to
>>> find the 'current' OPP entry for 533000097. This sounds like an issue with the OPP
>>> framework? Should we not fall back to the highest OPP as the current OPP?
>>>
>>> Stephen/Viresh, any thoughts?
>>
>> I think we (in all frameworks generally) try to set a frequency <=
>> target frequency and so there may be a problem if the frequency is
>> larger than highest supported. IOW, you need to fix tables a bit.
>>
> 
> Rounding is annoying for sure.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
