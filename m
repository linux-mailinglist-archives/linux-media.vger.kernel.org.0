Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F755535265
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 19:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344411AbiEZRG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 13:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236465AbiEZRG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 13:06:27 -0400
Received: from knet-dmarc.kensnet.org (knetgate.kensnet.org [80.168.136.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E3A2DFF
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 10:06:23 -0700 (PDT)
Received: from knetgate.kensnet.org ([192.168.122.1])
        by knet-dmarc.kensnet.org (8.14.4/8.14.4) with ESMTP id 24QH67dt031005
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 26 May 2022 18:06:07 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 knet-dmarc.kensnet.org 24QH67dt031005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kensnet.org;
        s=default; t=1653584768;
        bh=XuCFAVxlpHSuVsjpqFmIwi7BlrRQFtILGeblLATbuhk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nkt/cJz+DndkFNkmVC0NtZXRjjHJBuwHR4hWLIL9f4nDsQkzemicGINUaD70g+llc
         Uhc+QjFiyYcDX1wh3fp71AxZY59uwSOSym3ZAEMb2Rpt4nOxic7d5FYzWWVdaNrUMa
         oSuXnybCwWgTCK+/PwjaZabWtRJzBBOgPLL/S0r8=
Received: from localhost.localdomain ([172.16.0.45])
        (authenticated bits=0)
        by knetgate.kensnet.org (8.14.4/8.14.4) with ESMTP id 24QH63A0020197
        (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
        Thu, 26 May 2022 18:06:05 +0100
Subject: Re: HauppaugeTV-quadHD DVB-T & HVR5525 mpeg risc op code error
To:     Martin Burnicki <martin.burnicki@burnicki.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>
References: <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
 <20200423163559.GB23006@gofer.mess.org>
 <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
 <20200425114147.GA3037@gofer.mess.org>
 <4aa38e2a-6b98-6530-69d9-d945a467bf0b@burnicki.net>
 <1a2d9e15-55e2-88a7-d197-208a8ce99218@burnicki.net>
 <20200427080751.GA5925@gofer.mess.org>
 <e7d8aeb8-124a-f7b3-d469-4c47f182f067@burnicki.net>
 <0fc5d43f-7928-1649-220b-45916b189d8f@burnicki.net>
 <20200430164934.GA16730@gofer.mess.org>
 <49697978-c4ef-66fe-94ac-17117540c111@kensnet.org>
 <5744615d-1126-418a-1c39-95df385605ac@burnicki.net>
From:   Ken Smith <kens@kensnet.org>
Organization: K-Net Technology
Message-ID: <7d749461-e52d-66de-fbcc-491d9ca035bb@kensnet.org>
Date:   Thu, 26 May 2022 18:06:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <5744615d-1126-418a-1c39-95df385605ac@burnicki.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-kensnet-MailScanner-Information: Please contact the ISP for more information
X-kensnet-MailScanner-ID: 24QH63A0020197
X-kensnet-MailScanner: Found to be clean
X-kensnet-MailScanner-From: kens@kensnet.org
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


>>>
>>
>> Hi, I'd like to resurrect this thread (copied below). I have a system 
>> showing this error. Its a HP ML350 server with 2x Xeon 5675 running 
>> Rocky Linux 8.5. It has a Hauppauge HVR5525 card that uses the same 
>> cx23885 kernel module as the quadHD card discussed above. The HVR5525 
>> is a dual DVB-T2/DVB-S2 card.
>>
>> In other threads I read about the dma_reset_workaround option. That 
>> option did not appear to be in the version included in standard 
>> kernel in Rocky 8.5. I have loaded a 5.4 kernel and compiled the DVB 
>> media modules from .git source and set dma_reset_workaround=2 in a 
>> file in modprobe.d. The built module shows version 0.0.4
>>
>> Sadly the error remains. The system runs MythTV v.31. The main 
>> symptom is occasional aborted recordings. Although the card does 
>> appear to recover, not requiring a reboot/cold restart.
>>
>> I'd appreciate some assistance with this. What information can I 
>> provide to help to trace this.
>
> I'm also maintaining a driver which started to show problems on 
> systems with new CPUs and chipsets quite some time ago, for example on 
> some Ryzen CPUs. In my case it turned out that the problem was because 
> my driver accessed memory locations on a my PCI card directly via a 
> pointer.
>
> Looks like the problem occurred because the CPU/chipset "optimized" 
> and re-ordered the execution of some machine instructions. There are 
> "barrier" instructions that can be inserted in the source code to 
> avoid this, but my original code didn't use them because the driver 
> had been working on many systems for a long time.
>
> Anyway, the low level functions provided by the kernel to access 
> registers on a peripheral are implemented to use those barriers, so 
> simply using those primitives (writel, readl and friends) instead of 
> accessing the registers directly via a pointer (*p = cmd; val = *(p+1) 
> ) fixed the problem for my driver.
>
> All the symptoms described here for the cx23885 module make me assume 
> that the problem is very similar, i.e. due to a missing barrier 
> instruction somewhere in the source code. Unfortunately I'm not 
> familiar with the Linux media driver stuff, so I don't know where I 
> could start to look for a missing barrier instruction.
>
> The only workaround that fixed the problem for me, and that I'm still 
> using, is to load the cx23885 module with a high debug level, by 
> putting a line
>
> options cx23885 debug=8
>
> into a file
>
> /etc/modprobe.d/cx23885.conf
>
> This produces a HUGE amount of kernel log messages (dmesg), but with 
> lower debug levels the driver still didn't work reliably.
>
> To make this stable for a long time, I changed /var/log/ to NOT point 
> to my SSD but to a real hard disk, and I created a cronjob file in 
> /etc/etc/cron.d/ with the line
>
> 1 0-23 * * * root rm -f /var/log/kern.log*
>
> to periodically remove the huge kernel log files.
>
> This hack works for me since this has been discussed on this ML years 
> ago.
>
>
> Martin
Thank you Martin and Robert.

I've been doing some testing today. intel_iommu=off and 
dma_reset_workaround=2 or dma_reset_workaround=0 didn't change the 
symptoms.

This system has journald. I initially set debug=1 to see where the 
messages go and I see what you mean about the volume of messages. I need 
to work out how to divert this torrent to /dev/null if that option is to 
be workable.

I fully understand your comment about out of order instructions, Martin. 
Looks like this driver may need the same attention as the one you 
maintain. One option for me is to move the HVR5525 to a lower power 
machine and run that as a slave MythBackend.

Many thanks


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

