Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC52223320
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 07:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgGQFxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 01:53:14 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:30468 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725300AbgGQFxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 01:53:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594965193; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=4tH6ToMxx8+ekSYiqz8suxCIKe0URL0znIrfCOTp/B0=; b=a10F3BjV7IxEPYzZzRk0ivKylyL3JsCwdHzYSoxBgKEF5T0tHGF3qGPkiXJr28Hald9haaX6
 4OuJRFa0buOq/1VGr5y+t8m0i3CXnXTYPu94fdvPb8qyCxjoM4wqm3GqBvN3AX/4u1CqTHet
 4e3i2jdeMYAlXgY1RR3QjwqKHrM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f113caec9bd2efa2e50cd5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 05:52:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9480FC433C6; Fri, 17 Jul 2020 05:52:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.225.150] (unknown [137.97.45.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC6DCC433CB;
        Fri, 17 Jul 2020 05:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC6DCC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: venus: Add an optional power
 domain for perf voting
To:     Rob Herring <robh@kernel.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
References: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
 <1594878139-3402-2-git-send-email-rnayak@codeaurora.org>
 <20200716195913.GA2744252@bogus>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <cd368ea7-6ddc-004c-164d-dbbad8516853@codeaurora.org>
Date:   Fri, 17 Jul 2020 11:22:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716195913.GA2744252@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/17/2020 1:29 AM, Rob Herring wrote:
> On Thu, Jul 16, 2020 at 11:12:16AM +0530, Rajendra Nayak wrote:
>> Add an optional power domain which when specified can be used for
>> setting the performance state of Venus.
> 
> The h/w suddenly grew a new power island/domain? Seems like an abuse of
> power-domains...

The power-domain always existed, we have just managed to survive without
having venus support DVFS and have the domain always be at a high performance
level (set statically by boot code)
Now, if we care to do DVFS and support better PM on the SoC, its important
for the devices to manage this additional power domain (and dynamically
scale it)

That said, if the name 'opp-pd' makes it look like a software construct,
like Bjorn mentioned, I am fine to give it a real name like 'cx-pd'
Does that sound good?

PS: Like I mentioned earlier [1], cx is a shared power island,
not a power island specific to this block, and definitely not a software
pm-domain construct.

[1] https://lore.kernel.org/patchwork/patch/1241077/

> 
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
