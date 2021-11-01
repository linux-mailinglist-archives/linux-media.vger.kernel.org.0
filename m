Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3D0441B0A
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 13:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbhKAMU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 08:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbhKAMU0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 08:20:26 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A90EC061714;
        Mon,  1 Nov 2021 05:17:52 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j9so35959650lfu.7;
        Mon, 01 Nov 2021 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1K4Vfyrx+NnpEvfn33F0nZBm2wjp8S+aY71ay6s8xVk=;
        b=dlLlAXI28e4mE7rFfBWy95uFDnHpZb31twZwIBIYbdX2ckm9wBrR7Gtt2D4H0qywEw
         7nAYDYutQOebbrfPcQEprGUwVqVJobxGbcDwOlMog4EaT0mHT1tAWtsMfrosPDW2Rs9X
         UhBFjfhx6+ATfu7DZW8KCrIS2+mE4Pxx67WrEfnmF60gCT83fMaTJXGzGEdKgnFtu2Be
         IXS6s31YAF1mTFRQkxonP5VInCwrxIpmhCFYZCXcihtR4iPHOnAPprkdHzQsjijNz8MO
         d6N6aFJgCvKwfGBaFP1BsrgDdKG6t2PQ6okCTy/iexNbitrc3ronNFMxZvBsw62Xd9Of
         ChNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1K4Vfyrx+NnpEvfn33F0nZBm2wjp8S+aY71ay6s8xVk=;
        b=pyuMElDF1hMTTKu8ooP1QVGkjj3QyAa/aldC31BEHiiM4zlSPfilx+Ewv9x1ieWztb
         WJWty9L7/k2XC4O3d/UWsFmr7Eawf/KT4sUOKmaHwAAM/c+nnU2ud33QZBUJybGyg+VP
         ZgmeTHyXARxYR7AJqrXVRFnIjDVW0C4He5gGLuDFjXk/DHOBxWEdN/Wy7cxG8EKgofOc
         Vxs8Smbb8U+X5FnN/gHKqSRGnje5cm9SXaD+ULmT0Wb0+rExoJ4w2dOJc7VcRX2k2v34
         kcE8G5NBC9UGHawG1tvn2G8HaGFO3P6jZGR2J9tKtSqJRg/YYEdMsef3Pwaqi26SWIiQ
         7p8w==
X-Gm-Message-State: AOAM53079XNtFy8e+iyicv+QnZ7drnG2pIY419miSLRnXtwaNGDZ7zuE
        XIedQ1P3kVZjSbn2iNvnjLs=
X-Google-Smtp-Source: ABdhPJwRtpRggItkAv4aRUuZ1CvDsi7YwrIsiOjnJ1Ptyk4lgCLiSblkQCksF31DSE64dg7az7DGsA==
X-Received: by 2002:a05:6512:3ba3:: with SMTP id g35mr4252973lfv.330.1635769070734;
        Mon, 01 Nov 2021 05:17:50 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
        by smtp.gmail.com with ESMTPSA id h13sm1440446ljg.48.2021.11.01.05.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 05:17:50 -0700 (PDT)
Message-ID: <28a3777a-7941-6ffc-07e5-38456372cfb3@gmail.com>
Date:   Mon, 1 Nov 2021 15:17:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
Content-Language: en-US
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
 <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
 <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com>
 <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/1/21 12:58, Dongliang Mu wrote:
> On Mon, Nov 1, 2021 at 5:43 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>>
>> On 11/1/21 12:41, Dongliang Mu wrote:
>> >> Hi, Dongliang,
>> >>
>> >> Did patch attached to my previous email pass syzbot's reproducer test?
>> >> Unfortunately, I am not able to test rn :(
>> >
>> > Yes, it works. The memory leak does not occur anymore.
>> >
>> > But I am crafting another patch based on yours as there is a small
>> > issue in the retval and I would like to make the error handling code
>> > uniform.
>> >
>>
>> Cool! Thank you for confirmation.
> 
> Hi Pavel,
> 
> Thanks for your advice. I have sent the patch and you are on the CC
> list. Can you please take a look at and review my patch?
> 
> It should cover your patch. But I am not sure if I introduce any new
> issue in the patch.
> 

The patch LGTM, but I can't drop R-b tag, since I am not an expert in 
this driver. Anyway, there is 100% missing clean up, so, I believe, you 
don't introduce new bugs



With regards,
Pavel Skripkin
