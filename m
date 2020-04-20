Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB30E1B1475
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgDTS1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbgDTS1a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:27:30 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E3DC061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:27:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id d17so13391394wrg.11
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+QvfzGLGwzhe7yeQA9gRtVFA0vTVO9RJ2FJx3yDCC20=;
        b=dS7P1vDB+1mQz/mAMkIlUi1YEyhBP8ku75LSUIhb7EMgN0kB9QWsGZL9rd97CYD5mR
         zkbsG71jT6HuY3c99ii6etcUpigYWgBWC5PPVRkqXIcRPPk41uUZFVU+tnAwlRys9K1K
         oKhFYQPpd2YN5buuR9i2CIdtkDEwnG5M3kZwVqvUkS+/rowj6ENDH9nwd6PAKIv4tXiQ
         XWQg1CDQDLGkou6zzZMap+4e9tMFdOKH3jBTaf2BkJ23TAmlMy1/0LGp5ZxvS2juVLBl
         i44ND3OYtlrR4VSV1LpAcMjwt4cwoCnFO7w49xRnIniBaIoEWFlSYecYcMj0Fm4q96lC
         4OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+QvfzGLGwzhe7yeQA9gRtVFA0vTVO9RJ2FJx3yDCC20=;
        b=rYgQqK8fPZ8pALD2d6oJKEApvFDkxXlr/ZQM1ik40xntT3/SeNrxj48hTt3M/udnC1
         zmOkmyEZEruh44Y4OT+5ZkRm7u1p+C0PhNVwh2rF/WsD2ADAityrr0rb2srxK9HChojW
         yK3X+ET0d+72rmcg3AlYxUAmWGQ5drto6839FSex3AlVg1HFoXuU0ZE/Leb3uny3+Bmt
         SSkMxihidnOKhaD7ZtgPxXkUIY5N0iMKE7+XLYAnk1D15bMll9dhbwLx1RaOiOpyXhmj
         bMGesLTQEXkLe9Y2sTXngcERyWGYwf8B4NOxTtwDtecv1MTLe214hjUb4FOhR6w9cNIx
         WEmA==
X-Gm-Message-State: AGi0PuZ3ZVw8lGGDnn9H42Xc+Kn9Ca1D6WEuuiylGCJV5nBl2EcltRCw
        eVoUQFdV9lGkwQVGS4E7ZZpNwT8NEVs=
X-Google-Smtp-Source: APiQypLm8yZezfTR2twXFY3iIEsAnJU2JX7bC2yZ02Fc69WeHLu7CclFbd3ExcB+4dLZfUBRBkq/vA==
X-Received: by 2002:a5d:634f:: with SMTP id b15mr19214847wrw.46.1587407248082;
        Mon, 20 Apr 2020 11:27:28 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id t16sm480848wrb.8.2020.04.20.11.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 11:27:27 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200418172549.7cca07a7@coco.lan> <20200418172654.74a1eeea@coco.lan>
 <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
 <20200420013109.65babb54@coco.lan>
 <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
Message-ID: <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
Date:   Mon, 20 Apr 2020 20:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Me again ... sorry to ask such a basic question, but I can't get your 
modified source code. I get the following error:

 > git clone https://git.linuxtv.org/mchehab/experimental.git/
Cloning into 'experimental'...
warning: adding alternate object store: 
https://git.linuxtv.org/git/linux.git/
warning: adding alternate object store: 
https://git.linuxtv.org/git/media_tree.git/
warning: adding alternate object store: 
https://git.linuxtv.org/git/linux.git/
error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f under 
https://git.linuxtv.org/mchehab/experimental.git
Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c987.
error: fetch failed.

Do I use the wrong command?

kind regards,

Patrik

On 20.04.20 19:48, Patrik Gfeller wrote:
>
> On 20.04.20 01:31, Mauro Carvalho Chehab wrote:
>> Em Sat, 18 Apr 2020 17:37:22 +0200
>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>
>>> On 18.04.20 17:26, Mauro Carvalho Chehab wrote:
>>>> Em Sat, 18 Apr 2020 17:25:49 +0200
>>>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
>>>>> Em Sat, 18 Apr 2020 16:39:25 +0200
>>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>>>>> Hello Mauro et al,
>>>>>>
>>>>>> I've recently switched to Linux, and I'm very impressed. Almost
>>>>>> everything thing works out of the box. Only the webcam on my 
>>>>>> device does
>>>>>> not. I did some digging and if I'm right an atomisp driver would be
>>>>>> required. Is this correct? Below the output of lspci:
>>>>>>
>>>>>> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium 
>>>>>> Processor
>>>>>> x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 
>>>>>> 00:02.0
>>>>>> VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
>>>>>> Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller 
>>>>>> (rev 36)
>>>>>> 00:03.0 Multimedia controller: Intel Corporation 
>>>>>> Atom/Celeron/Pentium
>>>>>> Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
>>>>>> Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
>>>>>> 00:0b.0 Signal processing controller: Intel Corporation
>>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
>>>>>> Management Controller (rev 36) 00:14.0 USB controller: Intel 
>>>>>> Corporation
>>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
>>>>>> Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation
>>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
>>>>>> Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
>>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI 
>>>>>> Express
>>>>>> Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
>>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU 
>>>>>> (rev 36)
>>>>>> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac 
>>>>>> Wireless
>>>>>> Network Adapter (rev 31)
>> What hardware do you have?
> I have aASUS Transformer Book T101HA-GR029T (HW probe @
>
> https://linux-hardware.org/?probe=ccc26d4cd3).
>
>> I did a look at the atomisp driver. There are some APIs that changed 
>> upstream,
>> but making the driver to build again is not hard:
>>
>>     https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp
>>
>> If this would work or just hang, I don't know :-)
>
> Cool!
>
> Meanwhile I downloaded to kernel source and checked out the latest 
> commit that still has the driver in staging. I'm currently in the 
> process of building the old kernel in order to test if the driver 
> works at all (1st time I'm doing this - thus takes some time, 
> especially on my Atom :-). But I will then switch over to your changed 
> version to give it a try.
>
>>
>> This driver is still a big mess, and it requires some defines on its 
>> source
>> code, in order to use it with some different Atom models.
>>
>>>>>> According to the history it looks like the driver was removed 
>>>>>> from the
>>>>>> kernel in 2018 and replaced with a dummy driver (to make sure 
>>>>>> power save
>>>>>> works).
>>>>>>
>>>>>> Is there a chance that the atomisp driver will return to the kernel?
>>>>>> There are quite a few older tablets and 2in1 devices that would 
>>>>>> benefit.
>>>>>> Unfortunately I do not understand the removed code (my coding 
>>>>>> skills are
>>>>>> very basic) and can thus not help to change what ever is 
>>>>>> necessary to
>>>>>> make it fit for the kernel :-( (does not sound like a beginner 
>>>>>> project).
>>>>>> However - I would be glad to help out to help testing an ISP driver.
>>>>> There are simply too many things there to be fixed, and nobody 
>>>>> without
>>>>> time for it. Also, the last reports we had is that the driver was not
>>>>> working.
>>>>>
>>>>> Unfortunately, I don't have myself any atomisp hardware, otherwise I
>>>>> could try fixing it on my spare time.
>>>> In time: not really sure if it would be a worth project, as newer 
>>>> Intel
>>>> hardware are coming with a different IP block (IPU3).
>>> I don't know how widespread the IPU that I have is, I assume that some
>>> other tablets & 2in1 devices that are a few years old use it as well.
>> The IPU is used on some Dell 2in1 devices(I guess they use an i5core
>> with a chipset made for mobile market). Not sure if they're using IPU3
>> also on Atom.
>>
>>> For me it would be definitely nice to have this driver. However, I can
>>> ask around in some of the forums  if there is a wider interest. 
>>> Might be
>>> a niche tough, but the support for the Atom device I use have been
>>> greatly improved in the recent years. So there is at least some work
>>> going on for that platform (I do not know, but I think it is called
>>> cherry trail?). As there are many older reports of problems with audio,
>>> touchscreen, stability (freezes) ... and none of them are present 
>>> anymore.
>>>
>>> As mentioned, if the development is hindered by missing hardware I 
>>> would
>>> be glad to help. Anyhow - many thanks for your replies, much 
>>> appreciated!
>>>
>>>> Thanks,
>>>> Mauro
>>
>>
>> Thanks,
>> Mauro
>
> thanks & kind regards,
>
> Patrik
>
