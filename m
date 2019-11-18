Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D66100727
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 15:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfKROPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 09:15:53 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56020 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfKROPx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 09:15:53 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 2A6CA290428
Subject: Re: [PATCH] media: v4l2-core: set sd->devnode = NULL if
 v4l2_device_register_subdev_nodes fails
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20191115161116.16304-1-dafna.hirschfeld@collabora.com>
 <CAAEAJfCpszObksiU7uZcX2Aw=oiuYCMEUgxU_ZC1zBPq+soQaw@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <ca94ffb1-5021-c3b2-5b7c-55d4d525427a@collabora.com>
Date:   Mon, 18 Nov 2019 15:15:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfCpszObksiU7uZcX2Aw=oiuYCMEUgxU_ZC1zBPq+soQaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/15/19 11:12 PM, Ezequiel Garcia wrote:
> Hi Dafna,
> 
> Thanks for the patch!
> 
> On Fri, 15 Nov 2019 at 13:13, Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> In case v4l2_device_register_subdev_nodes fails, sd->devnode is
>> unregistered and then released. Therefore the field is set to
>> NULL so that the subdev won't hold a pointer to a released object.
>> This fixes a reference after free bug in function
>> v4l2_device_unregister_subdev
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-device.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
>> index 63d6b147b21e..468705c85e97 100644
>> --- a/drivers/media/v4l2-core/v4l2-device.c
>> +++ b/drivers/media/v4l2-core/v4l2-device.c
>> @@ -250,6 +250,7 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
>>                  if (!sd->devnode)
>>                          break;
>>                  video_unregister_device(sd->devnode);
>> +               sd->devnode = NULL;
>>          }
>>
> 
> You also need to clear devnode in v4l2_device_unregister_subdev, as we
> discussed in IRC.
> It would mean fixing a different issue that is triggered upon driver
> removal/unbinding,
I think that the right place to set devnode to null would be
in the beginning of the function v4l2_device_release_subdev_node
where it is freed. This ensures that the devnode is set to NULL always
and only when it is freed.
What do you think?

Thanks,
Dafna

> but it seems fine to address both issues as one: don't leave devnode
> incorrectly defined.
> 
> Can you send a new version (and amend the commit description)?
> 
> Thanks,
> Ezequiel
> 
