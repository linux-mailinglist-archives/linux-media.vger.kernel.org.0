Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFDD51B8D98
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 09:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgDZHof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 03:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726110AbgDZHoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 03:44:34 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DE9C061A0C
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2020 00:44:34 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d15so15055074wrx.3
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2020 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TQGMa95+ZRhrv67wobM8XmjWl8YYee1Je5I6IQCnefM=;
        b=CJ3v3DMQJq85Mv8P417soNHfn2jrDp0QTt/wojgMAcNOSr4ZzDoByrN/qywFKRFZoQ
         r8lel0+WPb1gkLwtCivemZQzUVONSbcmyTn0SV0UDDJ7DXJm/g4kYtYZ/qNJPUKiELrX
         i7oPXIFkZn/msxC0wQtgPbcu6aAQCoEdjaAOAz2fJ4jFENzyL9XRXdMeb3nJ88gqAl8e
         E2c1U8uhCGRccUJTXdGszf4uPyfnpPt/a0xORkprWXC2mqFTwEsAR7NEiqW1oYZXaWhc
         RIBU7FmqdDzVAC7TvfSKyFWXwBjlsxphuZPg+joN6WxtkBCnKakyLrBboOxM4YzmcICq
         0rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TQGMa95+ZRhrv67wobM8XmjWl8YYee1Je5I6IQCnefM=;
        b=TJNiPw5YBLkndkcZECfdkP/PS+aiOUW1P0gpDiKvgw1wO+HOhb4Sefdu7EVGulxiz+
         3nG7hLBffwEgQxAVE4QQk4pT3EVJS4/qRkHPEriGmxREZ+Qki78RCFRd9o+BgUgp6bA4
         b3NgV2/MsClUTZZ8dLawZiSURh4GTyTXwEJftPFgZi/eWs6/A5JNPeNXggEbum0lD3rK
         h0NV7qmJDZBiuT3yU1qow7WiVAmhasPG3Y/HAkfBXfBs22Q4JwwVus2OQs9sJOszyfBJ
         IZw/LMH/JvLe0DVr41ebhU4VQ0GxwaQaZpxf0c8w7D3rg3sxrTwIlDtO7TNJjT5DEW69
         6cUw==
X-Gm-Message-State: AGi0PuanvWFA66fapZV6egQ4R/XU8iwTfTXGWXtepPjMj+DVeDp85iie
        T8VW2J5PnxIf3C6Dl02pYrE=
X-Google-Smtp-Source: APiQypLi+oBS2UAJREpvVy1awf1uW0ykWVyRlzMWJrNBy77tuXCWsoYLrbNH0zgcrFQyo1mNERhCmw==
X-Received: by 2002:adf:978c:: with SMTP id s12mr20495306wrb.312.1587887073015;
        Sun, 26 Apr 2020 00:44:33 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id m1sm15252074wro.64.2020.04.26.00.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 00:44:32 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200425023926.GA30200@pendragon.ideasonboard.com>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <1c4e1128-dd66-88e3-88c1-82198ccee3d9@gmail.com>
Date:   Sun, 26 Apr 2020 09:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425023926.GA30200@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

I hope you are well!

We are currently evaluation (mainly Mauro and Laurent) if it is possible 
to continue the work on the atomisp driver. I try to do some tests to 
see if the driver works at all using the patches Mauro made. As the 
firmware is hardcoded I need specific firmware versions. In an earlier 
post related to atomisp you mentioned that you use the following firmware:

shisp_2400b0_v21.bin
Version string: irci_stable_candrpv_0415_20150423_1753

I only found the following versions

shisp_2400b0_v21.bin
Version string: irci_master_20140707_0622

shisp_2401a0_v21.bin
Version string: irci_master_20140707_0622

I tried to change the hardcoded string in the code to the version I have 
available, but not sure if it loaded the firmware at all. I saw that 
there are debug lines to provide more verbose information, but I could 
not figure out how to enable those messages:

atomisp_fops.c
         isp->firmware = atomisp_load_firmware(isp);
         if (!isp->firmware) {
             dev_err(isp->dev, "Failed to load ISP firmware.\n");
             ret = -ENOENT;
             goto error;
         }
         ret = atomisp_css_load_firmware(isp);
         if (ret) {
             dev_err(isp->dev, "Failed to init css.\n");
             goto error;
         }

If you could provide me the correct firmware file would be highly 
appreciated. Maybe you even remember how to enable the more verbose logging?

thanks and kind regards,
Patrik

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
>
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
>
