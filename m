Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB453FEC60
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 12:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbhIBKum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 06:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236263AbhIBKuj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 06:50:39 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA7BC061575;
        Thu,  2 Sep 2021 03:49:40 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LkHpmiwTclQKhLkHqmKOn7; Thu, 02 Sep 2021 12:49:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630579778; bh=z8S8PBTuuy6W8YvwKgx9nMDnBhYR8E+ca6ZFT8GLcmg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SH0liSzmKgUoL0hI9UUZqzASA/gjwWlwQooMG9aktGrU1uGMgl84kJDu1NAguBx4V
         E9Eqv+9kC3J+R752P4lryn3ehBdGF4b3iJZb3uNRKpQbzvs9bG1MvnReYNPc//pwO6
         5yI2iVZiwECDthkWxzdvnUZ37YUIOq86Arw7KwZo7WSc6DlWeQiEbk88gKYOfCqx6N
         gt5yQUfgnt/Z5Gz24FoIk8NWvWZif9R8id5qs+Q/PzJZkC2S6epM8ftzmOAfMR9pcA
         93hraVwjiNjALm9m8IZS/NTHgMB0PUgkZHTr6g/aaj23VILwgkAbi7A+XKeXitIUEa
         uP9Yvei7/Iv/A==
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <911af8f1-d654-b4e1-1aac-c8a7ff94f6da@xs4all.nl>
Date:   Thu, 2 Sep 2021 12:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMtG5773DVqMm00i2M9TjNm6lyyWSRkJZUlCS9i7Xgy8HAYiw1GYfZx9ltiiX9UpndCkRJZpsATVre9Rj9KHnQ+xJqm2KSm6t8edndVXEQxjhe06pbaV
 c5jNiYaiumt4ot483fjLZoxsDyrRbopSSalT8TY+0pWubTLpfWSAgKTGwqSM5/ccgmuiRFHuTrNRucYHkVTfVh5F5TNYquh0fuyIDhGTQdO5DEY+1TPhsKiJ
 HS4HP4/i7kjRiwaLlGX+ke4xgaLX65C6aPaRynUQkzA/3g3dCf0jNQbc+B0M716KKhFIGX+2pb+zM1STp6yrs7WcQiXvZznnT4K55USyyXl9BsEEjeHVEEj1
 6hBJnR7sOn6sLQTuUMPV8oGVrPgj81+zckrVq4JLc/QxS99HVLhYdWxZe2s311N753y9WcWdjr3AhZEz1kSjnXFwf3MxUarvMPPNF3ICg/l77H19iRMQ8edy
 tEjWIISdJBFXd2jJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongliang,

On 02/09/2021 12:23, Dongliang Mu wrote:
> On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>>
>> On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>>>
>>> stk_camera_probe mistakenly execute usb_get_intf and increase the
>>> refcount of interface->dev.
>>>
>>> Fix this by removing the execution of usb_get_intf.
>>
>> Any idea about this patch?
> 
> +cc Dan Carpenter, gregkh
> 
> There is no reply in this thread in one month. Can someone give some
> feedback on this patch?

I saw that it was marked as Obsoleted in patchwork, but I might have confused
this patch with similar, but not identical, patches for this driver.

I've moved the state back to New.

Comments follow below:

> 
>>
>>>
>>> Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
>>> Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
>>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
>>> ---
>>>  drivers/media/usb/stkwebcam/stk-webcam.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
>>> index a45d464427c4..5bd8e85b9452 100644
>>> --- a/drivers/media/usb/stkwebcam/stk-webcam.c
>>> +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
>>> @@ -1311,7 +1311,6 @@ static int stk_camera_probe(struct usb_interface *interface,
>>>
>>>         dev->udev = udev;
>>>         dev->interface = interface;
>>> -       usb_get_intf(interface);

Even though this increments the refcount (which might well be unnecessary),
it is also decremented with usb_put_intf. So is there actually a bug here?

And if this is changed, then I expect that both get_intf and put_intf should be
removed, and not just the get.

Regards,

	Hans

>>>
>>>         if (hflip != -1)
>>>                 dev->vsettings.hflip = hflip;
>>> --
>>> 2.25.1
>>>

