Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726AE1C816A
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 07:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgEGFPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 01:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgEGFPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 01:15:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E484C061A0F;
        Wed,  6 May 2020 22:15:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so1593685plk.10;
        Wed, 06 May 2020 22:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nX7bM4TH0Tvn6hSm8gSOJvn+yn2K9ALhjMGae7bRORU=;
        b=KgV4t378aPEJDPqUuu6JwtkmVJRC3gE1dk5/MGcb8Yrk5OlinEQlA2gw7Sz9Mg9qs1
         jD9EwAodYa1MlHq2ChhmDoCDIfQ8sG6myoTqYosXggAvFgzt9KwldVTSMwNU3dwGtCCP
         8YiRvRpeDe+N/SNEORLTcWtH9rWRG2Li21bnTX/8GvM5+vvH7Kp3/IRgq7zkJiC8HcoX
         FE6AXO9JggRx2ya4fXFcbG/QOwpVjDnJGK1unI13UGlWhCw4NIgkURyI0f/VO7xRbS/p
         eHj9tpOP2XdeORrVOUm7SIjZOKlZgu1pKGnVjJ/YjfEEk79o3UZFOT/l1M7aq6aKiyYq
         5dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nX7bM4TH0Tvn6hSm8gSOJvn+yn2K9ALhjMGae7bRORU=;
        b=bnjl2q+K6AKyF7nH6jzuUl0pYzqYP9aUAD/gGt56CrfPuVR0kiaKekc4GxqhDVABll
         rVkEvMVFb0mQLDo/XRuhYK7rstin4sSar5b23FEZ5Z5wGczHOd4hGu86U1l0P+PXVUgH
         7K4EIUx+U3iIJZgR+C9cKJC6Zi58Ll1QgWf7cpZ7by0frs9HcgzX28T/aDibanI5yA7p
         XP9FLcqnRk/J1JT8dl+Y4FhvUZHn3TER7mm1c1L8s0hMZSxhv+gRGkLs95Ys9mld8ILA
         NZnFCZnV43n5Dlr+91t7SJ8lqlCsIBtprs85nwVlPZM3tQyj0X39m0PKtF5xirswT2nQ
         qC+Q==
X-Gm-Message-State: AGi0PuZA5pbmQiO5AdysJ+q5OGTD8Idq1vKQBpLWp+FfQoWdo3sgr28r
        JmnpDM+lq66/zlJabeJAXnNOnWvbbgY=
X-Google-Smtp-Source: APiQypLlqbbQkO44XhBAGOE2WtkfSoD8mEKjku4O8Ur/r2EPn0z3KOuE/0+kT/ufg1eo+jyqYfJs5w==
X-Received: by 2002:a17:90a:6f22:: with SMTP id d31mr13316874pjk.14.1588828541305;
        Wed, 06 May 2020 22:15:41 -0700 (PDT)
Received: from [192.168.1.7] ([120.244.109.48])
        by smtp.gmail.com with ESMTPSA id z25sm3549380pfa.213.2020.05.06.22.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 22:15:40 -0700 (PDT)
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
 <46615f6e-11ec-6546-42a9-3490414f9550@gmail.com>
 <20200506174345.GA3711921@kroah.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <4bc70ec6-e518-5f42-b336-c86e1f92619f@gmail.com>
Date:   Thu, 7 May 2020 13:15:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200506174345.GA3711921@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2020/5/7 1:43, Greg KH wrote:
> On Thu, May 07, 2020 at 12:48:47AM +0800, Jia-Ju Bai wrote:
>> Yes, I agree that this issue is not new, because DMA attacks are old
>> problems.
>> But I am a little surprised that many current drivers are still vulnerable
>> to DMA attacks.
> Given that the attack vector is very hard to actually do, that's not
> a suprise.
>
> It's only a very recent thing that Linux drivers have started to work on
> "we don't trust the data coming from the hardware" path.  Previously we
> always trusted that, but did not trust data coming from userspace.  So
> work on fixing up drivers in this area is always encouraged.
>
> An example of this would be all of the fuzzing that USB drivers have
> been getting with custom loop-back interfaces and the like over the past
> year or so.  Expanding that to "we don't trust PCI device data" should
> be the next step on this, and would help out your area as well.

Okay, I am glad to hear that :)
Hardware security for the Linux kernel should receive more attention.
Last year some researchers finished an interesting work about fuzzing 
the inputs from hardware:
https://github.com/securesystemslab/periscope


>
>>> If you trust a device enough to plug it in, well, you need to trust it
>>> :)
>> Well, maybe I need to trust all devices in my computer :)
>>
>> Anyway, thanks a lot for your patient explanation and reply.
>> If you have encountered other kinds of DMA-related bugs/vulnerabilities,
>> maybe I can help to detect them using my static-analysis tool :)
> Did you only find a problem in this one driver?  Have you run it on any
> more "complex" drivers and gotten any good results showing either that
> we are programming defensively in this area, or not?
>

At present, I only detect the cases that a DMA value *directly* taints 
array index, loop condition and important kernel-interface calls (such 
as request_irq()).
In this one driver, I only find two problems that mentioned in this patch.
With the kernel configuration "allyesconfig" in my x86_64 machine, I 
find nearly 200 such problems (intra-procedurally and 
inter-procedurally) in all the compiled device drivers.

I also find that several drivers check the data from DMA memory, but 
some of these checks can be bypassed.
Here is an example in drivers/scsi/esas2r/esas2r_vda.c:

The function esas2r_read_vda() uses a DMA value "vi":
   struct atto_ioctl_vda *vi =
             (struct atto_ioctl_vda *)a->vda_buffer;

Then esas2r_read_vda() calls esas2r_process_vda_ioctl() with vi:
   esas2r_process_vda_ioctl(a, vi, rq, &sgc);

In esas2r_process_vda_ioctl(), the DMA value "vi->function" is
used at many places, such as:
   if (vi->function >= vercnt)
   ...
   if (vi->version > esas2r_vdaioctl_versions[vi->function])
   ...

However, when DMA failures or attacks occur, the value of vi->function 
can be changed at any time. In this case, vi->function can be first 
smaller than vercnt, and then it can be larger than vercnt when it is 
used as the array index of esas2r_vdaioctl_versions, causing a 
buffer-overflow vulnerability.

I also submitted this patch, but no one has replied yet:
https://lore.kernel.org/lkml/20200504172412.25985-1-baijiaju1990@gmail.com/


Best wishes,
Jia-Ju Bai
