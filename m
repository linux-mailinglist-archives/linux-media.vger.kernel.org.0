Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA2A219EDF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 13:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgGILJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 07:09:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50773 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726936AbgGILJj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jul 2020 07:09:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594292979; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=x4m6NkhtSK7m0N67OblPvMfBvcT5m7GhZdNzWJ4eB+I=; b=kiYzVtoZjVvmzBtdn8x9DbbJLN75JJBATD/D9yhQFe+YoSScRD4OjqxtmQIjtNxrIcEWJoT/
 aHW6ZUHBkGQ0iM3EoEQ+RqXW6ZjKVWwg+KJZ3ommCjOrNijczTXzF+PsrdlBERhfazw80r1a
 M5xviFwbXEO3mRxxUu9zrnZhDrY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5f06fae50082b278484b5da0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 11:09:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C0706C433CA; Thu,  9 Jul 2020 11:09:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.11] (unknown [61.3.20.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A525AC433C6;
        Thu,  9 Jul 2020 11:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A525AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2] dt-bindings: media: venus: Add an optional power
 domain for perf voting
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
References: <1589349807-10163-1-git-send-email-rnayak@codeaurora.org>
 <20200527193638.GA2604206@bogus>
 <448cc4c0-0714-dc62-df19-7fa8fba91758@codeaurora.org>
 <1e8c07c8-0954-462a-cfe6-a1ccde1bedea@codeaurora.org>
Message-ID: <43b6f7ee-503c-1036-3f00-9fbb4d531ea0@codeaurora.org>
Date:   Thu, 9 Jul 2020 16:39:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1e8c07c8-0954-462a-cfe6-a1ccde1bedea@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/1/2020 4:50 PM, Rajendra Nayak wrote:
> 
> On 6/1/2020 11:26 AM, Rajendra Nayak wrote:
>>
>> On 5/28/2020 1:06 AM, Rob Herring wrote:
>>> On Wed, May 13, 2020 at 11:33:27AM +0530, Rajendra Nayak wrote:
>>>> Add an optional power domain which when specified can be used for
>>>> setting the performance state of Venus.
>>>>
>>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>>> ---
>>>>   Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
>>>>   Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
>>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>>>> index 764affa..ac1ed64 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>>>> @@ -25,12 +25,16 @@ properties:
>>>>       maxItems: 1
>>>>     power-domains:
>>>> -    maxItems: 2
>>>> +    minItems: 2
>>>> +    maxItems: 3
>>>>     power-domain-names:
>>>> +    minItems: 2
>>>> +    maxItems: 3
>>>>       items:
>>>>         - const: venus
>>>>         - const: vcodec0
>>>> +      - const: opp-pd
>>>
>>> Humm, looks suspicious. This is a phyical power island in this block?
>>
>> yes, this is used to represent the physical 'cx' power island in the SoC
>> (Its a shared power island, not a power island specific to this block)
>> that can be scaled to different 'performance levels' based on the frequency
>> the codec is expected to run at.
> 
> Rob, Did you have any other concerns here? Should I be re-posting this?

Rob, ping.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
