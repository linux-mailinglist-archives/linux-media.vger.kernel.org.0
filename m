Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F106C39AF54
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 03:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhFDBIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 21:08:09 -0400
Received: from gateway23.websitewelcome.com ([192.185.50.161]:32644 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229685AbhFDBII (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 21:08:08 -0400
X-Greylist: delayed 1216 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Jun 2021 21:08:08 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 2D76BCC12
        for <linux-media@vger.kernel.org>; Thu,  3 Jun 2021 19:46:05 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id oxyPlecqw8ElSoxyPlzelo; Thu, 03 Jun 2021 19:46:05 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8MZ6QMJp18jNvCBuEt+8EXH4IwtikkXnl4EIXVb4e2c=; b=MYUX0zASYWu+jrRJ8OXVlP43kK
        D7ag4jS6eiYT1BRBDJmyfntmL4IbzMsdnYFmE5bRSJf57X8CRp3kEVxaJ+FY+0BIq9l4pzfoc0fRR
        KAT6B5pnZtfNRikRgGm0oJ/8RWFJB4Iy0yJ8zZKc4wxsShJ3vbXYUFyqN0ml2CQ+VqE4pzNNGRkBB
        wnyVKGFSDO3bCKrItkx+9t+UOU968CRHofUUVkioY8HqWDMoZ/LyKM2a1uAlcb/RsJUQ8TwSlwEUq
        Wi6GzwnMTuVDXXBKkjyD1eKxoV+4nmcARtq5YqY1xPSZ8NMeZTWM+KDKJVycxuuB2k8WxHXssZIkG
        XIPP/vyQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:33262 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1loxyJ-001HnV-Su; Thu, 03 Jun 2021 19:45:59 -0500
Subject: Re: [PATCH][next] media: venus: hfi_msgs.h: Replace one-element
 arrays with flexible-array members
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210211001044.GA69612@embeddedor>
 <bf31beab-dc36-23e9-757f-9729be59f7b2@embeddedor.com>
 <de8538ad-48d8-7a3c-af4f-ab31ee2da761@linaro.org>
 <f63824ee-fc8b-25cf-f3c2-c7b3947b8076@embeddedor.com>
 <64aa38bc-62b2-79d9-156f-74a09f11f871@linaro.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <0436d974-f17b-10f3-8b05-f8505524a6f5@embeddedor.com>
Date:   Thu, 3 Jun 2021 19:47:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <64aa38bc-62b2-79d9-156f-74a09f11f871@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1loxyJ-001HnV-Su
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:33262
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

On 5/17/21 06:01, Stanimir Varbanov wrote:
> Hi,
> 
> On 5/12/21 7:37 PM, Gustavo A. R. Silva wrote:
>>
>>
>> On 5/12/21 06:39, Stanimir Varbanov wrote:
>>> Hi,
>>>
>>> On 5/11/21 6:46 PM, Gustavo A. R. Silva wrote:
>>>> Hi all,
>>>>
>>>> Friendly ping:
>>>>
>>>> We are about to be able to globally enable -Warray-bounds and, these are one of
>>>> the last out-of-bounds warnings in linux-next.
>>>>
>>>> Could someone take this, please?
>>>
>>> This one introduces regressions, so I cannot take it. It needs some more
>>> work.
>>
>> Please, share with me the errors or warnings you see with this. So, I can
>> have an idea of what is going on. Unfortunately, I don't have access to the
>> test suite or hardware to test this.
> 
> I guess it needs more debugging, but the simple answer is that the
> driver refuse to start streaming with this patch.

This patch should fix the problems you are seeing:

https://lore.kernel.org/linux-hardening/20210604004338.GA140710@embeddedor/

Could you please help me to test it?

Thanks!
--
Gustavo

> 
>>
>> Thanks!
>> --
>> Gustavo
>>
>>
>>
>>>>
>>>> Thanks
>>>> --
>>>> Gustavo
>>>>
>>>> On 2/10/21 18:10, Gustavo A. R. Silva wrote:
>>>>> There is a regular need in the kernel to provide a way to declare having
>>>>> a dynamically sized set of trailing elements in a structure. Kernel code
>>>>> should always use “flexible array members”[1] for these cases. The older
>>>>> style of one-element or zero-length arrays should no longer be used[2].
>>>>>
>>>>> Use flexible-array members in struct hfi_msg_sys_property_info_pkt and
>>>>> hfi_msg_session_property_info_pkt instead of one-element arrays.
>>>>>
>>>>> Also, this helps with the ongoing efforts to enable -Warray-bounds by
>>>>> fixing the following warnings:
>>>>>
>>>>>   CC [M]  drivers/media/platform/qcom/venus/hfi_msgs.o
>>>>> drivers/media/platform/qcom/venus/hfi_msgs.c: In function ‘hfi_sys_property_info’:
>>>>> drivers/media/platform/qcom/venus/hfi_msgs.c:246:35: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>>>>>   246 |  if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
>>>>>       |                          ~~~~~~~~~^~~
>>>>> drivers/media/platform/qcom/venus/hfi_msgs.c: In function ‘hfi_session_prop_info’:
>>>>> drivers/media/platform/qcom/venus/hfi_msgs.c:342:62: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>>>>>   342 |  if (!req_bytes || req_bytes % sizeof(*buf_req) || !pkt->data[1])
>>>>>       |                                                     ~~~~~~~~~^~~
>>>>>
>>>>> [1] https://en.wikipedia.org/wiki/Flexible_array_member
>>>>> [2] https://www.kernel.org/doc/html/v5.9/process/deprecated.html#zero-length-and-one-element-arrays
>>>>>
>>>>> Link: https://github.com/KSPP/linux/issues/79
>>>>> Link: https://github.com/KSPP/linux/issues/109
>>>>> Build-tested-by: <lkp@intel.com>
>>>>> Link: https://lore.kernel.org/lkml/6023dd80.MmTeFf8SzwX0iK7%2F%25lkp@intel.com/
>>>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>>>> ---
>>>>>  drivers/media/platform/qcom/venus/hfi_msgs.h | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.h b/drivers/media/platform/qcom/venus/hfi_msgs.h
>>>>> index 526d9f5b487b..e2d2ccfbdd24 100644
>>>>> --- a/drivers/media/platform/qcom/venus/hfi_msgs.h
>>>>> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.h
>>>>> @@ -113,7 +113,7 @@ struct hfi_msg_sys_ping_ack_pkt {
>>>>>  struct hfi_msg_sys_property_info_pkt {
>>>>>  	struct hfi_pkt_hdr hdr;
>>>>>  	u32 num_properties;
>>>>> -	u32 data[1];
>>>>> +	u32 data[];
>>>>>  };
>>>>>  
>>>>>  struct hfi_msg_session_load_resources_done_pkt {
>>>>> @@ -233,7 +233,7 @@ struct hfi_msg_session_parse_sequence_header_done_pkt {
>>>>>  struct hfi_msg_session_property_info_pkt {
>>>>>  	struct hfi_session_hdr_pkt shdr;
>>>>>  	u32 num_properties;
>>>>> -	u32 data[1];
>>>>> +	u32 data[];
>>>>>  };
>>>>>  
>>>>>  struct hfi_msg_session_release_resources_done_pkt {
>>>>>
>>>
> 
