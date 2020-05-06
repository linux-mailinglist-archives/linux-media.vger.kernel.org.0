Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC191C7709
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 18:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbgEFQtX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 12:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730600AbgEFQs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 12:48:58 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE48C061A0F;
        Wed,  6 May 2020 09:48:58 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s18so1033392pgl.12;
        Wed, 06 May 2020 09:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Q5IRPzLfDFc6zE5WNxwnTajRGP0x4b+ii1VC2EvdLBA=;
        b=XF2QLEqjTD2QnOLJBp1OzwZJQQsiq+YIlYLWBtZj1eBnyNpi9Rcc1/30vzfG6oLAwT
         /zJ8OM5+6cI4raADuZlzasemdSnMNlZ6U99dJ7FEB9Nqk1SlstQENZfCKXlctc4y3XH6
         U98Vf3pAFefTaEDi+Xp4gG08BvFTS5MUsF9SL6hBlJSGXajQ7OW9sikF14xeT7a4Lpwu
         tK/7OkUlJsNU0fcUf2N3wPB8qSoOKK6+ypn/jQdkTsXuQgiZ9+rFwAWAX80QTG7QN46D
         niAESIK0pW4nhb0cDndJLW3lPgMm0DnwI/bbZLS5qHlkjeBWSt9zIS+gym7dkyrEizcv
         oSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Q5IRPzLfDFc6zE5WNxwnTajRGP0x4b+ii1VC2EvdLBA=;
        b=s41w2fmedGow7aObXRjz94/wu9HEbE32UuzZT0n/FohmwKN6xES7F3aFMhwxlACmzy
         GwpqFlLujIIga2A2I5i7/Fx7ycoc1R4KiAV98XUnEAwJmdzTTGvRgItJMcIp6nI28vBx
         78RI0Y3J4k3DtHw3fmmp5ECVW9G2cmUJ3yN9pMV2qd+4TWVSSaN6za5z3GtOw0gWoyJ7
         hT9bmzBEwMkOPAn4xn1AE0Jd5MNRxZVUxhqf7e5y0DyWUuiIYh3EWuX/kPXcBzr7UPEQ
         HSxHL7fAFsnE3pMisUVG/Cxt4MP6tWgLRseeQOtiBWVdxORqkFwzE90qVRHR/tVX1Q/J
         O7Yg==
X-Gm-Message-State: AGi0PuZ8kCmSqwQ6knMTToa4t46iBhLmvGVFAyavbpG1WYoLpic0bols
        v3wNAjdMdKilmElkUxR/OG6otfGQq1g=
X-Google-Smtp-Source: APiQypLBYRdgWEyw6Mj7pmR/T0S9WSt4ZK/eK79Wp+uv+ye4U97ZHumhHS2/tZ+YxVnjnsqT/VxpcQ==
X-Received: by 2002:aa7:982b:: with SMTP id q11mr8890440pfl.260.1588783737640;
        Wed, 06 May 2020 09:48:57 -0700 (PDT)
Received: from [192.168.1.7] ([223.72.42.191])
        by smtp.gmail.com with ESMTPSA id d20sm1928346pgl.72.2020.05.06.09.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:48:56 -0700 (PDT)
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
 <b3af10e3-8709-3da0-6841-e5ddd6b4a609@gmail.com>
 <20200506155257.GB3537174@kroah.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <46615f6e-11ec-6546-42a9-3490414f9550@gmail.com>
Date:   Thu, 7 May 2020 00:48:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200506155257.GB3537174@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2020/5/6 23:52, Greg KH wrote:
> On Wed, May 06, 2020 at 11:30:22PM +0800, Jia-Ju Bai wrote:
>>
>> On 2020/5/6 19:07, Greg KH wrote:
>>> On Wed, May 06, 2020 at 06:13:01PM +0800, Jia-Ju Bai wrote:
>>>> I have never modified DMA memory in the real world, but an attacker can use
>>>> a malicious device to do this.
>>>> There is a video that shows how to use the Inception tool to perform DMA
>>>> attacks and login in the Windows OS without password:
>>>> https://www.youtube.com/watch?v=HDhpy7RpUjM
>>> If you have control over the hardware, and can write to any DMA memory,
>>> again, there's almost nothing a kernel can do to protect from that.
>> I think that each device can only access its own DMA memory, instead of any
>> DMA memory for other hardware devices.
> That's not true at all for all systems that Linux runs on.

I am not sure to understand this.
For example, a driver requests DMA memory with "len" size by using:
    mem = dma_alloc_coherent(..., len, ...);
I think that the driver can only access DMA memory between "mem" and 
"mem + len", is it true?
Can the driver access other DMA memory using some code like "mem + len * 
10"?

>
>> A feasible example is that, the attacker inserts a malicious device via
>> PCI-E bus in a locked computer, when the owner of this computer leaves.
> This is a semi-well-known issue.  It's been described in the past
> regarding thunderbolt devices, and odds are, more people will run across
> it again in the future and also complain about it.
>
> The best solution is to solve this at the bus level, preventing
> different devices access to other memory areas.
>
> And providing physical access control to systems that you care about
> this type of attack for.
>
> Again, this isn't a new thing, but the ability for us to do much about
> it depends on the specific hardware control, and how we set defaults up.

Yes, I agree that this issue is not new, because DMA attacks are old 
problems.
But I am a little surprised that many current drivers are still 
vulnerable to DMA attacks.

>
> If you trust a device enough to plug it in, well, you need to trust it
> :)

Well, maybe I need to trust all devices in my computer :)

Anyway, thanks a lot for your patient explanation and reply.
If you have encountered other kinds of DMA-related bugs/vulnerabilities, 
maybe I can help to detect them using my static-analysis tool :)


Best wishes,
Jia-Ju Bai
