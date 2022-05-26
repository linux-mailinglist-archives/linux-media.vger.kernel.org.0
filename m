Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A33534CC8
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 11:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239446AbiEZJwu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 05:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbiEZJwt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 05:52:49 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537FBC9657
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 02:52:48 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id o29-20020a05600c511d00b00397697f172dso2179152wms.0
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=yC3gNLDwQgDGWU6u5sZWLctx128ZpF2u3Rd5klYlRWU=;
        b=PMk0HECdtjBLit3vp2CPEk4WVu57Lvh52lkGuZ7EYZhgv/sRNdJylppnPgG82LGxZM
         rM5bMVFj5DumbnYkHLRk6ntrBjD9VD98vsXRCrnLZHRukucbc4ILULAo+wSTkqGT1PoM
         7EqoE7tvKyLEilKIvHTPBpijkwyotzCXDc0Iz1ZhlYQvV4xNuIsfS0oK0xnetM+ZXcO/
         nLcCMB+iWJq2edWPyDYmFyQprY+gU3ccdNxenVDQq04Lm3qJHkM25a8OR716aYfWi2sN
         y0BMJ4yB98XV+OGnjw1EJ1g953NOc0jVlmkgDE1kvYMeIrsCpLgxKlXhgvUbEucjyeH1
         fuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=yC3gNLDwQgDGWU6u5sZWLctx128ZpF2u3Rd5klYlRWU=;
        b=lMRd5JVeLCKLtKVKewWTyKQlK1m52lzxST0Aes6qFAyRHreiY6TCOPHO7+AqBCrrvf
         UmHMBCvGEOar1/U5krz+RIhkkBJBzNWK84mKVIXw4wD+N6mA8v2Cd3sB/RoUmv78YuQR
         oCFEuzThX5+Vp8G3J21HmuXXpRMQh4PgEkiXV04l8C7kt+EoIrgAIkCs0gnN+6EBrw8a
         7OmifjLoQPOxZVny+uJe/0uhmbjiapUmCkorHrYQq3QmonrvDA1YHictgh8FdTAZajIm
         dLaaZzp5IyM9otgO2kjSc9g/g0GOSWoEMv1TalcSxfJX96EH8dnbaQGU8Q8oUrRTEObN
         WGJQ==
X-Gm-Message-State: AOAM530gq0QRQKJLySejKEnOAS8I2isbTKdATQ0RzIANaBoxrttM5xwr
        qf4EhmBahlf6FQUHC7gfWN+gWeYycNdkbjXv
X-Google-Smtp-Source: ABdhPJy15J8eKZEv8ZJqwnWbq6A0IO6Ydw0Db7bSv7nxLSDrTnB6Yern2dTrvvYGulY6cCqFjmIcgA==
X-Received: by 2002:a05:600c:34c7:b0:397:73ae:a096 with SMTP id d7-20020a05600c34c700b0039773aea096mr1507367wmq.171.1653558766889;
        Thu, 26 May 2022 02:52:46 -0700 (PDT)
Received: from localhost.localdomain (knetgate.kensnet.org. [80.168.136.138])
        by smtp.gmail.com with ESMTPSA id v8-20020adfe288000000b0020ffa2799f4sm1270332wri.73.2022.05.26.02.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 02:52:46 -0700 (PDT)
From:   Ken Smith <kens999@gmail.com>
Subject: Re: HauppaugeTV-quadHD DVB-T & HVR5525 mpeg risc op code error
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
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
X-Priority: 1 (Highest)
Message-ID: <a2ea7352-e37b-c749-2d60-f19ce10fdb95@gmail.com>
Date:   Thu, 26 May 2022 10:52:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <20200430164934.GA16730@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Ian Young wrote:
> On Tue, Apr 28, 2020 at 08:24:20PM +0200, Martin Burnicki wrote:
>> Hi,
>>
>> Am 27.04.20 um 10:59 schrieb Martin Burnicki:
>>> Sean Young wrote:
>>>> Would you mind testing this patch please?
>>> I'm going to try it this evening.
>>>
>>> I'll have to find out how to do an out-of-tree build for a copy of the
>>> cx module that includes the patch.
>>>
>>> My own kernel driver is always and only built out-of-tree, but for the
>>> cx driver I need to see which files I need to copy to a local directory,
>>> and if there is anything else that needs to be done to build a copy of
>>> it out-of-tree.
>> Sorry, I haven't managed to test the patch, yet.
>>
>> Currently I have the driver loaded with
>>
>> options cx23885 dma_reset_workaround=2
>>
>> but today there were 3 occurrences of the risc opcode error:
>>
>>
> Drats.
>
>> So the workaround doesn't seem to fix the problem anyway, and the patch
>> would just enable the workaround with out the specific option, right?
> Yes, that's right.
>
>> The effect of the workaround looks just like debug levels lower than 7,
>> it just seems to reduce the probability that the bug occurs, but doesn't
>> really fix it.
>>
>> So my conclusion is still that that this smells like a missing memory
>> barrier or so in the driver.
>>
>> Since the driver seems to work properly with older mainboards/CPU types,
>> this doesn't sound like a problem in the CX chip, IMO.
> I would agree with that. I would suspect same issue was being papered over
> by the patch; now what that issue is, I don't know. Certainly some 
> ordering
> or barrier issue seems likely.
>
> Actually I suspected this all along, but the workaround is the best we 
> have.
>
> I think, some time spent hunting down the issue would really be helpful
> here. Hopefully that doesn't mean too many aborted recordings..
>
> Thanks,
>
> Sean
>

Hi, I'd like to resurrect this thread (copied above). I have a system 
showing this error. Its on a HP ML350 server with 2x Xeon 5675 running 
Rocky Linux 8.5. It has a Hauppauge HVR5525 card that uses the same 
cx23885 kernel module, as many PCIe cards do, as the quadHD card 
discussed above. The HVR5525 is a dual DVB-T2/DVB-S2 card.

Elsewhere I read about the dma_reset_workaround option. That option did 
not appear to be in the driver included in standard kernel in Rocky 8.5. 
I have tested with a 5.4 & 5.18 kernel and compiled the DVB media 
modules from .git source and set dma_reset_workaround=2 in a file in 
modprobe.d. The built module shows version 0.0.4

Sadly the error remains. The system runs MythTV v.31. The main symptom 
is aborted recordings. Although the card does appear to recover, not 
requiring a reboot/cold restart.

I've also logged this on Bugzilla. For some reason my original 
subscription to this list had stopped working so I may have missed some 
threads since Oct 2020.

I'd appreciate some assistance with this. What information can I 
provide, or testing can I do, to help to trace this.

Many thanks

Ken


