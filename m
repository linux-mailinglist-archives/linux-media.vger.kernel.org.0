Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1CF3FF30F
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 20:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346894AbhIBSPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 14:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346837AbhIBSPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 14:15:50 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DE8C061575;
        Thu,  2 Sep 2021 11:14:51 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so6282701lfu.5;
        Thu, 02 Sep 2021 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e2Q8mzLJmaOQ5im2dSD47/Lcv42ZClmztK2gVopfMNc=;
        b=do1S4nqRBIe45s4tAP4RN7n1VcujfAHWgYN0cQ4aA09uolZnaSLUd2NKRJ7vXcrW+1
         HCpWjlhGWtH/NU8+TcXBa3r0apx0mNhM4BHmKhu/SDX+0xS/6aY5IF7U+Ye1tgJDtq5v
         HBHAz+L0Py3n9XqJS5LqXVZe0EdkxEwBpn/cb4oa71Bfmqu9v9XTuUo/jFXXq0xvq7C2
         w8Jvk9QRUlxjzGGMgvsqdpSXdgGBXZEw4Bgp1iA5PEvQ+m1uROTu3upIghkLDu5fDwHy
         hLtcDnkA6DfjoKKfzDpPaYEKi+6Hteogs0GdwaI3PVBZZeB0q+xY7jFFBy/O8uUIvJeu
         jaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e2Q8mzLJmaOQ5im2dSD47/Lcv42ZClmztK2gVopfMNc=;
        b=dLYMJGEe50qjzIGMMwM4IUn/gccQEogeaxE/YXbUVYKCnYA+Xx4wDE13x8YN+rSkPP
         8wwSI6978QQ9Lr1Ot44Dz4sOpHawGsh4LxU1eo+uDeuHWtSMhMgdvewlI7pRXdz9j3Be
         xyLaR05F6lokcGBe9s676X8C4q5CnGF4r8lT93fYgONPhEsjwYTP/eDQss5DLu8nhZ7K
         e6jLVfqfFMJFxxZUxa49LBjdRiphI/IYFjlR+/XwupbpVak7ux+KMsj1qOBiL+vqHbbe
         9cQuNgvQK69xvLP3FyfAHBd3soo6ejKNRyxcTt7/Z16o7+1davqtrJYLFzCnlm/uI3CH
         +A5Q==
X-Gm-Message-State: AOAM531BG5qBICKPQwQd2a9GuTKa5lCW9fDMTYS+gNImEo44snlm9fjr
        Clbv9J+FKpHnSffP5KtGNaU=
X-Google-Smtp-Source: ABdhPJxFzowEWoxhqXvXPhobhAK+wh5g1VLoIKlLS87iZ9ZhGGGaLOvltmcW825+t/oeky1zp0Z4/w==
X-Received: by 2002:a05:6512:2207:: with SMTP id h7mr3728727lfu.44.1630606490093;
        Thu, 02 Sep 2021 11:14:50 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.70])
        by smtp.gmail.com with UTF8SMTPSA id p14sm306413lji.56.2021.09.02.11.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 11:14:49 -0700 (PDT)
Message-ID: <90aa8c94-da50-7023-0f1a-8df58449bd6d@gmail.com>
Date:   Thu, 2 Sep 2021 21:14:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
Content-Language: en-US
To:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
 <YTCp6d1umr7AXRZW@kroah.com> <20210902125416.1ad73fad@coco.lan>
 <CAD-N9QVZQo+YPjNwAUqg-kQ_fEwicLR=1am1E99h8oHi0aXocA@mail.gmail.com>
 <CAD-N9QXPJz60jKfHg1Yh6tnzJRBFAwkmV+LUoSY+f7cZ_5kYww@mail.gmail.com>
 <2c3e496a-fdc7-020b-4234-58441e766f7d@xs4all.nl>
 <CAD-N9QX7q3wTdTUC_b2fEn1txjEjdgmtx2eaX9ymxAp_vUfxiA@mail.gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAD-N9QX7q3wTdTUC_b2fEn1txjEjdgmtx2eaX9ymxAp_vUfxiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/2/21 14:22, Dongliang Mu wrote:
> On Thu, Sep 2, 2021 at 7:15 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 02/09/2021 13:10, Dongliang Mu wrote:
>> > On Thu, Sep 2, 2021 at 6:59 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>> >>
>> >> On Thu, Sep 2, 2021 at 6:54 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>> >>>
>> >>> Em Thu, 2 Sep 2021 12:39:37 +0200
>> >>> Greg KH <gregkh@linuxfoundation.org> escreveu:
>> >>>
>> >>>> On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
>> >>>>> On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>> >>>>>>
>> >>>>>> On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>> >>>>>>>
>> >>>>>>> stk_camera_probe mistakenly execute usb_get_intf and increase the
>> >>>>>>> refcount of interface->dev.
>> >>>>>>>
>> >>>>>>> Fix this by removing the execution of usb_get_intf.
>> >>>>>>
>> >>>>>> Any idea about this patch?
>> >>>>>
>> >>>>> +cc Dan Carpenter, gregkh
>> >>>>>
>> >>>>> There is no reply in this thread in one month. Can someone give some
>> >>>>> feedback on this patch?
>> >>>>
>> >>>> This is the media developers domain, not much I can do here.
>> >>>
>> >>> There is a high volume of patches for the media subsystem. Anyway,
>> >>> as your patch is at our patchwork instance:
>> >>>
>> >>>         https://patchwork.linuxtv.org/project/linux-media/patch/20210714032340.504836-1-mudongliangabcd@gmail.com/
>> >>>
>> >>> It should be properly tracked, and likely handled after the end of
>> >>> the merge window.
>> >
>> > Hi Mauro,
>> >
>> > I found there is another fix [1] for the same memory leak from Pavel
>> > Skripkin (already cc-ed in this thread).
>> >
>> > [1] https://www.spinics.net/lists/stable/msg479628.html
>>
>> Ah, that's why I marked it as Obsoleted :-)
> 
> Oh, I see. If that patch is already merged, please remark my patch as Obsoleted.
> 
> Curiously, I did not get an email notification to mark my patch as
> Obsoleted before. Why?
> 
>>

Hi, Dongliang!

Yep my patch has been merged already (1 month ago, I guess).




With regards,
Pavel Skripkin
