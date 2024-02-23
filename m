Return-Path: <linux-media+bounces-5781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288486115B
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25114286C79
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127907B3D5;
	Fri, 23 Feb 2024 12:17:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0F78667
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708690655; cv=none; b=mPyuOeNhIJ28AdBLlx767On0rsW27Ior4qABqz3hvSU9vO3w1rC3F5L0A79ZjN1cPxXM0EiC5PTKZ+xDzp+np1vM2hPceNBh7mhGr+PCtUTsRBpgkBWrjUnxDctjLbKQO1tvOkupyhDg8UFLVdo2wsfUSRNUV+PceBJi4xe4JOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708690655; c=relaxed/simple;
	bh=/MrxLoFNzY/uuR/oj1sOP5Nm1rtQ4/A3F4DfSG9IUZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyJFECIBHCErhi19ltmFALZpI5w5P9KYcKM0XzmiEkzUWFcnVmKZNIVhT4SmiqPaFz31xECWnCkgpQ+LkIYGdrwZtYET7PnoEGG57T8q1rS6Bi2s8XiiWf6PKeA0H4smG9a7tyjzQ7gm/bfAQpR+C2znOB4+2I1jhO+G+qNyrNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F825C43390;
	Fri, 23 Feb 2024 12:17:34 +0000 (UTC)
Message-ID: <76875c0d-c8d4-4db8-94dc-2808063a7db9@xs4all.nl>
Date: Fri, 23 Feb 2024 13:17:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mc: return ENODEV instead of EIO/ENXIO when dev
 is, unregistered
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <41bb718b-2c6d-41aa-b093-b800dffcbe1e@xs4all.nl>
 <20240223095045.GI31348@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240223095045.GI31348@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 23/02/2024 10:50, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Fri, Feb 23, 2024 at 10:34:32AM +0100, Hans Verkuil wrote:
>> If the media device is unregistered, the read/write/ioctl file ops
>> returned EIO instead of ENODEV. And open returned ENXIO instead of the
>> linux kernel standard of ENODEV.
> 
> Are you sure this is right ? Looking at chrdev_open() for instance, it
> returns -ENXIO when it can't find a cdev for the requested minor.

Right, but in this case the cdev is there, but the underlying device has
been removed and no longer exists. Linux returned ENODEV in that case.

'man 2 open' gives an interesting description of ENODEV:

ENODEV pathname refers to a device special file and no corresponding device exists.
    (This is a Linux kernel bug; in this situation ENXIO must be returned.)

I think ENXIO is Posix, but in the linux kernel ENODEV is actually used.

Grepping for ENODEV (and looking at some other subsystems) suggests that ENODEV
is pretty standard for this. I think it is the difference between the major/minor
no longer being valid (ENXIO), and that it is still valid, but the underlying
device has gone. For open() that can happen if it is disconnected right after you
managed to enter the open() fop.

Personally I would prefer to have all media subsystems (v4l2/dvb/rc/cec/mc) behave
the same w.r.t. disconnects, and -EIO for read/write/ioctl is really wrong.

That said, if you prefer to stick to ENXIO instead of ENODEV, then I can make
a v2 that just replaces EIO by ENXIO.

Regards,

	Hans

> Furthermore, the read() 3 manpage documents the ENXIO error as
> 
>        ENXIO  A request was made of a nonexistent device, or the request
>        was outside the capabilities of the device.
> 
> while it doesn't document ENODEV at all.
> 
>> Change the error code to ENODEV and document this as well in
>> media-func-open.rst.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../userspace-api/media/mediactl/media-func-open.rst   |  4 ++--
>>  drivers/media/mc/mc-devnode.c                          | 10 +++++-----
>>  2 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/mediactl/media-func-open.rst b/Documentation/userspace-api/media/mediactl/media-func-open.rst
>> index 24487cb0a308..8c1c7ebefdb1 100644
>> --- a/Documentation/userspace-api/media/mediactl/media-func-open.rst
>> +++ b/Documentation/userspace-api/media/mediactl/media-func-open.rst
>> @@ -61,5 +61,5 @@ ENFILE
>>  ENOMEM
>>      Insufficient kernel memory was available.
>>
>> -ENXIO
>> -    No device corresponding to this device special file exists.
>> +ENODEV
>> +    Device not found or was removed.
>> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
>> index 7f67825c8757..fbf76e1414de 100644
>> --- a/drivers/media/mc/mc-devnode.c
>> +++ b/drivers/media/mc/mc-devnode.c
>> @@ -75,7 +75,7 @@ static ssize_t media_read(struct file *filp, char __user *buf,
>>  	if (!devnode->fops->read)
>>  		return -EINVAL;
>>  	if (!media_devnode_is_registered(devnode))
>> -		return -EIO;
>> +		return -ENODEV;
>>  	return devnode->fops->read(filp, buf, sz, off);
>>  }
>>
>> @@ -87,7 +87,7 @@ static ssize_t media_write(struct file *filp, const char __user *buf,
>>  	if (!devnode->fops->write)
>>  		return -EINVAL;
>>  	if (!media_devnode_is_registered(devnode))
>> -		return -EIO;
>> +		return -ENODEV;
>>  	return devnode->fops->write(filp, buf, sz, off);
>>  }
>>
>> @@ -114,7 +114,7 @@ __media_ioctl(struct file *filp, unsigned int cmd, unsigned long arg,
>>  		return -ENOTTY;
>>
>>  	if (!media_devnode_is_registered(devnode))
>> -		return -EIO;
>> +		return -ENODEV;
>>
>>  	return ioctl_func(filp, cmd, arg);
>>  }
>> @@ -152,11 +152,11 @@ static int media_open(struct inode *inode, struct file *filp)
>>  	 */
>>  	mutex_lock(&media_devnode_lock);
>>  	devnode = container_of(inode->i_cdev, struct media_devnode, cdev);
>> -	/* return ENXIO if the media device has been removed
>> +	/* return ENODEV if the media device has been removed
>>  	   already or if it is not registered anymore. */
>>  	if (!media_devnode_is_registered(devnode)) {
>>  		mutex_unlock(&media_devnode_lock);
>> -		return -ENXIO;
>> +		return -ENODEV;
>>  	}
>>  	/* and increase the device refcount */
>>  	get_device(&devnode->dev);
> 


