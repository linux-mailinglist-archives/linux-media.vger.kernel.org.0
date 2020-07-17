Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712F62232CE
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 07:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgGQFOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 01:14:06 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:39288 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbgGQFOF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 01:14:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594962845; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NpxTil8JCWes0+2Pepn4rr9f/VI4zSITIqSFlcRAvsE=; b=dm9+pvzshbhd0K8lwVykcymr4gm/Tm+b+46AG0kAIy1MIZ9kOXp30lnQQQp5hRTgq3EZcXjn
 VwKb1//NGDmrBD4bq0cv3N8xwFhMXnElMAyl8BXtemS5Znzl2GR3BHyH7dxXAqb09JkOpK8C
 l2d1POujKQy7sCUsSQ94bim+Ul8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5f11339c8e36ecda306db6fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 05:14:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1F23AC43391; Fri, 17 Jul 2020 05:14:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.225.150] (unknown [137.97.45.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C87DC433C9;
        Fri, 17 Jul 2020 05:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C87DC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: venus: Add an optional power
 domain for perf voting
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
References: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
 <1594878139-3402-2-git-send-email-rnayak@codeaurora.org>
 <20200716234310.GH1218486@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0f0ae5f5-b03e-0fd3-865f-b80472fb7a21@codeaurora.org>
Date:   Fri, 17 Jul 2020 10:43:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716234310.GH1218486@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/17/2020 5:13 AM, Bjorn Andersson wrote:
> On Wed 15 Jul 22:42 PDT 2020, Rajendra Nayak wrote:
> 
>> Add an optional power domain which when specified can be used for
>> setting the performance state of Venus.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>> This is a resend of https://lore.kernel.org/patchwork/patch/1241077/
>>
>>   Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
>>   Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> index 55f2d67..1e8675b 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> @@ -25,12 +25,16 @@ properties:
>>       maxItems: 1
>>   
>>     power-domains:
>> -    maxItems: 2
>> +    minItems: 2
>> +    maxItems: 3
>>   
>>     power-domain-names:
>> +    minItems: 2
>> +    maxItems: 3
>>       items:
>>         - const: venus
>>         - const: vcodec0
>> +      - const: opp-pd
> 
> In line with Rob's question, the "opp power-domain" seems like a
> software construct, wouldn't this be better named e.g. "cx"?

The reason I chose to call it 'opp-pd' was to signify its the domain
that supports scaling (performance state) and not something that's just
turned on/off. I am fine calling it cx if that makes it look more 'real'

> 
> Regards,
> Bjorn
> 
>>   
>>     clocks:
>>       maxItems: 5
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
>> index 157dff8..437286d 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
>> @@ -25,13 +25,17 @@ properties:
>>       maxItems: 1
>>   
>>     power-domains:
>> -    maxItems: 3
>> +    minItems: 3
>> +    maxItems: 4
>>   
>>     power-domain-names:
>> +    minItems: 3
>> +    maxItems: 4
>>       items:
>>         - const: venus
>>         - const: vcodec0
>>         - const: vcodec1
>> +      - const: opp-pd
>>   
>>     clocks:
>>       maxItems: 7
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
