Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390A91C74E3
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 17:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbgEFPad (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 11:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729668AbgEFPad (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 May 2020 11:30:33 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584B8C061A0F;
        Wed,  6 May 2020 08:30:33 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w65so1140549pfc.12;
        Wed, 06 May 2020 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EP/d1HVUIepNzw8vFBcWMMB05FDxcGMjkekQo0Yq7gw=;
        b=tNHhsjrM0dAmJS6ZEQUvQLBG/b27NCjcBlDzYpOJHP52ow9LkjrbGeXN5/vKocc1K0
         0cfZ3t6nV/vu+w9SMiNGn0bktZ53X95RUMGsc9m739K6oJwjyQaPpKHVVeXqIXu/9GrI
         hQLdD8C+xRCcU9W8Yz5tRT7eeZ9ZwtTXX/umVexruwh8WEurArlhXMOpFKcZ0qQU6uyz
         NDUXr/nttHjqmRYByBqaFwI3FGczRclDU6uWQMFUH4Tc4JAMWgeZ4qoHyJ04575AsJLm
         YyihHPF9nK2UnR3+EHaEIDkiLYH9mSvC0NilZgQbFmOX2HEleOZ2sL1e+s0EM9Tf6rPP
         cAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EP/d1HVUIepNzw8vFBcWMMB05FDxcGMjkekQo0Yq7gw=;
        b=XmUumE4RxPNXa6qJ4BqlZE70/4+IwWgy6GrWEr115+j0fm4t9KVvFa43rHhLCPbpQ3
         xQUM6hhuT1xNLe8o2bEbOOvIDqhs3GdiIj34zRCXyyjXlnMnGXuAPNVdhsDEgAzrWzot
         Om/7hBtQQwotPmiFD55XRW2U84Jo0zIc5IrIbCA7RwGP7nfNBQZkVuWzVLMlgIvN0pzc
         1q053cc4DWmBYbMikmtzKjedqksebE/B9JerZWbdhA90RblACOC3aGxxnBDxX4AKDncZ
         pa/Pl7XNTVaJ7CB5OkBxRE+2qPuFXO1JjHLK7uiNidjumml0CZN99ep0INF1dRDU/ATF
         1WQw==
X-Gm-Message-State: AGi0Pua57z2oMjTEJ/jxbwV4SyXZcOWnmwSyjCOFDywTEAaeqPwC0jlW
        xJB53YYymXjsAtSNiT6nmFOhtZgEOps=
X-Google-Smtp-Source: APiQypKf3niZEcjx0HEcbdP5WEHP3Ldg13i5E8FzO3Cvt0EdUS9ZPVrwpi0Xu0rGGCA39N9hVY+SEw==
X-Received: by 2002:a63:31cc:: with SMTP id x195mr7131812pgx.100.1588779032394;
        Wed, 06 May 2020 08:30:32 -0700 (PDT)
Received: from [192.168.1.7] ([223.72.42.191])
        by smtp.gmail.com with ESMTPSA id z25sm2151506pfa.213.2020.05.06.08.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 08:30:31 -0700 (PDT)
Subject: Re: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in
 ttusb_dec_handle_irq() when DMA failures/attacks occur
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, sean@mess.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200505142110.7620-1-baijiaju1990@gmail.com>
 <20200505181042.GD1199718@kroah.com>
 <0e4a86ee-8c4e-4ac3-8499-4e9a6ed7bd1e@gmail.com>
 <20200506110722.GA2975410@kroah.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <b3af10e3-8709-3da0-6841-e5ddd6b4a609@gmail.com>
Date:   Wed, 6 May 2020 23:30:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200506110722.GA2975410@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2020/5/6 19:07, Greg KH wrote:
> On Wed, May 06, 2020 at 06:13:01PM +0800, Jia-Ju Bai wrote:
>> I have never modified DMA memory in the real world, but an attacker can use
>> a malicious device to do this.
>> There is a video that shows how to use the Inception tool to perform DMA
>> attacks and login in the Windows OS without password:
>> https://www.youtube.com/watch?v=HDhpy7RpUjM
> If you have control over the hardware, and can write to any DMA memory,
> again, there's almost nothing a kernel can do to protect from that.

I think that each device can only access its own DMA memory, instead of 
any DMA memory for other hardware devices.
Thus, it is dangerous that the whole kernel can be attacked via a simple 
malicious device, through some vulnerabilities in the trusted driver.

A feasible example is that, the attacker inserts a malicious device via 
PCI-E bus in a locked computer, when the owner of this computer leaves. 
The attacker modifies the DMA memory of this malicious device, to 
exploit the vulnerabilities in the trusted driver and steal key data 
from the computer.
I think this is possible, because many buses (such PCI-E bus) support 
hot plugging now.
Thus, to protect the kernel from such DMA attacks, these vulnerabilities 
in the trusted driver had better be fixed.

Besides, I think that a safe way is to only store data in DMA memory, 
and this data is only passed to userspace and hardware, instead of 
tainting kernel data...

>> Besides, not related to this patch, some drivers use DMA to send/receive
>> data (such as the URB used in USB drivers and ring descriptors used in
>> network drivers). In this case, if the data is malicious and used as an
>> array index through DMA, security problems may occur.
>>
>> In my opinion, similar to the data from userspace, the data from hardware
>> may be also malicious and should be checked.
>>
>> Maybe we could discuss this issue with DMA driver developers?
> Sure, but I think that's outside the scope of this tiny patch :)

Okay, in the discussion e-mail, I will introduce my opinion and give 
several possible DMA issues that I found, thanks :)


Best wishes,
Jia-Ju Bai
