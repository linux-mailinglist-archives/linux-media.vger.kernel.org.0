Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871A0348A4C
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 08:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCYHmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 03:42:12 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60757 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229619AbhCYHl4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 03:41:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PKcnlaRbjFRvvPKcrlS5xH; Thu, 25 Mar 2021 08:41:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616658115; bh=SSxxAoODb4Tt1I6hP1/2k6vBdMjdOxsyPPlphYnbrOk=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SkHIInCICFvEiHiKdZRzJ6sQyl7U3jv4hoHUqSfvQDf9wmk9Gt4vSRMG/azw9dkV7
         3BUqCH8tta1BGpp9t4f3x0nRwCoOVPx7Dgg6l1lmGrfhTkx6Wgxloze1qHIz1XO3L1
         7P48rbzqFPN9ZlRM4T1CEbV8S5ERtzXiMeUARTlmsn2a/upvNt7ni/hwLAUoNdV73T
         NcGp6P0NGBrVEsyF7+5sD4Fl7bxqK8YqgHK22jdL2XYLgmtWBU4o0A24CDkbftSYvE
         jjD0XKU/dtIGoCFMKV7rNgRy+kgn3v3AlbtQGQ7yiWL8+I6djFq26cF2OfI5blq5tL
         Gd4mMgQljBW9w==
Subject: Re: [PATCH 1/2] media: v4l2-core: ignore native time32 ioctls on
 64-bit
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        syzbot+142888ffec98ab194028@syzkaller.appspotmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210318134334.2933141-1-arnd@kernel.org>
 <72a923ff-dc5c-a505-3f45-6fd935b4c6bf@xs4all.nl>
Message-ID: <a3d67c73-a1f5-9964-a3b8-59e398c99983@xs4all.nl>
Date:   Thu, 25 Mar 2021 08:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <72a923ff-dc5c-a505-3f45-6fd935b4c6bf@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPI692OvcOt7VVdyn3B5LWenFbj5Iss8zcqKHzUFMBptxlut/1rQ3VbXJrZm5/1cVhP+7oUDArVTy4lYJrswwlNUe6/Io5arAnRktQ7DjhSjL6QTqOKl
 MZd2ffj+Msw+xw4RKfDmtLSWhRCA1U+7oGgwRqW8v+WeWRe+TjLEnJW/TP+pg869dnIPudJmFXmaL49t+f35aUU9Y6af1vNz4FHq1SJFEqAj4HI33GhoxyQy
 qPteu5nU5ubU1vqZ2gZsCB/hYgdFbVAPsyeNjpcQCCoDZFjUSPXMBuZ7aZ+NoDl7I3f7G2/uGDmHE5EF/n44I672a3Ff6+ix5JYJqSBOilxmHZccdC4diNDf
 lELaTRcN/oFt4rcSxxcY3caeKjTLVAA8y47NjtfjjWCHjVwJERatFoVDz/unQvu+LVczAyQucThBn8MREWUq383Ued4EmdLwZU2kkiJq/jMKzfm7GkCf13zV
 ZIEqi1w5YUqfuZ3JO/fAdrb8m3bdaaYn0hfIv5UOeUtGAyJ+MGv1HtTqgXc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/03/2021 09:50, Hans Verkuil wrote:
> Hi Arnd,

<snip>

>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 336133dbc759..9f5573d3b857 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -428,7 +428,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>  
>>  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
>>  
>> -#ifdef CONFIG_COMPAT_32BIT_TIME
>> +#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>>  	case VIDIOC_DQEVENT_TIME32: {
>>  		struct v4l2_event_time32 *ev32 = arg;
>>  		struct v4l2_event ev = { };
>>
> 
> This chunk doesn't apply since there is no '#ifdef CONFIG_COMPAT_32BIT_TIME' in
> either the mainline kernel or the media_tree master branch.
> 
> Are we missing a patch for v4l2-subdev.c?

Ping!

	Hans

> 
> Regards,
> 
> 	Hans
> 

