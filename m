Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6026430BB5C
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 10:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhBBJtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 04:49:10 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51481 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229557AbhBBJtD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 04:49:03 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6sIBl1JpVefbk6sIEljMlw; Tue, 02 Feb 2021 10:48:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612259299; bh=yfljhA2fRTSVgPenNf2zsW9J6AMM5DlAwxp3NNWKiWw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WohBfowsKXkuh2a2GqxFtxQmC2i60CUS3WwOcfQXism3ZmnoDRsg+1MfXcaEqKqlY
         Tzhy5R52M/XjuUHnH2ptggStN750hAXJ5O5/3vtLDr+YntOFniHYiLJnFtmwetW0xt
         OcOtBPF+Ywr6w/Ix9Dm8fAOEEwDfGSBNHzRn+piFOO6bRz2/E9Zg1YCbZYVmIkysNb
         5w3pJ9GmfE7kC1GjCVEDpuoFQIjUam+kA+FhWXDKudA0Whw55pb/qX6gQbjQuv3IhM
         zgLALxq/Y2yhjkCV02vQcqypJEWcwI2sNnSdVB+T3k8B4RHwt6cPZv/9ZYFzlQKP/G
         GpYA9g0y8DvMA==
Subject: Re: [PATCHv2 1/2] v4l2-dev: add /sys media_dev attr for video devices
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210201093659.2945449-1-hverkuil-cisco@xs4all.nl>
 <20210201093659.2945449-2-hverkuil-cisco@xs4all.nl>
 <YBhkCYUnWjog3dBO@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c3757e32-5f4e-83b1-0b72-b7edceec8e06@xs4all.nl>
Date:   Tue, 2 Feb 2021 10:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YBhkCYUnWjog3dBO@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfI8RmKqpGcTtZtrbjIlGXPabByjji6mMObwgybHMJVowY56zLwLfBZX7KR9qoMFuTBLNu0p5bVcU3I5R2Vu7ejno4+xAK85/FOpup42Z1AOsJYdpv3wS
 tQhx2PnWBLNooqsEvnmXziSB4sOtn/40rBk4eGMDFg8WqWHH36wczl0nS3NjJLynJbcuIjOnUjLt48hBPDwDdX4jSdexE+tZ3dmxu1eLkRiKFQapM/J26aYD
 y9Ftkhn2eLiFJYBDFUISbKk0K9J/MiJCZQwt/3xB1HygFFwUgJ6o02BXz1NIKao0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/02/2021 21:26, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Mon, Feb 01, 2021 at 10:36:58AM +0100, Hans Verkuil wrote:
>> Create a media_dev attribute in /sys for each video device
>> which contains the media device major and minor number (or
>> is empty if there is no associated media device).
>>
>> It is not created if the CONFIG_MEDIA_CONTROLLER is not
>> defined.
>>
>> This makes it possible for applications like v4l2-compliance
>> to find the associated media controller of a video device.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/v4l2-core/v4l2-dev.c | 48 +++++++++++++++++++++++++++++-
>>  1 file changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index b6a72d297775..85b94b25aba2 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -87,13 +87,59 @@ static ssize_t name_show(struct device *cd,
>>  }
>>  static DEVICE_ATTR_RO(name);
>>  
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +static ssize_t media_dev_show(struct device *cd,
>> +			 struct device_attribute *attr, char *buf)
>> +{
>> +	struct video_device *vdev = to_video_device(cd);
>> +	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
>> +
>> +	buf[0] = '\0';
>> +	if (!v4l2_dev->mdev)
>> +		return 0;
>> +	return sprintf(buf, "%u:%u\n",
>> +		       MAJOR(v4l2_dev->mdev->devnode->dev.devt),
>> +		       MINOR(v4l2_dev->mdev->devnode->dev.devt));
> 
> Could v4l2-dev->mdev be set to null between time of check and time of
> use, or are sysfs properties guaranteed to be removed first ?

After checking device_del() I see that these attributes are removed
before the device node itself is removed. However, I am not 100% certain
that all drivers will postpone unregistering the media device node until
all other device nodes are unregistered.

I think it would be safer to copy v4l2_dev->mdev->devnode->dev.devt into
struct video_device at registration time. It's more robust.

> 
> I'm still not convinced that this is the right way to go from a
> userspace point of view. I believe we should shift from the paradigm of
> a video node belonging to a media device to a media device that contains
> video nodes. This means that userspace should use the media device as
> the entry point, and find video nodes from the media graph, instead of
> going the other way around. That's the only sensible way to handle
> complex devices, and is really a mindset change that should be pushed to
> all userspace applications. It will obviously take time and effort, but
> if we don't start by eating our own dogfood, we'll never succeed.
> 
> I'm thus not opposed to this patch series so much that I would like it
> to not being merged, but I believe it's a step in the wrong direction.
> With time I've learnt that I can't prevent every step I consider wrong
> to be taken (and I also make mistakes, so who knows :-)).

I completely agree with you, but the reality is that many V4L2 drivers do
not use the media controller, and that is not something that will change.

I honestly do not see why having a reference to the actual associated media
device would be a bad thing: it will only ensure that v4l2-ctl/compliance
can tell the user that that device is part of a media controller.

I don't see how or why applications would want to abuse this.

I'll post a v3 of this series.

Regards,

	Hans

> 
>> +}
>> +
>> +static DEVICE_ATTR_RO(media_dev);
>> +#endif
>> +
>> +static umode_t video_device_attr_is_visible(struct kobject *kobj,
>> +					    struct attribute *attr, int n)
>> +{
>> +	struct video_device *vdev = to_video_device(kobj_to_dev(kobj));
>> +
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +	if (attr == &dev_attr_media_dev.attr) {
>> +		struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
>> +
>> +		if (!v4l2_dev->mdev)
>> +			return 0;
>> +	}
>> +#endif
>> +	return attr->mode;
>> +}
>> +
>>  static struct attribute *video_device_attrs[] = {
>>  	&dev_attr_name.attr,
>>  	&dev_attr_dev_debug.attr,
>>  	&dev_attr_index.attr,
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +	&dev_attr_media_dev.attr,
>> +#endif
>>  	NULL,
>>  };
>> -ATTRIBUTE_GROUPS(video_device);
>> +
>> +static const struct attribute_group video_device_group = {
>> +	.is_visible = video_device_attr_is_visible,
>> +	.attrs = video_device_attrs,
>> +};
>> +
>> +static const struct attribute_group *video_device_groups[] = {
>> +	&video_device_group,
>> +	NULL
>> +};
>>  
>>  /*
>>   *	Active devices
> 

