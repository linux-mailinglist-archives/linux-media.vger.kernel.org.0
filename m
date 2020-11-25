Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF572C40D9
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 14:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbgKYNDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 08:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKYNDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 08:03:51 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF94C061A4F
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 05:03:50 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id u12so1860057wrt.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BXaJmG+wTXtQ1LIgHLXOdZkWb3psJr3hG12v2PvvxlE=;
        b=Tb1NODJpg8kwIwdN7oQj+EV58bHxyDFPIYQMJPF4FNz9of+yAPa2kYA92zKU+hq3Uy
         zPV1ZmyDxYUqI5ymigRmZgnaFgok6chy6EymiPCZ5nzYcd5iQweT957e+FRN2j46+XR8
         Po9Sl4pv+m1+8H9OwgBkx97tM4iOOmWHOlW9yYMtWte6kMOG3RMQxDxIoI4yuYbvv/OV
         yGvNeg3TlqNi/bMSi4/Odx3euErYZww+yHDozaDO63ijUqjMKeP0ij1aygvjiW4odH+G
         StSjnOnjf0KKV/Ir4BdTibLgYDocoeZFpmChDi33FrIFnyPazBstgFrUgprJktbqS52D
         7UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BXaJmG+wTXtQ1LIgHLXOdZkWb3psJr3hG12v2PvvxlE=;
        b=UrS0epTAE/k5RyOXq1J4CY3QTPNQXOVI0zjVAg3ZlRRpxAblW0C9EOV09jPr706Rr3
         PxnXz4kMZXC9TFqDyfKp3UaDZP6ZUok1xdcf0Io8whL2cCrwVS6hb/7pxko8/hYW0kmp
         KQ/V35F8k3RvoRwUTAWMByWnCkBbTg73isxcsjTWjiPVAyQr8Q6Tf6zHdNcJZbL05Gs2
         CNyfvL/EB19ebUjGtz/YJq0PRkqdmoM0UkZ4d77qwuW7KsAPd8/TYRxraeC0CE2ae4ET
         I6QG9OxK/v9PEyHUPAlEF6PuG1/npsozQNVmJWYbDthmsS1QZrMezlVYLQ6gW+Qdfluu
         xtJw==
X-Gm-Message-State: AOAM5327kIabh8U7G0JJ6eV6S0RHchZskyWj2/4dFdwXopDzbyEZufft
        Acm6I/rRFNZ+9uUUj2lrTR/tww==
X-Google-Smtp-Source: ABdhPJxyygtdb4BfwuO8knoOC+REpXaIwuegyRa3gkpJ6Ld63hatAPSPzBPzrzXpMPFH7Ub8N0lgHg==
X-Received: by 2002:adf:c702:: with SMTP id k2mr4175742wrg.156.1606309428614;
        Wed, 25 Nov 2020 05:03:48 -0800 (PST)
Received: from [192.168.0.3] (hst-221-112.medicom.bg. [84.238.221.112])
        by smtp.googlemail.com with ESMTPSA id z6sm4628966wmi.1.2020.11.25.05.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 05:03:48 -0800 (PST)
Subject: Re: [PATCH 3/3] media: hfi_venus: Request interrupt for sync cmds
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
 <20201120001037.10032-4-stanimir.varbanov@linaro.org>
 <CAPBb6MWsaHQtQYh8tQnGjwPCrCXeCnf08jL+yxM9ZkCBFNW5mg@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <595f8e22-0616-ff8f-78f3-991ef94ebf65@linaro.org>
Date:   Wed, 25 Nov 2020 15:03:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MWsaHQtQYh8tQnGjwPCrCXeCnf08jL+yxM9ZkCBFNW5mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/25/20 10:08 AM, Alexandre Courbot wrote:
> On Fri, Nov 20, 2020 at 9:12 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> From: Vikash Garodia <vgarodia@codeaurora.org>
>>
>> For synchronous commands, update the message queue variable.
>> This would inform video firmware to raise interrupt on host
>> CPU whenever there is a response for such commands.
>>
>> Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/hfi_venus.c | 74 ++++++++++---------
>>  1 file changed, 41 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index 4be4a75ddcb6..b8fdb464ba9c 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>> @@ -372,7 +372,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
>>  }
>>
>>  static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
>> -                                        void *pkt)
>> +                                        void *pkt, bool sync)
>>  {
>>         struct device *dev = hdev->core->dev;
>>         struct hfi_pkt_hdr *cmd_packet;
>> @@ -397,15 +397,23 @@ static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
>>         if (rx_req)
>>                 venus_soft_int(hdev);
>>
>> +       /* Inform video firmware to raise interrupt for synchronous commands */
>> +       queue = &hdev->queues[IFACEQ_MSG_IDX];
>> +       if (sync) {
>> +               queue->qhdr->rx_req = 1;
>> +               /* ensure rx_req is updated in memory */
>> +               wmb();
>> +       }
> 
> Wouldn't it be safer to do this before calling venus_soft_int()? I
> don't know what the firmware is supposed to do with rx_req but
> intuitively it looks like it should be set before we signal it.
> 

I'll leave Vikash to comment. IMO this is a good suggestion.

<cut>

-- 
regards,
Stan
