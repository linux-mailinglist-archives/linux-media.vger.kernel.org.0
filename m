Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E85330B190
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 21:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhBAU1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 15:27:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33826 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhBAU1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 15:27:54 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB8EF556;
        Mon,  1 Feb 2021 21:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612211231;
        bh=slOCyZwZYJE/Ra0ghG6cflsZxibE4h5qplcMeUnmvZ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b4qYl3yUb/hKtA3faV1zYpztbYbPYHxLFkT3CyepTvmWU+ZubKJbNCuELqRoE8J96
         bY5HspJ5kMbT9VQl9KM0zNwfKNd9bg4j/59QSkLc5ImT/co5rqNtkzL9qY5LxuKqzs
         b89OYBEimmXPfuIcspjKvrHpZcwBNhUiGgbcIFho=
Date:   Mon, 1 Feb 2021 22:26:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv2 1/2] v4l2-dev: add /sys media_dev attr for video devices
Message-ID: <YBhkCYUnWjog3dBO@pendragon.ideasonboard.com>
References: <20210201093659.2945449-1-hverkuil-cisco@xs4all.nl>
 <20210201093659.2945449-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210201093659.2945449-2-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Feb 01, 2021 at 10:36:58AM +0100, Hans Verkuil wrote:
> Create a media_dev attribute in /sys for each video device
> which contains the media device major and minor number (or
> is empty if there is no associated media device).
> 
> It is not created if the CONFIG_MEDIA_CONTROLLER is not
> defined.
> 
> This makes it possible for applications like v4l2-compliance
> to find the associated media controller of a video device.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 48 +++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index b6a72d297775..85b94b25aba2 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -87,13 +87,59 @@ static ssize_t name_show(struct device *cd,
>  }
>  static DEVICE_ATTR_RO(name);
>  
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +static ssize_t media_dev_show(struct device *cd,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(cd);
> +	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
> +
> +	buf[0] = '\0';
> +	if (!v4l2_dev->mdev)
> +		return 0;
> +	return sprintf(buf, "%u:%u\n",
> +		       MAJOR(v4l2_dev->mdev->devnode->dev.devt),
> +		       MINOR(v4l2_dev->mdev->devnode->dev.devt));

Could v4l2-dev->mdev be set to null between time of check and time of
use, or are sysfs properties guaranteed to be removed first ?

I'm still not convinced that this is the right way to go from a
userspace point of view. I believe we should shift from the paradigm of
a video node belonging to a media device to a media device that contains
video nodes. This means that userspace should use the media device as
the entry point, and find video nodes from the media graph, instead of
going the other way around. That's the only sensible way to handle
complex devices, and is really a mindset change that should be pushed to
all userspace applications. It will obviously take time and effort, but
if we don't start by eating our own dogfood, we'll never succeed.

I'm thus not opposed to this patch series so much that I would like it
to not being merged, but I believe it's a step in the wrong direction.
With time I've learnt that I can't prevent every step I consider wrong
to be taken (and I also make mistakes, so who knows :-)).

> +}
> +
> +static DEVICE_ATTR_RO(media_dev);
> +#endif
> +
> +static umode_t video_device_attr_is_visible(struct kobject *kobj,
> +					    struct attribute *attr, int n)
> +{
> +	struct video_device *vdev = to_video_device(kobj_to_dev(kobj));
> +
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	if (attr == &dev_attr_media_dev.attr) {
> +		struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
> +
> +		if (!v4l2_dev->mdev)
> +			return 0;
> +	}
> +#endif
> +	return attr->mode;
> +}
> +
>  static struct attribute *video_device_attrs[] = {
>  	&dev_attr_name.attr,
>  	&dev_attr_dev_debug.attr,
>  	&dev_attr_index.attr,
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	&dev_attr_media_dev.attr,
> +#endif
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(video_device);
> +
> +static const struct attribute_group video_device_group = {
> +	.is_visible = video_device_attr_is_visible,
> +	.attrs = video_device_attrs,
> +};
> +
> +static const struct attribute_group *video_device_groups[] = {
> +	&video_device_group,
> +	NULL
> +};
>  
>  /*
>   *	Active devices

-- 
Regards,

Laurent Pinchart
