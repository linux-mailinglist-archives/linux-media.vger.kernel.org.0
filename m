Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1195F1AF1A2
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 17:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgDRPaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 11:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725903AbgDRPaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 11:30:03 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15ED2C061A0C
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 08:30:02 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id e26so5894027wmk.5
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hKSEU5ji9VsU8aDNFgJ9bcAbZD1MrthPhqs3Uv1eXIc=;
        b=p+TL257zK3RpTQxfgfLMXBB3jWJfkbAz63ElC6aVtGYMCV0JKlMcAoEb9KKH9pUFLB
         IL+S+e42LFpZHzMKvXJlhPluA8izu0UZuxBZ409KqNZmg4edXI8uxTgdwyFXPy0tH22i
         ZJFpjrJ0eNLsIds+3CzEYpllRv9e3k9nhetBIy9IhHfuG7QrLzPy0zLZ19aGvKhm+iKm
         6bos1BFZF/zzaDt8F8WiSy8HuHd7AYHwS39uRykEDY/TtGee0U0QRRAgFTLEZb+17D5L
         ZJSXmVw6gaxWhyE15sJ1GZZP4LrxMGY8ck/nnLnxGheEH+LPhUL4mAP4o8WyWp161h9x
         Cd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hKSEU5ji9VsU8aDNFgJ9bcAbZD1MrthPhqs3Uv1eXIc=;
        b=Z+r/XTFBHQr4rPZ+NZ++OVaF2/ubbfetWkjryBHcsvwZHMVmxGhr8rxLS5fmvbZoQ6
         Gs4c3pAMVnPkpVSkZTGK/mKYt2uqNhQiVKxCOaUQREMElm3VCiy71DImXI9YvX1zn/iT
         snbTckaSaYnChKlTFZvc++z61HCJgzGY9tJ0Dk49MqawMBxzBxm8Rg3v92HfNW7og/Pz
         yYprRaOUig6O6lEhO3gz6rJgwQhXy1FSGQi3PeUiRS/vOGHAh2HYH7VNNDjN1N1auYtJ
         NfM+TCPuSvz1jdefehI0kjA5QiFwSqGkmS6kqHtrABXiKOzo+TbHH7fFS9kGOxFyHwpw
         KiZQ==
X-Gm-Message-State: AGi0Pubsh4TyknvyxGGZTgxyaPfJz2GX8OmW1odbkcnJt0Y/pwO/Q2m3
        rTsuMIe8SPHT0o80yYzZ/GaCfpRsFig=
X-Google-Smtp-Source: APiQypKvMzb/IzQiDQPx1376/DNso1Q1mG+l5y5a5sQ41Xg2C9VYG1Su57IRz+8NM2mWxVUwFcmsOA==
X-Received: by 2002:a1c:2705:: with SMTP id n5mr8381688wmn.94.1587223800060;
        Sat, 18 Apr 2020 08:30:00 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id x13sm12311044wmc.5.2020.04.18.08.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2020 08:29:59 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200418172549.7cca07a7@coco.lan>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <dedc80a8-f61c-64a1-a134-cb1e59add0dd@gmail.com>
Date:   Sat, 18 Apr 2020 17:29:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200418172549.7cca07a7@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 18.04.20 17:25, Mauro Carvalho Chehab wrote:
> Em Sat, 18 Apr 2020 16:39:25 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>
>> Hello Mauro et al,
>>
>> I've recently switched to Linux, and I'm very impressed. Almost
>> everything thing works out of the box. Only the webcam on my device does
>> not. I did some digging and if I'm right an atomisp driver would be
>> required. Is this correct? Below the output of lspci:
>>
>> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor
>> x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0
>> VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
>> Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
>> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium
>> Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
>> Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
>> 00:0b.0 Signal processing controller: Intel Corporation
>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
>> Management Controller (rev 36) 00:14.0 USB controller: Intel Corporation
>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
>> Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation
>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
>> Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express
>> Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
>> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless
>> Network Adapter (rev 31)
>>
>> According to the history it looks like the driver was removed from the
>> kernel in 2018 and replaced with a dummy driver (to make sure power save
>> works).
>>
>> Is there a chance that the atomisp driver will return to the kernel?
>> There are quite a few older tablets and 2in1 devices that would benefit.
>> Unfortunately I do not understand the removed code (my coding skills are
>> very basic) and can thus not help to change what ever is necessary to
>> make it fit for the kernel :-( (does not sound like a beginner project).
>> However - I would be glad to help out to help testing an ISP driver.
> There are simply too many things there to be fixed, and nobody without
> time for it. Also, the last reports we had is that the driver was not
> working.
>
> Unfortunately, I don't have myself any atomisp hardware, otherwise I
> could try fixing it on my spare time.

Thanks for your reply ... I would be glad to donate a device for this 
project :-). Please send me the contact data (maybe to my private 
eMail), then I'll take care to send one to you.

>
>> However - even without the cam it is a very impressing operating system
>> which I enjoy very much. I would like to thank all of you for your work
>> that benefits so many people!
>>
>> All the best and stay healthy.
>>
>> With kind regards,
>>
>> Patrik Gfeller <patrik.gfeller@gmail.com>
>>
>
>
> Thanks,
> Mauro
