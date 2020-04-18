Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1781AF1B7
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 17:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgDRPh0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 11:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725879AbgDRPh0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 11:37:26 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8FBC061A0C
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 08:37:25 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id v8so7158930wma.0
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kcItUzABxKYJxazOb/7pUlmn8DsnfbfCoG7oESCZYuk=;
        b=RLXkITZdO3xllfo1YQlO4VX66GSjIoVgRHGcGKJylc+jxBYXqaapiYoYhUla5x34MJ
         nErtjuGVy76opAUmUfoCtkRcP/COGs3qudxQj1NgWOElQZIsu15Y+V4BBzAOU+svn6Ze
         x82R78X5IsZG+WTaw82blQoMW/hBeNXCsvnq6+1YjkBLweLwEIRjNhTSF2NwXUqyH9uZ
         i0x6uM8kG6TC/tgxl7KMFMOKFqWDsHHgfJqw8MG7HlAUMS4oEnLVUO9XV59m/C2CeAdI
         bxLbIGrez4VtXwWcZ0C8jckidq05MtGsrvOl+1+Ezwpc0XR0d3ftSdpXXwSi1xNDnhQI
         n4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kcItUzABxKYJxazOb/7pUlmn8DsnfbfCoG7oESCZYuk=;
        b=HP4hydWdPdn99Si/+FvFxIFIS8Q0s6jFH0Zad85BbS/8uMNSvQK+0mK0O0AIWSkNAZ
         XrMfmCIipW31gP/FoM1MNrp9aQHrXQ+MoK8DWoZBkUpbavJizqTqJvl4bGxLw900+7la
         8oPBCCG7gBia7lwF4EbpIU5R3fZVVGxcH3iYJa0YBzmKdSuWl+qYibT92EfMHqTNiNcJ
         LHTKQmPMSydZqOBMjdOsKpC43R08OxKAx1cmgtaVaBXCJmknS2GLxGCC4MdPq9+Mlv2s
         kKylFsVPbFX2zpJLmro8vwVS3MQtVhr+WIujlaCXg0o1Lq0OyC76mBiZGVqAo/ZkIXMj
         rdng==
X-Gm-Message-State: AGi0PuZlfgpSBLy+zy8NBOvlL1VYiUnBqDt88nMuloTmaWxoEEtYn0/k
        Lxjqocqrvb7rpHq5PxW0ipc6EqhRlu0=
X-Google-Smtp-Source: APiQypL/3rdOUzP4/0+12ceLb/VtQY9jMaasDk3hhsTcqSWMjP/wsqcMhI8/VvCiHZVjnavFsV5+zw==
X-Received: by 2002:a1c:2e07:: with SMTP id u7mr8599044wmu.74.1587224243941;
        Sat, 18 Apr 2020 08:37:23 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id t63sm6817336wmt.37.2020.04.18.08.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2020 08:37:23 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200418172549.7cca07a7@coco.lan> <20200418172654.74a1eeea@coco.lan>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
Date:   Sat, 18 Apr 2020 17:37:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200418172654.74a1eeea@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 18.04.20 17:26, Mauro Carvalho Chehab wrote:
> Em Sat, 18 Apr 2020 17:25:49 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
>
>> Em Sat, 18 Apr 2020 16:39:25 +0200
>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>
>>> Hello Mauro et al,
>>>
>>> I've recently switched to Linux, and I'm very impressed. Almost
>>> everything thing works out of the box. Only the webcam on my device does
>>> not. I did some digging and if I'm right an atomisp driver would be
>>> required. Is this correct? Below the output of lspci:
>>>
>>> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor
>>> x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0
>>> VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
>>> Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
>>> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium
>>> Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
>>> Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
>>> 00:0b.0 Signal processing controller: Intel Corporation
>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
>>> Management Controller (rev 36) 00:14.0 USB controller: Intel Corporation
>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
>>> Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation
>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
>>> Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express
>>> Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
>>> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless
>>> Network Adapter (rev 31)
>>>
>>> According to the history it looks like the driver was removed from the
>>> kernel in 2018 and replaced with a dummy driver (to make sure power save
>>> works).
>>>
>>> Is there a chance that the atomisp driver will return to the kernel?
>>> There are quite a few older tablets and 2in1 devices that would benefit.
>>> Unfortunately I do not understand the removed code (my coding skills are
>>> very basic) and can thus not help to change what ever is necessary to
>>> make it fit for the kernel :-( (does not sound like a beginner project).
>>> However - I would be glad to help out to help testing an ISP driver.
>> There are simply too many things there to be fixed, and nobody without
>> time for it. Also, the last reports we had is that the driver was not
>> working.
>>
>> Unfortunately, I don't have myself any atomisp hardware, otherwise I
>> could try fixing it on my spare time.
> In time: not really sure if it would be a worth project, as newer Intel
> hardware are coming with a different IP block (IPU3).

I don't know how widespread the IPU that I have is, I assume that some 
other tablets & 2in1 devices that are a few years old use it as well. 
For me it would be definitely nice to have this driver. However, I can 
ask around in some of the forums  if there is a wider interest. Might be 
a niche tough, but the support for the Atom device I use have been 
greatly improved in the recent years. So there is at least some work 
going on for that platform (I do not know, but I think it is called 
cherry trail?). As there are many older reports of problems with audio, 
touchscreen, stability (freezes) ... and none of them are present anymore.

As mentioned, if the development is hindered by missing hardware I would 
be glad to help. Anyhow - many thanks for your replies, much appreciated!

>
> Thanks,
> Mauro
