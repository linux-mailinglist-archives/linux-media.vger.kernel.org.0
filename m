Return-Path: <linux-media+bounces-34343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23398AD1BC1
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 12:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0941F3A817F
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 10:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955B92459F0;
	Mon,  9 Jun 2025 10:46:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378677E9;
	Mon,  9 Jun 2025 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465978; cv=none; b=p8+JRa1tBIvvCMdixW79qvHZLuPBzuoKna7dZjwoMWuSlHhjSNF8DPXhLIlc+2U013iEPHPZvszU5p7Caw3gLpZpcPSJRc3vDFe0Rv9fLrb5CjrlOdT2pI3R4qhLpnhr8PMknNUNyPFmrxJJUsHo3WxzqgbJ+YdWyfXvic/T7bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465978; c=relaxed/simple;
	bh=oOEaW4f23EFyLh1NVyXUs5wN/BLPIJM8Q15QevDYr54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOh9iMMaf/oX/1iMHIX0Z2SrT4cecrwf+MxIHdlXAoigPKiIRylBRm0Dmamo8eFki/Mj4t+LOOr/vFUnA+x/i7cfsXlCUDVi9SShio8rIXoE03K9UNuNR6VY9OVW9o7wUld3aOknu0OJ4PZbFCloxzaqVqC7UIaO+USiK7iN5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC26FC4CEEB;
	Mon,  9 Jun 2025 10:46:14 +0000 (UTC)
Message-ID: <29c200ff-1fe8-4026-ad08-fc1da845622e@xs4all.nl>
Date: Mon, 9 Jun 2025 12:46:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: mc: add debugfs node to keep track of
 requests
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-3-603db4749d90@collabora.com>
 <aEC7jMDgRAg1cfXZ@kekkonen.localdomain>
 <870611a1e5d21fa375dd9359192641484c1c0e76.camel@collabora.com>
 <aEa3azYxM5Sc6cZC@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <aEa3azYxM5Sc6cZC@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/06/2025 12:28, Sakari Ailus wrote:
> Hi Nicolas,
> 
> On Wed, Jun 04, 2025 at 07:08:53PM -0400, Nicolas Dufresne wrote:
>> Le mercredi 04 juin 2025 à 21:33 +0000, Sakari Ailus a écrit :
>>> Hi Nicolas, Hans,
>>>
>>> Thanks for the update.
>>
>> thanks for the review, these things are precious.
>>
>>>
>>> On Wed, Jun 04, 2025 at 04:09:37PM -0400, Nicolas Dufresne wrote:
>>>> From: Hans Verkuil <hverkuil@xs4all.nl>
>>>>
>>>> Keep track of the number of requests and request objects of a media
>>>> device. Helps to verify that all request-related memory is freed.
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>> ---
>>>>  drivers/media/mc/mc-device.c  | 30 ++++++++++++++++++++++++++++++
>>>>  drivers/media/mc/mc-devnode.c |  5 +++++
>>>>  drivers/media/mc/mc-request.c |  6 ++++++
>>>>  include/media/media-device.h  |  9 +++++++++
>>>>  include/media/media-devnode.h |  4 ++++
>>>>  include/media/media-request.h |  2 ++
>>>>  6 files changed, 56 insertions(+)
>>>>
>>>> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
>>>> index c0dd4ae5722725f1744bc6fd6282d5c765438059..5a458160200afb540d8014fed42d8bf2dab9c8c3 100644
>>>> --- a/drivers/media/mc/mc-device.c
>>>> +++ b/drivers/media/mc/mc-device.c
>>>> @@ -679,6 +679,23 @@ void media_device_unregister_entity(struct media_entity *entity)
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(media_device_unregister_entity);
>>>>  
>>>> +#ifdef CONFIG_DEBUG_FS
>>>> +/*
>>>> + * Log the state of media requests.
>>>> + * Very useful for debugging.
>>>> + */
>>>
>>> Fits on a single line.
>>
>> Ack.
>>
>>>
>>>> +static int media_device_requests(struct seq_file *file, void *priv)
>>>> +{
>>>> +	struct media_device *dev = dev_get_drvdata(file->private);
>>>> +
>>>> +	seq_printf(file, "number of requests: %d\n",
>>>> +		   atomic_read(&dev->num_requests));
>>>> +	seq_printf(file, "number of request objects: %d\n",
>>>> +		   atomic_read(&dev->num_request_objects));
>>>
>>> Newline here?
>>
>> I prefer that too.
>>
>>>
>>>> +	return 0;
>>>> +}
>>>> +#endif
>>>> +
>>>>  void media_device_init(struct media_device *mdev)
>>>>  {
>>>>  	INIT_LIST_HEAD(&mdev->entities);
>>>> @@ -697,6 +714,9 @@ void media_device_init(struct media_device *mdev)
>>>>  		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
>>>>  				   mdev->dev);
>>>>  
>>>> +	atomic_set(&mdev->num_requests, 0);
>>>> +	atomic_set(&mdev->num_request_objects, 0);
>>>> +
>>>>  	dev_dbg(mdev->dev, "Media device initialized\n");
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(media_device_init);
>>>> @@ -748,6 +768,15 @@ int __must_check __media_device_register(struct media_device *mdev,
>>>>  
>>>>  	dev_dbg(mdev->dev, "Media device registered\n");
>>>>  
>>>> +#ifdef CONFIG_DEBUG_FS
>>>> +	if (!media_debugfs_root)
>>>> +		media_debugfs_root = debugfs_create_dir("media", NULL);
>>>> +	mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
>>>> +					     media_debugfs_root);
>>>> +	debugfs_create_devm_seqfile(&devnode->dev, "requests",
>>>> +				    mdev->media_dir, media_device_requests);
>>>> +#endif
>>>
>>> I have no objection to this but it would have been great to have the Media
>>> device lifetime set in first and MC device and devnode merged. But maybe
>>> it's too late for that. Well, at least this won't change error handling...
>>
>> Since this specific patch is not required to fix the MTK VCODEC issue, I can
>> delay this a little. Is that comment related to an existing patch ?
> 
> Yes.
> 
> I've pushed the current set here:
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=media-ref>. I've
> rebased it recently but it's still WiP.

Since this patch series has been going on for many years now, I do not believe
that that should prevent this specific patch from being merged. It is generally
a bad idea to do that, unless it is absolutely certain that such a patch series
will be merged in a few weeks tops.

I've carried this patch around out-of-tree ever since I started the first
request implementation because without it it is very hard to check that all
requests are properly freed. So getting this in is actually quite useful.

And when it is in I will probably add a test in test-media to improve the stateless
decoder regression test, verifying that all requests are freed.

Regards,

	Hans

> 
> ...
> 
>>>> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
>>>> index d27c1c646c2805171be3997d72210dd4d1a38e32..dbcabeffcb572ae707f5fe1f51ff719d451c6784 100644
>>>> --- a/include/media/media-devnode.h
>>>> +++ b/include/media/media-devnode.h
>>>> @@ -20,9 +20,13 @@
>>>>  #include <linux/fs.h>
>>>>  #include <linux/device.h>
>>>>  #include <linux/cdev.h>
>>>> +#include <linux/debugfs.h>
>>>>  
>>>>  struct media_device;
>>>>  
>>>> +/* debugfs top-level media directory */
>>>> +extern struct dentry *media_debugfs_root;
>>>> +
>>>>  /*
>>>>   * Flag to mark the media_devnode struct as registered. Drivers must not touch
>>>>   * this flag directly, it will be set and cleared by media_devnode_register and
>>>> diff --git a/include/media/media-request.h b/include/media/media-request.h
>>>> index 7f9af68ef19ac6de0184bbb0c0827dc59777c6dc..610ccfe8d7b20ec38e166383433f9ee208248640 100644
>>>> --- a/include/media/media-request.h
>>>> +++ b/include/media/media-request.h
>>>> @@ -292,6 +292,7 @@ struct media_request_object_ops {
>>>>   * struct media_request_object - An opaque object that belongs to a media
>>>>   *				 request
>>>>   *
>>>> + * @mdev: Media device this object belongs to
>>>
>>> This deserves at least a comment what this may be used for: generally once
>>> object is unbound, it's not related to a request anymore (nor a Media
>>> device). This field also adds a new Media device lifetime issue: nothing
>>
>> We could make it explicit by clearing the mdev pointer ?
> 
> That would probably be out of scope of this patch(set). Also see the
> patchset I referred to earlier.
> 
>>
>>> guarantees the mdev is not disappearing at a wrong time albeit this is
>>> very, very likely not user-triggerable without physically removing
>>> hardware.
>>
>> I'm not too familiar with the subject, if the MC knows it has open request
>> FD(s), why would it allow userspace from unloading its module ?
> 
> Drivers nor MC currently have a list of request file handles.
> 
> Apart from the file handles, that was the original thinking, yes, but
> devices can be also unbound without touching the driver (or other) modules.
> 
>>
>>>
>>>>   * @ops: object's operations
>>>>   * @priv: object's priv pointer
>>>>   * @req: the request this object belongs to (can be NULL)
>>>> @@ -303,6 +304,7 @@ struct media_request_object_ops {
>>>>   * another struct that contains the actual data for this request object.
>>>>   */
>>>>  struct media_request_object {
>>>> +	struct media_device *mdev;
>>>>  	const struct media_request_object_ops *ops;
>>>>  	void *priv;
>>>>  	struct media_request *req;
>>>>
> 


