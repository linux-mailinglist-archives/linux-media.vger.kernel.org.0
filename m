Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6C7232F06
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 10:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgG3I7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 04:59:18 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:2957 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgG3I7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 04:59:18 -0400
X-Originating-IP: 176.88.148.196
Received: from [192.168.1.3] (unknown [176.88.148.196])
        (Authenticated sender: cengiz@kernel.wtf)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9FA0C24000C;
        Thu, 30 Jul 2020 08:59:13 +0000 (UTC)
From:   Cengiz Can <cengiz@kernel.wtf>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Thu, 30 Jul 2020 11:59:10 +0300
Message-ID: <1739ef25b30.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
In-Reply-To: <20200730084545.GB1793@kadam>
References: <20200729135636.9220-1-cengiz@kernel.wtf>
 <CAHp75VfM3OapAkYJ-sN-MG2yuGDqaqDjc6p0gXT9cHYgnH+5LQ@mail.gmail.com>
 <20200730084545.GB1793@kadam>
User-Agent: AquaMail/1.25.2-1666 (build: 102500007)
Subject: Re: [PATCH] staging: atomisp: move null check to earlier point
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On July 30, 2020 11:48:06 Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Wed, Jul 29, 2020 at 06:13:44PM +0300, Andy Shevchenko wrote:
>> On Wed, Jul 29, 2020 at 5:00 PM Cengiz Can <cengiz@kernel.wtf> wrote:
>>>
>>> `find_gmin_subdev` function that returns a pointer to `struct
>>> gmin_subdev` can return NULL.
>>>
>>> In `gmin_v2p8_ctrl` there's a call to this function but the possibility
>>> of a NULL was not checked before its being dereferenced. ie:
>>>
>>> ```
>>> /* Acquired here --------v */
>>> struct gmin_subdev *gs = find_gmin_subdev(subdev);
>>> int ret;
>>> int value;
>>>
>>> /*  v------Dereferenced here */
>>> if (gs->v2p8_gpio >= 0) {
>>>  pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
>>>          gs->v2p8_gpio);
>>>  ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
>>>  if (!ret)
>>>          ret = gpio_direction_output(gs->v2p8_gpio, 0);
>>>  if (ret)
>>>          pr_err("V2P8 GPIO initialization failed\n");
>>> }
>>> ```
>>>
>>> I have moved the NULL check before deref point.
>>
>> "Move the NULL check..."
>> See Submitting Patches documentation how to avoid "This patch", "I", "we", etc.

Noted. Sorry. I'm not a native English speaker.

>>
>
> I always feel like this is a pointless requirement.  We're turning into
> bureaucracts.
>
>>
>>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c 
>>> b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>>> index 0df46a1af5f0..8e9c5016f299 100644
>>> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>>> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>>> @@ -871,6 +871,11 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, 
>>> int on)
>>>  int ret;
>>>  int value;
>>>
>>> +       if (!gs) {
>>> +               pr_err("Unable to find gmin subdevice\n");
>>
>>> +               return -EINVAL;
>>
>> And here is a change of semantics...
>
> Yeah.  The change of semantics should be documented in the commit
> message, but it's actually correct.  I discussed this with Mauro earlier
> but my bug reporting script didn't CC a mailing list and I didn't
> catch it.  Mauro suggested:
>
>    53  > Yet, it could make sense to have something like:
>    54  >
>    55  >       if (WARN_ON(!gs))
>    56  >               return -ENODEV;
>    57  >
>    58  > at the beginning of the functions that call find_gmin_subdev().

I will be updating v2 according to this.

>
> regards,
> dan carpenter



