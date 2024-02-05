Return-Path: <linux-media+bounces-4719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E139849E4B
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 16:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4C628960B
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA502E41A;
	Mon,  5 Feb 2024 15:32:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632853A8F9
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707147168; cv=none; b=fUc1Zjxbi7uggXoyl/9HHM9vk9s0pr6kbc8ugk4kJ+k/4mtVntcZ727G1aeMoCcYAvaD1How+NjbRL472gMXFt0qkdW1SvUkAV6LnnlC8GZigdlYSeq8HXSKL2yTuWsnHLRZtgOJ7iqD82zr3SBvQRtEb5HiWStyolIZ60HpaWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707147168; c=relaxed/simple;
	bh=QDd5nvWSX5soexgL9aySIZGZKOLJRjsEhtUGUcnXsj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zegyv8ZTK2skOAVuIyVuQ5zW65uEB0/XPHszVHfYW3uX8oGK9YtLmfkZdQUkiMvEFP6Ah1wgY/iMx7w0ZzcmcJDlmMUwnXFoXaH0b0NPPTsxkgGaax/blZADQlclDk323VH7XzcAjoyAZeznL9222dwtnnbOKx8V29jJjRAcSMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9BBC433C7;
	Mon,  5 Feb 2024 15:32:46 +0000 (UTC)
Message-ID: <659634d3-64c0-45fa-b816-4e32f9035a06@xs4all.nl>
Date: Mon, 5 Feb 2024 16:32:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/29] media: mc: Maintain a list of open file handles
 in a media device
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-27-sakari.ailus@linux.intel.com>
 <84475ab9-e644-4254-81f6-db4da6a3e12e@xs4all.nl>
 <20240205151602.GA8645@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240205151602.GA8645@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2024 16:16, Laurent Pinchart wrote:
> On Mon, Feb 05, 2024 at 04:11:43PM +0100, Hans Verkuil wrote:
>> On 20/12/2023 11:37, Sakari Ailus wrote:
>>> The list of file handles is needed to deliver media events as well as for
>>> other purposes in the future.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  drivers/media/mc/mc-device.c  | 23 ++++++++++++++++++++++-
>>>  drivers/media/mc/mc-devnode.c |  2 +-
>>>  include/media/media-devnode.h |  4 +++-
>>>  3 files changed, 26 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
>>> index 67a39cb63f89..9cc055deeec9 100644
>>> --- a/drivers/media/mc/mc-device.c
>>> +++ b/drivers/media/mc/mc-device.c
>>> @@ -45,9 +45,11 @@ static inline void __user *media_get_uptr(__u64 arg)
>>>  	return (void __user *)(uintptr_t)arg;
>>>  }
>>>  
>>> -static int media_device_open(struct file *filp)
>>> +static int media_device_open(struct media_devnode *devnode, struct file *filp)
>>>  {
>>> +	struct media_device *mdev = to_media_device(devnode);
>>>  	struct media_device_fh *fh;
>>> +	unsigned long flags;
>>>  
>>>  	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
>>>  	if (!fh)
>>> @@ -55,12 +57,23 @@ static int media_device_open(struct file *filp)
>>>  
>>>  	filp->private_data = &fh->fh;
>>>  
>>> +	spin_lock_irqsave(&mdev->fh_list_lock, flags);
>>
>> The only reason for using the irqsave variant is because we want
>> to support events in the future, and those can be sent in irq context.
> 
> Even in that case, would media_device_open() ever be called from
> interrupt context ? spin_lock_irqsave() is only needed if you don't know
> which context the function can be called from. If we know we'll be
> called from interruptible context only, you can use spin_lock_irq()
> instead.

Someone can call open() while at the same time the kernel sends a
media event from interrupt context. Such an event function will walk
over the fh_list. The irqsave here is meant to ensure that no event
interrupt can run while we add our fh to the fh list.

But without interrupts that access fh_list the irqsave variant is
confusing.

Regards,

	Hans

> 
>> But it is confusing to see this being used here when it is not yet
>> needed.
>>
>> At minimum this should be explained in the commit log.
>>
>>> +	list_add(&fh->mdev_list, &mdev->fh_list);
>>> +	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
>>> +
>>>  	return 0;
>>>  }
>>>  
>>>  static int media_device_close(struct file *filp)
>>>  {
>>> +	struct media_devnode *devnode = media_devnode_data(filp);
>>> +	struct media_device *mdev = to_media_device(devnode);
>>>  	struct media_device_fh *fh = media_device_fh(filp);
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&mdev->fh_list_lock, flags);
>>> +	list_del(&fh->mdev_list);
>>> +	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
>>>  
>>>  	kfree(fh);
>>>  
>>> @@ -769,11 +782,13 @@ void media_device_init(struct media_device *mdev)
>>>  	INIT_LIST_HEAD(&mdev->pads);
>>>  	INIT_LIST_HEAD(&mdev->links);
>>>  	INIT_LIST_HEAD(&mdev->entity_notify);
>>> +	INIT_LIST_HEAD(&mdev->fh_list);
>>>  
>>>  	mutex_init(&mdev->req_queue_mutex);
>>>  	mutex_init(&mdev->graph_mutex);
>>>  	ida_init(&mdev->entity_internal_idx);
>>>  	atomic_set(&mdev->request_id, 0);
>>> +	spin_lock_init(&mdev->fh_list_lock);
>>>  
>>>  	mdev->devnode.release = media_device_release;
>>>  	media_devnode_init(&mdev->devnode);
>>> @@ -824,6 +839,8 @@ EXPORT_SYMBOL_GPL(__media_device_register);
>>>  
>>>  void media_device_unregister(struct media_device *mdev)
>>>  {
>>> +	unsigned long flags;
>>> +
>>>  	if (mdev == NULL)
>>>  		return;
>>>  
>>> @@ -834,6 +851,10 @@ void media_device_unregister(struct media_device *mdev)
>>>  	}
>>>  	mutex_unlock(&mdev->graph_mutex);
>>>  
>>> +	spin_lock_irqsave(&mdev->fh_list_lock, flags);
>>> +	list_del_init(&mdev->fh_list);
>>> +	spin_unlock_irqrestore(&mdev->fh_list_lock, flags);
>>> +
>>>  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
>>>  	dev_dbg(mdev->dev, "Media device unregistering\n");
>>>  	media_devnode_unregister(&mdev->devnode);
>>> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
>>> index 04d376015526..0b5c24828e24 100644
>>> --- a/drivers/media/mc/mc-devnode.c
>>> +++ b/drivers/media/mc/mc-devnode.c
>>> @@ -171,7 +171,7 @@ static int media_open(struct inode *inode, struct file *filp)
>>>  	get_device(&devnode->dev);
>>>  	mutex_unlock(&media_devnode_lock);
>>>  
>>> -	ret = devnode->fops->open(filp);
>>> +	ret = devnode->fops->open(devnode, filp);
>>>  	if (ret) {
>>>  		put_device(&devnode->dev);
>>>  		return ret;
>>> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
>>> index b0efdde4ffd8..840f7ae852d3 100644
>>> --- a/include/media/media-devnode.h
>>> +++ b/include/media/media-devnode.h
>>> @@ -21,6 +21,8 @@
>>>  #include <linux/device.h>
>>>  #include <linux/cdev.h>
>>>  
>>> +struct media_devnode;
>>> +
>>>  /*
>>>   * Flag to mark the media_devnode struct as registered. Drivers must not touch
>>>   * this flag directly, it will be set and cleared by media_devnode_register and
>>> @@ -49,7 +51,7 @@ struct media_file_operations {
>>>  	__poll_t (*poll) (struct file *, struct poll_table_struct *);
>>>  	long (*ioctl) (struct file *, unsigned int, unsigned long);
>>>  	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
>>> -	int (*open) (struct file *);
>>> +	int (*open) (struct media_devnode *, struct file *);
>>>  	int (*release) (struct file *);
>>>  };
>>>  
> 


