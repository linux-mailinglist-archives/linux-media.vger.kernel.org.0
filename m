Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32E544D31D
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 09:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhKKI0w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 03:26:52 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:54040 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbhKKI0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 03:26:51 -0500
Received: from [192.168.1.18] ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id l5NImT107Bazol5NImZYOT; Thu, 11 Nov 2021 09:24:01 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 11 Nov 2021 09:24:01 +0100
X-ME-IP: 86.243.171.122
Subject: Re: [PATCH] media: uvcvideo: Fix a memory leak in an error handling
 path of 'uvc_ioctl_ctrl_map()'
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
 <CANiDSCsWE+cr70hdNkqXKxj8EXdJ-bRtXqLDgiGhYVdHYTFHBQ@mail.gmail.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <cb095a2e-24e9-ff99-8ba1-7ddf6609f996@wanadoo.fr>
Date:   Thu, 11 Nov 2021 09:24:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANiDSCsWE+cr70hdNkqXKxj8EXdJ-bRtXqLDgiGhYVdHYTFHBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 11/11/2021 à 09:12, Ricardo Ribalda a écrit :
> Hi Christophe
> 
> I believe this is a dup of:
> https://lore.kernel.org/lkml/20210917114930.47261-1-colin.king@canonical.com/

Yes it is, and Colin's proposal is cleaner than mine.

Sorry for the noise.

CJ

> 
> Thanks
> 
> On Thu, 11 Nov 2021 at 09:06, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> If 'map->name' can't be allocated, 'map' must be released before returning.
>>
>> Fixes: 70fa906d6fce ("media: uvcvideo: Use control names from framework")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/media/usb/uvc/uvc_v4l2.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>> index f4e4aff8ddf7..5aa76a9a6080 100644
>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>> @@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>>          if (v4l2_ctrl_get_name(map->id) == NULL) {
>>                  map->name = kmemdup(xmap->name, sizeof(xmap->name),
>>                                      GFP_KERNEL);
>> -               if (!map->name)
>> +               if (!map->name) {
>> +                       kfree(map);
>>                          return -ENOMEM;
>> +               }
>>          }
>>          memcpy(map->entity, xmap->entity, sizeof(map->entity));
>>          map->selector = xmap->selector;
>> --
>> 2.30.2
>>
> 
> 

