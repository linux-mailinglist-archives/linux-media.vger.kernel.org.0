Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330B82256AE
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 06:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgGTE3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 00:29:37 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:20763 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725287AbgGTE3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 00:29:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595219376; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Dpw1HGE3ZCaDA+GhNOQnpyNXQW1TL4kVVJ9x2AeOGN4=; b=kJli9AY8WF5NMcW887PjIAxrBkLK35o9FE4F7NmpLLmgVwxfN/r342pmaRjEGzPN+QVByeEV
 P9xMBy5iOzw8qL/7NhpO9ht9UM7JQw+uSmziD0mCllAyegdzVRcUAQpM8o9oisEK23SKFaUB
 BnQ9a7453YNNXbnTO7EYqXl2IFs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5f151d958423214e131269ce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 04:29:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6B40C433CB; Mon, 20 Jul 2020 04:29:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.12] (unknown [61.3.19.245])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDC83C433C6;
        Mon, 20 Jul 2020 04:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BDC83C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: venus: Add an optional power
 domain for perf voting
To:     Rob Herring <robh@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
References: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
 <1594878139-3402-2-git-send-email-rnayak@codeaurora.org>
 <20200716195913.GA2744252@bogus>
 <cd368ea7-6ddc-004c-164d-dbbad8516853@codeaurora.org>
 <CAL_Jsq+RXcgTVwd_JC8YLYb1Ni29zFD9AxcNsmcpyrdefWq3Kw@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <59502915-743e-6756-34e2-f409e61fc03b@codeaurora.org>
Date:   Mon, 20 Jul 2020 09:59:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+RXcgTVwd_JC8YLYb1Ni29zFD9AxcNsmcpyrdefWq3Kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/18/2020 12:26 AM, Rob Herring wrote:
> On Thu, Jul 16, 2020 at 11:52 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>>
>> On 7/17/2020 1:29 AM, Rob Herring wrote:
>>> On Thu, Jul 16, 2020 at 11:12:16AM +0530, Rajendra Nayak wrote:
>>>> Add an optional power domain which when specified can be used for
>>>> setting the performance state of Venus.
>>>
>>> The h/w suddenly grew a new power island/domain? Seems like an abuse of
>>> power-domains...
>>
>> The power-domain always existed, we have just managed to survive without
>> having venus support DVFS and have the domain always be at a high performance
>> level (set statically by boot code)
>> Now, if we care to do DVFS and support better PM on the SoC, its important
>> for the devices to manage this additional power domain (and dynamically
>> scale it)
>>
>> That said, if the name 'opp-pd' makes it look like a software construct,
>> like Bjorn mentioned, I am fine to give it a real name like 'cx-pd'
>> Does that sound good?
> 
> He suggested 'cx' as '-pd' would be redundant. I have no idea what
> 'cx' means, but fine.
> 
>> PS: Like I mentioned earlier [1], cx is a shared power island,
>> not a power island specific to this block, and definitely not a software
>> pm-domain construct.
> 
> Put this context/detail into your patches. Assume I don't remember
> what happened last week.

Thanks Rob, will do when I re-post shortly.

> 
> Unfortunately, gmail seems to have no way to filter on unread mails in
> reply to my replies and doesn't move the thread up in 'Sent' filter,
> so older threads get lost.
> 
> Rob
> 
>> [1] https://lore.kernel.org/patchwork/patch/1241077/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
