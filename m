Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9BEC15D894
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 14:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgBNNex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 08:34:53 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:59937 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729278AbgBNNex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 08:34:53 -0500
Received: from [IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef]
 ([IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2b7JjO1g0P9a92b7KjHRpW; Fri, 14 Feb 2020 14:34:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581687291; bh=ogiA29kGr63K3T/Y1WL1eNJvSK0/wAs6xVkh+Eug/kE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GsRJZ1Irf+iTNkEOSgRVdt3REwAyk5x6dBqUcmorejchJxuIhXOlMkiJl6sMIjZ+x
         gWi6RLmq+3zgPkCpyamUBRwOHbHCGS4oy23P4kp5/qK3dObGmWO5vCjRsLoX1okTEi
         LfCAdn/RHqgrHF/rJH4k1VMrrfvXYDhQ4T0NjVdEJmG/e3KJ0GNmvJC+PKDDts/zzc
         xPml4L5D1ehCDPWzwf7HgYGvVuUi8UXaNw7S+Vm8WW2xpkXNiwZLZw59KuoeN7S5gI
         ZbJ0OS0RPhpTl0dYZBbffGBsInKDL/+S9zjA9+aQwfA1CHlA9o1+tkDhB1dcHOVklH
         uJ+gcMbyUNVng==
Subject: Re: [PATCH] media: usbvision: Fix a use after free in v4l2_release()
To:     Hillf Danton <hdanton@sina.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souptick Joarder <jrdr.linux@gmail.com>, andreyknvl@google.com,
        bnvandana@gmail.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <20200124141356.365bgzg2lp3tjedm@kili.mountain>
 <d8663b81-e920-3e1d-11d0-f636ea52c6ef@xs4all.nl>
 <20200214112239.GC4831@pendragon.ideasonboard.com>
 <20200214121447.13612-1-hdanton@sina.com>
 <20200214124825.12568-1-hdanton@sina.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <feb28930-0a50-b43b-e639-37adc5a60743@xs4all.nl>
Date:   Fri, 14 Feb 2020 14:34:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200214124825.12568-1-hdanton@sina.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH5PW6WF6TCXyCSmhbqE0CqtW3dAdYqoOaC6hKS7cmFA119bWFTslJ3LzzTvGcUQ0+hntZ8td+iitWdQkUOgBfXG//S9gKFWEoPDLBgmE7sXv9O/v4cg
 jB2Vq+smd/yDyvuXMUFF8Vt7oIoEZqOA+XtLwI1P/h2XZeMHhsOEmi/AC5WHPbloWwB5KpKLF4HGDUBSsgXHUWqygimIDmRHMOeWNbHcfgPR8upobERr5FjP
 6TQq/tYnV2o53zL4mcFAZ6BtQlKxACNhWeafqdtI7TbAGImtrsZ7/hxeRBKHuX9dZ6bszmIjYBfqILBNt646f3PmVE9/pfCWIU0twTIegPMv+lssTRirds8a
 x2G7bRGVD/XT25jGka6lI2M6UVWMUP8imFH/98VHhSC6XxLZ5DL3o4c6X8jbLgC66qAUpAie+hv0ZMaFZVuTB1t/HiA1kEShoxj4xNlyS3TKmzjoAJMryEu0
 Cz/mrrTj4xfzrCyrozaqZmKurVaBqDl2iKtq4l3wZb4XYqh1pB+e5nv3I1H1fsmSiA/ZQmpYU5TBu0TkSbkCnPoR2yCKIDqPE1TDToqfGSuk3KQM+u691tiA
 wWNie0K/Z1grSkLek0ZbSNucMja4rHJ3kcRWd6kyxXmMZaQCzNeZ0Z10wrr/Sux7ex6DDLhaZpFlQcHW50GHMrxzTl1RvxHgMQCgQ7/Ih+0uyn7I4hNHfgb5
 onTpacPaGMHtDyMd6yOxRGRTErO72CCXv3FhmgKZASZ75o+7DPdmj1KUi751Ay72926eYIkPcxx3DQs8vpQVK31MNiwb6zBfSJlt+/GJ+KzHfEK1UnBEzw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/14/20 1:48 PM, Hillf Danton wrote:
> 
> On Fri, 14 Feb 2020 13:21:03 +0100 Hans Verkuil wrote:
>> On 2/14/20 1:14 PM, Hillf Danton wrote:
>>>
>>> On Fri, 14 Feb 2020 12:30:29 +0100 Hans Verkuil wrote:
>>>>
>>>> Hillf, if you want your patch to be merged, then make sure it is CC-ed to
>>>> linux-media as well.
>>>
>>> Please pick it up if it makes a sense to you and it was sent with
>>> linux-media added on the Cc list as it is known for a while that
>>> my mail agent is rejected @vger.kernel.org for what I am not clear
>>> about. It makes my day occasionally :P
>>
>> I don't I ever received the full patch, only replies to your patch.
>>
> 
> =========
> Please take a look at the Cc tag in the snippet from
> https://lore.kernel.org/lkml/b1d071e2-0428-a08c-392d-3ca5d4a7e710@xs4all.nl/T/#m13f2c16b7cd1892f6a0b58b72ce37979cb6940b9
> 
> 
>> Subject: [PATCH] media: usbvision: add the release callback for video device
>> From: Hillf Danton <hdanton@sina.com>
>>
>> To fix the UAF syzbot reported,
>>
>> BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
>>
>> a release cb which is a simple wrapper of usbvision_release() is added
>> for releasing resources as the last reference to the usbvision video
>> device goes away.
>>
>> Reported-by: syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>
>> Fixes: 2aa689dd8057 ("[media] usbvision: embed video_device")
>> Cc: Hans Verkuil <hans.verkuil@cisco.com>

Ah, my work email. And I always delete posts mailed to that if it is also CC-ed
to linux-media. Which didn't actually arrive there in your case. And it's no longer
in my trash folder either.

So please mail me a properly formatted patch so I can forward it to linux-media
for you.

Regards,

	Hans

>> Signed-off-by: Hillf Danton <hdanton@sina.com>
>> ---
> =========
> 
>> Please mail your patch directly to me so I have a clean version.
> 

