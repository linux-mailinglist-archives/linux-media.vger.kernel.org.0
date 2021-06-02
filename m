Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D587F399613
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 00:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhFBWuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 18:50:19 -0400
Received: from gateway30.websitewelcome.com ([192.185.179.30]:24901 "EHLO
        gateway30.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229626AbhFBWuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 18:50:17 -0400
X-Greylist: delayed 1500 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Jun 2021 18:50:17 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 481DF897A
        for <linux-media@vger.kernel.org>; Wed,  2 Jun 2021 17:01:24 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id oYvUlleLqnrr4oYvUlaQrA; Wed, 02 Jun 2021 17:01:24 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QGxXXmCFwyQE+vVNSEra/v2uZBYm6bBxxjB0/bpHJj0=; b=K5w/is1y6OWG4J4JsHJi+SeTNn
        KC5+nKnTyg0qCm7TTgmHdYyHcGZSDwvSN3rxxEkZpbQb4uMQQmA89McPTAA2ge9a6wpzh6KGYi+Jt
        H6CMyO0Rz5ZDD4aDVpqOrZ6vVdNYfOByVCuZEkZO55B9XEqvLMnphnrJJsF8aK6tR8QenuKt9AOoQ
        xtpQZL44B8QYYAvqUZlosIbkrRFFjeYp6WWykaOWBuwwtlCtn0cvc9j7ie99NBGG2myMMC47LASOv
        SFcWek5q4WzBsT5OLQahxjUBdwW6RSnIxN0531p+usneuWK2IZ61ii6knQ4RE4zTq6AltdFXuIXXq
        S3S9cuKw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:52554 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1loYvQ-00061U-Lg; Wed, 02 Jun 2021 17:01:20 -0500
Subject: Re: [PATCH][venus-for-next-v5.14] media: venus: hfi_cmds: Fix packet
 size calculation
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210601184616.GA23488@embeddedor>
 <202106021254.39A1561075@keescook>
 <e40f4067-82e2-31ff-0694-375a59f949de@embeddedor.com>
Message-ID: <113fd896-464c-6aef-215a-a53ac6103a62@embeddedor.com>
Date:   Wed, 2 Jun 2021 17:02:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e40f4067-82e2-31ff-0694-375a59f949de@embeddedor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1loYvQ-00061U-Lg
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:52554
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/2/21 15:34, Gustavo A. R. Silva wrote:
> 
> 
> On 6/2/21 14:55, Kees Cook wrote:
>> On Tue, Jun 01, 2021 at 01:46:16PM -0500, Gustavo A. R. Silva wrote:
>>> Now that a one-element array was replaced with a flexible-array member
>>> in struct hfi_sys_set_property_pkt, use the struct_size() helper to
>>> correctly calculate the packet size.
>>>
>>> Fixes: 701e10b3fd9f ("media: venus: hfi_cmds.h: Replace one-element array with flexible-array member")
>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>> ---
>>> BTW... it seems that a similar problem is present in
>>> https://lore.kernel.org/linux-hardening/20210211001044.GA69612@embeddedor/ 
>>> and that is what is causing the regression. I will send v2 of that
>>> patch, shortly. Thanks.
>>>
>>>  drivers/media/platform/qcom/venus/hfi_cmds.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> index 11a8347e5f5c..c86279e5d6e8 100644
>>> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> @@ -27,7 +27,7 @@ void pkt_sys_idle_indicator(struct hfi_sys_set_property_pkt *pkt, u32 enable)
>>>  {
>>>  	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
>>>  
>>> -	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
>>> +	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
>>
>> I think this should be "1" not "2".
>>
>> (i.e. there is a single "data" item, followed by an entire *hfi (which
>> starts immediate after data[0]).
> 
> Yeah; I see your point. Here I just wanted to preserve the exact same size
> as the original code, which turns out has a "benign" off-by-one issue.

And the reason why I say it's a "benign" off-by-one (which is actually off-by-four-bytes)
issue is because of this piece of code:

drivers/media/platform/qcom/venus/hfi_venus.c:
 864 static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
 865                                       bool enable)
 866 {
 867         struct hfi_sys_set_property_pkt *pkt;
 868         u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
 869         int ret;
 870
 871         if (!enable)
 872                 return 0;
 873
 874         pkt = (struct hfi_sys_set_property_pkt *)packet;
 875
 876         pkt_sys_idle_indicator(pkt, enable);
 877
 878         ret = venus_iface_cmdq_write(hdev, pkt, false);
 879         if (ret)
 880                 return ret;
 881
 882         return 0;
 883 }

IFACEQ_VAR_SMALL_PKT_SIZE at line 868 is of size 100, which is greater than

sizeof(*pkt) + sizeof(*hfi) + sizeof(u32); in the original code:

drivers/media/platform/qcom/venus/hfi_cmds.c:
  26 void pkt_sys_idle_indicator(struct hfi_sys_set_property_pkt *pkt, u32 enable)
  27 {
  28         struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
  29
  30         pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
  31         pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
  32         pkt->num_properties = 1;
  33         pkt->data[0] = HFI_PROPERTY_SYS_IDLE_INDICATOR;
  34         hfi->enable = enable;
  35 }

--
Gustavo

> I'll fix it up and respin.
> 
> Thanks!
> --
> Gustavo
