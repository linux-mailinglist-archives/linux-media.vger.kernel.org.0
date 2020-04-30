Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD0A1C0041
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 17:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgD3P2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 11:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726318AbgD3P2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 11:28:42 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF12DC035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 08:28:41 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id o27so2134763wra.12
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JhJSq45hSX7YjEoDH2XL4rb8DnxofFXBV+dnLriY+cA=;
        b=uDJKDWlDmz26sRHyYczh2KzAk5lFH22bfEg5zmalw9RVz/YCHII6BinTNKLInsFgZn
         YJtH+H/kA7FMvmBz7rYTiVb36q1/6jYOrObmlzeqsOIXVaW5DoW6V1RxHy0SezmMSGCl
         RU5EzrKWXEynCpMOf1CiEwFkoB9TSUspG7/S82saYIxpF5kNpXz76f/Fo/LYBZ8abHQk
         XWehP6zc9IU6W6L51z//sipsRavJcOh2bjeUKLjFGMt0fPHSpzaJfY7yupK7ucEE9izl
         4G0F8mfAoN5aE5FbN1WrY/iTCDCnZ7qWUoIWTgte8irz8UhEWUSp8n+aVSiSOGdRD36p
         CAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JhJSq45hSX7YjEoDH2XL4rb8DnxofFXBV+dnLriY+cA=;
        b=pkliFp94+W8ZIU/vtYToLjAx5k/4ZqDr72OSvVPE4o/I9lEmDRTcspiuDEzreISI63
         UbadzAcgVmZIPB939YToDTAlp7dGis4H2B3fdUnleVNdIBdIiymju4KsKOAc2fRr+d9M
         6zxukMnCu7v5P6/XL+o0L3it1R+IDjYFY5yVpATBwSN0R7xlqe7MKHFcaeASgBnj9h4+
         KywNLlDYUOU5qjVnS6sTndWVXndtw1YoQXoNbonX0hqxAFWJLKE0x7AlBFb/2uB9P8Ok
         41+O6hOQ3sFunjTvqx/sWmMDZQd/QoIwZ0mqQZhD7WNJ2URX+ql3Sh+aXoG16Wva0zxb
         w1OQ==
X-Gm-Message-State: AGi0PuYlRAOQJCLLl+YC2dTx0+c1SL2ND9pgljpREJaidpnyRZ0Vn2+z
        v30brg+/oI0klhAQDFGq7Pk=
X-Google-Smtp-Source: APiQypJq84intKN/O/R2y9lWWYs8/gyo0PkWxGKInTiRerJ2Bubp3bwfE27Y7y72FEzlzN0Is3CSqQ==
X-Received: by 2002:a5d:49cb:: with SMTP id t11mr4500395wrs.91.1588260520342;
        Thu, 30 Apr 2020 08:28:40 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id q8sm97021wrp.58.2020.04.30.08.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 08:28:39 -0700 (PDT)
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: atomisp kernel driver(s)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200425023926.GA30200@pendragon.ideasonboard.com>
 <1c4e1128-dd66-88e3-88c1-82198ccee3d9@gmail.com>
 <20200426191721.GB31313@pendragon.ideasonboard.com>
 <48ecd222-428d-521d-fdbf-601cd1e21f74@gmail.com>
 <20200429181926.GM5956@pendragon.ideasonboard.com>
Message-ID: <e746289c-c99a-3773-d0ac-7a3e4ce0be8f@gmail.com>
Date:   Thu, 30 Apr 2020 17:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429181926.GM5956@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 29.04.20 20:19, Laurent Pinchart wrote:
> Hi Patrik,
>
> On Wed, Apr 29, 2020 at 07:59:23PM +0200, Patrik Gfeller wrote:
>> On 26.04.20 21:17, Laurent Pinchart wrote:
>>> On Sun, Apr 26, 2020 at 09:44:30AM +0200, Patrik Gfeller wrote:
>>>> Hi Sakari,
>>>>
>>>> I hope you are well!
>>>>
>>>> We are currently evaluation (mainly Mauro and Laurent) if it is possible
>>>> to continue the work on the atomisp driver. I try to do some tests to
>>>> see if the driver works at all using the patches Mauro made. As the
>>>> firmware is hardcoded I need specific firmware versions. In an earlier
>>>> post related to atomisp you mentioned that you use the following firmware:
>>>>
>>>> shisp_2400b0_v21.bin
>>>> Version string: irci_stable_candrpv_0415_20150423_1753
>>>>
>>>> I only found the following versions
>>>>
>>>> shisp_2400b0_v21.bin
>>>> Version string: irci_master_20140707_0622
>>>>
>>>> shisp_2401a0_v21.bin
>>>> Version string: irci_master_20140707_0622
>>>>
>>>> I tried to change the hardcoded string in the code to the version I have
>>>> available, but not sure if it loaded the firmware at all. I saw that
>>>> there are debug lines to provide more verbose information, but I could
>>>> not figure out how to enable those messages:
>>>>
>>>> atomisp_fops.c
>>>>            isp->firmware = atomisp_load_firmware(isp);
>>>>            if (!isp->firmware) {
>>>>                dev_err(isp->dev, "Failed to load ISP firmware.\n");
>>>>                ret = -ENOENT;
>>>>                goto error;
>>>>            }
>>>>            ret = atomisp_css_load_firmware(isp);
>>>>            if (ret) {
>>>>                dev_err(isp->dev, "Failed to init css.\n");
>>>>                goto error;
>>>>            }
>>>>
>>>> If you could provide me the correct firmware file would be highly
>>>> appreciated. Maybe you even remember how to enable the more verbose logging?
>>> What verbose logging are you talking about ? If you're referring to
>>> dev_dbg(), Documentation/admin-guide/dynamic-debug-howto.rst if your
>>> kernel is compiled with dynamic debug support, otherwise just
>>>
>>> #define DEBUG 1
>>>
>>> at the top of the file.
>> Thanks, That was exactly what I was looking for. I've made sure that
>> dynamic debug support was enabled and re-compiled the kernel. Then I've
>> added to the following boot parameter: dyndbg="module atomisp_ov2680 +pm".
> Can you try
>
> atomisp_ov2680.dyndbg=+p
>
> ? I haven't tested the plain dyndbg argument myself. Make sure it gets
> to the kernel with
>
> cat /proc/cmdline

First I checked my current configuration again (did some more reading) - 
does not look ok:

$ cat /proc/cmdline

BOOT_IMAGE=/boot/vmlinuz-5.7.0-rc1+ 
root=UUID=7c547d86-dd95-4cb2-b7ad-e46368c8eed3 ro ignore_loglevel 
verbose fbcon=rotate:1 module_blacklist=intel_atomisp2_pm "dyndbg=module 
atomisp_ov2680 +pm; module atomisp +pm"

$ sudo cat /sys/kernel/debug/dynamic_debug/control | grep ov2680

...
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:329 
[atomisp_ov2680]ov2680_get_intg_factor =_ "++++ov2680_get_intg_factor\012"
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:314 
[atomisp_ov2680]ov2680_g_bin_factor_y =_ "++++ov2680_g_bin_factor_y\012"
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:302 
[atomisp_ov2680]ov2680_g_bin_factor_x =_ "++++ov2680_g_bin_factor_x\012"
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:255 
[atomisp_ov2680]ov2680_write_reg_array =_ "+++ov2680_write_reg_array 
reg=%x->%x\012"
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:239 
[atomisp_ov2680]ov2680_write_reg_array =_ "++++write reg array\012"

...

But of course I tried your options as well:

$ cat /proc/cmdline
BOOT_IMAGE=/boot/vmlinuz-5.7.0-rc1+ 
root=UUID=7c547d86-dd95-4cb2-b7ad-e46368c8eed3 ro ignore_loglevel 
verbose fbcon=rotate:1 module_blacklist=intel_atomisp2_pm 
atomisp_ov2680.dyndbg=+p

$ sudo cat /sys/kernel/debug/dynamic_debug/control | grep ov2680

Control looks the same as with the first try; so this works as well (as 
expected).

I do not see debug messages yet - but I checked the code, and from what 
I understand we most likely do not reach them yet.
>> I do not see debug messages in dmesg or kern.log - but maybe we do not
>> reach those lines yet.
> You can add a dev_dbg() at the beginning of the probe function and see
> if that one gets printed.
I'll try this tomorrow (have time, as we have a holiday :-) ). Will have 
to find the probe function - but if I do not find it I'll just add the 
statement prior to a line that already shows some logging (e.g. where it 
does not find the regulators).
>
>>>> On 25.04.20 04:39, Laurent Pinchart wrote:
>>>>> On Sat, Apr 18, 2020 at 04:39:25PM +0200, Patrik Gfeller wrote:
>>>>>> Hello Mauro et al,
>>>>>>
>>>>>> I've recently switched to Linux, and I'm very impressed. Almost
>>>>>> everything thing works out of the box. Only the webcam on my device does
>>>>>> not. I did some digging and if I'm right an atomisp driver would be
>>>>>> required. Is this correct? Below the output of lspci:
>>>>>>
>>>>>> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36)
>>>>>> 00:02.0 VGA compatible controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
>>>>>> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36)
>>>>>> 00:0a.0 Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
>>>>>> 00:0b.0 Signal processing controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power Management Controller (rev 36)
>>>>>> 00:14.0 USB controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI Controller (rev 36)
>>>>>> 00:1a.0 Encryption controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted Execution Engine (rev 36)
>>>>>> 00:1c.0 PCI bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express Port #1 (rev 36)
>>>>>> 00:1f.0 ISA bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
>>>>>> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter (rev 31)
>>>>>>
>>>>>> According to the history it looks like the driver was removed from the
>>>>>> kernel in 2018 and replaced with a dummy driver (to make sure power save
>>>>>> works).
>>>>>>
>>>>>> Is there a chance that the atomisp driver will return to the kernel?
>>>>> As much as I'd like to say yes, I think this is unfortunately very
>>>>> unlikely. There are a few obstacles to getting a working camera with
>>>>> atomisp:
>>>>>
>>>>> - According to some reports, the driver doesn't work. That's the first
>>>>>      thing that would need to be fixed, and without hardware documentation
>>>>>      and support from Intel, that would be a difficult (to say the least)
>>>>>      task.
>>>>>
>>>>> - Assuming we could fix the driver, we would need to make sure it
>>>>>      supports your device. If the atomisp is anything like the IPU3 (a more
>>>>>      recent ISP from Intel), there are two different and incompatible sets
>>>>>      of ACPI data formats related to the device, one developed for Windows,
>>>>>      and one developed for Linux. I expect the atomisp driver to support
>>>>>      the latter but not the former. If your device was shipped with
>>>>>      Windows, it uses the Windows-specific ACPI data format. Furthermore,
>>>>>      it would in that case likely not encode all the information we would
>>>>>      need in ACPI, as Windows drivers have the bad habit of hardcoding
>>>>>      device-specific data in drivers. At the very least we would need to
>>>>>      get the atomisp to support the Windows ACPI data format (which is most
>>>>>      likely completely undocumented), and we would need to figure out how
>>>>>      to retrieve data that are simply not there. This being said, maybe the
>>>>>      atomisp ACPI design was better than the IPU3 and all (or part of)
>>>>>      those issues don't exist, but I'd be surprised.
>>>>>
>>>>> - At this point you would (hopefully) have a driver that could capture
>>>>>      RAW images. In order to use the camera as a webcam, those images would
>>>>>      need to be processed by the ISP that is part of the atomisp. This
>>>>>      requires complex image processing algorithm control code in userspace.
>>>>>      Intel has not released any open version of such code for the atomisp
>>>>>      (or any other platform) to my knowledge, so this would need to be
>>>>>      implemented from scratch. The libcamera project could help there, as
>>>>>      it provides a framework to host such code, but the atomisp-specific
>>>>>      code would still need to be implemented. This is a complex task when
>>>>>      the hardware is fully documented, without hardware documentation and
>>>>>      thus without knowing how the hardware works, it gets extremely
>>>>>      difficult. The task would be orders of magnitude more complex than
>>>>>      reverse-engineering a GPU.
>>>>>
>>>>> - Finally, in order for the driver to be merged back in the upstream
>>>>>      kernel, it would require massive cleanups, but that's the simplest
>>>>>      task of all that is required here.
>>>>>
>>>>> I'm sorry for the bad news, we need to be more vocal blaming hardware
>>>>> vendors for this type of mess.
>>>>>
>>>>>> There are quite a few older tablets and 2in1 devices that would benefit.
>>>>>> Unfortunately I do not understand the removed code (my coding skills are
>>>>>> very basic) and can thus not help to change what ever is necessary to
>>>>>> make it fit for the kernel :-( (does not sound like a beginner project).
>>>>>> However - I would be glad to help out to help testing an ISP driver.
>>>>>>
>>>>>> However - even without the cam it is a very impressing operating system
>>>>>> which I enjoy very much. I would like to thank all of you for your work
>>>>>> that benefits so many people!
>>>>> You're welcome. Your thanks are much appreciated :-)
