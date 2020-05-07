Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C271C8664
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 12:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgEGKLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 06:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGKLY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 06:11:24 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B01C061A10;
        Thu,  7 May 2020 03:11:24 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so2419970pjb.3;
        Thu, 07 May 2020 03:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HhSAZeA5fR3eItczHq8etGQv9r/MRFur72D3zwuNGr8=;
        b=PNz7Rl44p/6xrv3Ez9oT4I8v/ywwZUrSOGssT1stHaUldJsN3rR+Z1nc8KvN5aJWtZ
         41vtDvGKG6WIAg/bUhLCJlH+oTkDlRiVOc1MXVkywbKC11wAbus0FUF1wdTaVPmEdBLc
         PLMI608TXls4KxptYlzIqlpOVvuPwVT7JYtCujHchp9H4VFwMDjI2chyFWwhO/aa0Erd
         9I5/FQXK2MV/RixgCzVAe/1kMvz4EF/YqP087eo7k3QxYObbHEOLpBaLbJDKRBv0RvgU
         l0+FKFgK/A/TqaUZZLMqBvCIALogr4K6Ra5/K18G21vhVAcNRHB3iwgsu/FZb5tLTZ6V
         CwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HhSAZeA5fR3eItczHq8etGQv9r/MRFur72D3zwuNGr8=;
        b=LsgQtq7lzLiQpI2Mr5sX23INoaxfTUIiaJDH2Vn4tfEoqw9N8rrGFZ3jD03NxitvkR
         QUxa7CqdMvim558cM760Ro/QhDlkwUkOKcMUoD1ypW5gdiUY4mPs+sZYMaaqbVxguw/M
         NwLfr4o0ZbcocLgEQEqdgNmlklTk3oM1yZSq/85H4vczxr8cT5DA4tO83C7QRTZy16pE
         ameWMfCXSYPACtKW5pB9LoYSO4HynlBqz0pnqVMlKaL0OiSZ+ZQ76xgipeUD288goluf
         iyPo777IfvKIRrN9cwMq1yxkK7sA7+NvnamMh4Oh30fA+7hMltxmA/9fGyfvQZMjmuug
         Hwzg==
X-Gm-Message-State: AGi0PuYUZBjAd8zBaWJMg6zk2cn+rVqJjtWpqHlJo5PWJZqn4CM/Fapp
        xTUF6mM/jzHy8X1Yloi+w7axPEtPjfU=
X-Google-Smtp-Source: APiQypL2FeT2BHJNUixYPIA4dPmVZLzjBVooz5RM2BkFiXZ9Gv6It3eyH66eBN8NiTWnZ9IT2WyUNw==
X-Received: by 2002:a17:902:7d98:: with SMTP id a24mr11941831plm.97.1588846283429;
        Thu, 07 May 2020 03:11:23 -0700 (PDT)
Received: from [192.168.1.7] ([120.244.109.48])
        by smtp.gmail.com with ESMTPSA id m12sm3368268pgj.46.2020.05.07.03.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 03:11:22 -0700 (PDT)
Subject: Re: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in
 ttusb_dec_handle_irq() when DMA failures/attacks occur
To:     Sean Young <sean@mess.org>
Cc:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, gregkh@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200505142110.7620-1-baijiaju1990@gmail.com>
 <20200507084332.GA14459@gofer.mess.org>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <4f95bc0d-0b75-dd75-642c-b2238feb9890@gmail.com>
Date:   Thu, 7 May 2020 18:11:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200507084332.GA14459@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the reply, Sean :)

On 2020/5/7 16:43, Sean Young wrote:
> On Tue, May 05, 2020 at 10:21:10PM +0800, Jia-Ju Bai wrote:
>> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
>> ---
>>   drivers/media/usb/ttusb-dec/ttusb_dec.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
>> index 3198f9624b7c..8543c552515b 100644
>> --- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
>> +++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
>> @@ -250,6 +250,7 @@ static void ttusb_dec_handle_irq( struct urb *urb)
>>   	struct ttusb_dec *dec = urb->context;
>>   	char *buffer = dec->irq_buffer;
>>   	int retval;
>> +	u8 index = buffer[4];
>>   
>>   	switch(urb->status) {
>>   		case 0: /*success*/
>> @@ -281,11 +282,11 @@ static void ttusb_dec_handle_irq( struct urb *urb)
>>   		 * this should/could be added later ...
>>   		 * for now lets report each signal as a key down and up
>>   		 */
>> -		if (buffer[4] - 1 < ARRAY_SIZE(rc_keys)) {
> Here buffer[4] is signed char, so if buffer[4] == 0 then (buffer[4] - 1) = -1,
> this becomes "if (-1 < ARRAY_SIZE(rc_keys))", which evaluates to false,
> due to it becoming an unsigned compare. _I think_.

I think you are right.
Maybe I should use "int index = buffer[4]" here.

>> -			dprintk("%s:rc signal:%d\n", __func__, buffer[4]);
>> -			input_report_key(dec->rc_input_dev, rc_keys[buffer[4] - 1], 1);
>> +		if (index - 1 < ARRAY_SIZE(rc_keys)) {
>> +			dprintk("%s:rc signal:%d\n", __func__, index);
>> +			input_report_key(dec->rc_input_dev, rc_keys[index - 1], 1);
>>   			input_sync(dec->rc_input_dev);
>> -			input_report_key(dec->rc_input_dev, rc_keys[buffer[4] - 1], 0);
>> +			input_report_key(dec->rc_input_dev, rc_keys[index - 1], 0);
> Like Greg said, this patch reduces the number of dereferences and makes
> the code much cleaner, but the commit message is misleading.

Okay, I will change my log and send a new patch.


Best wishes,
Jia-Ju Bai
