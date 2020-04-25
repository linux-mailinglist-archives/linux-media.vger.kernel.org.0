Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E131B85B4
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 12:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgDYKgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 06:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDYKgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 06:36:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8413DC09B04A
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2020 03:36:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id f13so14460427wrm.13
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2020 03:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=c+LjWGyl6HMGH4ECIHaF/nJWcc+Qh7jNhSbWerTe4L4=;
        b=R6Uk+PYthHtGTVSUjgWU9OumryCjmk7DPsXga2ifuqmfAf43ffgHcKgDCmxwxNrXlJ
         Rsxr2p5RR1jy9hRJU6WXrjybR7GF2J5v6Lsmh0OElj8islbDEtL0TGv/JCPM1vUAxKpJ
         U+zeuJ7PQ4Jkai0fD/X8e3ESbmcQqaoyY05O39tR1XJp7uSDZ+W4JaXyhrp+dhxnAKvC
         JgZ8v05G8MytslUhv6tMFkcaMIc0N5AuGL/hs1ZaBz1HcKt17X3XOsJleOPgmT/lgH72
         0H+1PGKLj+pWWVa38T0dEr44F1PrZdVSE33Ng/Jt72/qQP1Kmov+KH+CF6oy8bArNQtC
         Hz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=c+LjWGyl6HMGH4ECIHaF/nJWcc+Qh7jNhSbWerTe4L4=;
        b=qp+uXDwkMx0gwh2SkrBkOn79OEMJh45bHy7wVwrSLl1n/nTAqpXO22TrX44LrMVbHJ
         /2CSVhy9aiiH9mFg9g88ZVxORMLKu5J298+YuuMGotCUdcId0VdaJXxtyFcBsRT1Jdoa
         6kzC0EE1lFVSV5ymYYdIyTuAZt1gE9NOpjnM5VoPwT9Ony20avy+rQWQb0TZIz3bJOhU
         YPBW3P3dadZrmRXSdJYlGSnqVQgASvnG2UU1RfwrC7u5T5/y9pB/u700puyYK7gYb51U
         YErrHyAWHiBoh8l5hfzKEFEtapo2lC8t4V55o7st4YAjl4WrrHSqfstBvNaR9xPM/4Qh
         +2UQ==
X-Gm-Message-State: AGi0PuaCBbm6aPSFJmCyxJmdnM0KmByPKyPR/b3JxMgITsf6Vw5hqJjo
        FPH68dfu3SRxIRLVs2lnrvY=
X-Google-Smtp-Source: APiQypILmqJ7yLxkYCrx9rfdOGn2Gk3kdwF0gjqYozurMbnU1TB4a41aOBe1ltvVPdQUgBYcT2+TrA==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr15635509wrs.4.1587810980858;
        Sat, 25 Apr 2020 03:36:20 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id u30sm12237789wru.13.2020.04.25.03.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 03:36:20 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200425023926.GA30200@pendragon.ideasonboard.com>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <8bda5543-100b-95f7-04a2-d7b302fc7833@gmail.com>
Date:   Sat, 25 Apr 2020 12:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425023926.GA30200@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

thank you for your comprehensive answer.

On 25.04.20 04:39, Laurent Pinchart wrote:
> Hi Patrik,
>
> (CC'ing Sakari Ailus)
>
> On Sat, Apr 18, 2020 at 04:39:25PM +0200, Patrik Gfeller wrote:
>> Hello Mauro et al,
>>
>> I've recently switched to Linux, and I'm very impressed. Almost
>> everything thing works out of the box. Only the webcam on my device does
>> not. I did some digging and if I'm right an atomisp driver would be
>> required. Is this correct? Below the output of lspci:
>>
>> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36)
>> 00:02.0 VGA compatible controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
>> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36)
>> 00:0a.0 Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
>> 00:0b.0 Signal processing controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power Management Controller (rev 36)
>> 00:14.0 USB controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI Controller (rev 36)
>> 00:1a.0 Encryption controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted Execution Engine (rev 36)
>> 00:1c.0 PCI bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express Port #1 (rev 36)
>> 00:1f.0 ISA bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
>> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter (rev 31)
>>
>> According to the history it looks like the driver was removed from the
>> kernel in 2018 and replaced with a dummy driver (to make sure power save
>> works).
>>
>> Is there a chance that the atomisp driver will return to the kernel?
> As much as I'd like to say yes, I think this is unfortunately very
> unlikely. There are a few obstacles to getting a working camera with
> atomisp:
>
> - According to some reports, the driver doesn't work. That's the first
>    thing that would need to be fixed, and without hardware documentation
>    and support from Intel, that would be a difficult (to say the least)
>    task.
>
> - Assuming we could fix the driver, we would need to make sure it
>    supports your device. If the atomisp is anything like the IPU3 (a more
>    recent ISP from Intel), there are two different and incompatible sets
>    of ACPI data formats related to the device, one developed for Windows,
>    and one developed for Linux. I expect the atomisp driver to support
>    the latter but not the former. If your device was shipped with
>    Windows, it uses the Windows-specific ACPI data format. Furthermore,
>    it would in that case likely not encode all the information we would
>    need in ACPI, as Windows drivers have the bad habit of hardcoding
>    device-specific data in drivers. At the very least we would need to
>    get the atomisp to support the Windows ACPI data format (which is most
>    likely completely undocumented), and we would need to figure out how
>    to retrieve data that are simply not there. This being said, maybe the
>    atomisp ACPI design was better than the IPU3 and all (or part of)
>    those issues don't exist, but I'd be surprised.
>
> - At this point you would (hopefully) have a driver that could capture
>    RAW images. In order to use the camera as a webcam, those images would
>    need to be processed by the ISP that is part of the atomisp. This
>    requires complex image processing algorithm control code in userspace.
>    Intel has not released any open version of such code for the atomisp
>    (or any other platform) to my knowledge, so this would need to be
>    implemented from scratch. The libcamera project could help there, as
>    it provides a framework to host such code, but the atomisp-specific
>    code would still need to be implemented. This is a complex task when
>    the hardware is fully documented, without hardware documentation and
>    thus without knowing how the hardware works, it gets extremely
>    difficult. The task would be orders of magnitude more complex than
>    reverse-engineering a GPU.
>
> - Finally, in order for the driver to be merged back in the upstream
>    kernel, it would require massive cleanups, but that's the simplest
>    task of all that is required here.
>
> I'm sorry for the bad news, we need to be more vocal blaming hardware
> vendors for this type of mess.

Bad news indeed, this doesn't sound promising at all. I can confirm that 
the driver does not work out of the box in its current state (many 
thanks to Mauro for making this test possible). With all those obstacles 
I'm surprised that work on such a driver was even started. My only hope 
is, that the ISP 2 is better documented and less complex than ISP 3 ...

I'll try to get hold of hardware documentation from Intel, and check if 
there is any kind of community support program in place (it is at least 
worth a try :-) ) - that hopefully would allow to assess if there is a 
possibility to fix the driver and how much post processing would be 
needed in user space (what raw format that thing delivers). 
Unfortunately I would depend on others to do the judgment (I do not have 
the technical skills necessary). I'll also try to find out who initiated 
the original implementation to find out on what documentation it was 
based (or if it was all reverse engineering) and what was the rational 
to asses such an implementation as possible.

What I've found already is a public document about the ISP2-Registers of 
the x5-Z8350:

https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z8000-datasheet-vol-2.pdf 
(page 972 ff.) - not sure if this is of any help.

What kind of documentation would be needed? What I understood so far is 
that details of ACPI format are important.

As already mentioned: I would also sponsor a device or two to developers 
with a reputation as you and Mauro have (preferably the same device I 
have :-), they are quite cheap today - and that is a way I could support 
the efforts).

>> There are quite a few older tablets and 2in1 devices that would benefit.
>> Unfortunately I do not understand the removed code (my coding skills are
>> very basic) and can thus not help to change what ever is necessary to
>> make it fit for the kernel :-( (does not sound like a beginner project).
>> However - I would be glad to help out to help testing an ISP driver.
>>
>> However - even without the cam it is a very impressing operating system
>> which I enjoy very much. I would like to thank all of you for your work
>> that benefits so many people!
> You're welcome. Your thanks are much appreciated :-)

with kind regards,

Patrik

