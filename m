Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0A81B137B
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 19:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgDTRsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 13:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726492AbgDTRsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 13:48:05 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E056C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 10:48:05 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id y24so521251wma.4
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7zNYnIzzSbHUxTinxJMMbvYf6PSgni6kx/EASHGEwVA=;
        b=aFjQVUHxDubOZp1G95h7Jxnw2n8sfLomtZjn1/ghowo5obfrNnhTfSmFdiPOMGlt+L
         PCDTOMG6S7iiZJ3Mx92xaXjEftdNUjwphgSCc4K8UnFsww7VMdwsB3wyPChpZs1wksHs
         /Bw3MiKCPjxzoXwPuQyMfsiQgsQYOR7ExqxNrP43U5Ay/65tcfFycga0py0/ZPY6TdtV
         yyqRnfkkqmdtoIDtcMg01n2cC1uw8K+fH68Shcpe2IDTM9w/L2HeyY2uFxxn/1UH3nMq
         mFWTtmky+MRD+ZG+dn6h973/3bUdvmCb3wG0TOaj2sdEErKSQvpWpOhhgEN2asIDPEDa
         wUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7zNYnIzzSbHUxTinxJMMbvYf6PSgni6kx/EASHGEwVA=;
        b=Vkn3M7opxJMpX/YIbFGbtXGO6WprI+5KQlcq+mSOC8Z2C1RWAdRFxCmwauF0Dmrbqq
         niSt4U7ZGvWX/23Z0FYhq87NDUqLGloM9acOR6qUlrPobRtgeA4RRjN/Yw1isI+3yivz
         B+aTytX8/uF9I58V0IzW/s/Ma6L0AJnZ7km5VMr3sK131ZPW0leM6xpzZat86BF6Lrwu
         TqnPru1MgAF03aqiK0BywMMV2R+yeOTHdcI9tGnCy/AGKZaCS63VEdo4K0U4rzqAoRNQ
         nBmEkMv2oURbixKTA50H1AtNMHbPBcLrHapYYtG6N937b1fDWKcWb4TDAGVhV558zc1d
         kGbA==
X-Gm-Message-State: AGi0PuagckSNcJI1SRZXP3e4qfKsI3Mx7L2sznqwd72YmhLH4rhc6umm
        xmRPK+E8s7NoNYQXxl77nJISSXbR9ZA=
X-Google-Smtp-Source: APiQypKw2vm5ae5WKk5CYkPG9u6yhgYTh0PLwHLLr9P9aQWLzM9HRuDRjK3/+be2gnqrOS6O+R7afA==
X-Received: by 2002:a05:600c:2316:: with SMTP id 22mr491929wmo.164.1587404882281;
        Mon, 20 Apr 2020 10:48:02 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id k184sm203808wmf.9.2020.04.20.10.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 10:48:01 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200418172549.7cca07a7@coco.lan> <20200418172654.74a1eeea@coco.lan>
 <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
 <20200420013109.65babb54@coco.lan>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
Date:   Mon, 20 Apr 2020 19:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420013109.65babb54@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 20.04.20 01:31, Mauro Carvalho Chehab wrote:
> Em Sat, 18 Apr 2020 17:37:22 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>
>> On 18.04.20 17:26, Mauro Carvalho Chehab wrote:
>>> Em Sat, 18 Apr 2020 17:25:49 +0200
>>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
>>>   
>>>> Em Sat, 18 Apr 2020 16:39:25 +0200
>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>>>   
>>>>> Hello Mauro et al,
>>>>>
>>>>> I've recently switched to Linux, and I'm very impressed. Almost
>>>>> everything thing works out of the box. Only the webcam on my device does
>>>>> not. I did some digging and if I'm right an atomisp driver would be
>>>>> required. Is this correct? Below the output of lspci:
>>>>>
>>>>> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor
>>>>> x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0
>>>>> VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
>>>>> Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
>>>>> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium
>>>>> Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
>>>>> Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
>>>>> 00:0b.0 Signal processing controller: Intel Corporation
>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
>>>>> Management Controller (rev 36) 00:14.0 USB controller: Intel Corporation
>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
>>>>> Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation
>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
>>>>> Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express
>>>>> Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
>>>>> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless
>>>>> Network Adapter (rev 31)
> What hardware do you have?
I have aASUS Transformer Book T101HA-GR029T (HW probe @

https://linux-hardware.org/?probe=ccc26d4cd3).

> I did a look at the atomisp driver. There are some APIs that changed upstream,
> but making the driver to build again is not hard:
>
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp
>
> If this would work or just hang, I don't know :-)

Cool!

Meanwhile I downloaded to kernel source and checked out the latest 
commit that still has the driver in staging. I'm currently in the 
process of building the old kernel in order to test if the driver works 
at all (1st time I'm doing this - thus takes some time, especially on my 
Atom :-). But I will then switch over to your changed version to give it 
a try.

>
> This driver is still a big mess, and it requires some defines on its source
> code, in order to use it with some different Atom models.
>
>>>>> According to the history it looks like the driver was removed from the
>>>>> kernel in 2018 and replaced with a dummy driver (to make sure power save
>>>>> works).
>>>>>
>>>>> Is there a chance that the atomisp driver will return to the kernel?
>>>>> There are quite a few older tablets and 2in1 devices that would benefit.
>>>>> Unfortunately I do not understand the removed code (my coding skills are
>>>>> very basic) and can thus not help to change what ever is necessary to
>>>>> make it fit for the kernel :-( (does not sound like a beginner project).
>>>>> However - I would be glad to help out to help testing an ISP driver.
>>>> There are simply too many things there to be fixed, and nobody without
>>>> time for it. Also, the last reports we had is that the driver was not
>>>> working.
>>>>
>>>> Unfortunately, I don't have myself any atomisp hardware, otherwise I
>>>> could try fixing it on my spare time.
>>> In time: not really sure if it would be a worth project, as newer Intel
>>> hardware are coming with a different IP block (IPU3).
>> I don't know how widespread the IPU that I have is, I assume that some
>> other tablets & 2in1 devices that are a few years old use it as well.
> The IPU is used on some Dell 2in1 devices(I guess they use an i5core
> with a chipset made for mobile market). Not sure if they're using IPU3
> also on Atom.
>
>> For me it would be definitely nice to have this driver. However, I can
>> ask around in some of the forums  if there is a wider interest. Might be
>> a niche tough, but the support for the Atom device I use have been
>> greatly improved in the recent years. So there is at least some work
>> going on for that platform (I do not know, but I think it is called
>> cherry trail?). As there are many older reports of problems with audio,
>> touchscreen, stability (freezes) ... and none of them are present anymore.
>>
>> As mentioned, if the development is hindered by missing hardware I would
>> be glad to help. Anyhow - many thanks for your replies, much appreciated!
>>
>>> Thanks,
>>> Mauro
>
>
> Thanks,
> Mauro

thanks & kind regards,

Patrik

