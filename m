Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9052E3FECC3
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 13:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244817AbhIBLQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 07:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhIBLQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 07:16:52 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5BA4C061575;
        Thu,  2 Sep 2021 04:15:52 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LkhCmj5EklQKhLkhDmKRvQ; Thu, 02 Sep 2021 13:15:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630581351; bh=M9kFlv397udHSVcT2A9pjvQRtbjYdLswfiMvJlJ6c9I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s8N+W4kRsCubAN5Z55S6Xf/bnlI/fYZ+XbnMZnLaa+cDsLPv5YjgT3pilik16tJkY
         gqnbqrVPkjy7bvjB+jva4LArxQiwTPQDjU0VA/q7T4U4ap/WEj0mw9RVQRRZTi/HcM
         QTF50SjgLFDmsuAQ7+2WX7h8CdacKi82KJjQtF5YyS/L28ZZgJFVIwKSlApWARhXGj
         vtjfeoP0NYjMaVR4wFejRqlVQu1CKqanzRQcGY/MEozJYfRswPLFHrkQ9CCnm0fnVM
         7qvMWDbURGQ/V8O0TI8W2mWAr7+L4cwExoLmkRtNarrzc2m6ckIr03XVDz0Rz/VBuI
         vlLRp5ggyoyNw==
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pavel Skripkin <paskripkin@gmail.com>
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
 <YTCp6d1umr7AXRZW@kroah.com> <20210902125416.1ad73fad@coco.lan>
 <CAD-N9QVZQo+YPjNwAUqg-kQ_fEwicLR=1am1E99h8oHi0aXocA@mail.gmail.com>
 <CAD-N9QXPJz60jKfHg1Yh6tnzJRBFAwkmV+LUoSY+f7cZ_5kYww@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2c3e496a-fdc7-020b-4234-58441e766f7d@xs4all.nl>
Date:   Thu, 2 Sep 2021 13:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAD-N9QXPJz60jKfHg1Yh6tnzJRBFAwkmV+LUoSY+f7cZ_5kYww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDt5fKd03AmAOzuheOBootkpYTxN/OSMx534Yj6GMFJ4QhzWv5hZB/KrSoIrGCcvUVp9V+2JP2R8WhcUuK4tZlSISh4BZa5sLNDB9MkWmjc2meyEmoB0
 sG8Li+l6wsJnEDTtd1l5fT6rB819VfugiQBIXEGQXW99A6BGJDgZgNk5O/j9awKYIQy+hqxHzun8CZdPyffdL50xSg+h93HQ7kTzCrIwTpRVWjylpEhIKQ/1
 GD7kNRwKIsz57Qn1nJa0fwyzc3XnAzahGDQdRuf/DJQjRBNlof0K6cvqfYZdGu2vsvzvMHYIlLLDOHj4kClqYIaSdrquucurE4BH0nzdvqptIYMUwdsQSiTW
 53SkhImdnzKxvuNM/lb6E0su8fIAVv+PZabglqbbvHYkKD7yQQawbtYIY0sAOxQIlbm97kqi9LJt9BvpWWnAb+jAByEFhPz+KNoqkn5YDjHYQcrHqom6caRk
 8KL8N5m2CS0snFWXykdiIvo/J34vqlIdzJOLuA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/09/2021 13:10, Dongliang Mu wrote:
> On Thu, Sep 2, 2021 at 6:59 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>>
>> On Thu, Sep 2, 2021 at 6:54 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>
>>> Em Thu, 2 Sep 2021 12:39:37 +0200
>>> Greg KH <gregkh@linuxfoundation.org> escreveu:
>>>
>>>> On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
>>>>> On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>>>>>>
>>>>>> On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>>>>>>>
>>>>>>> stk_camera_probe mistakenly execute usb_get_intf and increase the
>>>>>>> refcount of interface->dev.
>>>>>>>
>>>>>>> Fix this by removing the execution of usb_get_intf.
>>>>>>
>>>>>> Any idea about this patch?
>>>>>
>>>>> +cc Dan Carpenter, gregkh
>>>>>
>>>>> There is no reply in this thread in one month. Can someone give some
>>>>> feedback on this patch?
>>>>
>>>> This is the media developers domain, not much I can do here.
>>>
>>> There is a high volume of patches for the media subsystem. Anyway,
>>> as your patch is at our patchwork instance:
>>>
>>>         https://patchwork.linuxtv.org/project/linux-media/patch/20210714032340.504836-1-mudongliangabcd@gmail.com/
>>>
>>> It should be properly tracked, and likely handled after the end of
>>> the merge window.
> 
> Hi Mauro,
> 
> I found there is another fix [1] for the same memory leak from Pavel
> Skripkin (already cc-ed in this thread).
> 
> [1] https://www.spinics.net/lists/stable/msg479628.html

Ah, that's why I marked it as Obsoleted :-)

Regards,

	Hans

> 
>>>
>>>>>>> Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
>>>>>>> Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
>>>>>>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
>>>
>>> If you're the author of the patch, it doesn't make much sense to
>>> add a "Reported-by:" tag there. We only use it in order to give
>>> someone's else credit to report an issue.
>>
>> I see. Someone told me this rule in another thread. I will update this
>> in the next version.
>>
>>>
>>> Thanks,
>>> Mauro

