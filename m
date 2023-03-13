Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C80D6B7958
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 14:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjCMNqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 09:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjCMNqj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 09:46:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245556E6B8
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 06:46:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BCAC8612C5
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 13:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F114C433D2;
        Mon, 13 Mar 2023 13:46:29 +0000 (UTC)
Message-ID: <132b4fdf-7ec1-33a4-566a-8e10e6094230@xs4all.nl>
Date:   Mon, 13 Mar 2023 14:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 25/26] media: Implement best effort media device removal
 safety sans refcounting
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <20230201214535.347075-26-sakari.ailus@linux.intel.com>
 <a3a8c0ec-f13e-2473-78d6-f454790467be@xs4all.nl>
 <768335ad-d5ba-d0a7-828a-80c0ec44e41b@xs4all.nl>
 <ZAHVKu3OPyd7iLhH@kekkonen.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ZAHVKu3OPyd7iLhH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/03/2023 12:08, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Mar 03, 2023 at 09:54:40AM +0100, Hans Verkuil wrote:
>> On 03/03/2023 09:39, Hans Verkuil wrote:
>>> On 01/02/2023 22:45, Sakari Ailus wrote:
>>>> Add a new helper data structure media_devnode_compat_ref, which is used to
>>>> prevent user space from calling IOCTLs or other system calls to the media
>>>> device that has been already unregistered.
>>>>
>>>> The media device's memory may of course still be released during the call
>>>> but there is only so much that can be done to this without the driver
>>>> managing the lifetime of the resources it needs somehow.
>>>>
>>>> This patch should be reverted once all drivers have been converted to manage
>>>> their resources' lifetime.
>>>>
>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>> ---
>>>>  drivers/media/mc/mc-device.c  | 60 ++++++++++++++++++++++++++++++-----
>>>>  drivers/media/mc/mc-devnode.c | 21 ++++++++----
>>>>  include/media/media-devnode.h | 29 +++++++++++++++++
>>>>  3 files changed, 96 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
>>>> index 3a1db5fdbba7..22fdaa6370ea 100644
>>>> --- a/drivers/media/mc/mc-device.c
>>>> +++ b/drivers/media/mc/mc-device.c
>>>> @@ -45,18 +45,34 @@ static inline void __user *media_get_uptr(__u64 arg)
>>>>  	return (void __user *)(uintptr_t)arg;
>>>>  }
>>>>  
>>>> +static void compat_ref_release(struct kref *kref)
>>>> +{
>>>> +	struct media_devnode_compat_ref *ref =
>>>> +		container_of_const(kref, struct media_devnode_compat_ref, kref);
>>>> +
>>>> +	kfree(ref);
>>>> +}
>>>> +
>>>>  static int media_device_open(struct media_devnode *devnode, struct file *filp)
>>>>  {
>>>>  	struct media_device *mdev = to_media_device(devnode);
>>>>  	struct media_device_fh *fh;
>>>>  	unsigned long flags;
>>>>  
>>>> +	if (devnode->ref && (!atomic_read(&devnode->ref->registered) ||
>>>> +			     !kref_get_unless_zero(&devnode->ref->kref)))
>>>> +		return -ENXIO;
>>>> +
>>>
>>> This seems pointless: if the media device is unregistered, then the device
>>> node disappears and it can't be opened anymore.
>>>
>>> I'm confused by this patch in general: when media_device_unregister() is called,
>>> it is no longer possible to call ioctls and basically do anything except close
>>> the open fh.
>>>
>>> So what am I missing here? It all looks odd.
>>
>> I read up on this a bit more, and I think this patch is bogus: drivers not
>> converted to the release() callback will indeed just crash, but that's no
>> different than many existing drivers, media or otherwise, when you forcibly
>> unbind them. It's broken today, and since you have to be root to unbind, I
>> would say that we can just leave it as-is rather than introducing a rather
>> ugly workaround. I don't think it will help anyway, since most likely
>> such drivers will also fails if the application has a video device open
>> when the device is unbound.
> 
> The main difference is whether accessing such a file handle will access
> released memory always or whether that is possible only during a very brief
> amount of time.
> 

I still don't like this. It was broken before, and it is broken now (perhaps a
bit less broken, but still...).

There is a right fix now, and drivers that are likely to be removed forcibly
should be converted. This patch just makes it more likely that such drivers
won't be converted since it is less likely to hit this, so people will just
think that this is 'good enough'. And it makes the code a lot uglier.

Note that if we still want this in, then it needs a lot more comments explaining
what is going on.

Regards,

	Hans
