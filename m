Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4933B399503
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 22:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhFBU4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 16:56:46 -0400
Received: from gateway36.websitewelcome.com ([192.185.188.18]:30323 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230050AbhFBUzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 16:55:38 -0400
X-Greylist: delayed 1246 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Jun 2021 16:55:38 EDT
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 0BF704023A9F5
        for <linux-media@vger.kernel.org>; Wed,  2 Jun 2021 15:33:06 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id oXY1lf9nX1iQOoXY1l07Um; Wed, 02 Jun 2021 15:33:06 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+MhsQd5tiNlUqXw8oT14rjbKzGf8+RSzY0HUwHrz/28=; b=lWaAGL4hOhZnX/8WEY+pBwlfZu
        silUDulrgxJkD4EN9ozzXyLMBN7oiBGTdWlanUSfeJUX0fJsSWPQF3r90THiDhWSn+Mq5KIUJvXcc
        3Sdx1CLFU+/UIseyDTPiZ5G2HMMzC6EIrN2YDV9KqNhc2/cB+J7oWAemXQlrU6bX4T95D5esrC77+
        rN0Hg/OwBRB42vUhQ34Os5Z7fzv2tbvDOnxBE9AyBPiV1P2Fea7Gp8KomRbuBbkDd0ghF9uun6SQ1
        6wpG816qVUrZ2wsWUqd15rxSRQSdJEAGw8WOlYo9NEqkkoAeF+wl+gevBv9bAILf9LkJ1mpW13XEI
        nqpoapmQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:52430 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1loXXw-002fpS-Uf; Wed, 02 Jun 2021 15:33:00 -0500
Subject: Re: [PATCH][venus-for-next-v5.14] media: venus: hfi_cmds: Fix packet
 size calculation
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
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <e40f4067-82e2-31ff-0694-375a59f949de@embeddedor.com>
Date:   Wed, 2 Jun 2021 15:34:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <202106021254.39A1561075@keescook>
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
X-Exim-ID: 1loXXw-002fpS-Uf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:52430
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/2/21 14:55, Kees Cook wrote:
> On Tue, Jun 01, 2021 at 01:46:16PM -0500, Gustavo A. R. Silva wrote:
>> Now that a one-element array was replaced with a flexible-array member
>> in struct hfi_sys_set_property_pkt, use the struct_size() helper to
>> correctly calculate the packet size.
>>
>> Fixes: 701e10b3fd9f ("media: venus: hfi_cmds.h: Replace one-element array with flexible-array member")
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>> BTW... it seems that a similar problem is present in
>> https://lore.kernel.org/linux-hardening/20210211001044.GA69612@embeddedor/ 
>> and that is what is causing the regression. I will send v2 of that
>> patch, shortly. Thanks.
>>
>>  drivers/media/platform/qcom/venus/hfi_cmds.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
>> index 11a8347e5f5c..c86279e5d6e8 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
>> @@ -27,7 +27,7 @@ void pkt_sys_idle_indicator(struct hfi_sys_set_property_pkt *pkt, u32 enable)
>>  {
>>  	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
>>  
>> -	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
>> +	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
> 
> I think this should be "1" not "2".
> 
> (i.e. there is a single "data" item, followed by an entire *hfi (which
> starts immediate after data[0]).

Yeah; I see your point. Here I just wanted to preserve the exact same size
as the original code, which turns out has a "benign" off-by-one issue.

I'll fix it up and respin.

Thanks!
--
Gustavo

> 
>>  	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
>>  	pkt->num_properties = 1;
>>  	pkt->data[0] = HFI_PROPERTY_SYS_IDLE_INDICATOR;
>> @@ -39,7 +39,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
>>  {
>>  	struct hfi_debug_config *hfi;
>>  
>> -	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
>> +	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
> 
> Same here.
> 
>>  	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
>>  	pkt->num_properties = 1;
>>  	pkt->data[0] = HFI_PROPERTY_SYS_DEBUG_CONFIG;
>> @@ -50,7 +50,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
>>  
>>  void pkt_sys_coverage_config(struct hfi_sys_set_property_pkt *pkt, u32 mode)
>>  {
>> -	pkt->hdr.size = sizeof(*pkt) + sizeof(u32);
>> +	pkt->hdr.size = struct_size(pkt, data, 2);
> 
> This looks correct.
> 
>>  	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
>>  	pkt->num_properties = 1;
>>  	pkt->data[0] = HFI_PROPERTY_SYS_CONFIG_COVERAGE;
>> @@ -116,7 +116,7 @@ void pkt_sys_power_control(struct hfi_sys_set_property_pkt *pkt, u32 enable)
>>  {
>>  	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
>>  
>> -	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
>> +	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
> 
> Also 1.
> 
>>  	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
>>  	pkt->num_properties = 1;
>>  	pkt->data[0] = HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL;
>> -- 
>> 2.27.0
>>
> 
